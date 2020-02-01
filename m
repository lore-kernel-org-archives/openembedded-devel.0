Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D264B60C18
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 16:37:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t23so11336350wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2020 08:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uRTy02/IRtBtOvttLrNfyXSrJaqLwA6RfriKRWZto9U=;
	b=VnFzhPIrtiDGe6yLhFs+LnPzNREN7NaJ3tiy24TOY3+XOifBE6aIkuZWxUlaW0F2K3
	VB5xBQflHrqF3WxaqF3Pi03R+cm+o5mM6e6jQFZga7b4U5fQ51Jt5be0u5eHg8C97J7a
	c6akPu9Xd5dc7dySH/lkxmRgmfR+OzS2VfcaExiDL53VIpcuwRzrXuEtDnNiEbGl8MXP
	hdR0qYhSNDvkiu1TNWQw1ULmQg5bW2X9hZCUsPrBQ37DoAYWcU/FFqe7+9V5U/dy4uGY
	a+VVQZ/UbbR4yaM/Hd1OSTdQbTDNkLumVJKc5dD51dtWrA5z1qpYxE688ywZBdugt+w4
	NaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uRTy02/IRtBtOvttLrNfyXSrJaqLwA6RfriKRWZto9U=;
	b=VY7cfZP974xiIpKlxxrCBrAeXf7fu8tPIBBjBo/NUkzHzj/J6AKiO+QfhL9HSLRIxq
	fEbDQ2uYxGPDXm8IM/TOJ0NFDp47A2cpgLNcBsSnCSadHisy81oGu3Nck1GLNS6Auezw
	zypWovOk22onSlg5m6U7ljithH/Oi+Bw3wZSXuKq2I2lCCtqQSwR84Qg1IBcbS7hWK6/
	WzvRysSfIC/Emedjafbu6ut3hPmqakD19O1b01/sa5wD0xvCG9iQqJ4YZP0kTqt85Eeu
	FJjVHda8PHZTsWx4kPpNSVk14iLB8hrcBTi+4u4vmNBEGVsyDjWylGUT0o5f2IFaIGZw
	uO/w==
X-Gm-Message-State: APjAAAVRNeWSrqdjPIIY3MNvvYeKIezBLQRH6ltWVaZRh3LWBVEmI4PC
	NHKUst3x3Kq9btOFAh1j//nXjQ6d
X-Google-Smtp-Source: APXvYqwB9sO8vxhAY+/loLy9p1lE1eCa31ssJH8oMeL0zysWSOLKi5pevGcrh30KAM019qBRZWbJWg==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr18252234wme.37.1580575049314; 
	Sat, 01 Feb 2020 08:37:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F01CE208F5D55732A5FC539.dip0.t-ipconnect.de.
	[2003:f0:7f01:ce20:8f5d:5573:2a5f:c539])
	by smtp.gmail.com with ESMTPSA id s1sm8594117wro.66.2020.02.01.08.37.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 08:37:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2020 17:37:03 +0100
Message-Id: <20200201163703.4264-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200201163703.4264-1-schnitzeltony@gmail.com>
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] thunar: upgrade 1.8.10 -> 1.8.12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Feb 2020 16:37:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.8.12
========================
- NULL is the proper sentinel for g_object_new() (Bug #16310)
- Drop timer on finalize (Bug #15305)
- Store column width setting asynchronously and only once (Bug #15305)
- When move to trash fails, ask whether to delete files (Bug #15975)
- Ctrl+Mousewheel does not enlarge/shrink entries (for detailed list
view) (Bug #15936)
- Extra padding for Eject button when scrollbar is visible (Bug #15312)
- Use standard icon instead of custom
- Translation Updates: Albanian, Chinese (China), Chinese (Taiwan),
Croatian, Czech, Dutch, French, Galician, Greek, Hungarian, Italian,
Japanese, Norwegian Bokmål, Portuguese, Portuguese (Brazil), Russian,
Serbian, Slovak, Spanish, Swedish, Ukrainian

Could not find announcemant for 1.8.11

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../thunar/{thunar_1.8.10.bb => thunar_1.8.12.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.10.bb => thunar_1.8.12.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb
index eb57daefc..0d2befd02 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb
@@ -8,8 +8,8 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "85c7394d82542d5a023f1f5baef109d8"
-SRC_URI[sha256sum] = "3d448d81c0e49efbaa5ae6bf34ac3c88a614178a1127afaee6b3a1b5ee12e709"
+SRC_URI[md5sum] = "bebd2d83ad2ed111b906c99b65fb32ed"
+SRC_URI[sha256sum] = "29295bee0b1f5bfd525e37405e5d32b497ae539b15183dd14e6ca49e252225f8"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.21.0


