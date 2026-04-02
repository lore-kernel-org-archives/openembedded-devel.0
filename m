Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9A9D3941D
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 12:06:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14061.1775131600620779073
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 05:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QdKGyNbN;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6463145e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775131599; x=1775736399; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4+Q69UCiPYkbl++uFEWCsF4bOH10UbE3aTuX/WhFG8=;
        b=QdKGyNbNPHetanrfRhY9DOmkAZYBogZrnT1QsL4rLEjyx2CxdP+H6KaBQmAOGJtpZn
         i5PymzxcRjC07gY2YW6ITbOJLzZ+UyqARobiA8TAReoCDbRmQgQtlhqB3AuUa9poUA0h
         eEN9IjUpI11Ev+vqz5tgY2W0x5Gl3z08ObN1aVZU1qCOoDTAgMcwOD1XaZpIQle9ZASQ
         p6iQStE3NLhx/vt198WobW2yhSDLbNYr4aOWyUIE5WT2AEV7LO1pWUs/KcCY6L+px9Pb
         BBP/Xz0GE+pzEpUxK5M1QiserFzPYC3RyflChRjZ15iXSP1i3+u9b6DlPcJRddevYXT6
         L5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131599; x=1775736399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4+Q69UCiPYkbl++uFEWCsF4bOH10UbE3aTuX/WhFG8=;
        b=iXQM+/C1aOLvBecsV90ojGBovTBkzPs+8fpN8x+9dQUxFcil/6u5HbW/c0o/aJRTAM
         vC93IDdHLCLz+xG2JFmH31DZgud+I7FoAh3Iba7ANqeDcqOv7oFlwfK7BW8m/aFgZw35
         d/2QeVyKxT4GsoJOB5HI0x6LuZhLStanC1ondKF1AJboo7ezAq3gBj0kGr8wfeRBm3fJ
         1HOfX5TPp9M4kn8PNnRFoOVUQgae97woRheY3zAAmcLcWzhcDFZMwCNeV/nVDVxBCRQ0
         9z2IaJpblbSa+wNYv8pHXiKqWveGxHosxcpenCEN0lfRlLBJ87ZmfDG+0sdIWe2CWGPs
         Y6gg==
X-Forwarded-Encrypted: i=1; AJvYcCVR9bdz+8PEs+RInbttcZt0zOv88Qpx1iAK4sG50mZjBwzWPCwNdqkylPgRFKHjAbjX0FJHOxzv0DVWc2deJNswF/Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYf/iFHwwDF5LD6x/H8iwl/EcqKhegdr9+vh4dZZiF4Lt+XC1o
	vVWcRaHesoORrl5avh+FnX7kM+ku2BezsFhu4WEGoL7nDd0Pj7L/5LDj
X-Gm-Gg: ATEYQzxdIH5cv/I7GjGF9qrWzgCPgwjyCCUbS1udAM/5G3TALF5nQkfUkcSTjGO8EMu
	twHY0HzyoczQR/FR9QIU69jJ5zjhL4Gjz0P9gA7opwZ1sFjdbx6rds2pHx1R+xypqC1R9vv47Xi
	MNqaiBDo73msDiVXtEnlacQkpXEr2Wh09bv6YGnZ4RnsaPCvYy3UdcVGGCO/mTJDmaOOY8H7uL0
	gqNvhI9aLdRWvu/LuWW0rFuRrBLwgN4sDROFI6kvkaM9gj+4zF5IDZYhQbD0CB2q8LzMo1gGEDo
	53KWy/ZwqZI2tdtMRb3FcYRFcLYIJApuFXQkXu2hXFgPMIskktbuRbtHJbwbzBrf6y3wLdeAg8s
	oiaxsr6/P6+npy/Xk5lEgKL7645ENaeBkErZaxXTqIsu68kbmrAeJQkftPacw1W4WOiSAqiFFzc
	NVWG/jM/fRJlbHjTYgkvvPauGvjMSyMXc=
X-Received: by 2002:a05:600c:8209:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-48883591d6amr142037145e9.17.1775131598663;
        Thu, 02 Apr 2026 05:06:38 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm7164204f8f.29.2026.04.02.05.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 05:06:38 -0700 (PDT)
Message-ID: <89c376b6-d8b7-4c39-9af4-b6db0e3c84c9@gmail.com>
Date: Thu, 2 Apr 2026 14:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] refpolicy-targeted: Updated policy to allow
 adb push and adb pull through adb shell - adb push is allowed to /tmp only -
 adb pull is allowed on all files
To: gmisra@qti.qualcomm.com, openembedded-devel@lists.openembedded.org
References: <20260402084123.405103-1-gmisra@qti.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260402084123.405103-1-gmisra@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 12:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125965

Could you please trim the subject, and move part of it to the description?

Also, I know that this came up before, but I still don't really
understand why meta-oe is a better place for this patch, instead of
meta-selinux. The reason for this could be me, I don't know much about
selinux, so please bear with me.

I had a quick look at meta-selinux, and it seems that it depends
indirectly on meta-oe (it depends on meta-python, which in turn depends
on meta-oe) - so if someone uses meta-selinux, this patch will kick in
unconditionally. At the first sight this means to me that having this
patch in meta-oe instead of meta-selinux just kind of obscures its
presence, without any apparent benefits.

Am I missing something?


On 4/2/26 10:41, Gargi Misra via lists.openembedded.org wrote:
> Signed-off-by: Gargi Misra <gmisra@qti.qualcomm.com>
> ---
>  .../0001-Added-sepolicy-for-adb-service.patch | 36 +++++++++++++------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch b/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch
> index 62f81e4ffb..29d45641d6 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch
> +++ b/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch
> @@ -1,6 +1,6 @@
> -From c110d893be565ade574ee2933c6e89197f833006 Mon Sep 17 00:00:00 2001
> +From d1c726eb1da3718d05a694222fa0a6a0e944f381 Mon Sep 17 00:00:00 2001
>  From: Gargi Misra <gmisra@qti.qualcomm.com>
> -Date: Thu, 5 Mar 2026 12:39:42 +0530
> +Date: Tue, 31 Mar 2026 23:39:22 +0530
>  Subject: [PATCH] refpolicy-targeted: Added sepolicy for adb service
>  
>      - Labeled adb binary
> @@ -12,15 +12,15 @@ Signed-off-by: Gargi Misra <gmisra@qti.qualcomm.com>
>  ---
>   policy/modules/services/adbd.fc |  5 +++++
>   policy/modules/services/adbd.if |  5 +++++
> - policy/modules/services/adbd.te | 25 +++++++++++++++++++++++++
> - 3 files changed, 35 insertions(+)
> + policy/modules/services/adbd.te | 39 +++++++++++++++++++++++++++++++++
> + 3 files changed, 49 insertions(+)
>   create mode 100644 policy/modules/services/adbd.fc
>   create mode 100644 policy/modules/services/adbd.if
>   create mode 100644 policy/modules/services/adbd.te
>  
>  diff --git a/policy/modules/services/adbd.fc b/policy/modules/services/adbd.fc
>  new file mode 100644
> -index 000000000..6f5bb9269
> +index 000000000..57d4c1d45
>  --- /dev/null
>  +++ b/policy/modules/services/adbd.fc
>  @@ -0,0 +1,5 @@
> @@ -31,7 +31,7 @@ index 000000000..6f5bb9269
>  +
>  diff --git a/policy/modules/services/adbd.if b/policy/modules/services/adbd.if
>  new file mode 100644
> -index 000000000..612fc0106
> +index 000000000..d71ab1374
>  --- /dev/null
>  +++ b/policy/modules/services/adbd.if
>  @@ -0,0 +1,5 @@
> @@ -42,10 +42,10 @@ index 000000000..612fc0106
>  +
>  diff --git a/policy/modules/services/adbd.te b/policy/modules/services/adbd.te
>  new file mode 100644
> -index 000000000..f7e8ac7d0
> +index 000000000..a58c61c9e
>  --- /dev/null
>  +++ b/policy/modules/services/adbd.te
> -@@ -0,0 +1,25 @@
> +@@ -0,0 +1,39 @@
>  +policy_module(adbd)
>  +
>  +########################################
> @@ -64,13 +64,27 @@ index 000000000..f7e8ac7d0
>  +# Minimal Rules Required for adbd service
>  +allow adbd_t self:capability sys_resource;
>  +
> -+domain_interactive_fd(adbd_t)
>  +dev_rw_usbfs(adbd_t)
> -+files_read_etc_files(adbd_t)
> -+files_rw_etc_runtime_files(adbd_t)
> ++
> ++# Required for semodule on adb shell
> ++domain_interactive_fd(adbd_t)
> ++
> ++# Required for adb pull
> ++files_read_all_symlinks(adbd_t)
> ++files_read_all_files(adbd_t)
> ++
> ++# Required for adb push on /tmp
> ++files_list_tmp(adbd_t)
> ++files_manage_generic_tmp_files(adbd_t)
> ++
>  +term_use_ptmx(adbd_t)
>  +term_use_generic_ptys(adbd_t)
>  +
> ++
> ++
> ++
> ++
> ++
>  -- 
>  2.43.0
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125963): https://lists.openembedded.org/g/openembedded-devel/message/125963
> Mute This Topic: https://lists.openembedded.org/mt/118630252/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


