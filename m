Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E051C706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 19:49:48 +0000 (UTC)
Received: by wghl18 with SMTP id l18so948991wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 11:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=SagT/hF2d8PIJAszGzK9Nliq6Mfkx+2iPktR3qfXwOw=;
	b=joEZxgd3esvjO75QK6AE6kJDa69U6pvTW6poGAfSMWteQ2FGxPB8HHrZY2OOyLY6xv
	huQ2d4vJm671jkVad/52dexaXcP0mX41KDCSgkeTlNwZzecgGIT/2jKFiAu9sontSSip
	D16ASvloThFUo/Eb4/1Yxen7Zhf3CaDhGB2TJp3JGAyDLmQVP4NX7puyEiHkgKD71SRE
	FQNcc/63w1wgmKPzQWrsgJ14cslPNOT6AnyFq9bdBDrgEC9TySbXDRrikqTEEtYHUR9y
	j3RlAi3OSb68K9VEUz3lkZikMoq//KNvJcOujOuB0/lLk9g9Bht4dUQPeAXpfcGXTwqZ
	H3NQ==
X-Received: by 10.180.76.133 with SMTP id k5mr23725943wiw.30.1424720989171;
	Mon, 23 Feb 2015 11:49:49 -0800 (PST)
Received: from [192.168.50.198] (ip-84-119-96-251.unity-media.net.
	[84.119.96.251]) by mx.google.com with ESMTPSA id
	pp10sm56969442wjc.31.2015.02.23.11.49.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Feb 2015 11:49:48 -0800 (PST)
Message-ID: <54EB846E.9090304@gmail.com>
Date: Mon, 23 Feb 2015 20:50:06 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
	<1424512336-47007-3-git-send-email-sven.ebenfeld@gmail.com>
In-Reply-To: <1424512336-47007-3-git-send-email-sven.ebenfeld@gmail.com>
Subject: Re: [meta-oe][PATCH 2/7] crda: Fix SRC_URI
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
X-List-Received-Date: Mon, 23 Feb 2015 19:49:49 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit

Please don't hesitate about trying this patch as crda just got updated.

Am 21.02.2015 um 10:52 schrieb Sven Ebenfeld:
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  meta-networking/recipes-connectivity/crda/crda_1.1.3.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> index 0bb8998..5b86058 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> @@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
>  
>  DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
>  
> -SRC_URI = "http://wireless.kernel.org/download/crda/${BP}.tar.bz2;name=crda \
> -           http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin;name=bin \
> +SRC_URI = "https://www.kernel.org/pub/software/network/${PN}/${BP}.tar.bz2;name=crda \
> +           https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2013.01.11.tar.bz2;name=bin \
>  "
>  SRC_URI[crda.md5sum] = "29579185e06a75675507527243d28e5c"
>  SRC_URI[crda.sha256sum] = "aa8a7fe92f0765986c421a5b6768a185375ac210393df0605ee132f6754825f0"
> -SRC_URI[bin.md5sum] = "e0c8a5ca63fb8bf803213f9a0c90b50b"
> -SRC_URI[bin.sha256sum] = "b1ee0b20c123c612dfdb6851ab42c01666f66fb583e0e590942f19bb54cf84be"
> +SRC_URI[bin.md5sum] = "f137585abd5e07454932ea555b826149"
> +SRC_URI[bin.sha256sum] = "6eb469555eb547b22738ce7bf59ebba42138560f128085a5e238eb6c8075792e"
>  
>  inherit python-dir pythonnative
>  # Recursive make problem
> @@ -28,7 +28,7 @@ do_install() {
>  
>      install -d ${D}${libdir}/crda/
>  
> -    install -m 0644 ${WORKDIR}/2013.01.11-regulatory.bin ${D}${libdir}/crda/regulatory.bin
> +    install -m 0644 ${WORKDIR}/wireless-regdb-2013.01.11/regulatory.bin ${D}${libdir}/crda/regulatory.bin
>  }
>  
>  
> 

