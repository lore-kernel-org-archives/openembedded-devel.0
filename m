Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7E8CFC536
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 13:11:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8790.1763817098812286727
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 05:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnbksYmw;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so1602444f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 05:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817097; x=1764421897; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZqw+LYQ4cNEp9trJoYzhoJ1by116q7jA2pC41xuBZk=;
        b=UnbksYmwu+0O1oHBDw45O3JboT7Wg2WP8JUTpvBXCjLULQixlJck/MrKkCxyPHQQN1
         4Z9SPVo5CnsGDrQbIo34G2xSv5DKW7Vyrc94rDZM3U7pzP9D2LX0aoeQIvgUc8JN2MKi
         9ogo+ovTljA2b2ClD8F2s60Pdo0mM5mDfkm92A0BLYWJFgnMxtLaQuUHQA+hLMjxvuK7
         +LTDnUD/P/vlNPgTvE1te41i3+aUBdWT7vMcrzvi12NfjKw1PegqMQ1BVAOjua2LEbT5
         dJ+fRtWH/0Hf4FnlBCces7KG3qBY5PdBXSc52I8rTWcDkLiMbZtX3KQ6/8aCHU+4fGVb
         Qasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817097; x=1764421897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZqw+LYQ4cNEp9trJoYzhoJ1by116q7jA2pC41xuBZk=;
        b=Z8As11UYPSvyRrK2B2IYXhUT1bEoatL0SqKwVFLtI8AuXBShBo3iNkGQ4+49urV2ic
         FuyTjb+KJi+TNnNu18AsoV4Fv6K8jLjbzaDxLoon5smLF84vRXP/pt7W+3+ANC7RAgrd
         xBOuFKFp4+B132qTk38u/2cS3M/JqCaXtoHpnG7/QCR/YY5ZWuY7gsjMKHzXyghz3bXQ
         Cj42dXxsUlXK4JjHMuvYzWECW2OeYdP49tyqzZgcCLQsyPJeDaAYp0UJaMC+aTz9w+Ja
         drFtu7qxdcDyJX0CxC4XbKW3S2pkE0PJuwuBWs436ZW4Pb2AV9Hoa54eHqTEKXUYiR47
         Z94g==
X-Forwarded-Encrypted: i=1; AJvYcCUZoSeUBBlQooXLyMAkseMH9lDTS5wLGH3aQyPmBdTZ1gvj3VuTrv7KbRM8axmksMfzwd82qbYEUsWcysJ45F+LKfw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXaB8bT0P2D+CATG+pZFlzyk+fVyxEanQ2q4B0NR1PuVshgmvt
	rpdcAtiiql+BRPTQqSY2vFLijCby/xR7qKKqiXI/XZW+a1GwsSi1YA/w
X-Gm-Gg: ASbGncupCSVeC3RWMvIwoXZnXcBRk36vbS3yBD5l5IK1YVGPW5mqoO220eGKR20Tc0t
	cC8h3Ym0BeFgzdDlhDI4KCNh5N1GJYy3+abUf+XKLNV6AIHH5fhTdMPVBrQFX5NFHLr/O93tvsW
	fqIOKn/rS9Ry23+M+CcOIC4dVouIizphm49yhFUQ9TLglbIsgnE0DmhABckMpao9qmPELLqp4ou
	nnCNzarvHZHu3U1WTwBCgZzwRQ2QgBuZ7VyYfDwRVidOAeZpyLPPEv69Msbzl/Qq0yBxL8MIP4K
	CeDybJaS4y32YW48Q0VklnudQmjB4dAZII1/WSxMKlfCVz/7rVoOFHINg0TfL+7UjhhaEIbl/ax
	gKdDXhhTySee/tGO4xLTPtK4RyHLXDOMcZgb7BNtaJi01bxoLExRyCIOgrLQy4kCqMF3o+vhe1d
	mhPd+BO+s/16hfgpPV1CM=
X-Google-Smtp-Source: AGHT+IH/14HFgrtPJywASXLsg01n24OHxm4+sMf5znfSDPNQEy0xu7DMO95eps7nTefiYD3kinE8GA==
X-Received: by 2002:a05:6000:1a8e:b0:429:cf88:f7ac with SMTP id ffacd0b85a97d-42cc1d35d6dmr5613899f8f.44.1763817096878;
        Sat, 22 Nov 2025 05:11:36 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e432sm16064624f8f.9.2025.11.22.05.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:11:36 -0800 (PST)
Message-ID: <2a3abfd0-522d-4a35-bd01-f5628a6e7d7c@gmail.com>
Date: Sat, 22 Nov 2025 14:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 09/12] ImageMagick: Fix
 CVE-2023-34151
To: Divyanshu.Rathore@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
Cc: Sana.Kazi@bmwtechworks.in
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
 <20251120084959.51761-9-Divyanshu.Rathore@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251120084959.51761-9-Divyanshu.Rathore@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 13:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121972

This patch fails to compile - could you please check on this?

https://gist.githubusercontent.com/OldManYellsAtCloud/7f1ad8025974a4db9a72c0e4fd766a2f/raw/c4adbe7863064343437528e02d5feab1f47b3b56/gistfile1.txt


On 11/20/25 09:49, Divyanshu Rathore via lists.openembedded.org wrote:
> Backport the fix for CVE-2023-34151
>
> Add below patch to fix
> 0009-ImageMagick-Fix-CVE-2023-34151.patch
>
> Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> ---
>  .../0009-ImageMagick-Fix-CVE-2023-34151.patch | 287 ++++++++++++++++++
>  .../imagemagick/imagemagick_7.0.10.bb         |   1 +
>  2 files changed, 288 insertions(+)
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix-CVE-2023-34151.patch
>
> diff --git a/meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix-CVE-2023-34151.patch b/meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix-CVE-2023-34151.patch
> new file mode 100644
> index 0000000000..dd4802d75f
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix-CVE-2023-34151.patch
> @@ -0,0 +1,287 @@
> +From 338a66fd7b9ec918d4a9d31dcce4a7ca04df51bf Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Fri, 24 Oct 2025 16:17:41 +0530
> +Subject: [PATCH 3/8] ImageMagick: Fix CVE-2023-34151
> +
> +CVE: CVE-2023-34151
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/3d6d98d8a2be30d74172ab43b5b8e874d2deb158]
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/annotate.c       |  4 ++--
> + MagickCore/draw.c           |  2 +-
> + MagickCore/geometry.c       |  6 +++---
> + MagickCore/shear.c          |  6 +++---
> + MagickCore/visual-effects.c |  4 ++--
> + coders/caption.c            | 10 +++++-----
> + coders/label.c              | 10 +++++-----
> + coders/pcl.c                |  4 ++--
> + coders/pdf.c                |  4 ++--
> + coders/ps.c                 |  4 ++--
> + coders/ps2.c                |  4 ++--
> + coders/ps3.c                |  4 ++--
> + coders/svg.c                |  4 ++--
> + 13 files changed, 33 insertions(+), 33 deletions(-)
> +
> +diff --git a/MagickCore/annotate.c b/MagickCore/annotate.c
> +index 4be938be5..3e8f3aa1b 100644
> +--- a/MagickCore/annotate.c
> ++++ b/MagickCore/annotate.c
> +@@ -336,7 +336,7 @@ MagickExport MagickBooleanType AnnotateImage(Image *image,
> +     (void) CloneString(&annotate->text,textlist[i]);
> +     if ((metrics.width == 0) || (annotate->gravity != NorthWestGravity))
> +       (void) GetTypeMetrics(image,annotate,&metrics,exception);
> +-    height=(size_t) floor(metrics.ascent-metrics.descent+0.5);
> ++    height=CastDoubleToUnsigned(metrics.ascent-metrics.descent+0.5);
> +     if (height == 0)
> +       height=draw_info->pointsize;
> +     height+=(size_t) floor(draw_info->interline_spacing+0.5);
> +@@ -626,7 +626,7 @@ MagickExport ssize_t FormatMagickCaption(Image *image,DrawInfo *draw_info,
> +     status=GetTypeMetrics(image,draw_info,metrics,exception);
> +     if (status == MagickFalse)
> +       break;
> +-    width=(size_t) floor(metrics->width+draw_info->stroke_width+0.5);
> ++    width=CastDoubleToUnsigned(metrics->width+draw_info->stroke_width+0.5);
> +     if (width <= image->columns)
> +       continue;
> +     if (s != (char *) NULL)
> +diff --git a/MagickCore/draw.c b/MagickCore/draw.c
> +index facea115e..54286130a 100644
> +--- a/MagickCore/draw.c
> ++++ b/MagickCore/draw.c
> +@@ -3478,7 +3478,7 @@ static MagickBooleanType RenderMVGContent(Image *image,
> +                 (void) GetNextToken(q,&q,extent,token);
> +                 if (*token == ',')
> +                   (void) GetNextToken(q,&q,extent,token);
> +-                bounds.height=(size_t) floor(GetDrawValue(token,&next_token)+
> ++                bounds.height=CastDoubleToUnsigned(GetDrawValue(token,&next_token)+
> +                   0.5);
> +                 if (token == next_token)
> +                   ThrowPointExpectedException(token,exception);
> +diff --git a/MagickCore/geometry.c b/MagickCore/geometry.c
> +index 5c6e2ad69..6541db8f4 100644
> +--- a/MagickCore/geometry.c
> ++++ b/MagickCore/geometry.c
> +@@ -1424,8 +1424,8 @@ MagickExport MagickStatusType ParseMetaGeometry(const char *geometry,ssize_t *x,
> +       scale.y=geometry_info.sigma;
> +       if ((percent_flags & SigmaValue) == 0)
> +         scale.y=scale.x;
> +-      *width=(size_t) floor(scale.x*former_width/100.0+0.5);
> +-      *height=(size_t) floor(scale.y*former_height/100.0+0.5);
> ++      *width=CastDoubleToUnsigned(scale.x*former_width/100.0+0.5);
> ++      *height=CastDoubleToUnsigned(scale.y*former_height/100.0+0.5);
> +       former_width=(*width);
> +       former_height=(*height);
> +     }
> +@@ -1445,7 +1445,7 @@ MagickExport MagickStatusType ParseMetaGeometry(const char *geometry,ssize_t *x,
> +       if (geometry_ratio >= image_ratio)
> +         {
> +           *width=former_width;
> +-          *height=(size_t) floor((double) (PerceptibleReciprocal(
> ++          *height=CastDoubleToUnsigned((double) (PerceptibleReciprocal(
> +             geometry_ratio)*former_height*image_ratio)+0.5);
> +         }
> +       else
> +diff --git a/MagickCore/shear.c b/MagickCore/shear.c
> +index 05703ca34..a4c75431f 100644
> +--- a/MagickCore/shear.c
> ++++ b/MagickCore/shear.c
> +@@ -1766,9 +1766,9 @@ MagickExport Image *ShearRotateImage(const Image *image,const double degrees,
> +   */
> +   width=integral_image->columns;
> +   height=integral_image->rows;
> +-  bounds.width=(size_t) floor(fabs((double) height*shear.x)+width+0.5);
> +-  bounds.height=(size_t) floor(fabs((double) bounds.width*shear.y)+height+0.5);
> +-  shear_width=(size_t) floor(fabs((double) bounds.height*shear.x)+
> ++  bounds.width=CastDoubleToUnsigned(fabs((double) height*shear.x)+width+0.5);
> ++  bounds.height=CastDoubleToUnsigned(fabs((double) bounds.width*shear.y)+height+0.5);
> ++  shear_width=CastDoubleToUnsigned(fabs((double) bounds.height*shear.x)+
> +     bounds.width+0.5);
> +   bounds.x=CastDoubleToLong(floor((double) ((shear_width > bounds.width) ?
> +     width : bounds.width-shear_width+2)/2.0+0.5));
> +diff --git a/MagickCore/visual-effects.c b/MagickCore/visual-effects.c
> +index 789660231..3f5a5ee5e 100644
> +--- a/MagickCore/visual-effects.c
> ++++ b/MagickCore/visual-effects.c
> +@@ -2062,8 +2062,8 @@ MagickExport Image *ShadowImage(const Image *image,const double alpha,
> +     (void) SetImageColorspace(clone_image,sRGBColorspace,exception);
> +   (void) SetImageVirtualPixelMethod(clone_image,EdgeVirtualPixelMethod,
> +     exception);
> +-  border_info.width=(size_t) floor(2.0*sigma+0.5);
> +-  border_info.height=(size_t) floor(2.0*sigma+0.5);
> ++  border_info.width=CastDoubleToUnsigned(2.0*sigma+0.5);
> ++  border_info.height=CastDoubleToUnsigned(2.0*sigma+0.5);
> +   border_info.x=0;
> +   border_info.y=0;
> +   (void) QueryColorCompliance("none",AllCompliance,&clone_image->border_color,
> +diff --git a/coders/caption.c b/coders/caption.c
> +index 67a3fb48c..cff07fd10 100644
> +--- a/coders/caption.c
> ++++ b/coders/caption.c
> +@@ -155,7 +155,7 @@ static Image *ReadCAPTIONImage(const ImageInfo *image_info,
> +     return(DestroyImageList(image));
> +   (void) SetImageProperty(image,"caption",caption,exception);
> +   draw_info=CloneDrawInfo(image_info,(DrawInfo *) NULL);
> +-  width=(size_t) floor(draw_info->pointsize*strlen(caption)+0.5);
> ++  width=CastDoubleToUnsigned(draw_info->pointsize*strlen(caption)+0.5);
> +   if (AcquireMagickResource(WidthResource,width) == MagickFalse)
> +     {
> +       caption=DestroyString(caption);
> +@@ -249,8 +249,8 @@ static Image *ReadCAPTIONImage(const ImageInfo *image_info,
> +             status=GetMultilineTypeMetrics(image,draw_info,&metrics,exception);
> +             if (status == MagickFalse)
> +               break;
> +-            width=(size_t) floor(metrics.width+draw_info->stroke_width+0.5);
> +-            height=(size_t) floor(metrics.height+draw_info->interline_spacing+
> ++            width=CastDoubleToUnsigned(metrics.width+draw_info->stroke_width+0.5);
> ++            height=CastDoubleToUnsigned(metrics.height+draw_info->interline_spacing+
> +               draw_info->stroke_width+0.5);
> +             if ((image->columns != 0) && (image->rows != 0))
> +               {
> +@@ -279,8 +279,8 @@ static Image *ReadCAPTIONImage(const ImageInfo *image_info,
> +         status=GetMultilineTypeMetrics(image,draw_info,&metrics,exception);
> +         if (status == MagickFalse)
> +           break;
> +-        width=(size_t) floor(metrics.width+draw_info->stroke_width+0.5);
> +-        height=(size_t) floor(metrics.height+draw_info->interline_spacing+
> ++        width=CastDoubleToUnsigned(metrics.width+draw_info->stroke_width+0.5);
> ++        height=CastDoubleToUnsigned(metrics.height+draw_info->interline_spacing+
> +           draw_info->stroke_width+0.5);
> +         if ((image->columns != 0) && (image->rows != 0))
> +           {
> +diff --git a/coders/label.c b/coders/label.c
> +index b6c25036f..cd76961f7 100644
> +--- a/coders/label.c
> ++++ b/coders/label.c
> +@@ -135,7 +135,7 @@ static Image *ReadLABELImage(const ImageInfo *image_info,
> +     return(DestroyImageList(image));
> +   (void) SetImageProperty(image,"label",label,exception);
> +   draw_info=CloneDrawInfo(image_info,(DrawInfo *) NULL);
> +-  width=(size_t) floor(draw_info->pointsize*strlen(label)+0.5);
> ++  width=CastDoubleToUnsigned(draw_info->pointsize*strlen(label)+0.5);
> +   if (AcquireMagickResource(WidthResource,width) == MagickFalse)
> +     {
> +       label=DestroyString(label);
> +@@ -174,8 +174,8 @@ static Image *ReadLABELImage(const ImageInfo *image_info,
> +           status=GetMultilineTypeMetrics(image,draw_info,&metrics,exception);
> +           if (status == MagickFalse)
> +             break;
> +-          width=(size_t) floor(metrics.width+draw_info->stroke_width+0.5);
> +-          height=(size_t) floor(metrics.height+draw_info->stroke_width+0.5);
> ++          width=CastDoubleToUnsigned(metrics.width+draw_info->stroke_width+0.5);
> ++          height=CastDoubleToUnsigned(metrics.height+draw_info->stroke_width+0.5);
> +           if ((image->columns != 0) && (image->rows != 0))
> +             {
> +               if ((width >= image->columns) && (height >= image->rows))
> +@@ -204,8 +204,8 @@ static Image *ReadLABELImage(const ImageInfo *image_info,
> +           status=GetMultilineTypeMetrics(image,draw_info,&metrics,exception);
> +           if (status == MagickFalse)
> +             break;
> +-          width=(size_t) floor(metrics.width+draw_info->stroke_width+0.5);
> +-          height=(size_t) floor(metrics.height+draw_info->stroke_width+0.5);
> ++          width=CastDoubleToUnsigned(metrics.width+draw_info->stroke_width+0.5);
> ++          height=CastDoubleToUnsigned(metrics.height+draw_info->stroke_width+0.5);
> +           if ((image->columns != 0) && (image->rows != 0))
> +             {
> +               if ((width < image->columns) && (height < image->rows))
> +diff --git a/coders/pcl.c b/coders/pcl.c
> +index 8197a0c39..375c8e781 100644
> +--- a/coders/pcl.c
> ++++ b/coders/pcl.c
> +@@ -333,8 +333,8 @@ static Image *ReadPCLImage(const ImageInfo *image_info,ExceptionInfo *exception)
> +     image->resolution.x,image->resolution.y);
> +   if (image_info->ping != MagickFalse)
> +     (void) FormatLocaleString(density,MagickPathExtent,"2.0x2.0");
> +-  page.width=(size_t) floor(page.width*image->resolution.x/delta.x+0.5);
> +-  page.height=(size_t) floor(page.height*image->resolution.y/delta.y+0.5);
> ++  page.width=CastDoubleToUnsigned(page.width*image->resolution.x/delta.x+0.5);
> ++  page.height=CastDoubleToUnsigned(page.height*image->resolution.y/delta.y+0.5);
> +   (void) FormatLocaleString(options,MagickPathExtent,"-g%.20gx%.20g ",(double)
> +     page.width,(double) page.height);
> +   image=DestroyImage(image);
> +diff --git a/coders/pdf.c b/coders/pdf.c
> +index 7792d417a..3e8b3c182 100644
> +--- a/coders/pdf.c
> ++++ b/coders/pdf.c
> +@@ -1605,9 +1605,9 @@ static MagickBooleanType WritePDFImage(const ImageInfo *image_info,Image *image,
> +     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
> +       &geometry.width,&geometry.height);
> +     scale.x=(double) (geometry.width*delta.x)/resolution.x;
> +-    geometry.width=(size_t) floor(scale.x+0.5);
> ++    geometry.width=CastDoubleToUnsigned(scale.x+0.5);
> +     scale.y=(double) (geometry.height*delta.y)/resolution.y;
> +-    geometry.height=(size_t) floor(scale.y+0.5);
> ++    geometry.height=CastDoubleToUnsigned(scale.y+0.5);
> +     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
> +     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception);
> +     if (image->gravity != UndefinedGravity)
> +diff --git a/coders/ps.c b/coders/ps.c
> +index 3c18e5a92..9b3f3da88 100644
> +--- a/coders/ps.c
> ++++ b/coders/ps.c
> +@@ -1483,9 +1483,9 @@ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *image,
> +     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
> +       &geometry.width,&geometry.height);
> +     scale.x=PerceptibleReciprocal(resolution.x)*geometry.width*delta.x;
> +-    geometry.width=(size_t) floor(scale.x+0.5);
> ++    geometry.width=CastDoubleToUnsigned(scale.x+0.5);
> +     scale.y=PerceptibleReciprocal(resolution.y)*geometry.height*delta.y;
> +-    geometry.height=(size_t) floor(scale.y+0.5);
> ++    geometry.height=CastDoubleToUnsigned(scale.y+0.5);
> +     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
> +     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception);
> +     if (image->gravity != UndefinedGravity)
> +diff --git a/coders/ps2.c b/coders/ps2.c
> +index 31e7f75c7..2e713c64a 100644
> +--- a/coders/ps2.c
> ++++ b/coders/ps2.c
> +@@ -533,9 +533,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image *image,
> +     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
> +       &geometry.width,&geometry.height);
> +     scale.x=PerceptibleReciprocal(resolution.x)*geometry.width*delta.x;
> +-    geometry.width=(size_t) floor(scale.x+0.5);
> ++    geometry.width=CastDoubleToUnsigned(scale.x+0.5);
> +     scale.y=PerceptibleReciprocal(resolution.y)*geometry.height*delta.y;
> +-    geometry.height=(size_t) floor(scale.y+0.5);
> ++    geometry.height=CastDoubleToUnsigned(scale.y+0.5);
> +     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
> +     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception);
> +     if (image->gravity != UndefinedGravity)
> +diff --git a/coders/ps3.c b/coders/ps3.c
> +index 62f47c439..beb007587 100644
> +--- a/coders/ps3.c
> ++++ b/coders/ps3.c
> +@@ -980,9 +980,9 @@ static MagickBooleanType WritePS3Image(const ImageInfo *image_info,Image *image,
> +     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
> +       &geometry.width,&geometry.height);
> +     scale.x=PerceptibleReciprocal(resolution.x)*geometry.width*delta.x;
> +-    geometry.width=(size_t) floor(scale.x+0.5);
> ++    geometry.width=CastDoubleToUnsigned(scale.x+0.5);
> +     scale.y=PerceptibleReciprocal(resolution.y)*geometry.height*delta.y;
> +-    geometry.height=(size_t) floor(scale.y+0.5);
> ++    geometry.height=CastDoubleToUnsigned(scale.y+0.5);
> +     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
> +     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception);
> +     if (image->gravity != UndefinedGravity)
> +diff --git a/coders/svg.c b/coders/svg.c
> +index 8f80d83e3..5caf8afe7 100644
> +--- a/coders/svg.c
> ++++ b/coders/svg.c
> +@@ -2520,10 +2520,10 @@ static void SVGStartElement(void *context,const xmlChar *name,
> +             svg_info->view_box=svg_info->bounds;
> +           svg_info->width=0;
> +           if (svg_info->bounds.width > 0.0)
> +-            svg_info->width=(size_t) floor(svg_info->bounds.width+0.5);
> ++            svg_info->width=CastDoubleToUnsigned(svg_info->bounds.width+0.5);
> +           svg_info->height=0;
> +           if (svg_info->bounds.height > 0.0)
> +-            svg_info->height=(size_t) floor(svg_info->bounds.height+0.5);
> ++            svg_info->height=CastDoubleToUnsigned(svg_info->bounds.height+0.5);
> +           (void) FormatLocaleFile(svg_info->file,"viewbox 0 0 %.20g %.20g\n",
> +             (double) svg_info->width,(double) svg_info->height);
> +           sx=PerceptibleReciprocal(svg_info->view_box.width)*svg_info->width;
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index 905af46f11..bb0c148fd7 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -31,6 +31,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
>      file://0006-ImageMagick-Fix-CVE-2025-55004.patch \
>      file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
>      file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
> +    file://0009-ImageMagick-Fix-CVE-2023-34151.patch \
>  "
>  
>  SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121939): https://lists.openembedded.org/g/openembedded-devel/message/121939
> Mute This Topic: https://lists.openembedded.org/mt/116392319/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


