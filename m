Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7786477CEC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d79so8685672wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EuRfyphXyvQy5gemxe9X2TwpBRez9ZX6nNHxSYfH54w=;
	b=BsIExh0HeCl/l7BmRHXQbleAtAaPA85FbNNmToHz3b6GSO+wbpCnN8acafCJHkHP6C
	iG/niVVkn3Ao+eC7DlUDfvIMICwnnHln7iFLUNEbwHynk4MHO2ya3LQX78IEjiwzkwTr
	+FuGFgVUSF0mQHx+UFKzUD9qQm81ZSy3EGXEuSw7YEYZ1jSxrutHXv4yYzpko57l9Rev
	wewoXRlxhhfu+fr6cOnF1ny6yswmHCmbasOmAYkuSTL/ljKs/WvUIrjCACru14MauD9r
	mXJwjypV9v4ffohogpPQbUFdi6+Kjn1yXgm5Spufeo3udlDA2MySCHytcyGMMbh5iSkG
	EKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EuRfyphXyvQy5gemxe9X2TwpBRez9ZX6nNHxSYfH54w=;
	b=f0Vz9ex0BzH+fYzTWH5mLJB8TZv+cNzq2svlCfQTgXp30AYz/h26Swc7Xb6PdZgO0g
	qqy3hBj05Q1q6PEGiQnCW3w+3yz8IU08XnQRXJBwUQsVC7YQkipFjRNOTSy0P0hrZ8y0
	aK0llS71jafGM5AobpytayhLAGm5M+EHQaxrYbi6RfmJJlW57U5I+GycZ86eHfRzWsU5
	A115Kh2xlBcOwVFmScsqbpkZ0tRH5SO05e5HNRgbIKdX7U+Bsjoi1sAx9Ug2cCkJdPtM
	CDyFfUT2vqucc9qSh+z0XESQQ5viBja4chfsOcQwkbAV7fB4nx9p+OvArrZ0XJKgbtQK
	He+w==
X-Gm-Message-State: AN3rC/6rnuSrmMcWUVctc+lgWLqYrzDiwHzip7oS6qlLaH+8SGfu8m2N
	ZfNjtLL9hFzvn6gh
X-Received: by 10.28.142.133 with SMTP id q127mr21690038wmd.116.1492027022344; 
	Wed, 12 Apr 2017 12:57:02 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:21 +0200
Message-Id: <20170412195638.3243-13-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/29] xfce4-systemload-plugin: update 1.2.0 -> 1.2.1
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e4-systemload-plugin_1.2.0.bb => xfce4-systemload-plugin_1.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.0.bb => xfce4-systemload-plugin_1.2.1.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.0.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb
index 1da87d2..eeb4518 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "f2c7e77c8ef7d654c0b429d2e109d4a0"
-SRC_URI[sha256sum] = "4081d2c5ebda1c80d0eed48ae247a483ed4b15c8cb094fe009cb2304dda50cad"
+SRC_URI[md5sum] = "550277af9886c47005117110f6e7ec0d"
+SRC_URI[sha256sum] = "2bf7d0802534a1eb2e9f251af2bb97abc3f58608c1f01511d302c06111d34812"
-- 
2.9.3


