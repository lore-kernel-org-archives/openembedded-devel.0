Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BB0CFC534
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:48:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8367.1763815724611207534
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=goRGOLkI;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so1595941f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763815723; x=1764420523; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suc+TP9rWsOmQDdZxMOWwJ3fgzJjhVnNmlHYNkoo/78=;
        b=goRGOLkIms/KJ06p0uIOH8WpKlujQY/ILAg3fn36jdeHkBtOvWsWGOlfbS2SSRNNZE
         ot4MrBQcZTsvkrGkJhnwzdtC7AR19QTKHGK+PkEN/uaoeNvtqWaPPmd4P5TgjR4EIeQF
         eoZ6KPapbj9d5Nn3LNOvq0L05fkj6QQYMhzUXbWbFEQH4trjl8732gWl7UDo+oKASorC
         NCDoZwqrYXln2ZOxqqKs9TSWT0jvyb6Qz9XW3HR9W4NA+wkW0rIau0pSsvzTLiiBsVqs
         NZOTMFoM5DK3sowYDhW+zymIo3RsdBHSvv+0GRsAlBtywCrYXVwr2uewkro5caaDjt/O
         6EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763815723; x=1764420523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suc+TP9rWsOmQDdZxMOWwJ3fgzJjhVnNmlHYNkoo/78=;
        b=CwkHrlCQZTK/hXg9GXB3BWj7gdRHonfuD//Dx5aAUlNaM34uPQVtI2ElrMcd4yZyg+
         4rf2lRXUFHPl2UKXx8HteXz2L48xPilU/lSleVy+pI/MrIlqteqOuSCGY8GF7AqsW3zn
         YsrJvi0eIipokoUnCff7SX3mVM4MypWFF4H3zQlpotMftJYg940Cl5CjA81HJziWyUaf
         ZSwcNLDOs8zFADTV5JnTo0n9NIPBYTsBNbRKgAcOWZuF4gk6cBVxgdNbrUnTlHG+LB7x
         4Ghep30mXiBqvecOWu68XVWNUZ/1sGlHJuwUV8Q6eEyp//AsJnMPfHJVYO7R2oA6W0Zi
         ly6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdsW5dRax99/FisRVo62XGoyOr7H/38xDsYpu68JFtJh1X/YthEFXzRjCDDYIrs10vRLD0Z/64NB1YDsomVqZrT/Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfCsn+rtyikcrTZ251P7INgwM6p5g6ws6JCjCDfyS0ZlWcBFC7
	3mZlpRMnHtiwnFLBLwVuZrlTlCtjgRU6HdvPOaKucR9hdwVNCZZS1rjy
X-Gm-Gg: ASbGncuEblkkueY+GUtnGFmGn4stZO15ZuKYg3pUin0AWQYV3yf5tmvSLOSU7NiuzPU
	cE8xplaUGEDg9oSZiOre12pXuQX0oAsHzC4nOFErqyehqbntgJtQ+84fbgUjpUY25vCCrvNurP2
	+5xuUjZCL95LOIwTca/n5q9A+lai2LF3CRU9nHw+9DUTMoDjTErHiFogHlYcXKwxG6gEX44KnIo
	k+0Z2KhXOqOb1F5zpCr8KwYoza3uHv7/7W1c/wjU4W8YGFu3JbWgAJ4hbIerPgsXK2K6ObtmuWW
	GZXMJ33Yskc+TyEeBkgXz7x10mt41bLcxXm3+h7pd4QO1O/1W7ssLmZxuA52GqKTgDKaUj2gYDY
	aPselcao99OgZeS3EZme73TwhoOx7e0ycUhcjJQQ0Sy/PDZ4XbO+AurYpnSZJesqAow4BiqyG3I
	ba2CY+pg4R8fgj+kYip9cE5h/kIVbLcA==
X-Google-Smtp-Source: AGHT+IGGBcQl2dkoqqgacn8SJhYAbrV8jW6En0bMPvL7IMfWUDVMuoLYJGQpixFvghgZH5+Rk9sCyQ==
X-Received: by 2002:a5d:5d12:0:b0:42b:3062:c647 with SMTP id ffacd0b85a97d-42cc1ceff02mr5825345f8f.21.1763815722365;
        Sat, 22 Nov 2025 04:48:42 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb91f4sm16993672f8f.31.2025.11.22.04.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 04:48:41 -0800 (PST)
Message-ID: <24f80f63-9e6f-46d9-83af-b614bbd663eb@gmail.com>
Date: Sat, 22 Nov 2025 13:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 11/12] ImageMagick: Fix
 CVE-2025-55298
To: Divyanshu.Rathore@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
Cc: Sana.Kazi@bmwtechworks.in
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
 <20251120084959.51761-11-Divyanshu.Rathore@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251120084959.51761-11-Divyanshu.Rathore@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 12:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121970

These patches fail to apply - could you please take a look at this? It
looks that this patch's content is already present.


ERROR: imagemagick-7.0.10-62-r0 do_patch: Applying patch
'0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch' on
target directory
'/cocto/kirkstone-next/build/tmp/work/core2-64-poky-linux/imagemagick/7.0.10-62-r0/git'
CmdError('quilt --quiltrc
/cocto/kirkstone-next/build/tmp/work/core2-64-poky-linux/imagemagick/7.0.10-62-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch
0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
patching file MagickCore/image.c
Hunk #1 FAILED at 1650.
Hunk #2 FAILED at 1666.
2 out of 2 hunks FAILED -- rejects in file MagickCore/image.c
Patch 0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
can be reverse-applied


On 11/20/25 09:49, Divyanshu Rathore via lists.openembedded.org wrote:
> Backport the fix for CVE-2025-55298
>
> Add below patch to fix
> 0011-ImageMagick-Fix-CVE-2025-55298.patch
>
> Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> ---
>  ...support-patch-1-to-fix-CVE-2025-5529.patch |  49 ++++
>  ...support-patch-2-to-fix-CVE-2025-5529.patch |  58 ++++
>  ...support-patch-3-to-fix-CVE-2025-5529.patch | 205 +++++++++++++
>  ...support-patch-4-to-fix-CVE-2025-5529.patch | 103 +++++++
>  ...011-ImageMagick-Fix-1-CVE-2025-55298.patch |  71 +++++
>  ...011-ImageMagick-Fix-2-CVE-2025-55298.patch | 274 ++++++++++++++++++
>  .../imagemagick/imagemagick_7.0.10.bb         |   6 +
>  7 files changed, 766 insertions(+)
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-1-CVE-2025-55298.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-2-CVE-2025-55298.patch
>
> diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch
> new file mode 100644
> index 0000000000..d4bd7d6acb
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch
> @@ -0,0 +1,49 @@
> +From 11f9e946dab3f2a4de68809bab9c01be2967bb08 Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Tue, 11 Nov 2025 14:34:12 +0530
> +Subject: [PATCH 1/6] ImageMagick: Add support patch 1 to fix CVE-2025-55298
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/83caf59fce695fea0c5878e9f0d0b65e662cae66]
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/image.c | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index 34804e522..849a89931 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -1640,15 +1640,15 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +   char
> +     *q;
> + 
> ++  const char
> ++    *p;
> ++
> +   int
> +     c;
> + 
> +   MagickBooleanType
> +     canonical;
> + 
> +-  const char
> +-    *p;
> +-
> +   ssize_t
> +     field_width,
> +     offset;
> +@@ -1656,6 +1656,8 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +   canonical=MagickFalse;
> +   offset=0;
> +   (void) CopyMagickString(filename,format,MagickPathExtent);
> ++  if (IsStringTrue(GetImageOption(image_info,"filename:literal")) != MagickFalse)
> ++    return(strlen(filename));
> +   for (p=strchr(format,'%'); p != (char *) NULL; p=strchr(p+1,'%'))
> +   {
> +     q=(char *) p+1;
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
> new file mode 100644
> index 0000000000..3550a4abba
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
> @@ -0,0 +1,58 @@
> +From c02868456edccf0dd555c3d004efb491974c92c7 Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Tue, 11 Nov 2025 15:17:32 +0530
> +Subject: [PATCH 2/6] ImageMagick: Add support patch-2 to fix CVE-2025-55298
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/image.c | 13 +++++++------
> + 1 file changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index 849a89931..3437ed358 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -1650,7 +1650,6 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +     canonical;
> + 
> +   ssize_t
> +-    field_width,
> +     offset;
> + 
> +   canonical=MagickFalse;
> +@@ -1666,21 +1665,23 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +         p=q+1;
> +         continue;
> +       }
> +-    field_width=0;
> +-    if (*q == '0')
> +-      field_width=(ssize_t) strtol(q,&q,10);
> +     switch (*q)
> +     {
> +       case 'd':
> +       case 'o':
> +       case 'x':
> +       {
> ++        ssize_t
> ++          count;
> ++
> +         q++;
> +         c=(*q);
> +         *q='\0';
> +-        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
> ++        count=FormatLocaleString(filename+(p-format-offset),(size_t)
> +           (MagickPathExtent-(p-format-offset)),p,value);
> +-        offset+=(4-field_width);
> ++        if ((count <= 0) || (count > (MagickPathExtent-(p-format-offset))))
> ++          return(0);
> ++        offset+=(ssize_t) ((q-p)-count);
> +         *q=c;
> +         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
> +         canonical=MagickTrue;
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch
> new file mode 100644
> index 0000000000..63e88ebfd9
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch
> @@ -0,0 +1,205 @@
> +From 19073f73f83c78a1fed8f040ed08b16ccfc817f5 Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Tue, 11 Nov 2025 21:53:10 +0530
> +Subject: [PATCH 3/6] ImageMagick: Add support patch-3 to fix CVE-2025-55298
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/82550750ec8f79393b381c3ed349dd495bbab8a7]
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/image.c | 134 +++++++++++++++++++--------------------------
> + 1 file changed, 55 insertions(+), 79 deletions(-)
> +
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index 3437ed358..cd4de6df9 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -1638,34 +1638,41 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +   ExceptionInfo *exception)
> + {
> +   char
> +-    *q;
> ++    *p = filename,
> ++    pattern[MagickPathExtent];
> + 
> +   const char
> +-    *p;
> +-
> +-  int
> +-    c;
> +-
> +-  MagickBooleanType
> +-    canonical;
> +-
> +-  ssize_t
> +-    offset;
> ++    *cursor = format;
> + 
> +-  canonical=MagickFalse;
> +-  offset=0;
> ++  /*
> ++    Start with a copy of the format string.
> ++  */
> +   (void) CopyMagickString(filename,format,MagickPathExtent);
> +   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) != MagickFalse)
> +     return(strlen(filename));
> +-  for (p=strchr(format,'%'); p != (char *) NULL; p=strchr(p+1,'%'))
> ++  while ((cursor=strchr(cursor,'%')) != (const char *) NULL)
> +   {
> +-    q=(char *) p+1;
> +-    if (*q == '%')
> ++    const char
> ++      *q = cursor;
> ++
> ++    ssize_t
> ++      offset = (ssize_t) (cursor-format);
> ++
> ++    cursor++;  /* move past '%' */
> ++    if (*cursor == '%')
> +       {
> +-        p=q+1;
> ++        /*
> ++          Escaped %%.
> ++        */
> ++        cursor++;
> +         continue;
> +       }
> +-    switch (*q)
> ++    /*
> ++      Skip padding digits like %03d.
> ++    */
> ++    if (*cursor == '0')
> ++      (void) strtol(cursor,(char **) &cursor,10);
> ++    switch (*cursor)
> +     {
> +       case 'd':
> +       case 'o':
> +@@ -1674,93 +1681,62 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +         ssize_t
> +           count;
> + 
> +-        q++;
> +-        c=(*q);
> +-        *q='\0';
> +-        count=FormatLocaleString(filename+(p-format-offset),(size_t)
> +-          (MagickPathExtent-(p-format-offset)),p,value);
> +-        if ((count <= 0) || (count > (MagickPathExtent-(p-format-offset))))
> ++        count=FormatLocaleString(pattern,sizeof(pattern),q,value);
> ++        if ((count <= 0) || (count >= MagickPathExtent))
> +           return(0);
> +-        offset+=(ssize_t) ((q-p)-count);
> +-        *q=c;
> +-        (void) ConcatenateMagickString(filename,q,MagickPathExtent);
> +-        canonical=MagickTrue;
> +-        if (*(q-1) != '%')
> +-          break;
> +-        p++;
> ++        if ((offset+count) >= MagickPathExtent)
> ++          return(0);
> ++        (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExtent-
> ++          offset));
> ++        cursor++;
> +         break;
> +       }
> +       case '[':
> +       {
> +-        char
> +-          pattern[MagickPathExtent];
> +-
> +         const char
> +-          *option;
> ++          *end = strchr(cursor,']'),
> ++          *option = (const char *) NULL;
> + 
> +-        char
> +-          *r;
> +-
> +-        ssize_t
> +-          i;
> +-
> +-        ssize_t
> +-          depth;
> ++        size_t
> ++          extent = (size_t) (end-cursor);
> + 
> +         /*
> +-          Image option.
> ++          Handle %[key:value];
> +         */
> +-        if (strchr(p,']') == (char *) NULL)
> ++        if (end == (const char *) NULL)
> +           break;
> +-        depth=1;
> +-        r=q+1;
> +-        for (i=0; (i < (MagickPathExtent-1L)) && (*r != '\0'); i++)
> +-        {
> +-          if (*r == '[')
> +-            depth++;
> +-          if (*r == ']')
> +-            depth--;
> +-          if (depth <= 0)
> +-            break;
> +-          pattern[i]=(*r++);
> +-        }
> +-        pattern[i]='\0';
> +-        if (LocaleNCompare(pattern,"filename:",9) != 0)
> ++        if (extent >= sizeof(pattern))
> +           break;
> +-        option=(const char *) NULL;
> ++        (void) CopyMagickString(pattern,cursor,extent);
> ++        pattern[extent]='\0';
> +         if (image != (Image *) NULL)
> +           option=GetImageProperty(image,pattern,exception);
> +-        if ((option == (const char *) NULL) && (image != (Image *) NULL))
> ++        if ((option == (const char *) NULL) && (image != (Image *)NULL))
> +           option=GetImageArtifact(image,pattern);
> +         if ((option == (const char *) NULL) &&
> +             (image_info != (ImageInfo *) NULL))
> +           option=GetImageOption(image_info,pattern);
> +         if (option == (const char *) NULL)
> +           break;
> +-        q--;
> +-        c=(*q);
> +-        *q='\0';
> +-        (void) CopyMagickString(filename+(p-format-offset),option,(size_t)
> +-          (MagickPathExtent-(p-format-offset)));
> +-        offset+=strlen(pattern)-strlen(option)+3;
> +-        *q=c;
> +-        (void) ConcatenateMagickString(filename,r+1,MagickPathExtent);
> +-        canonical=MagickTrue;
> +-        if (*(q-1) != '%')
> +-          break;
> +-        p++;
> ++        (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExtent-
> ++          offset));
> ++        cursor=end+1;
> +         break;
> +       }
> +       default:
> +         break;
> +     }
> +   }
> +-  if (canonical == MagickFalse)
> +-    (void) CopyMagickString(filename,format,MagickPathExtent);
> +-  else
> +-    for (q=filename; *q != '\0'; q++)
> +-      if ((*q == '%') && (*(q+1) == '%'))
> +-        (void) CopyMagickString(q,q+1,(size_t) (MagickPathExtent-(q-filename)));
> ++  for (p=filename; *p != '\0'; )
> ++  {
> ++    /*
> ++      Replace "%%" with "%".
> ++    */
> ++    if ((*p == '%') && (*(p+1) == '%'))
> ++      (void) memmove(p,p+1,strlen(p));  /* shift left */
> ++    else
> ++      p++;
> ++  }
> +   return(strlen(filename));
> + }
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patch
> new file mode 100644
> index 0000000000..65739cbf44
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patch
> @@ -0,0 +1,103 @@
> +From 3b5f524f80851b819bcbfd40e30912af3710ef48 Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Wed, 12 Nov 2025 11:35:37 +0530
> +Subject: [PATCH 4/6] ImageMagick: Add support patch-4 to fix CVE-2025-55298
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/6c7c8d5866b9c0ce6cc76a741e05b9482716101e]
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/image.c | 31 +++++++++++++++++++++----------
> + 1 file changed, 21 insertions(+), 10 deletions(-)
> +
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index cd4de6df9..1acf8edbd 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -1647,6 +1647,8 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +   /*
> +     Start with a copy of the format string.
> +   */
> ++  assert(format != (const char *) NULL);
> ++  assert(filename != (char *) NULL);
> +   (void) CopyMagickString(filename,format,MagickPathExtent);
> +   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) != MagickFalse)
> +     return(strlen(filename));
> +@@ -1670,7 +1672,7 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +     /*
> +       Skip padding digits like %03d.
> +     */
> +-    if (*cursor == '0')
> ++    if (isdigit((int) ((unsigned char) *cursor)) != 0)
> +       (void) strtol(cursor,(char **) &cursor,10);
> +     switch (*cursor)
> +     {
> +@@ -1682,9 +1684,8 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +           count;
> + 
> +         count=FormatLocaleString(pattern,sizeof(pattern),q,value);
> +-        if ((count <= 0) || (count >= MagickPathExtent))
> +-          return(0);
> +-        if ((offset+count) >= MagickPathExtent)
> ++        if ((count <= 0) || (count >= MagickPathExtent) ||
> ++            ((offset+count) >= MagickPathExtent))
> +           return(0);
> +         (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExtent-
> +           offset));
> +@@ -1698,7 +1699,9 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +           *option = (const char *) NULL;
> + 
> +         size_t
> +-          extent = (size_t) (end-cursor);
> ++          extent = (size_t) (end-cursor-1),
> ++          option_length,
> ++          tail_length;
> + 
> +         /*
> +           Handle %[key:value];
> +@@ -1707,19 +1710,27 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +           break;
> +         if (extent >= sizeof(pattern))
> +           break;
> +-        (void) CopyMagickString(pattern,cursor,extent);
> ++        (void) CopyMagickString(pattern,cursor+1,extent+1);
> +         pattern[extent]='\0';
> +         if (image != (Image *) NULL)
> +-          option=GetImageProperty(image,pattern,exception);
> +-        if ((option == (const char *) NULL) && (image != (Image *)NULL))
> +-          option=GetImageArtifact(image,pattern);
> ++          {
> ++            option=GetImageProperty(image,pattern,exception);
> ++            if (option == (const char *) NULL)
> ++              option=GetImageArtifact(image,pattern);
> ++          }
> +         if ((option == (const char *) NULL) &&
> +             (image_info != (ImageInfo *) NULL))
> +           option=GetImageOption(image_info,pattern);
> +         if (option == (const char *) NULL)
> +           break;
> ++        option_length=strlen(option);
> ++        tail_length=strlen(end+1);
> ++        if ((offset+option_length+tail_length+1) > MagickPathExtent)
> ++          return(0);
> +         (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExtent-
> +           offset));
> ++        (void) ConcatenateMagickString(p+offset+option_length,end+1,(size_t) (
> ++          MagickPathExtent-offset-option_length-tail_length-1));
> +         cursor=end+1;
> +         break;
> +       }
> +@@ -1733,7 +1744,7 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +       Replace "%%" with "%".
> +     */
> +     if ((*p == '%') && (*(p+1) == '%'))
> +-      (void) memmove(p,p+1,strlen(p));  /* shift left */
> ++      (void) memmove(p,p+1,strlen(p+1)+1);  /* shift left */
> +     else
> +       p++;
> +   }
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-1-CVE-2025-55298.patch b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-1-CVE-2025-55298.patch
> new file mode 100644
> index 0000000000..1a92b36755
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-1-CVE-2025-55298.patch
> @@ -0,0 +1,71 @@
> +From bc530e782bcee75960dac57e9191ab7257842bd9 Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Wed, 12 Nov 2025 11:52:00 +0530
> +Subject: [PATCH 5/6] ImageMagick: Fix CVE-2025-55298
> +
> +CVE: CVE-2025-55298
> +
> +This CVE fixed in two parts, this commit includes the first fix.
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/1f93323df9d8c011c31bc4c6880390071f7fb895]
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/image.c | 32 ++++++++++++++++++++++++++++++++
> + 1 file changed, 32 insertions(+)
> +
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index 1acf8edbd..7a52236d8 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -1633,6 +1633,31 @@ MagickExport VirtualPixelMethod GetImageVirtualPixelMethod(const Image *image)
> + %    o exception: return any errors or warnings in this structure.
> + %
> + */
> ++
> ++static inline MagickBooleanType PercentNInvalidOperation(char *filename)
> ++{
> ++  MagickBooleanType
> ++    match = MagickFalse;
> ++
> ++  size_t
> ++    length = strlen(filename);
> ++
> ++  ssize_t
> ++    i;
> ++
> ++  for (i=0; i < (ssize_t) length-1; i++)
> ++  {
> ++    if ((filename[i] == '%') &&
> ++        ((filename[i+1] == 'n') || (filename[i+1] == 'N')))
> ++      {
> ++        filename[i]='?';
> ++        filename[i+1]='\?';
> ++        match=MagickTrue;
> ++      }
> ++  }
> ++  return(match);
> ++}
> ++
> + MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +   Image *image,const char *format,int value,char *filename,
> +   ExceptionInfo *exception)
> +@@ -1652,6 +1677,13 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +   (void) CopyMagickString(filename,format,MagickPathExtent);
> +   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) != MagickFalse)
> +     return(strlen(filename));
> ++  if (PercentNInvalidOperation(filename) != MagickFalse)
> ++    {
> ++      errno=EPERM;
> ++      (void) ThrowMagickException(exception,GetMagickModule(),OptionError,
> ++        "InvalidArgument","`%s'",filename);
> ++      return(0);
> ++    }
> +   while ((cursor=strchr(cursor,'%')) != (const char *) NULL)
> +   {
> +     const char
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-2-CVE-2025-55298.patch b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-2-CVE-2025-55298.patch
> new file mode 100644
> index 0000000000..22fafbb4ff
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-2-CVE-2025-55298.patch
> @@ -0,0 +1,274 @@
> +From 51bdbd8ba79cc29b5b8bd1cbe201612c4f1b6a14 Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Wed, 12 Nov 2025 13:05:40 +0530
> +Subject: [PATCH 6/6] ImageMagick: Fix CVE-2025-55298
> +
> +CVE: CVE-2025-55298
> +
> +This CVE fixed in two parts, this commit includes the second fix.
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/439b362b93c074eea6c3f834d84982b43ef057d5]
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/image.c | 182 ++++++++++++++++++++++++---------------------
> + 1 file changed, 96 insertions(+), 86 deletions(-)
> +
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index 7a52236d8..beaf69728 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -1619,7 +1619,7 @@ MagickExport VirtualPixelMethod GetImageVirtualPixelMethod(const Image *image)
> + %
> + %  A description of each parameter follows.
> + %
> +-%    o image_info: the image info..
> ++%    o image_info: the image info.
> + %
> + %    o image: the image.
> + %
> +@@ -1634,28 +1634,39 @@ MagickExport VirtualPixelMethod GetImageVirtualPixelMethod(const Image *image)
> + %
> + */
> + 
> +-static inline MagickBooleanType PercentNInvalidOperation(char *filename)
> ++static inline MagickBooleanType IsValidFormatSpecifier(const char *start,
> ++  const char *end)
> + {
> +-  MagickBooleanType
> +-    match = MagickFalse;
> ++  char
> ++    specifier = end[-1];
> + 
> +   size_t
> +-    length = strlen(filename);
> ++    length = end-start;
> + 
> +-  ssize_t
> +-    i;
> ++  /*
> ++    Is this a valid format specifier?
> ++  */
> ++  if ((specifier != 'd') && (specifier != 'x') && (specifier != 'o'))
> ++    return(MagickFalse);
> ++  if ((length == 1) && (*start == specifier))
> ++    return(MagickTrue);
> ++  if (length >= 2)
> ++    {
> ++      size_t
> ++        i = 0;
> + 
> +-  for (i=0; i < (ssize_t) length-1; i++)
> +-  {
> +-    if ((filename[i] == '%') &&
> +-        ((filename[i+1] == 'n') || (filename[i+1] == 'N')))
> +-      {
> +-        filename[i]='?';
> +-        filename[i+1]='\?';
> +-        match=MagickTrue;
> +-      }
> +-  }
> +-  return(match);
> ++      if (*start == '0')
> ++        {
> ++          if ((length >= 3) && (start[1] == '0'))
> ++            return(MagickFalse);
> ++          i=1;
> ++        }
> ++      for ( ; i < (length-1); i++)
> ++        if (isdigit((int) ((unsigned char) start[i])) == 0)
> ++          return(MagickFalse);
> ++      return(MagickTrue);
> ++    }
> ++  return(MagickFalse);
> + }
> + 
> + MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +@@ -1669,82 +1680,89 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +   const char
> +     *cursor = format;
> + 
> +-  /*
> +-    Start with a copy of the format string.
> +-  */
> +   assert(format != (const char *) NULL);
> +   assert(filename != (char *) NULL);
> +-  (void) CopyMagickString(filename,format,MagickPathExtent);
> +   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) != MagickFalse)
> +-    return(strlen(filename));
> +-  if (PercentNInvalidOperation(filename) != MagickFalse)
> +     {
> +-      errno=EPERM;
> +-      (void) ThrowMagickException(exception,GetMagickModule(),OptionError,
> +-        "InvalidArgument","`%s'",filename);
> +-      return(0);
> ++      (void) CopyMagickString(filename,format,MagickPathExtent);
> ++      return(strlen(filename));
> +     }
> +-  while ((cursor=strchr(cursor,'%')) != (const char *) NULL)
> ++  while ((*cursor != '\0') && ((p-filename) < ((ssize_t) MagickPathExtent-1)))
> +   {
> +     const char
> +-      *q = cursor;
> +-
> +-    ssize_t
> +-      offset = (ssize_t) (cursor-format);
> ++      *specifier_start,
> ++      *start;
> + 
> +-    cursor++;  /* move past '%' */
> ++    if (*cursor != '%')
> ++      {
> ++        *p++=(*cursor++);
> ++        continue;
> ++      }
> ++    start=cursor++;  /* Skip '%' */
> +     if (*cursor == '%')
> +       {
> +-        /*
> +-          Escaped %%.
> +-        */
> ++        *p++='%';
> +         cursor++;
> +         continue;
> +       }
> +-    /*
> +-      Skip padding digits like %03d.
> +-    */
> +-    if (isdigit((int) ((unsigned char) *cursor)) != 0)
> +-      (void) strtol(cursor,(char **) &cursor,10);
> +-    switch (*cursor)
> +-    {
> +-      case 'd':
> +-      case 'o':
> +-      case 'x':
> ++    specifier_start=cursor;
> ++    while (isdigit((int) ((unsigned char) *cursor)) != 0)
> ++      cursor++;
> ++    if ((*cursor == 'd') || (*cursor == 'o') || (*cursor == 'x'))
> +       {
> +-        ssize_t
> +-          count;
> ++        const char
> ++          *specifier_end = cursor+1;
> + 
> +-        count=FormatLocaleString(pattern,sizeof(pattern),q,value);
> +-        if ((count <= 0) || (count >= MagickPathExtent) ||
> +-            ((offset+count) >= MagickPathExtent))
> +-          return(0);
> +-        (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExtent-
> +-          offset));
> +-        cursor++;
> +-        break;
> ++        if (IsValidFormatSpecifier(specifier_start,specifier_end) != MagickFalse)
> ++          {
> ++            char
> ++              format_specifier[MagickPathExtent];
> ++
> ++            size_t
> ++              length = cursor-specifier_start;
> ++
> ++            ssize_t
> ++              count;
> ++
> ++            (void) snprintf(format_specifier,sizeof(format_specifier),
> ++              "%%%.*s%c",(int) length,specifier_start,*cursor);
> ++            count=FormatLocaleString(pattern,sizeof(pattern),format_specifier,
> ++              value);
> ++            if ((count <= 0) || ((p-filename+count) >= MagickPathExtent))
> ++              return(0);
> ++            (void) CopyMagickString(p,pattern,MagickPathExtent-(p-filename));
> ++            p+=strlen(pattern);
> ++            cursor++;
> ++            continue;
> ++          }
> ++        else
> ++          {
> ++            /*
> ++              Invalid specifier — treat as literal.
> ++            */
> ++            cursor=start;
> ++            *p++=(*cursor++);
> ++            continue;
> ++          }
> +       }
> +-      case '[':
> ++    if (*cursor == '[')
> +       {
> +         const char
> +           *end = strchr(cursor,']'),
> +           *option = (const char *) NULL;
> + 
> +         size_t
> +-          extent = (size_t) (end-cursor-1),
> +-          option_length,
> +-          tail_length;
> ++          extent,
> ++          option_length;
> + 
> +-        /*
> +-          Handle %[key:value];
> +-        */
> +         if (end == (const char *) NULL)
> +-          break;
> ++          continue;
> ++        extent=(size_t) (end-cursor-1);
> +         if (extent >= sizeof(pattern))
> +-          break;
> ++          continue;
> +         (void) CopyMagickString(pattern,cursor+1,extent+1);
> +         pattern[extent]='\0';
> +-        if (image != (Image *) NULL)
> ++        if (image != NULL)
> +           {
> +             option=GetImageProperty(image,pattern,exception);
> +             if (option == (const char *) NULL)
> +@@ -1754,32 +1772,24 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +             (image_info != (ImageInfo *) NULL))
> +           option=GetImageOption(image_info,pattern);
> +         if (option == (const char *) NULL)
> +-          break;
> ++          continue;
> +         option_length=strlen(option);
> +-        tail_length=strlen(end+1);
> +-        if ((offset+option_length+tail_length+1) > MagickPathExtent)
> ++        if ((p-filename+option_length) >= MagickPathExtent)
> +           return(0);
> +-        (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExtent-
> +-          offset));
> +-        (void) ConcatenateMagickString(p+offset+option_length,end+1,(size_t) (
> +-          MagickPathExtent-offset-option_length-tail_length-1));
> ++        (void) CopyMagickString(p,option,MagickPathExtent-(p-filename));
> ++        p+=option_length;
> +         cursor=end+1;
> +-        break;
> ++        continue;
> +       }
> +-      default:
> +-        break;
> +-    }
> +-  }
> +-  for (p=filename; *p != '\0'; )
> +-  {
> +     /*
> +-      Replace "%%" with "%".
> ++      Invalid or unsupported specifier — treat as literal.
> +     */
> +-    if ((*p == '%') && (*(p+1) == '%'))
> +-      (void) memmove(p,p+1,strlen(p+1)+1);  /* shift left */
> +-    else
> +-      p++;
> ++    cursor=start;
> ++    if ((p-filename+1) >= MagickPathExtent)
> ++      return(0);
> ++    *p++=(*cursor++);
> +   }
> ++  *p='\0';
> +   return(strlen(filename));
> + }
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index af0a3149e3..d929a220f1 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -33,6 +33,12 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
>      file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
>      file://0009-ImageMagick-Fix-CVE-2023-34151.patch \
>      file://0010-ImageMagick-Fix-CVE-2025-55154.patch \
> +    file://0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch \
> +    file://0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch \
> +    file://0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch \
> +    file://0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patch \
> +    file://0011-ImageMagick-Fix-1-CVE-2025-55298.patch \
> +    file://0011-ImageMagick-Fix-2-CVE-2025-55298.patch \
>  "
>  
>  SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121947): https://lists.openembedded.org/g/openembedded-devel/message/121947
> Mute This Topic: https://lists.openembedded.org/mt/116392327/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


