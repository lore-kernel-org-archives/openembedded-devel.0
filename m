Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD806FF76
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2016 17:40:09 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so20556557vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2016 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=nDKPoCn0pu/iAv8ACly4gOJEapqG57GYt4fJxGW4w7s=;
	b=oe7PUnpeS1cHQdzwKJ8hfSBs3yYVGX5sqLnwjCRFgNJthOP4Vk1wDYMxwIjGojy9N3
	9b5Fzxw3Di4b7RdJBsQQS9p0z6YX5S7BB/TMjw5OnTzIWwlYZEKeuJpOj+d0GyesngYj
	VuLriBNFuAu7L9SgCFs2iQdusddwIZsiWqtkKQLshSThH8ZwXPiz15SFWeyspP+7gHpL
	MlkZIFbjyswxZPjPI0Yp2lmw7CjlefZyPd2v/ORM2PF1cyqJBtJ3aEkl0KLCpk+HtPAu
	LF7JaiEGz8K5iB1LA/5RNk9t3g2yIcmNQaDIA/m5C9B0FuSdyerEnUBAlYeSu4XiWYdL
	65lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=nDKPoCn0pu/iAv8ACly4gOJEapqG57GYt4fJxGW4w7s=;
	b=J/F1f/YNwyvmBVF1j5PsW3Px5PNIdaWiqJ8MBVHXa7NwTQ2iTcVKyrsVYSurkSu4QO
	7QvY2tqZCJX3aBT4CJT+zwrP9j3DlZRnQP2Kan5A3x2I/lPaWPgICEb4QcOh9h93PXA2
	cAj+bwOpn3ozxDDLPCvNyILV7oNFt/e8VxinHRDij6RH1afAl0mA2dqlZbo+yOi0EUN5
	InnRCJ60VEA1698lwUyq2m2qWclYdR2/ihc/QM+yIQFss41tYiyR/LMDKALFt4qQ7lne
	4/4okny1nGuMHbD6rO2PfcIwNkP7bYMGnzm5pd5SrYvhFapbrH29RoPQLLf2coucW+GN
	LsqQ==
X-Gm-Message-State: AKaTC01ufrOWTjzDiVmwFlWKgqTO0BeyFGBgOD91VFmM++oihTHELv44VTxV8Jgst2m+96A/ARmMO/EBYCb9cw==
X-Received: by 10.31.197.195 with SMTP id v186mr2903556vkf.84.1479577210193;
	Sat, 19 Nov 2016 09:40:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sat, 19 Nov 2016 09:39:39 -0800 (PST)
In-Reply-To: <1479497893-21851-1-git-send-email-michael.davis@essvote.com>
References: <1479497893-21851-1-git-send-email-michael.davis@essvote.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Nov 2016 09:39:39 -0800
Message-ID: <CAMKF1srV=Kf85RggcRhEV8GQofjtV76XnE9YiTBsUdrM+2haTw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCHv2] chromium: Fix ILL_ILLOPN signal in sandbox
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
X-List-Received-Date: Sat, 19 Nov 2016 17:40:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 18, 2016 at 11:38 AM, Davis, Michael
<michael.davis@essvote.com> wrote:
> Fix Aw Snap! error when running chromium 52 in Morty with sandbox enabled.
>
> Based on upstream qtwebengine-chromium commit b12ffcd411d4776f7120ccecb3be34344d930d2b
> http://code.qt.io/cgit/qt/qtwebengine-chromium.git/commit/?h=49-based&id=b12ffcd411d4776f7120ccecb3be34344d930d2b

Thanks. This looks good

>
> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  .../chromium/chromium/chromium/unset-madv-free.patch      | 15 +++++++++++++++
>  recipes-browser/chromium/chromium_52.0.2743.76.bb         |  1 +
>  2 files changed, 16 insertions(+)
>  create mode 100644 recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
>
> diff --git a/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch b/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
> new file mode 100644
> index 0000000..15d4982
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
> @@ -0,0 +1,15 @@
> +diff -Naur chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp chromium-52.0.2743.76b/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp
> +--- chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp    2016-07-15 17:02:49.000000000 -0500
> ++++ chromium-52.0.2743.76b/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp   2016-11-18 09:13:01.109731385 -0600
> +@@ -41,6 +41,11 @@
> + #include <errno.h>
> + #include <sys/mman.h>
> +
> ++#if OS(LINUX) && defined(MADV_FREE)
> ++// Added in Linux 4.5, but it breaks the sandbox.
> ++#undef MADV_FREE
> ++#endif
> ++
> + #ifndef MADV_FREE
> + #define MADV_FREE MADV_DONTNEED
> + #endif
> diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> index 14b519c..5be3c32 100644
> --- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> +++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> @@ -9,6 +9,7 @@ SRC_URI += "\
>          file://0005-Override-root-filesystem-access-restriction.patch \
>          file://chromium/0011-Replace-readdir_r-with-readdir.patch \
>          file://chromium/remove-Werror.patch \
> +        file://chromium/unset-madv-free.patch \
>          ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>  "
> --
> 2.5.5
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

