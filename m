Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20434CCF9E0
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.956.1761363629680900257
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BuAlffb2;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a27053843bso3859424b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363629; x=1761968429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRGxzbn/GGxK8z6HAIHgzAjlSB4nqaNVl0G8va6HhFY=;
        b=BuAlffb2cHVCPNV2Ii59n4bIemvkFjxqmCllCMxtN+r5NB/4e5YlyTGz51VvvcO5Uw
         W8Os1KvztzCZB+fr+u1x9kV3hbxJJRrjstzOoa+cR4xocG7YeS2qOe3bmLb/pJt4Te1n
         JJwrhRUjxaNUS249WNy/JiXbtSJZ8IErXJOYgrhbCzevuSKwZslHC+vbPvDM1Xwqlq7w
         7lZjQunx0iOiTu0dJxi/7uOh0Y4Nnb4ij/mwLdCLBztEWGlwg8sdQbwLo/YX/meeWkn2
         amsmRBqPQccr5hp6cWZW+xkO+aXz4bOPGW2wqcwo+2J0bDTBlglS2TOAvEy9uYNZNPzJ
         /LPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363629; x=1761968429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRGxzbn/GGxK8z6HAIHgzAjlSB4nqaNVl0G8va6HhFY=;
        b=pUc6ig5eg5Fy25NuNJtH+tD8Tf9pPenshNUgeA5eCdcVHb2wYdjRQTDlIH/8Ai28yu
         D7kVHNBM2Ft9CzhhGrG3x4rUM2ttPVNSA9W1Ux2MqYzul93yCOSyVIqpTN3ctk6X0sJX
         obw7oC8Zof9v7nSPotNtc0ZwQzY09JN1kQuqlt7Buse8Ac4cHvAtqIcRISJyrSXGNBeI
         h4t+KFdnYunUwxeAZlD/vofX4iFFZub2Fy05XMXpHGNhqt5aRZUhpf86mjBFSmUCVl1g
         HpE41kY5R4B6PxkG/pY7abTBWhJLLnyXuNESA4yMJEK0pG9XSH5ABuLDcj9XWiljF+9m
         HrbQ==
X-Gm-Message-State: AOJu0Yzz5QyOfYj2q9p7TSmoJGOQHMa1zMP+87qqe6bJSSiSC26fJ2np
	1qxrakhIYCy6rpKF3F6Mt2Y3JYFnjf/AcpFrnoUxr7b7UVD7PZow08hffX9OTtbs
X-Gm-Gg: ASbGnctkU6mga/Xa/1wzeGBWV3XK9bB53dQ55vfnsR/A7BvDDj8in2GZTcOf9F2Xz9f
	vtk34t48PkoAezFL8t3zFUkdFDwFpYsJeNu3DHq29Mez80M98vNKHhJ10xIVHXK9WCEAqVeXKRO
	FS0imGqEoE+O5ihVQWQrvNo8tUJ777sk7GkP7bl4m7mYMlLnb4nozrFcZ2TCLUUgHngijhWlYFR
	7jhYGuKQxRCwDoGUPXaJoseBOrpDmk+eBMw6aXSyvMuYFNQcAAue12TKBrP/K66vtQLXri1Xllr
	VDvdl+sIQf9aRuGjAAE3QJa6e9FT8swu5i7iff69U69+naKe0QNCTmP3necIDtVzMfcl68Iwp2e
	V5e9l8xfZYj4hj92yN0SMsSlH+EQuyafKgOpCuTRqhI9tHU4ZLOaTU4c9WRXjoweja6bqx9x/Fi
	15DMAUFyvQvnPiLZqk3X4/QWMO5spWMEpB5qaGtgzxoKCp1a9cqyNgHX+tPxliznBGUpG56oL/
X-Google-Smtp-Source: AGHT+IHM8sibFJ4K1C7JPrxHuJU4vvVqbQxW3i4JarvfXp3X66doVaBDRvUP1ERXLMH9SS2VjFX3oA==
X-Received: by 2002:a05:6a00:2e85:b0:77f:50df:df36 with SMTP id d2e1a72fcca58-7a286803147mr5465870b3a.18.1761363628788;
        Fri, 24 Oct 2025 20:40:28 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 09/11] python3-pybase64: Switch to PEP-517 build backend
Date: Fri, 24 Oct 2025 20:40:14 -0700
Message-ID: <20251025034017.2071643-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120993

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes

WARNING: python3-pybase64-1.4.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb b/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb
index a551034168..2246f93e8c 100644
--- a/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mayeut/pybase64"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84b11fa55a5d83cf6fa202fd3b49c7e8"

-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta

 SRC_URI[sha256sum] = "46cdefd283ed9643315d952fe44de80dc9b9a811ce6e3ec97fd1827af97692d0"


