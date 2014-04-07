Return-Path: <ashcharles@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id EAA536F4D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2014 19:03:20 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id e16so6794048qcx.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 12:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vt7quagf8g8NmG4SRTGBeFfGGAsQwVbt8Kg4up+3unI=;
	b=P5+Prr5Fy0dW67FNbKKNVPU/VtiX9pzCOPjrdyEJCm7ug6KiwTfImLbFYXLAFjMRut
	m2F4QOIxzSoffmpILQNaOkKs9tBDX+Fe79RHAUfS3fKQMbPQVcB5Sygo3NOqt4JHQpC6
	5GyUKxDNzJEvSEJaVGMRTE9wFkXGcu+pROaF4WSPrwvWQuuGW4O5ZGPArD6aGVlLrSaA
	2W0ZwcISoDbQrtGUBy777NnQF6gNTSKEWx3Ze0qCRQ3MFWgQGzYVHeLOHt2z9d92cOLQ
	7/o704VeU+RVtydcZ2yasJtN8N5IOjL3dKMjHTCIwZ+AIKpTOP+iJ/cCyDt+fTDPPF2C
	+Xdw==
X-Received: by 10.140.34.168 with SMTP id l37mr11155446qgl.85.1396897400924;
	Mon, 07 Apr 2014 12:03:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.225 with HTTP; Mon, 7 Apr 2014 12:02:50 -0700 (PDT)
In-Reply-To: <1396688588-5440-1-git-send-email-trevor.woerner@linaro.org>
References: <1396688588-5440-1-git-send-email-trevor.woerner@linaro.org>
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 7 Apr 2014 12:02:50 -0700
Message-ID: <CAK8F28=5nJUHW1J0QM6tWQ5tMOWjGWy6v9pZq2e81fKcgw5ktA@mail.gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: Ulf Samuelsson <ulf@emagii.com>, openembedded-devel@lists.openembedded.org,
	Patch Tracking <patches@linaro.org>
Subject: Re: [meta-xfce][PATCH] xfconf: remove unrecognized configure option
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
X-List-Received-Date: Mon, 07 Apr 2014 19:03:24 -0000
Content-Type: text/plain; charset=UTF-8

Tested-by: Ash Charles <ashcharles@gmail.com>

On Sat, Apr 5, 2014 at 2:03 AM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> This option was causing a QA warning:
>
>     NOTE: QA Issue: xfconf: configure was passed unrecognised options: --with-sysroot
>
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> index aa6ad2c..bb8c337 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> @@ -7,7 +7,6 @@ DEPENDS = "dbus-glib libxfce4util perl"
>  inherit xfce
>
>  EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
> -EXTRA_OECONF += "--with-sysroot=yes"
>
>  SRC_URI += "file://0001-Simplify-checks.patch"
>  SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
> --
> 1.9.0
>

