Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id AE0C870589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:55:07 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so6969307pab.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type;
	bh=rdSbwodvtdLXYlFDXrCTWENrcYdx0aV+Bqh7dgZiCJQ=;
	b=B8JyRxHbAhjOYnQjP4FFC35pEpKIEjYfhnf86qtjBBpvrFFKfgfuGnFhORmCdtIgqY
	vIm/4J045b057b/an4T2gTPClt9TOYrTllYyCpSp4T0sT8yBmoHf0kKn+r+e2EWxImWd
	hLn44S4odY7WyNhXXd6O6nr5BfUQy29GO8AthM/v0RE9moeZycWctwJsORFJlggDrABZ
	siFeyCXCVc9Pt+WwNkMVPA+nykmBTS4nJd8novQhxE4wYlZqm0TqQc7uGq6Lz8fHXDhb
	gs7yEAhPMvhWg4i33YN04kX0oH5BLTW0vtSjIEaKj4YDSrnE8chkg5kNLl7MOfifx88z
	6WxQ==
X-Gm-Message-State: ALoCoQndeR5prq6T9fwQImEeTSrMdSMAfnIwtTjplYv/9L+ydwpyd9pSac7JXbxOGL0n//f4Mgxs
X-Received: by 10.66.251.36 with SMTP id zh4mr14084177pac.100.1405432508082;
	Tue, 15 Jul 2014 06:55:08 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ce9sm18756151pdb.49.2014.07.15.06.55.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 06:55:07 -0700 (PDT)
Message-ID: <53C532B9.8010009@mvista.com>
Date: Tue, 15 Jul 2014 06:55:05 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1405402285-29775-1-git-send-email-akuster@mvista.com>
	<lq2r2a$kla$1@ger.gmane.org>
In-Reply-To: <lq2r2a$kla$1@ger.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] [v3] lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 13:55:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 07/15/2014 02:08 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Armin Kuster schreef op 15-07-14 07:31:
>> update to version r119 Use github instead of svn LICENSE md5sum changed
>> since it was updated in r117
> Good to know when it was changed, but I'm more interested in *what* changed.

Copyright was updated.

-Copyright (c) 2013, Yann Collet
+Copyright (c) 2011-2014, Yann Collet



- Armin


>
>> FIxes CVE-2014-4611
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com> ---
>> meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} | 11 ++++------- 1
>> file changed, 4 insertions(+), 7 deletions(-) rename
>> meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (68%)
>>
>> diff --git a/meta/recipes-support/lz4/lz4_svn.bb
>> b/meta/recipes-support/lz4/lz4_git.bb similarity index 68% rename from
>> meta/recipes-support/lz4/lz4_svn.bb rename to
>> meta/recipes-support/lz4/lz4_git.bb index 38e36d8..3978d76 100644 ---
>> a/meta/recipes-support/lz4/lz4_svn.bb +++
>> b/meta/recipes-support/lz4/lz4_git.bb @@ -2,15 +2,12 @@ SUMMARY =
>> "Extremely Fast Compression algorithm" DESCRIPTION = "LZ4 is a very fast
>> lossless compression algorithm, providing compression speed at 400 MB/s
>> per core, scalable with multi-cores CPU. It also features an extremely
>> fast decoder, with speed in multiple GB/s per core, typically reaching
>> RAM speed limits on multi-core systems."
>>
>> LICENSE = "BSD" -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850" +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
>>
>> -# Upstream names releases after SVN revs -SRCREV = "112" -PV =
>> "r${SRCREV}" +SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
>> +SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
>>
>> -SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http" -
>> -S = "${WORKDIR}/trunk" +S = "${WORKDIR}/git"
>>
>> EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir}
>> INCLUDEDIR=${includedir}"
>>
>>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTxO+KMkyGM64RGpERAnrdAJ9H8ZZGNxbZ7hGQd3sL8xKMhJ6v6wCdGKcf
> r8Kx6H0IJOr+2LDz7XAKVzo=
> =CNTg
> -----END PGP SIGNATURE-----
>


