Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id BC29C61C45
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:21:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 25so6305325wmk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J+Hoo/x/91bLObFqw2A41SyNt6iSKdVv8lkAYSx3bLo=;
	b=kcxzk4B2CRZQ/JwHgbwrGGJb9uTKZIqzWr8ci5tC/M1CIFKTAhrXarehhlnHyrugus
	qcEVQttoRL1aSRZt/31tPso7xpm+Cb7rIg46HYCsh1djD+yO6BOi7amFSsrPbCLlCXA/
	64RreEq6TO6DH3wOWmf4mfEwZWMZRu8XD6YJaALLXk6mS25f5Tm2kKQLJ4BUQEuX4QW4
	GP4fwfENIDjvZLE1lw1Hp686iarC/V7Czl3h+1dU35duZ5MEpRzru5gp1xpvhVeizAPq
	44HSdsohvHIyvGQIqLn8En2HKHgVR1ei67vAN2iWZ4op6aEvT+D5oOOGqCPmIEtYVuqM
	MEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J+Hoo/x/91bLObFqw2A41SyNt6iSKdVv8lkAYSx3bLo=;
	b=mwfI6ox71DpFKR3M+zLXrF1dBOmfL6l7juXZfZ4Zxf7PffwS7WnBqCGUgMjX61/cA6
	Z2gMd4IKrMiX5cSpTTm0bTCXWjdmRUSi9bd7zcdEZu0FDwNYktSzykcKIaU8GTRtY6DB
	2aZudXHYQHtvWG67HLj5hC+5z96GKE9e6r4YhvnuAsGPWzPjc/pPHkNApLdW46+TXXL0
	Lmk5QAZHbGYqQfeQtoMwS1z3RDRxwEN+oAfo3Iu2z9HMuPLGvW4yhurEF42lTDUPbB0O
	QbeVvFsAZxqOlonf+mF9ce1JCjegxPS4u0IJqjCeB4Cp2sPYY0A8nqGvfwayLjKoQ4AQ
	F4nQ==
X-Gm-Message-State: ANhLgQ3nOLt9D3onovsOmAHEDxhLtnPsBDWLJE9gCxVKrKxEgrzdPVGg
	CPA0uW3daFL30vIDflR7nOTg1Nz3
X-Google-Smtp-Source: ADFU+vuISoKgQCe3ylfNkaqWCDRqdQvo1qjLxpvjXHB4cMcACpMPY0ymka875D/MLD/4DCunsE5E+w==
X-Received: by 2002:a05:600c:2306:: with SMTP id
	6mr5067442wmo.86.1584022911128; 
	Thu, 12 Mar 2020 07:21:51 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F067F32CE0B3214CDB29793.dip0.t-ipconnect.de.
	[2003:f0:7f06:7f32:ce0b:3214:cdb2:9793])
	by smtp.gmail.com with ESMTPSA id
	r12sm20974339wrx.26.2020.03.12.07.21.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 07:21:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2020 15:21:40 +0100
Message-Id: <20200312142140.5926-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200312142140.5926-1-schnitzeltony@gmail.com>
References: <20200312142140.5926-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 3/3] xfce4-power-manager: upgrade 1.6.5 -> 1.6.6
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
X-List-Received-Date: Thu, 12 Mar 2020 14:21:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.6.6
=======================
- Dismiss critical notification when connecting to AC
- Fix inhibiting xfce4-screensaver (Bug #16364)
- settings: Move % sign out of spinbutton (Bug #15994)
- panel-plugin: Toggle presentation mode on middle click
- panel-plugin: Properly show 'About' menu item
- panel-plugin: Add missing about callback
- panel-plugin: Properly hook up about signal
- panel-plugin: Replace deprecated call
- Switch to symbolic window-close icons

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-power-manager_1.6.5.bb => xfce4-power-manager_1.6.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.5.bb => xfce4-power-manager_1.6.6.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.6.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.6.bb
index 295e2e4ed..608990ad4 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.6.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[md5sum] = "709efbc2de9ed84b4831847ff70bcd7f"
-SRC_URI[sha256sum] = "10adb67899b181ca5fc577fc9bb7a698fb94e42073585f7e2be642c7db127a74"
+SRC_URI[md5sum] = "19873fc8a6de5e37ed57036a0002a5ce"
+SRC_URI[sha256sum] = "1b7bf0d3e8af69b10f7b6a518451e01fc7888e0d9d360bc33f6c89179bb6080b"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.21.1


