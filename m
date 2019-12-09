Return-Path: <sbabic@denx.de>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Dec 2019 15:03:03 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id B478F7FCAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:03:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47WmR629rYz1rh8j;
	Mon,  9 Dec 2019 15:53:38 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47WmR61hJMz1rhB4;
	Mon,  9 Dec 2019 15:53:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id SveVVNomUm9k; Mon,  9 Dec 2019 15:53:36 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Mon,  9 Dec 2019 15:53:36 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 7EAE34540415;
	Mon,  9 Dec 2019 15:53:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id YnvfKCVBdOtA; Mon,  9 Dec 2019 15:53:33 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 5279145400CA;
	Mon,  9 Dec 2019 15:53:33 +0100 (CET)
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20191209144601.21938-1-brgl@bgdev.pl>
From: Stefano Babic <sbabic@denx.de>
Autocrypt: addr=sbabic@denx.de; prefer-encrypt=mutual; keydata=
	xsDiBEfdB5IRBADkpYcnh2BoAkGD5p186ysEkWlcp5DU07m7BKzvkEMRhFjeFUOU0klKNmh0
	ZM6rKpYpAYPYBm9YahMyqvj9DmLrZ4yfJ5MssvW9SRETmHpva+h1rN+DzmEcwrqZmLG1JWGy
	LA5ruJaFSzxJHBoROoog1NDMbNDB8A9F7VKrePfkVwCgmODpW/uh2IuMYLVidzDeuvo7alED
	/iV8rwU7C+eBcKy2htuDsEmsqlkBxIDM7IO6h5XxdyqbZOYizuBP3Ksb6xK54weEaB5aQs7S
	8N9Soi0p1Xh0LMWj6PBCzTC4LF+OCGEMBPc6bBHNzivChgztJlUMioCDSVpOXB/QpBaK302G
	yP5WdmcB1Jn6neq/YRlxHN38MV2yA/46jnzeUotL9LliVZKA/ql4GmyWg2Ae1BUiCqEJQNwl
	knGJOmIS4uABLArB5HjsfDU5hA9FORaNGCIiZlezBkZ3JXA2uQMQhfgqBXrZt4j1fcw9I7E+
	7IZ2kSCeTPZFLd5FiGQPDOm3Z9eHrpK6pmBGMeBG0pDgUEbN9awyLNBLj80eU3RlZmFubyBC
	YWJpYyA8c2JhYmljQGRlbnguZGU+wmMEExECACMCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIX
	gAUCT9deSgIZAQAKCRD09WXkmmjvppF1AKCRl8d49K4yxWzdBVRTTWG55cyo/gCfRD1RAttl
	R1ofs2wGLHNtXousyL3OwU0ER90HmBAIAIFfX4bKnOmCyB3nPh+jbXZuBSMZTuyDEnguRxl5
	N8Q0ayofQwucCBjXYv65sQ9Rq6FNhEnWqUZBu8A5CwvSakOFOGNC5ta/8VxVRLh0Z0ZTgEep
	SKiPonJyacCbmgWDECdVrKowV7QB9be3Wu67uAZ74rPw2Kd7f0FKnL3djvVRMaBWFIpyQ6SE
	bGOCJjhRQ5L1pIM1Soko+reU7eO+1g6IBw6YkFJisdQE6fzTwaSqUKPPsQLz/W03invQltOb
	Eg7ZwtFs0DFonr1DMm57ksiEhW6SN1wylRO/JzRYG1Qe7u1EVln6iV3ilBvbbfkyRssk4/0e
	kicpSnQknA72YOMAAwYH+QGpAiQ4hAMHrp1bUrtyGXYdeQpYufIZAM4etOnBy/G+e1nfu6y+
	jH4SN9sVK7bwBBAbhEJqkqR5LVsFIRapThJQOWB11rQxLpwkBU9wao/pRM+o95ujGo32WUzf
	wWrzWrkTDy7vMCZuUOLVi4n1GZlUAwpG4rzb6UxPC6GWymkVWGgXp1NC58og5i3Y+rKT7+Xi
	XT2BtvC6PDepoH4JhD+9OkHQO6UfTxPSmtgNbTgtl6L6tj+bm5dOHgkPJFMkEiG8qhUZYQzb
	bYz37orRbA72M2bxK76e9QKn0mVu+d/YCd8wRcvvJbGsozpzcxPvD5Wy5RNJCES8McPtAseU
	tMfCSQQYEQIACQUCR90HmAIbDAAKCRD09WXkmmjvpv+3AJ9RakBsH1j0X/Kxp6t2lf0VUfS2
	qACfZ+J6ktk8PKNuyHf0J/I0mbCrhV4=
Message-ID: <c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
Date: Mon, 9 Dec 2019 15:53:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209144601.21938-1-brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [meta-oe][PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 15:03:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 09/12/19 15:46, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> rdiff is a popular tool for calculating binary delta patches. It's
> provided by the librsync package (unrelated to rsync already available
> in poky).
> 

Nice, I added it (really, 2.1) to my public layer, but this definetely
belongs to OE:

https://github.com/sbabic/meta-swupdate/blob/master/recipes-support/librsync/librsync_2.1.0.bb


> This recipe adds new packages for librsync and rdiff.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../recipes-support/librsync/librsync_2.2.1.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> 
> diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> new file mode 100644
> index 000000000..9d224767c
> --- /dev/null
> +++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Remote delta-compression library."
> +AUTHOR = "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schubert"
> +
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
> +
> +SRC_URI = "git://github.com/librsync/librsync.git"
> +SRCREV = "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "popt"

Don't you have any depends from zlib / bzip ? cmake tests it, if you do
not add it, build will be fine but without support.

> +
> +inherit cmake
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +PACKAGES =+ "rdiff"
> +FILES_rdiff = "/usr/bin/rdiff"
> 

Best regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

