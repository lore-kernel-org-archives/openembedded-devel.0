Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 94ABB6BC7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 17:59:08 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 8so6762727pfr.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2019 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=D2JUHAyfXJCN+3Il++DWqqaCxsZeW2ozbYK9Ktd1Zlo=;
	b=h/R68HNftBC6A4tB6Ut3UXrdniEHFSugkvSMqOwN0qqrY/jcegTd+Q98RtEysy1Zt1
	yJO7xB3HRs8LmuO5MKIOrTiEn8R9+oSG56qvWQqIFcUjvbm4TRhEn9OQusHv4dk493EN
	UqevEilPjRHlyao5hizTlzfuEGRtSyddPon934vXEgPmSa8a0HxSW8DEgcC0zRMSBOqC
	9qaCQQCrswreVOo5ztrTq9GWLaMY4Dkox9Wsjg1Nw7TE2wVDjJxKEL1YxpOThkKkO2k8
	hz52p74l/VPDqmE4MwgA6/EAovvGQjLZ9X/7AxHHfB1BHMNlma28uXFndtWrrPlV2ZQR
	8Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=D2JUHAyfXJCN+3Il++DWqqaCxsZeW2ozbYK9Ktd1Zlo=;
	b=homkAP98UQZGvtw/UP6MARlA6kN2PPWEyUrgk5RrfnNomVTomsgNZitBbUZEkoyFHi
	kyUoiy5ioCbTpQOS+Sj3+QIBYsw4SIAmZ+a69AKLVBDPoI+t7oKNzjzFMx8UfcQo4eMu
	fgF+xJAM7PKdKyJ32tLzzQjrvVm02Rh7mUo58ulxJsu7rzq9zLwbtdfYfVNtMdf5JIcc
	1wl+IxjDrtHyYd8IBuNXyK7SrCFF3h50fBYP7MeLKyzXNZaZFGz1hVHIMiOuVnxrsI0d
	syyCiEPgkMPlA3Fm63PZ5iIHIByrx6onDRxSecUddRUM9YUch9SqtBvnxme2s0pEaZXq
	Ci7Q==
X-Gm-Message-State: APjAAAXWwPAE/E3TY/8K36sHD77DgJzsDmHJiu5nHdpTvy+bdDK3fSSy
	hG3m4L4WbSi5ZOJ4v4YgmARFzrFS
X-Google-Smtp-Source: APXvYqywMIIY+X3a1evLpd/dmvjsx3U2hsphMw0+l9QahrCP9AVkoYy0fjFcjltF4+4FOchRqH8HZQ==
X-Received: by 2002:a65:50cc:: with SMTP id s12mr67133045pgp.130.1554227949520;
	Tue, 02 Apr 2019 10:59:09 -0700 (PDT)
Received: from [10.47.245.159] ([156.39.10.47])
	by smtp.gmail.com with ESMTPSA id
	d20sm22621341pfo.77.2019.04.02.10.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 10:59:08 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190329175453.28137-1-akuster808@gmail.com>
	<CAMKF1soymd1o4yTkUAMFc1378c4forRgWYWeUnFdGtKBX40Tzw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <24099be4-c522-e789-66a2-fc1456d68dfc@gmail.com>
Date: Tue, 2 Apr 2019 10:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soymd1o4yTkUAMFc1378c4forRgWYWeUnFdGtKBX40Tzw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] libldb: allow python pkg to be excluded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 17:59:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/1/19 7:47 PM, Khem Raj wrote:
> Armin
>
> seeing this
>
> ERROR: libldb-1.4.1-r0 do_package_qa: QA Issue: libldb rdepends on
> samba, but it isn't a build dependency, missing samba in DEPENDS or
> PACK
> AGECONFIG? [build-deps]
this recipe makes my head hurt.=C2=A0 if I add the rdepends all hell brea=
ks
loose.

Someone is going to have to figure out the samab & libldb. Going through
the samba upgrade option is not in my cards as I don't have the time and
we are close to snapping for warrior.

I have other options for meta-security.

i am traveling this week so you might want to just drop this patch so we
can regroup after warrior.

kind regards,
Armin
> On Fri, Mar 29, 2019 at 10:55 AM Armin Kuster <akuster808@gmail.com> wr=
ote:
>> There are conflicts with the samba python package
>> so disable the python pkg by default to fix:
>>
>> The pyldb has an RDEPENDS on samba which is causing issues with other
>> packages.
>>
>> ERROR: The file /usr/lib/python2.7/site-packages/_ldb_text.py is insta=
lled by both libldb and samba, aborting
>>
>> Also cleanup per style guide
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../recipes-support/libldb/libldb_1.4.1.bb    | 40 +++++++++---------=
-
>>  1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/=
meta-networking/recipes-support/libldb/libldb_1.4.1.bb
>> index 3c7e5455e9..c3865152e1 100644
>> --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
>> +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
>> @@ -2,9 +2,9 @@ SUMMARY =3D "Hierarchical, reference counted memory po=
ol system with destructors"
>>  HOMEPAGE =3D "http://ldb.samba.org"
>>  SECTION =3D "libs"
>>  LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>> -
>> -DEPENDS +=3D "libtdb libtalloc libtevent popt"
>> -RDEPENDS_pyldb +=3D "python samba"
>> +LIC_FILES_CHKSUM =3D "file://pyldb.h;endline=3D24;md5=3Ddfbd238cecad7=
6957f7f860fbe9adade \
>> +                    file://man/ldb.3.xml;beginline=3D261;endline=3D26=
2;md5=3D137f9fd61040c1505d1aa1019663fd08 \
>> +                    file://tools/ldbdump.c;endline=3D19;md5=3Da7d4fc5=
d1f75676b49df491575a86a42"
>>
>>  SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>>             file://do-not-import-target-module-while-cross-compile.pat=
ch \
>> @@ -12,34 +12,32 @@ SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.ta=
r.gz \
>>             file://0001-libldb-fix-config-error.patch \
>>             file://libldb-fix-musl-libc-unkown-type-error.patch \
>>             file://libldb-fix-musl-libc-conflict-type-error.patch \
>> -          "
>> +           ${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://=
avoid-openldap-unless-wanted.patch', d)}"
>> +
>> +SRC_URI[md5sum] =3D "159a1b1a56dcccf410d1bba911be6076"
>> +SRC_URI[sha256sum] =3D "2df13aa25b376b314ce24182c37691959019523de3cc5=
356c40c1a333b0890a2"
>> +
>> +DEPENDS +=3D "libtdb libtalloc libtevent popt"
>> +
>> +S =3D "${WORKDIR}/ldb-${PV}"
>> +
>> +inherit waf-samba distro_features_check
>> +REQUIRED_DISTRO_FEATURES =3D "pam"
>>
>> -PACKAGECONFIG ??=3D "\
>> +PACKAGECONFIG ?=3D "\
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} =
\
>>  "
>> +
>>  PACKAGECONFIG[acl] =3D "--with-acl,--without-acl,acl"
>>  PACKAGECONFIG[attr] =3D "--with-attr,--without-attr,attr"
>>  PACKAGECONFIG[ldap] =3D ",,openldap"
>>  PACKAGECONFIG[libaio] =3D "--with-libaio,--without-libaio,libaio"
>>  PACKAGECONFIG[libbsd] =3D "--with-libbsd,--without-libbsd,libbsd"
>>  PACKAGECONFIG[libcap] =3D "--with-libcap,--without-libcap,libcap"
>> +PACKAGECONFIG[python] =3D ",--disable-python, , python"
>>  PACKAGECONFIG[valgrind] =3D "--with-valgrind,--without-valgrind,valgr=
ind"
>>
>> -SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file=
://avoid-openldap-unless-wanted.patch', d)}"
>> -
>> -LIC_FILES_CHKSUM =3D "file://pyldb.h;endline=3D24;md5=3Ddfbd238cecad7=
6957f7f860fbe9adade \
>> -                    file://man/ldb.3.xml;beginline=3D261;endline=3D26=
2;md5=3D137f9fd61040c1505d1aa1019663fd08 \
>> -                    file://tools/ldbdump.c;endline=3D19;md5=3Da7d4fc5=
d1f75676b49df491575a86a42"
>> -
>> -SRC_URI[md5sum] =3D "159a1b1a56dcccf410d1bba911be6076"
>> -SRC_URI[sha256sum] =3D "2df13aa25b376b314ce24182c37691959019523de3cc5=
356c40c1a333b0890a2"
>> -
>> -inherit waf-samba distro_features_check
>> -REQUIRED_DISTRO_FEATURES =3D "pam"
>> -
>> -S =3D "${WORKDIR}/ldb-${PV}"
>> -
>>  EXTRA_OECONF +=3D "--disable-rpath \
>>                   --disable-rpath-install \
>>                   --bundled-libraries=3Dcmocka \
>> @@ -50,7 +48,7 @@ EXTRA_OECONF +=3D "--disable-rpath \
>>                   --without-ldb-lmdb \
>>                  "
>>
>> -PACKAGES =3D+ "pyldb pyldb-dbg pyldb-dev"
>> +PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'pyldb=
 pyldb-dbg pyldb-dev', '', d)}"
>>
>>  NOAUTOPACKAGEDEBUG =3D "1"
>>
>> @@ -66,3 +64,5 @@ FILES_pyldb =3D "${libdir}/python${PYTHON_BASEVERSIO=
N}/site-packages/* \
>>  FILES_pyldb-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packa=
ges/.debug \
>>                     ${libdir}/.debug/libpyldb-util.so.*"
>>  FILES_pyldb-dev =3D "${libdir}/libpyldb-util.so"
>> +
>> +RDEPENDS_pyldb +=3D "samba"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



