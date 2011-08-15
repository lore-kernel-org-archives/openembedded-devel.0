Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QszNe-0004n4-7R
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 17:47:10 +0200
Received: by yxi19 with SMTP id 19so3143620yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2011 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=gq7uxilDhHdRpDYOYX5HF7hNcudaC2bl2pjA0+iS8Ro=;
	b=Q5q+F5irWKtoDPTktFazs2ncZSivd1uoyaJwA0ofmmZCv/dzVeuAhLnj3kuKF7zM64
	uDuyBxTLHASnUdPtDEc8TiVFYDyWrHbA3ZC3yKrob+2ifimuZE6V6uphCD5UyVxULHar
	DTATlGzN1FSA2dDLi8i4Q3gWMRnX3euy1/zes=
Received: by 10.101.189.1 with SMTP id r1mr3952858anp.6.1313422953617;
	Mon, 15 Aug 2011 08:42:33 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s13sm5231490anm.6.2011.08.15.08.42.32
	(version=SSLv3 cipher=OTHER); Mon, 15 Aug 2011 08:42:32 -0700 (PDT)
Message-ID: <4E493E66.2090709@gmail.com>
Date: Mon, 15 Aug 2011 08:42:30 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1313250436-32653-1-git-send-email-raj.khem@gmail.com>
	<1313250436-32653-2-git-send-email-raj.khem@gmail.com>
	<1313268924.8289.6.camel@mattotaupa>
In-Reply-To: <1313268924.8289.6.camel@mattotaupa>
X-Enigmail-Version: 1.2.1
Subject: Re: [meta-oe][PATCH 2/2] openssl-1.0.0: Add recipes for openssl_1.0.0d
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2011 15:47:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/13/2011 01:55 PM, Paul Menzel wrote:
> Am Samstag, den 13.08.2011, 08:47 -0700 schrieb Khem Raj:
>> Delete 1.0.0c recipes
> 
> The commit summary should say »update« and not »Add« then.
> 
> openssl-1.0.0: Update to openssl_1.0.0d
> 
> In my opinion »recipe« is redundant for a commit summary.
> 
>> Add patches from debian
> 
> The patch headers seem to be missing. Maybe you can submit those to 
> Debian too.
> 

I am no openssl expert therefore describing them might not be something
for me.

>> Remove recipes for openssl-native use BBCLASSEXTEND instead Drop
>> libdeps-first.patch it would not let openssl-native build on ubuntu
>> 11.10
> 
> What is the error?

openssl-native changed the order of libraries and objects where now
library was specified before objects and any references to functions
in libcrypto were being reported undefined.

> 
>> Delete debian.patch, all changes in it are now provided by patches
>> under debian dir
>> 
>> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
>> .../openssl/openssl-1.0.0c/debian.patch            |  515 --- 
>> .../openssl/openssl-1.0.0c/libdeps-first.patch     |   27 - 
>> .../configure-targets.patch                        |    0 
>> .../openssl-1.0.0d/debian/c_rehash-compat.patch    |   43 + 
>> .../openssl/openssl-1.0.0d/debian/ca.patch         |   20 + 
>> .../openssl-1.0.0d/debian/debian-targets.patch     |   52 + 
>> .../openssl-1.0.0d/debian/make-targets.patch       |   13 + 
>> .../openssl/openssl-1.0.0d/debian/man-dir.patch    |   13 + 
>> .../openssl-1.0.0d/debian/man-section.patch        |   32 + 
>> .../openssl/openssl-1.0.0d/debian/no-rpath.patch   |   13 + 
>> .../openssl-1.0.0d/debian/no-symbolic.patch        |   13 + 
>> .../openssl/openssl-1.0.0d/debian/pic.patch        |  240 ++ 
>> .../openssl/openssl-1.0.0d/debian/pkg-config.patch |   34 + 
>> .../openssl-1.0.0d/debian/version-script.patch     | 4491
>> ++++++++++++++++++++ .../engines-install-in-libdir-ssl.patch
>> |    0 .../oe-ldflags.patch                               |    0 
>> .../openssl/openssl-1.0.0d/parallel-make-fix.patch |   20 + 
>> .../shared-libs.patch                              |    0 
>> .../openssl/openssl-native_1.0.0c.bb               |   27 - 
>> .../recipes-connectivity/openssl/openssl_1.0.0c.bb |   36 - 
>> .../recipes-connectivity/openssl/openssl_1.0.0d.bb |   47 + 21
>> files changed, 5031 insertions(+), 605 deletions(-) delete mode
>> 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0c/debian.patch 
>> delete mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0c/libdeps-first.patch
>>
>> 
rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =>
openssl-1.0.0d}/configure-targets.patch (100%)
>> create mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/c_rehash-compat.patch
>>
>> 
create mode 100644
meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/ca.patch
>> create mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/debian-targets.patch
>>
>> 
create mode 100644
meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/make-targets.patch
>> create mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/man-dir.patch
>>
>> 
create mode 100644
meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/man-section.patch
>> create mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/no-rpath.patch
>>
>> 
create mode 100644
meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/no-symbolic.patch
>> create mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/pic.patch
>>
>> 
create mode 100644
meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/pkg-config.patch
>> create mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/version-script.patch
>>
>> 
rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =>
openssl-1.0.0d}/engines-install-in-libdir-ssl.patch (100%)
>> rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =>
>> openssl-1.0.0d}/oe-ldflags.patch (100%) create mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/parallel-make-fix.patch
>>
>> 
rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0c =>
openssl-1.0.0d}/shared-libs.patch (100%)
>> delete mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl-native_1.0.0c.bb 
>> delete mode 100644
>> meta-oe/recipes-connectivity/openssl/openssl_1.0.0c.bb create mode
>> 100644 meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
> 
> […]
> 
>> diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
>> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb new file
>> mode 100644 index 0000000..384f3ba --- /dev/null +++
>> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb @@ -0,0
>> +1,47 @@ +require recipes-connectivity/openssl/openssl.inc + +# For
>> target side versions of openssl enable support for OCF Linux
>> driver +# if they are available. +DEPENDS += "ocf-linux" + +CFLAG
>> += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS" + +PR =
>> "${INC_PR}.0" +#- * Copyright (c) 1998-2008 The OpenSSL Project.
>> All rights reserved. +#+ * Copyright (c) 1998-2011 The OpenSSL
>> Project.  All rights reserved.
> 
> What are those comments good for?
> 

Good for nothing. Those were changes that made difference in license
checksums between 1.0.0c and 1.0.0d  I have resubmit a patch to clean
them up. I meant to add them to commit message instead

>> + +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8" + 
>> +SRC_URI[src.md5sum] = "40b6ea380cc8a5bf9734c2f8bf7e701e" 
>> +SRC_URI[src.sha256sum] =
>> "92511d1f0caaa298dba250426f8e7d5d00b271847886d1adc62422778d6320db" 
>> + +DEFAULT_PREFERENCE = "-1"
> 
> Why is it not the default? Just not tested? I am not into 
> meta-openembedded yet but I am wondering if only distributions
> should pin that in their configurations.
> 

I left it as it was in 1.0.0c I have not tried to fix it. Avoid many
variables as a time. There could be a subsequent patch for that like
oe-core has. I am not too sure if that patch is applicable to 1.0.0 as well.

>> + +export DIRS = "crypto ssl apps engines" +export
>> OE_LDFLAGS="${LDFLAGS}" + +SRC_URI +=
>> "file://configure-targets.patch \ +
>> file://shared-libs.patch \ +            file://oe-ldflags.patch \ +
>> file://engines-install-in-libdir-ssl.patch \ +
>> file://debian/version-script.patch \ +	    file://debian/pic.patch
>> \ +	    file://debian/c_rehash-compat.patch \ +
>> file://debian/ca.patch \ +	    file://debian/make-targets.patch \ +
>> file://debian/no-rpath.patch \ +	    file://debian/man-dir.patch \ 
>> +	    file://debian/man-section.patch \ +
>> file://debian/pkg-config.patch \ +
>> file://debian/no-symbolic.patch \ +
>> file://debian/debian-targets.patch \ +	   "
> 
> The indentations do look differently.
> 

yes fixed in followup patch


>> + +PACKAGES += " \ +	${PN}-engines \ +	${PN}-engines-dbg \ +	" + 
>> +PARALLEL_MAKE = ""
> 
> Do you know what the problem with parallel builds is? What is the
> error?
> 

as explained above

>> +FILES_${PN}-engines = "${libdir}/ssl/engines/*.so" 
>> +FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
> 
> 
> Thanks,
> 
> Paul
> 
> 
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5JPmYACgkQuwUzVZGdMxSn8ACfQnp8RH/jIn9vp9mBk7r6uhpU
bo4AnR+MCqHihLjPe0Ilu/d5T3OPiUig
=1Ka9
-----END PGP SIGNATURE-----


