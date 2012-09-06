Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Ymv-0005Zq-M9
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 11:54:18 +0200
Received: from localhost ([127.0.0.1]:40647 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XoQ-0007CL-DU
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 08:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=1sm5lmx4MCE1lQPYWxrGGJiG8ZU=; b=maFq2htqRfEEtaXyCeLMPflFbZiI
	AaWCTaffy/AgPVQyifni9auaim5zOIugq8xBL4o9SNJVkbLjfiAn5nyNkMko+IYc
	yWSJsCbBQpyHS96mXbY6BK5iNJ/sOpdIgp87hubtbNOKjbxNAm8erhNwxIq5qC7B
	BYn6gMkuKzFVQ2w=
Received: from [195.171.99.130] (port=30569 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9XoQ-0007CH-B5
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 08:51:46 +0000
Message-ID: <50486464.7050704@communistcode.co.uk>
Date: Thu, 06 Sep 2012 09:52:52 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [PATCHv4 1/3] libplist: add upstream patch to fix parallel make issue
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
X-List-Received-Date: Thu, 06 Sep 2012 09:54:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/12 16:21, ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   .../libimobiledevice/files/fix-parallel-make.patch  | 21 +++++++++++++++++++++
>   .../libimobiledevice/libplist_1.8.bb                |  5 ++++-
>   2 files changed, 25 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
>
> diff --git a/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch b/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
> new file mode 100644
> index 0000000..f6ef6f4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
> @@ -0,0 +1,21 @@
> +From 335b25febd4c864ad0ac08479f5cd43fc21b7d73 Mon Sep 17 00:00:00 2001
> +From: Nikias Bassen
> +Date: Mon, 09 Jul 2012 21:17:15 +0000
> +Subject: Fix building with parallel build makeopts
> +
> +---
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 0bad840..155994e 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -57,6 +57,8 @@ ADD_SUBDIRECTORY( plutil )
> + ADD_SUBDIRECTORY( include )
> + ADD_SUBDIRECTORY( test )
> +
> ++ADD_DEPENDENCIES( plist libcnary )
> ++
> + IF ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
> + 	ADD_SUBDIRECTORY( swig )
> + ENDIF ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
> +--
> +cgit v0.9.0.2
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
> index 9c218fb..2da8058 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
> @@ -8,7 +8,10 @@ DEPENDS = "libxml2 glib-2.0 swig python"
>   
>   inherit cmake pkgconfig
>   
> -SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2"
> +SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \
> +           file://fix-parallel-make.patch \
> +"
> +
>   SRC_URI[md5sum] = "2a9e0258847d50f9760dc3ece25f4dc6"
>   SRC_URI[sha256sum] = "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
>   

With all the chatter this has got a bit lost. I believe everyone is now 
happy so this patch set is ready to merge.

Cheers all,


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



