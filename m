Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 603036B095
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 05:37:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J5biAx012075
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 22:37:44 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Jul 2013 22:37:44 -0700
Message-ID: <51E8D0A7.4050502@windriver.com>
Date: Fri, 19 Jul 2013 13:37:43 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Joe MacDonald <Joe.MacDonald@windriver.com>
References: <1374042294-7344-1-git-send-email-rongqing.li@windriver.com>
	<20130717190804.GB31259@windriver.com>
In-Reply-To: <20130717190804.GB31259@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cyrus-sasl: several fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jul 2013 05:37:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/18/2013 03:08 AM, Joe MacDonald wrote:
> [[PATCH] cyrus-sasl: several fixes] On 13.07.17 (Wed 14:24) rongqing.li@windriver.com wrote:
>
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> 1. Fix hardcoded libdir
>> 2. configure cyrus-sasl based on PACKAGECONFIG
>> 3. create user by inherit useradd
>> 4. add -fPIC to CFLAG to fix a building failure, the cause as below:
>>          ld: ../sasldb/.libs/libsasldb.a(db_berkeley.o): relocation R_X86_64_32S against
>>          `.rodata' can not be used when making a shared object; recompile with -fPIC
>>          ../sasldb/.libs/libsasldb.a(db_berkeley.o): could not read symbols: Bad value
>>
>>      Further investigation shows Upstream chose a strange way to keep compatible
>>      with certain versions of automake.
>>
>>          --- a/sasldb/Makefile.am
>>          +++ b/sasldb/Makefile.am
>>          @@ -1,6 +1,6 @@
>>           # Makefile.am for the SASLdb library
>>           # Rob Siemborski
>>          -# $Id: Makefile.am,v 1.28 2005/04/11 05:09:31 shadow Exp $
>>          +# $Id: Makefile.am,v 1.29 2005/05/07 04:14:56 shadow Exp $
>>           # Copyright (c) 2000 Carnegie Mellon University.  All rights reserved.
>>           #
>>           # Redistribution and use in source and binary forms, with or without
>>          @@ -62,7 +62,7 @@ libsasldb_la_LIBADD = $(SASL_DB_BACKEND)
>>           libsasldb_a_SOURCES =
>>           EXTRA_libsasldb_a_SOURCES =
>>
>>          -libsasldb.a: libsasldb.la $(LOCAL_SASL_DB_BACKEND_STATIC)
>>          -       $(AR) cru .libs/$@ $(LOCAL_SASL_DB_BACKEND_STATIC)
>>          +libsasldb.a: libsasldb.la $(SASL_DB_BACKEND_STATIC)
>>          +       $(AR) cru .libs/$@ $(SASL_DB_BACKEND_STATIC)
>
> This is ... odd.  I'm not sure how this relates to the comment below,
> but your solution seems sound.

I make a wrong reference, it should be Makefile has to two rule;

.c.o:
.c.lo:

the objection of libsasldb.la will trigger ".c.lo:" to work, so 
allockey.c and
db_berkeley.c are compiled two times.


>
>>
>>      that snippet of Makefile rule made libsasldb.a built twice, one with
>>      -fPIC, other without -fPIC. if no -fPIC library follow behind, this error
>>      will appear. so we enable -fPIC no matter whatever objects are built.
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |   32 +++++++++++++++++---
>>   .../cyrus-sasl/files/Fix-hardcoded-libdir.patch    |   25 +++++++++++++++
>>   2 files changed, 52 insertions(+), 5 deletions(-)
>>   create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch
>>
>> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> index 4311540..4dac450 100644
>> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> @@ -5,21 +5,40 @@ LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
>>
>>   SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
>> -	   file://avoid-to-call-AC_TRY_RUN.patch"
>> +	   file://avoid-to-call-AC_TRY_RUN.patch \
>> +	   file://Fix-hardcoded-libdir.patch"
>>
>> -inherit autotools pkgconfig
>> +inherit autotools pkgconfig useradd
>>
>>   EXTRA_OECONF += "--with-dblib=berkeley \
>>                    --with-bdb-libdir=${STAGING_LIBDIR} \
>>                    --with-bdb-incdir=${STAGING_INCDIR} \
>> -                 --without-pam --without-opie --without-des \
>> +                 --with-bdb=db-5.3 \
>> +                 --enable-login \
>> +                 --with-plugindir="${libdir}/sasl2/" \
>
> I'm not sure I expected any of these changes based on your commit log,
> though.  Well, moving --with/out-pam/opie/des into PACKAGECONFIG
> variables, yes, but not --with-bdb/--enable-login/--with-plugindir.  Can
> you comment on those as well?

Ok, I will add comments on it.

>
>>                    andrew_cv_runpath_switch=none"
>>
>> -PACKAGECONFIG ??= ""
>> +PACKAGECONFIG = "ntlm \
>> +        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
>> +        ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>> +        "
>
> Shouldn't you be checking the other values in DISTRO_FEATURES as well?
> And is ntlm a given?  I'm thinking you didn't necessarily mean to drop
> the ?? here.
>
> -J.


since other values seem no plan to be implemented as DISTRO_FEATURES
or other, so I keep them disabled directly.

Ok, I forget the default value, I will fix it by ??


-Roy

>
>>   PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
>> +PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
>> +PACKAGECONFIG[opie] = "--with-opie,--without-opie,opie,"
>> +PACKAGECONFIG[des] = "--with-des,--without-des,,"
>> +PACKAGECONFIG[ldap] = "--with-ldap=${STAGING_LIBDIR} --enable-ldapdb,--without-ldap --disable-ldapdb,openldap,"
>> +PACKAGECONFIG[ntlm] = "--with-ntlm,--without-ntlm,,"
>> +
>> +CFLAGS += "-fPIC"
>>
>>   do_configure_prepend () {
>>       rm -f acinclude.m4 config/libtool.m4
>> +
>> +    # make it be able to work with db 5.0 version
>> +    local sed_files="sasldb/db_berkeley.c utils/dbconverter-2.c"
>> +    for sed_file in $sed_files; do
>> +        sed -i 's#DB_VERSION_MAJOR == 4.*#(&) || DB_VERSION_MAJOR == 5#' $sed_file
>> +    done
>>   }
>>
>>   do_compile_prepend () {
>> @@ -29,8 +48,11 @@ do_compile_prepend () {
>>       cd ..
>>   }
>>
>> +USERADD_PACKAGES = "${PN}-bin"
>> +GROUPADD_PARAM_${PN}-bin = "--system mail"
>> +USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
>> +
>>   pkg_postinst_${PN}-bin () {
>> -    grep cyrus /etc/passwd || adduser --disabled-password --home=/var/spool/mail --ingroup mail -g "Cyrus sasl" cyrus
>>       echo "cyrus" | saslpasswd2 -p -c cyrus
>>       chgrp mail /etc/sasldb2
>>   }
>> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch b/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch
>> new file mode 100644
>> index 0000000..3fa8431
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libdir.patch
>> @@ -0,0 +1,25 @@
>> +Fix hardcoded libdir.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> +---
>> + plugins/Makefile.am |    2 +-
>> + 1 files changed, 1 insertions(+), 1 deletions(-)
>> +
>> +diff --git a/plugins/Makefile.am b/plugins/Makefile.am
>> +index b00915f..25262a1 100644
>> +--- a/plugins/Makefile.am
>> ++++ b/plugins/Makefile.am
>> +@@ -62,7 +62,7 @@ plugindir = @plugindir@
>> +
>> + common_sources = plugin_common.c plugin_common.h
>> +
>> +-sasldir = $(prefix)/lib/sasl2
>> ++sasldir = $(libdir)/sasl2
>> + sasl_LTLIBRARIES = @SASL_MECHS@
>> + EXTRA_LTLIBRARIES = libplain.la libanonymous.la libkerberos4.la libcrammd5.la \
>> + 	libgs2.la libgssapiv2.la libdigestmd5.la liblogin.la libsrp.la libotp.la \
>> +--
>> +1.7.4.1
>> +

-- 
Best Reagrds,
Roy | RongQing Li

