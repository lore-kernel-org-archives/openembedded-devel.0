Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id F23826D130
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 12:54:17 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id gn14so3739707plb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 04:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=SlpbZxMnrhGakJg9pYqP2S9fChe0048s0uI5WDNH/ng=;
	b=IJNXKDnEsdSHlXklfzASbLugYJxnlWjbZLsRxDwQYpOQT6YJ9YmeMt569y8LiTeUuh
	0lakAhSOWz0ue4Ky1wxOM85qknfJc00YIGqfT4MDNTcFpgYL5tIKT7qWJ2OKKM5n73Qs
	pyn7fowxQ7AyTP4AtOsYljxVH2snSc3q/3KTPtX2TlwmBD7LruWtbOE/OH9ilayKC5vO
	5i4bCgL92ymHH2XXnGawoW7UyEva/zTlkuOb0HyirIzjcBcD/SKLqI1+2D0hZ3AhSIbi
	2CrsOlmpDuOKvCenYZwduhdEzsZDO0aFbG5iUXE4+7x3LWTg2DnMB+fknKTfPXtbMkx9
	Zj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=SlpbZxMnrhGakJg9pYqP2S9fChe0048s0uI5WDNH/ng=;
	b=RJB/yguMs2RQOsojiGO84iXi2JMgWPgCv5E5zBcMKFdQpeUsNj3O6/bnEXp50qva55
	vzpx98cK9xugpA7pTOIP139rEUcSNbjCwW5zqv1GJYy7dkkYrTJrRMU7/4M67362/D9t
	/wvUMlH079W868nxp3U5/EZDDEmPDstHRBm3VhYy5LeQVkrLlXT4YjVI/dPJ5bJhuBli
	+UU/tpZO0Lr9pU9sMQUvNjzm61gGHy2HSv6poBEaqX2Ni9cSR+L0gp+31mSfiFsTP8fD
	unlsTfdDYKoxKh3Czzp/iWFocWu2SRANQJRlxDtOeaIKg4TiqB4VaSp93HUu8ALgkXYl
	HPYw==
X-Gm-Message-State: AJcUukfz3fayY7HLToOiZ+Au1DdIGT57q2VsklRIB70JvIcIs24uhiXa
	7QCebNbOovRZWnIcXiYyXc7DDtYrvHyD0SEQdGZqxgnz
X-Google-Smtp-Source: ALg8bN4cBZeUdF7inlRw3BhNUe1UDTz1cXmwPTpv/kfD4yk24S/BV82CigOziL/8YvGm9QvLp4AB7FX7Dxn96l2p2ak=
X-Received: by 2002:a17:902:b112:: with SMTP id
	q18mr6395169plr.255.1545483258741; 
	Sat, 22 Dec 2018 04:54:18 -0800 (PST)
MIME-Version: 1.0
References: <1545482646-18142-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1545482646-18142-1-git-send-email-ankit.tarot@gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Sat, 22 Dec 2018 18:24:07 +0530
Message-ID: <CAM_RqkO1Vf54+kbR+yCL8tLVHmOBnWz3+f7p+95+F1+M_D2RJw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] vulkan-headers: Initial recipe for Vulkan headers
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
X-List-Received-Date: Sat, 22 Dec 2018 12:54:18 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, my bad its already available as part of vulkan echo system in
meta layer.
Please ignore the patch.
Regards, Ankit

On Sat, Dec 22, 2018 at 6:12 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for Vulkan header files and API registry.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  .../vulkan-headers/vulkan-headers_git.bb           | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb
>
> diff --git a/meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb b/meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb
> new file mode 100644
> index 0000000..1a0a212
> --- /dev/null
> +++ b/meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY  = "Vulkan API Headers"
> +DESCRIPTION = "Vulkan headers and API registry from Khronos Group"
> +LICENSE  = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +SECTION = "base"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "f54e45b92374b99de8556cacffc3602a03187b68"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git"
> +
> +inherit pkgconfig cmake
> +
> +FILES_${PN} = " \
> +       /usr/share \
> +       /usr/share/vulkan \
> +       /usr/share/vulkan/registry \
> +       /usr/share/vulkan/registry/cgenerator.py \
> +       /usr/share/vulkan/registry/vk.xml \
> +       /usr/share/vulkan/registry/reg.py \
> +       /usr/share/vulkan/registry/genvk.py \
> +       /usr/share/vulkan/registry/validusage.json \
> +       /usr/share/vulkan/registry/generator.py \
> +"
> --
> 2.7.4
>

