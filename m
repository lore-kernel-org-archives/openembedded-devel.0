Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94FCD6E245
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBD6MNns002885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Dec 2013 22:22:23 -0800 (PST)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 12 Dec 2013 22:22:22 -0800
Message-ID: <52AAA79D.2000301@windriver.com>
Date: Fri, 13 Dec 2013 14:22:21 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Scott Penner
	<gwt.scott@gmail.com>
References: <cover.1386227209.git.wenzong.fan@windriver.com>
	<427446e772574bf40b2ee7b9fc46048efd9601c7.1386227209.git.wenzong.fan@windriver.com>
	<9022455822474819115@unknownmsgid>
In-Reply-To: <9022455822474819115@unknownmsgid>
Subject: Re: [PATCH 1/1] mariadb-native: fix link error on Ubuntu 13.10
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
X-List-Received-Date: Fri, 13 Dec 2013 06:22:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2013 11:32 PM, Scott Penner wrote:
> Great, what is the best way to apply this patch?
> Please excuse my noobness.

If you are working on the meta-openembedded tree, just save the patch 
email and run:

$ git am <saved-patch-email>

Or fetch my patch branch "wenzong/mariadb-native-2" and run git cherry-pick.

Thanks
Wenzong

>
> Thanks,
>
> Scott Penner
>
> Goodwell Inc.
> c. 4033761977
> a. Box 906 Brooks, Ab T1R1B8
>
>> On Dec 5, 2013, at 12:10 AM, "wenzong.fan@windriver.com" <wenzong.fan@windriver.com> wrote:
>>
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Below errors only occurs on Ubuntu 13.10:
>>
>> $arch-linux-libtool: link: g++ ... -o .libs/mysqltest_embedded \
>>     ../../libmysqld/.libs/libmysqld.so -ldl
>>
>>     ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlopen'
>>     ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlclose'
>>     ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlerror'
>>     ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlsym'
>>
>> GCC/ld verion on the host:
>>     gcc (Ubuntu/Linaro 4.8.1-10ubuntu8) 4.8.1
>>     GNU ld (GNU Binutils for Ubuntu) 2.23.52.20130913
>>
>> This is a strange behavior on Ub13.10, it fails even '-ldl' in the
>> link command line. This patch will append '-ldl' to dependency_libs
>> in libmysqld.la.
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>> .../recipes-support/mysql/mariadb-native_5.1.67.bb |    3 ++
>> .../mysql/mariadb/fix-link-error-ub1310.patch      |   37 ++++++++++++++++++++
>> 2 files changed, 40 insertions(+)
>> create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
>> index a55c2ab..dccbfd0 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
>> +++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
>> @@ -8,6 +8,9 @@ PACKAGES = ""
>> EXTRA_OEMAKE = ""
>> EXTRA_OECONF = " --with-embedded-server "
>>
>> +SRC_URI += "file://fix-link-error-ub1310.patch \
>> +    "
>> +
>> do_install() {
>>      oe_runmake 'DESTDIR=${D}' install
>>      mv -f ${D}${libdir}/mysql/* ${D}${libdir}
>> diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch b/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
>> new file mode 100644
>> index 0000000..a528ea7
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
>> @@ -0,0 +1,37 @@
>> +mariadb-native: fix link error on Ubuntu 13.10
>> +
>> +Below errors only occurs on Ubuntu 13.10:
>> +
>> +$arch-linux-libtool: link: g++ ... -o .libs/mysqltest_embedded \
>> +    ../../libmysqld/.libs/libmysqld.so -ldl
>> +
>> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlopen'
>> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlclose'
>> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlerror'
>> +    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlsym'
>> +
>> +GCC/ld verion on the host:
>> +    gcc (Ubuntu/Linaro 4.8.1-10ubuntu8) 4.8.1
>> +    GNU ld (GNU Binutils for Ubuntu) 2.23.52.20130913
>> +
>> +This is a strange behavior on Ub13.10, it fails even '-ldl' in the
>> +link command line. Below fix will append '-ldl' to dependency_libs
>> +in libmysqld.la.
>> +
>> +Upstream-Status: Submitted [https://mariadb.atlassian.net/browse/MDEV-5362]
>> +
>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> +================================================
>> +diff --git a/libmysqld/Makefile.am b/libmysqld/Makefile.am
>> +index 7a2c92e..eee501e 100644
>> +--- a/libmysqld/Makefile.am
>> ++++ b/libmysqld/Makefile.am
>> +@@ -92,7 +92,7 @@ INC_LIB=    $(top_builddir)/regex/libregex.la \
>> +                 @ndbcluster_libs@ @NDB_SCI_LIBS@ \
>> +        @mysql_embedded_plugin_libs@ \
>> +        $(libevent_inc_libs) \
>> +-        $(yassl_inc_libs)
>> ++        $(yassl_inc_libs) @LIBDL@
>> +
>> + if HAVE_YASSL
>> + yassl_inc_libs=    $(top_builddir)/extra/yassl/src/libyassl.la \
>> --
>> 1.7.10.4
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

