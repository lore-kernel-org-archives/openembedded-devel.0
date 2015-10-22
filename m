Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C34DD770C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 09:47:23 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so111779823wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LSs73/rdPCqw0dTEjpXTwTOGhEcXmI0pVnhwjpCA2Dk=;
	b=uib2rqUYpuKLina8ktKcym1JVRig/rmGmBKfqOoVwQsyW9YobzkyWCoSLE5bkrNlXo
	6IXgm+aHGKmr8AJChwNT2bcMxVRumVAw63vpAIgVXYMo96EWmX0jjGjQZeXg877Ix3ix
	8N0ZX94lhqrrXS5lxbuB7tjLVEKeUB+W0IU9+AOM3WYntx24tqWQwzh6f7MYF4hIo9mK
	QZpn9eY+ReTc+guGjBVtj2tHQgWAZRC54F1XkZ2Aw8vNYtpqsG8kEuxWk7AFjktWPtZW
	/kTuOsB6HR23LXVEQXgCzFIyV4y4dKbYujxJ3RjG4rx2FQEDH5s3thFsd/Ah4o/WdxJq
	64OA==
MIME-Version: 1.0
X-Received: by 10.194.123.168 with SMTP id mb8mr16094623wjb.108.1445507243159; 
	Thu, 22 Oct 2015 02:47:23 -0700 (PDT)
Received: by 10.194.154.232 with HTTP; Thu, 22 Oct 2015 02:47:23 -0700 (PDT)
In-Reply-To: <1445491305-39447-1-git-send-email-wenzong.fan@windriver.com>
References: <1445491305-39447-1-git-send-email-wenzong.fan@windriver.com>
Date: Thu, 22 Oct 2015 11:47:23 +0200
Message-ID: <CA+chaQf5_A_4gm34f7sdU=ES_5k4fF_-=aRYBo7BiKLbOaR=nQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-multimedia] gst-plugins-good: fix depends to libgudev
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
X-List-Received-Date: Thu, 22 Oct 2015 09:47:24 -0000
Content-Type: text/plain; charset=UTF-8

This shouldn't be needed when:
http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111271.html

is merged.

On Thu, Oct 22, 2015 at 7:21 AM, <wenzong.fan@windriver.com> wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> * udev provides libgudev but it won't be built with systemd;
> * systemd provides udev but no libgudev, libgudev has been removed
>   from systemd and it's a independent project now; libgudev only be
>   built if systemd distro feature enabled.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb    | 5
> ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/
> gst-plugins-good_0.10.31.bb
> b/meta-multimedia/recipes-multimedia/gstreamer-0.10/
> gst-plugins-good_0.10.31.bb
> index af18281..3f3478f 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/
> gst-plugins-good_0.10.31.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/
> gst-plugins-good_0.10.31.bb
> @@ -11,12 +11,15 @@ PACKAGECONFIG ?= "jpeg v4l \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio',
> '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>  "
> +
> +GUDEV="${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'libgudev',
> 'udev', d)}"
> +
>  PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>  PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
>  PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
>  PACKAGECONFIG[gdkpixbuf] =
> "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
> -PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2
> --without-gudev,udev"
> +PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2
> --without-gudev,${GUDEV}"
>  # sub-feature of v4l, but control separately since libv4l is not part of
> oe-core
>  PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
>  PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

