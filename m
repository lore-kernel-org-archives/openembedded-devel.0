Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 467 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Aug 2015 10:47:53 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3C3734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:47:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id AC8BE216C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 06:40:06 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 26 Aug 2015 06:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=ZfazLDiGPibWLKU
	hdeyltIZYiEM=; b=i1mFtM/1vnLq692r0NN6oUwV+VGpjsDBCIuWdVdcaYpk9Rv
	y3cYmVCFYMVevdFAxQIis+tkogkGfSYsgoHPPKdBoLxB+mrpWUXBEf4m/UwX9Dsh
	K6YVApdmcOC4rN26Xc+DCELZVPa086LowZ1NEjzJeCVHCBdk6ozFUN7fwRVU=
X-Sasl-enc: bQgMas8Rdx6Bp+2EdxhMR6sLm/4dLew7B65OXGpb4lp9 1440585605
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9524C680197;
	Wed, 26 Aug 2015 06:40:05 -0400 (EDT)
Message-ID: <1440585604.1644.17.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 13:40:04 +0300
In-Reply-To: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.16.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] libnotify3: remove the recipe
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
X-List-Received-Date: Wed, 26 Aug 2015 10:47:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-26 at 13:07 +0300, Alexander Kanavin wrote:
> libnotify 0.7.6 is now provided in oe-core
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb | 16 ----------------
>  meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb   |  2 +-
>  2 files changed, 1 insertion(+), 17 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
> 
> diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
> deleted file mode 100644
> index b66fe97..0000000
> --- a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "Send desktop notifications to a notification daemon"
> -SECTION = "libs"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> -
> -DEPENDS = "dbus gtk+3"
> -
> -# conflicts with libnotify, mixing them in build breaks couple of packages
> -EXCLUDE_FROM_WORLD = "1"
> -
> -BPN = "libnotify"
> -
> -inherit gnome lib_package
> -
> -SRC_URI[archive.md5sum] = "d20676bde7bd2d276508d019dc7276f1"
> -SRC_URI[archive.sha256sum] = "322541fdf276eb803686df81763a5186af041b2ee3e9cc5fa1dc86c550388c88"
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
> index 1acf8d3..586d1d9 100644
> --- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426 \
>  
>  PR = "r4"
>  
> -DEPENDS = "libnotify3 gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
> +DEPENDS = "libnotify gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
>  # optional: tracker
>  
>  # needs libnotify3 which conflicts with libnotify, mixing them in build breaks couple of packages


This last comment seems to be out of date after this patch.

-- 
Tanu

