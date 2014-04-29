Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id A39A6609B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 18:30:25 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 131so537805ykp.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=vlPbrxr3eEUfzWGDNiXbmif7FKeOGS10I73t8sxRcdQ=;
	b=oZdx/kNQctlLhmjZRmvGI8DKYeggb0/vn9OUrAp2ajlv4ujzTM5DOy5q/LvIg4O8Q7
	qa324vMLmQd6k3VVhK4xio4yEFbbM6LKst1837d3MVdAZ2hcqWjzrPRH/dW8XUq5jisL
	LPEQhK2bn3mlC0ZoPQB2aEMYiNHetOeai0j+rOEnYR1D5ac25tahVKV8wY2ne+INH9t6
	AXIpz/dEdD4+4jKd/dN3s3TQPmVCLYS+/wT0nOv9HQ++KGWn2/Ygsa8BZy4vDXEBNnZ/
	kyVJ86FqsxbTrBy7WR542gjRMCmxrwhKhUEJoLgVDP6Pn5yMemR7hqLecN/jZUmXpePf
	PFeA==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr49964855yhq.14.1398796225749;
	Tue, 29 Apr 2014 11:30:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 29 Apr 2014 11:30:25 -0700 (PDT)
In-Reply-To: <1398753593-4447-4-git-send-email-dv@pseudoterminal.org>
References: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
	<1398753593-4447-4-git-send-email-dv@pseudoterminal.org>
Date: Tue, 29 Apr 2014 15:30:25 -0300
X-Google-Sender-Auth: IZF6_tpjhuTAQqojo233NVZt7fU
Message-ID: <CAP9ODKq3Es6T2weEZXZnUtYHs3J6FKVG1e6VA-6k8j_425wuvA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH v2 3/4] chromium: Add use-egl PACKAGECONFIG option
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
X-List-Received-Date: Tue, 29 Apr 2014 18:30:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 29, 2014 at 3:39 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> By default, Chromium will try to use GLX and regular OpenGL. On embedded
> platforms, these are often not present, or unaccelerated, and using EGL
> and OpenGL ES instead makes more sense. To produce builds that use EGL and
> OpenGL ES by default instead, this PACKAGECONFIG option can be used.
>
> An EGL/OpenGLES-enabled build produces a chromium version that renders
> 2D and WebGL with GPU acceleration (if present).
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  recipes-browser/chromium/chromium_35.0.1883.0.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> index 1923b4e..1fb050f 100644
> --- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> @@ -23,6 +23,10 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
>
>  inherit gettext
>
> +# this makes sure the dependencies for the EGL mode are present; otherwise, the configure scripts
> +# automatically and silently fall back to GLX
> +PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"

There is any way to 'force' build to use egl here and fail if
something here is missing?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

