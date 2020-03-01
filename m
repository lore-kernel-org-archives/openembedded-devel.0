Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAD3F61A7D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2020 02:40:48 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t13so5076770qto.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 18:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a9C+5Cf+7vV66N6o7XJaVzEjmUPqhmv/ikWq+XLE+Io=;
	b=D5dGSVGuyzhFZ812ScSq8/eCpP4sD6SUuhCZMCqGNqCBEox8t1RuZDFKkSAXpQOrgT
	eF0DF/GhO+O1VQlWj2NiGV/6/lcwK86GVKqdazb1jZtLVQzAT66+Qq8g/0MSHJB+NlZf
	QseJr0xyTZa5nZsMJ+h2DbORxw63BgcykRgS80uVzIM+zIGoOadWodM1eBxqAKIazkGf
	1zmlgWwxLORV97aq14fCiPp7UeKs+XSP4e/WXlSx8486WvrzsDdWWRbwxILTAIjxRS+i
	u+wRY219zTZiPY+2Al4tTsWpc1pWqBx/549dQqLDcEaP37qfm/Ns/9DB96O8V8gvB62A
	eY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a9C+5Cf+7vV66N6o7XJaVzEjmUPqhmv/ikWq+XLE+Io=;
	b=W8O9Zqy8Umz8GZ+20mGpbc+IzWxgqoggBfGQXN+QiJ1YQAcnYcTYd5xspFBYnIf0wY
	ccc8boiCGOfzwROgvKpDLptJxSZcPqdgZL5yrDXaQpo4q5GgPoWNrm93PllX1VtgfkaF
	o0jbN+sv63ilfuqk1p4f8zSGp8nkdby98fOZ9yMZjJ+x+/Y6+0l0m6zI5lfJ/Lt+9Sf4
	WkqAKCPN/pL7PqA+hZtMMNas70Sm+Gk/fZPjLpENRmCShQG4+jcYWlKrGp2xuWFoK2vW
	EFkSLc4j9XyE6PuO70INlDobEkcJAIlAAlR5TrijIjlf53JB6715mry8YKkehHXlhx/g
	M3HA==
X-Gm-Message-State: ANhLgQ0iB/kksL4hjtvzvyKRajTPTTEtrHvm15e98AhtB2hnJ6GTk0lg
	vdTrWvfnQYwxsJO6gAVvInwsOAPYE9obCmz2ZcY=
X-Google-Smtp-Source: ADFU+vvWNqAbmZ0ZSaQJJ3xowfml93uGKigz1slUt9fJ9sj0KHK6x5fER7BE/cnOdqzq7AKCjpiGp3tKRTL1ZMYC69k=
X-Received: by 2002:ac8:7109:: with SMTP id z9mr237353qto.146.1583030449658;
	Sat, 29 Feb 2020 18:40:49 -0800 (PST)
MIME-Version: 1.0
References: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Feb 2020 18:40:23 -0800
Message-ID: <CAMKF1soxc=WDStbrVAjZzf5CKprvPb4zZW=OVjOB32dtpE944w@mail.gmail.com>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] opencv: Enable pkg-config .pc file generation
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
X-List-Received-Date: Sun, 01 Mar 2020 02:40:50 -0000
Content-Type: text/plain; charset="UTF-8"

which branch is this intended for? it does not
look it is for master since it sounds more like
backport, please add it to subject prefix so stable
maintainer can get notified about it.

On Sat, Feb 29, 2020 at 4:33 PM Yeoh Ee Peng <ee.peng.yeoh@intel.com> wrote:
>
> From: Carlos Rafael Giani <crg7475@mailbox.org>
>
> In OpenCV 4, .pc file generation is disabled by default. Yet, other
> software such as GStreamer and FFmpeg rely on the .pc files during build
> time configuration. Explicitely enable .pc file generation to make sure
> pkg-config can be used for getting information about OpenCV.
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> index 77b5dd6..5e89db0 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> @@ -64,6 +64,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
>      -DCMAKE_SKIP_RPATH=ON \
>      -DOPENCV_ICV_HASH=${IPP_MD5} \
>      -DIPPROOT=${WORKDIR}/ippicv_lnx \
> +    -DOPENCV_GENERATE_PKGCONFIG=ON \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
> --
> 2.7.4
>

