Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8747.1792580524600071026
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KlWT8PQs;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c434376dbebso117092466b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580523; x=1793185323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQwWhjrjo/fjntLgqmOdZe0xya/CpRQ6OGJ57NsuWws=;
        b=KlWT8PQsqPi0ik4WrBuF55YXqCJ2fCLgMPF3tk+Y3P1S5hxqoXdky62p64QZcajeqF
         LUatHCxZmI1C2qG+FB/9TRJELTixZnZdEKldzp/BxTFaCX4RBbtsYXIz7xuwLM/tzbA0
         omcBjwI+BvdMjwDU8AQGj2kb8PudAxoX86lVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580523; x=1793185323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQwWhjrjo/fjntLgqmOdZe0xya/CpRQ6OGJ57NsuWws=;
        b=gTdN5Q6tHRO7AWV2VpVfNf/LbW/PcVl4nOlMbfatlYMjBoEcoKLwAKm+Gcr28MNeoI
         bSE+cCdeejGpRs1lcsMqY1aUwRMafu59ufHqiYw+Ud+HzfdUAp3uTIVEJI//6c3EpEE9
         zIZKKH05XHkca9/e9rd1s0HWydJPnID/fchM5snmPMuX7silNRlvH3tOnuylLqxK8Vxw
         3N0juu1EE2z7wohDI5+wEXXsscxDIWwbWicU72fJfR+TDvoqrnVgVU5GkBghM3w+rtK8
         1aWQgDGOS5lWeZiXHWRQWplPWfUoAktikEh/EzCi2VB3EJohOYbvSFCJQsTL/vC2AXTz
         tj1A==
X-Gm-Message-State: AFq9FYJ6dBue5/89oq+vDjpoC3Teo64L/lICcbw6feXeRTy3JquG87ed
	JjDUIDVPTPhcPH1bROCYng+C6BjEGaKiF/HOU6RSNoZPz2gSy1euq9PxA5+lUjHgt1PZvRfbmMp
	4WMT+
X-Gm-Gg: AYBFou14qry9SlarkjoB9x5ZgFqK1RHopWRfXHYazNUfuirA1KMHUcljjJ9Gggao/l8
	GCkc9aZxRiWcIyLtfKos381E/bNVvRo+M4i9o8VMHNnyfNT9SQCWVlefuYUSrcaHh2zgL1cBn+w
	sTv28XrZRkaU9HjNG1QEAoC8aC03CQBk4r1jVxcj54xp1cnrV4JWjRXfVjMQwoqOMMk4u7FBp/Y
	pMabbpvTUfMFvERAKdG5SAIzTWNkcy1ei3r++HoI5jX1Gy76AnmMAomSl7IVv0po5H+B8JhrbHc
	CHoxMTu+gJzr6L6GIVps5iw1yZB4J0+6f/Qi4VST+Z8Rg9VuAbUQAwwzbklGK75Ymei/QYFlHLO
	w8NzuLRq4dRxaVutSBA/FbX5in0LXKU4mFSsVvoe5EUDM2iUTUEQpZhVGwsfXhwB0rGE0qXM9ZG
	YpcgTkOUnlGSWx0YyzNSrUA/OC+FrK+J1e/jGqG9pRYqAOyiJif2RqMRPya0g783HKroXh8HtUE
	7KOgqANh88CmNZAPhhsTqG/9WZyxIKju91uhlkeBoPOKSJK0RNDgRjJ8srmTkRvOoXy8npTZm9Y
	Q94EqSzYh9awhCepsWJMt0vo+SsZ58JaNBGWKe1BuX5f6YIONj/iDg3d7hixurc1XKEW+clo4af
	aJ18oUFUo54drATSP1I0YPez98g==
X-Received: by 2002:a17:907:2da2:b0:c42:4f89:13 with SMTP id a640c23a62f3a-c46045f60a8mr409067066b.15.1792580522476;
        Wed, 21 Oct 2026 04:02:02 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:02:01 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 34/36] python3-parse: Upgrade 1.22.2 -> 1.22.3
Date: Wed, 21 Oct 2026 14:00:58 +0300
Message-ID: <20261021110103.1943456-34-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131292
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.22.3:

- Preserve timezone offsets in strftime time-only results

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-parse_1.22.2.bb => python3-parse_1.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.22.2.bb => python3-parse_1.22.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.22.2.bb b/meta-python/recipes-devtools/python/python3-parse_1.22.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse_1.22.2.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.22.3.bb
index 75a9a7b9d5..430a4538a9 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.22.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "8ff0b98202798b8cefa4f8fac06b670d6d00e5ec6ecbbacaf97ac0d0e93a54e6"
+SRC_URI[sha256sum] = "7e79bb39c72c3bf1613510fd5cdffe5baa9a7873892bef1d4566f1672c8a42f4"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.47.3

