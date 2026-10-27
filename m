Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14651.1793092846281196198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lphPVaAt;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2454390f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092844; x=1793697644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVPYA98zzC5gIQ5IgnRAZX4XkAXI58C9fCshLcGLb5s=;
        b=lphPVaAtoJQZG4xunDXygNA1pTcdaUyMWPrm+qMPCf4S45ZcQc5CmX0zvBc+HDvs4k
         d0GnNi0Zqxeb/GAjgkn+Xk/KyANwluaKwcjL0BFBPAsKRcGZvrQEvEHaFzOFd2EeKSpQ
         XZZ22KQYgiPH+pHKmicKEqv0Er3I5dXcEzL3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092844; x=1793697644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVPYA98zzC5gIQ5IgnRAZX4XkAXI58C9fCshLcGLb5s=;
        b=s6L6vcVqs1qHR4lWcxLWId5hJlhew5xZrfgBprrjorrC4nuSXEyV9gbo2rrkJp8O4z
         tLKMzvfnm3PMxDTYRD78CibLwHDwsxgjvRq8jKXYf65TqdQwrvuSsCueutqXVwBy7ZiY
         r5B4xEk/7QAQmQfJxTAhPLhXOZ5Rsf8DJ6N7Nr8Te4lwkMLxsiu53OxYdA5nppet0NjZ
         cX+fSTHqMsjFxmEwpornVmcfbDQyzlWYU2a4qK7l3Os0/jrUZPG/JxPC/5JQ/OL+gmEU
         A153kW5UzjyTiFsRJ+fuTXwu//HZoXh2BfGmbhQdDxdjtXskRPjZJ9ccSSCPqJsAJHTM
         Tiug==
X-Gm-Message-State: AFq9FYI7HQFtC9XFXwYaAHKxKXE3g7Is2VP9IM2O/0iwrdrAAXT1Go61
	BZq1hyFkVqr7dpp22YPBd0/g3o91RHBCVo5mriGyaPZP7Veqp7zIhcCoXu2dpwkgRtl92lZMzq2
	lI120
X-Gm-Gg: AYBFou2Qw0PfIiW/aMmD8ohyQJ2oNawNtmyhC8ApnIkLG1CLeE/D4PPaimGSjNKB9EB
	g7BlalD6R+SKxa5Bzqm4GFNcFt8UHlkZmZBROe7pusKzXxBSEsCuZu0xX7pp6k4jp1OOT+InYpk
	+hd1/t89C8Qc4wnPPMGxaLH0h2iMi5WMx6jQPFE+kQHVvpMRoH/O8M1N2J0Xi5sVs+3y2Lt1l1y
	YTqia1y+Fp0BmsFleijcT+X53+aFMQ3Fj/UwAPj0lTGpHuY5JtMRMZHLg0LaPaaoaq2JJeSUk6h
	/RfP5P7lja0KS7I2mrtIdR5kDeq25OR0Oec9Mz/i6ZUavW1d/T8FMY1pQzJ28xZig5F11dWwQk5
	Rcu/oWGdZ64upMPyeKJe8BMz7XHeyahxROQajbJwxKHyL4h4M733a9kJ7Ge8UA5gA1Paxp3UW0x
	OtGX6VT5XpsOS36TqYFfWkRjPA5JFY9VHPFVh8c27P3RBbtREJk/a+s1+EJuBCyrKhrJtpgFx7a
	rAq8pjnGw3xEBniKqJRYcQZARnjGxhZMfVGrcO86LRFA6ouPKuDUZPxh1dCB4fWIbt61aNqPIyo
	paQf4PndaclzP2bdgVmn6TELbJvtD6WySDqosasVausDUL4hoIH4bkPSPIHWdZV2vFn/IkTkAlt
	4K7q6
X-Received: by 2002:a05:600c:1992:b0:4a2:1a:a121 with SMTP id 5b1f17b1804b1-4a35acaf98emr159782385e9.18.1793092844572;
        Tue, 27 Oct 2026 02:20:44 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/61] python3-platformdirs: Upgrade 4.10.1 -> 4.13.5
Date: Tue, 27 Oct 2026 11:19:39 +0200
Message-ID: <20261027092028.782979-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131476
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.13.5:

- Publish a GitHub Release with changelog notes, a PyPI link, and a
  version comparison after each PyPI release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-platformdirs_4.10.1.bb => python3-platformdirs_4.13.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.10.1.bb => python3-platformdirs_4.13.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
index 7c004a1ed3..a371e933b3 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "ceab4084426fe6319ce18e86deada8ab1b7487c7aee7040c55e277c9ae793695"
+SRC_URI[sha256sum] = "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

