Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D45C96BF38
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 02:53:28 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id m10so5465241plt.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 19:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GHG7lVlQSMoFVXYsPonhVhdDTF13h2bFzz4DA1H8A5U=;
	b=NlXcVsDxyfHY//LbFGeUa+M6dASUSzEM1AfkqzOBkGuTtCk/pqFwmoBlSuPDNalJgv
	4LJTqC24Ruj7ctEp5Kkiz8O6GuZ6uVbFqu0Fj5BXbJSwF7RgLdyZHAkO/Y0CzpQ/SyKn
	6kMz5h9ahqXopJ91Ke+7pnjp1V6fir8ERKYs0+YUinw1ABq/yLhsCIuNDKkcg+7jmHJs
	71Qd3/mc4XhvDneRixRGnLbSYXK4PQUxAwSFQq8xuEkGOUz5JbiQCfU1x1M2eXxSSE0s
	0o8Aoy/doTb4Yw4quymmkMmKBiy02BzYByZysjIgQQBPqjxTYhb04Wy3j0oZS8PfYciE
	YEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=GHG7lVlQSMoFVXYsPonhVhdDTF13h2bFzz4DA1H8A5U=;
	b=VckU2Ys+qES9qVsb6xlpr1ZPjqvoy2zzvb+1CQ4CBYGM85fEYt2a5kBerRqyyfz8zn
	IwDGHIlKwRyfyX5agYBAg9BCgm6BQToIxBFd/7tx4tfv3c9DwF1Jq/1YkncHpOSUagCj
	frciV+dLJOSRETBiAEFzUSEDHVezR6TPnPcafxC/zKOWW/WMasI6clR9G5aFwoT5H3NA
	kkRaxFhzJNbwo1Hsc2fx2zqVoNfjMztk3BTjPXEkTw/scBWNkGLb/vV2zcd/a+VpNVER
	Hv7PC9yX1/Ts+mAXP9Q7Qn9lvf/eCcx20EnGy+tpnGF6zum/VRpxkmwFz2u6CS502seL
	Mhjg==
X-Gm-Message-State: APjAAAV6kB7N+qP2neKDBcT0Z4FX0QmjHFJB0DPf+Vjlfdoy49ShmM4a
	47YCsiGqcZSKPinKqQe2MVe0LFBp
X-Google-Smtp-Source: APXvYqxDDnX4JfoS74Ck8Q1G+1gr02JTWMnru+Wa9o43jc4bG5iUfRj1gGmbf8Sly1uLNc9chm2Qdw==
X-Received: by 2002:a17:902:2bc9:: with SMTP id
	l67mr67530309plb.102.1554173609727; 
	Mon, 01 Apr 2019 19:53:29 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4157:7fb6:2684:2e1?
	([2601:202:4180:c33:4157:7fb6:2684:2e1])
	by smtp.gmail.com with ESMTPSA id
	l69sm15661495pga.73.2019.04.01.19.53.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 19:53:29 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190329175453.28137-1-akuster808@gmail.com>
	<CAMKF1soymd1o4yTkUAMFc1378c4forRgWYWeUnFdGtKBX40Tzw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bd8ab90c-fc8e-154d-83db-05eee54f6fcc@gmail.com>
Date: Mon, 1 Apr 2019 19:53:28 -0700
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
X-List-Received-Date: Tue, 02 Apr 2019 02:53:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
hmm.. ok. will look into that.

- armin
>
> On Fri, Mar 29, 2019 at 10:55 AM Armin Kuster <akuster808@gmail.com> wrote:
>> There are conflicts with the samba python package
>> so disable the python pkg by default to fix:
>>
>> The pyldb has an RDEPENDS on samba which is causing issues with other
>> packages.
>>
>> ERROR: The file /usr/lib/python2.7/site-packages/_ldb_text.py is installed by both libldb and samba, aborting
>>
>> Also cleanup per style guide
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../recipes-support/libldb/libldb_1.4.1.bb    | 40 +++++++++----------
>>  1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
>> index 3c7e5455e9..c3865152e1 100644
>> --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
>> +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
>> @@ -2,9 +2,9 @@ SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
>>  HOMEPAGE = "http://ldb.samba.org"
>>  SECTION = "libs"
>>  LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>> -
>> -DEPENDS += "libtdb libtalloc libtevent popt"
>> -RDEPENDS_pyldb += "python samba"
>> +LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
>> +                    file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
>> +                    file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>>
>>  SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>>             file://do-not-import-target-module-while-cross-compile.patch \
>> @@ -12,34 +12,32 @@ SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>>             file://0001-libldb-fix-config-error.patch \
>>             file://libldb-fix-musl-libc-unkown-type-error.patch \
>>             file://libldb-fix-musl-libc-conflict-type-error.patch \
>> -          "
>> +           ${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
>> +
>> +SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
>> +SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
>> +
>> +DEPENDS += "libtdb libtalloc libtevent popt"
>> +
>> +S = "${WORKDIR}/ldb-${PV}"
>> +
>> +inherit waf-samba distro_features_check
>> +REQUIRED_DISTRO_FEATURES = "pam"
>>
>> -PACKAGECONFIG ??= "\
>> +PACKAGECONFIG ?= "\
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
>>  "
>> +
>>  PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
>>  PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
>>  PACKAGECONFIG[ldap] = ",,openldap"
>>  PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
>>  PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
>>  PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
>> +PACKAGECONFIG[python] = ",--disable-python, , python"
>>  PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
>>
>> -SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
>> -
>> -LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
>> -                    file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
>> -                    file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>> -
>> -SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
>> -SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
>> -
>> -inherit waf-samba distro_features_check
>> -REQUIRED_DISTRO_FEATURES = "pam"
>> -
>> -S = "${WORKDIR}/ldb-${PV}"
>> -
>>  EXTRA_OECONF += "--disable-rpath \
>>                   --disable-rpath-install \
>>                   --bundled-libraries=cmocka \
>> @@ -50,7 +48,7 @@ EXTRA_OECONF += "--disable-rpath \
>>                   --without-ldb-lmdb \
>>                  "
>>
>> -PACKAGES =+ "pyldb pyldb-dbg pyldb-dev"
>> +PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'pyldb pyldb-dbg pyldb-dev', '', d)}"
>>
>>  NOAUTOPACKAGEDEBUG = "1"
>>
>> @@ -66,3 +64,5 @@ FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
>>  FILES_pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
>>                     ${libdir}/.debug/libpyldb-util.so.*"
>>  FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
>> +
>> +RDEPENDS_pyldb += "samba"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


