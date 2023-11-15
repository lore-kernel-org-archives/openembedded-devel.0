Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7143C47076
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:47 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.8082.1700032780531938724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQQ2tSOL;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ce2de8da87so3971080a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032779; x=1700637579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OSHLHdWy0D0QkAxfe+j0IraCxnFYbRaXzJxva3Yk/Y=;
        b=UQQ2tSOL0yjsCu1FfI+gHNGIJ4AM445sA9ZB3ymXspBswFOjOK/GCb5P5TlbxBiBsL
         f9Br5DolkaI2Y9mLkXm/44XHC9OYH2GEUZun8IX6hDKOz0U2f+lg6hb16PMdTbdiDPWV
         EZmZXmrSSTxMj4PURLmoCdGF71/0FvC88Ds4bV9LDeoxodRPsc+TUf+NulBRXfTFYBUY
         HB7Z+TJKwKFIV/TozlQTDvj5H5zslxpn4fQYuK1NZZpVK+F5URo/7boRJqSMGikq0I3n
         HU+bAtHrBfgR5KOvWPwAlSWJTOPrfgd8MnN0AxPuzf5LpXENvaTzghHx5jTyyOV6HOJr
         +o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032779; x=1700637579;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OSHLHdWy0D0QkAxfe+j0IraCxnFYbRaXzJxva3Yk/Y=;
        b=cUu5Ah4mWc8jClqZx17PyaLKXn1TiZ5IOOEsB/lYmHURzZCVNCOPxYHPrFZgzCQDxM
         lXxejtoWLER7/m3tSCAdTYM65gCnj5qxOkhNHWvowpomYycFXQE1kO2ovsx6b/xTDFI6
         shQjiM4CccAdIOeV+IPswNt0kjQRQa7xlXW88SKeeViWAsdEsu/SHOOd5DYvRcTrw/XS
         VLjFVg7ZbwC3ZeXsydN1ZvRJJ7USZzL+Z46lC0DrTqSko22NTzp5gBc3nnHOs7D2EwHG
         wOhsDRXIT8TFIMIk3GXh/f8xnkcoNeCpQBaRYNCMzZetlgVB6iiAbIg/d619C29gJSpk
         3Gug==
X-Gm-Message-State: AOJu0YztGYb3OZHnQpphCga3vZYi2oJsFEJPhrw1gWPpx19BuqLnX37v
	/p9sJ8OGu6ZWL2d5GYebBXqAEy05YCAxIw==
X-Google-Smtp-Source: AGHT+IE4oA9zWhGheZiqPO5ui0d6yp5WCnfXQ6bKl5eSwI9f5rjz/6ba1b+7WQEQAWIHhV+RC6TAAg==
X-Received: by 2002:a05:6870:4994:b0:1e9:c224:bb91 with SMTP id ho20-20020a056870499400b001e9c224bb91mr15490451oab.38.1700032779371;
        Tue, 14 Nov 2023 23:19:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <20231114120944.3741068-1-leon.anavi@konsulko.com>
References: <20231114120944.3741068-1-leon.anavi@konsulko.com>
Subject: Re: [meta-python][PATCH 1/5] python3-pillow: Upgrade 10.0.1 ->
 10.1.0
Message-Id: <170003277820.3928366.10282174909595836055.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106740


On Tue, 14 Nov 2023 14:09:40 +0200, Leon Anavi wrote:
> Upgrade to release 10.1.0:
> 
> - Added TrueType default font to allow for different sizes
> - Fixed invalid argument warning
> - Added ImageOps cover method
> - Catch struct.error from truncated EXIF when reading JPEG DPI
> - Consider default image when selecting mode for PNG save_all
> - Support BGR;15, BGR;16 and BGR;24 access, unpacking and putdata
> - Added CMYK to RGB unpacker
> - Improved flexibility of XMP parsing
> - Support reading 8-bit YCbCr TIFF images
> - Allow saving I;16B images as PNG
> - Corrected drawing I;16 points and writing I;16 text
> - Set blue channel to 128 for BC5S
> - Increase flexibility when reading IPTC fields
> - Set C palette to be empty by default
> - Added gs_binary to control Ghostscript use on all platforms
> - Read bounding box information from the trailer of EPS files if
>   specified
> - Added reading 8-bit color DDS images
> - Added has_transparency_data
> - Fixed bug when reading BC5S DDS images
> - Prevent TIFF orientation from being applied more than once
> - Use previous pixel alpha for QOI_OP_RGB
> - Added BC5U reading
> - Allow getpixel() to accept a list
> - Allow GaussianBlur and BoxBlur to accept a sequence of x and y
>   radii
> - Expand JPEG buffer size when saving optimized or progressive
> - Added session type check for Linux in ImageGrab.grabclipboard()
> - Allow "loop=None" when saving GIF images
> - Fixed transparency when saving P mode images to PDF
> - Added saving LA images as PDFs
> - Set SMaskInData to 1 for PDFs with alpha
> - Changed Image mode property to be read-only by default
> - Silence exceptions in _repr_jpeg_ and _repr_png_
> - Do not use transparency when saving GIF if it has been removed
>   when normalizing mode
> - Fix missing symbols when libtiff depends on libjpeg
> 
> [...]

Applied, thanks!

[1/5] python3-pillow: Upgrade 10.0.1 -> 10.1.0
      commit: a0473439e9eb8a928c8d1185426ddea88ea8b064
[2/5] python3-polyline: upgrade 1.4.0 -> 2.0.1
      commit: 5eec5c33289f8035b16af2743321550ae3415d9d
[3/5] python3-py7zr: Upgrade 0.20.7 -> 0.20.8
      commit: b3b68ce89cfb8d014fcd3070ca8dff5623bc5df5
[4/5] python3-zeroconf: upgrade 0.120.0 -> 0.126.0
      commit: 1c43e700f12eefc6819204c921a1c84661594592
[5/5] python3-pystemd: upgrade 0.10.0 -> 0.13.2
      commit: 8d78812fc8cf14e3242533a102a2228c898b445d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


