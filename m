Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23467C636D3
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:02 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.120983.1700784059487121801
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AC+zsgcA;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c27ee9c36bso946531a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784059; x=1701388859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAINmwdkuA1a+C8bJEkFI8M/kdWZE1c+dYEw2vDgUyo=;
        b=AC+zsgcAZqftHWOq16hBQSDjU7h7u9iPZl4rn8qhlbNlb42Vfcja9Y+v01jbfFjkpF
         KlJPIQbMMzIgLI65H+ygbvvnLvCmjRgkG0aaG0pYqBdxvmpWm5zruZI8A+CZvm9Z0pxx
         T6E9T7sd5Hkt7CIDUPDjbo120o11CdcKEAD0ksWSKhlGsivV9EVbaY5TIK6tuvIITgDd
         8DGVDe5bnI/Bvb7nouNi+rTU8mPdgI8X8dZ8v8xftAzMSwmtvRGibY1Y20QftgcSBtED
         t3Lc0Fzq6P8b2k8SQ+1eiaPqQCnBFlmS6kSn8Eo8edQYDVxs9VGxyZhGG42A97+XLvQV
         b/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784059; x=1701388859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAINmwdkuA1a+C8bJEkFI8M/kdWZE1c+dYEw2vDgUyo=;
        b=bbvXqRvpnM5QjizHEbcm9xAuGxCVVTTwcr3YOXRi6ItWEqCasnMtjYuGHe5/wxYNI6
         A8gB1xmo3Wbnao96l9d0z/aEdbJXx5/TK9Su2t0YYMnjxJWUhAaOJa7e5lZndzOHc+6B
         MGCY7aBrI0zlxFWW/VYz4d9nYBMm+K0M/FYPOLxYyA9IClQ4Wn4hH9TYgE4U8Q0ashEc
         7Px57djRCdmOtoRBsa0qIPOe26wiBvLIn8FqF6SSzZ+9e+czyi+jfu3VihXENwF+oyFv
         yS3zc+lOk5qVQbphn2zkqylnov0NpTfQePyIyiWUVDlG60t4CPWR9vhAIZatfz/YoWu4
         99dw==
X-Gm-Message-State: AOJu0Yz5PQ4QM8A8q3J+H9LH2etQPjO13SIz9VK90gNYh3FfLHWdI1Zy
	ss80EmZShCWHJo0vp7IhEeJVpSRVK/xeCA==
X-Google-Smtp-Source: AGHT+IFmVFvFECxYCxUOxtsD5SooZNK+Nc6JM9c7+TFgKcrKMKDntMN1GgtUa+NdKwV2qcRAGK1Nlw==
X-Received: by 2002:a17:902:7584:b0:1ca:abe:a08b with SMTP id j4-20020a170902758400b001ca0abea08bmr869508pll.68.1700784058613;
        Thu, 23 Nov 2023 16:00:58 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:00:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700633783-7740-1-git-send-email-wangmy@fujitsu.com>
References: <1700633783-7740-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] exiftool: upgrade 12.69 -> 12.70
Message-Id: <170078405796.3118595.13139224589591303781.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:00:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107028


On Wed, 22 Nov 2023 14:16:23 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
>   - This marks the 20th anniversary of the initial ExifTool release!
>   - Added ability to read/delete C2PA CAI JUMBF metadata from TIFF-based images
>     (eg. DNG), QuickTime-based files (eg. MP4) and WebP images, and read JUMBF
>     from other RIFF-based files (eg. WAV, AVI), GIF images and ID3v2 metadata
>   - Added read/write support for JPH images
>   - Added ability to read Leica Q3 maker notes
>   - Added ability to recognize and write FujiFilm M-RAW RAF images (multiple raw
>     images in a single file) and the ability to read preview-less RAF images
>   - Added support for reading a number of obscure Microsoft EXIF tags
>   - Added a few new Sony lenses and support for the ILCE-9M3
>   - Added a couple of new Panasonic Leica lenses
>   - Added a couple of new Canon RF lenses
>   - Added a number of new CPUType values for ELF executables
>   - Added some new Olympus CameraType values
>   - Decode a few more ID3v2.2 tags (github #142)
>   - Decode a few new Canon G5X Mark II tags
>   - Decode WB_RGGBLevels for a few more Nikon cameras
>   - Extract information from FujiFilm M-RAW header
>   - Improved decoding of a few Nikon Z tags
>   - Marked misspelt XMP-drone-dji:GPSLongtitude tag to Avoid when writing
>   - Changed RIFF MaxDataRate conversion to use SI prefixes by default
>   - Fixed decoding of unknown ColorBalance information for some Nikon models
>   - Fixed an incorrect Nikon Z LensID
>   - API Changes:
>       - Added ByteUnit option
> 
> [...]

Applied, thanks!

[1/1] exiftool: upgrade 12.69 -> 12.70
      commit: 8f83be7d83a500fe506a2ea55d9752ecef4b3c8a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


