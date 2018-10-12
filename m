Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id CCF6F79BC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:26:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w14-v6so6089523plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lnX7oan7KiNkD9YZORLqycvzqh7+v6UgpUgadKETXM8=;
	b=oG6vx4CPe9toT2ii/4Boy0YRBFWDK+u7koImiaPqpa/m0xZfY4jgpVU38bVyI4x14Q
	OFtdpEL4mhTRe1V9ZiVdaoryENskC7FWuhfZ3n40rNeV7LU65BRJtM2rPxlSg6tkApKa
	u/PgdeX7gtRDp0vRZ4YIx21mj0nHkT4Xq1MuMaKPYMHo+49Le6aAQlWvSXo0biLXXuO1
	QVG1aCt98dufsjXnYRJRGv4M3bCle4ojfJ7tdNnXLhJbW8nxepabwZDAKNZxVogvzmjq
	BSX1SU7k/KZSwZuUuCuLsw4rTZoXPRPqnBCUk+RopJ8XM6N35DU2WOdcC/JOWTgTQ8g+
	JVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lnX7oan7KiNkD9YZORLqycvzqh7+v6UgpUgadKETXM8=;
	b=FMDO3hvxRKhPnx9bPLQVlrp+HLANp32dmnL4hnMxDE/a2BZmqYauZs7y2a+He+ke0+
	RQqHFX3Su3jHpYUeyOhjC0oI8VU7BhlOimopAtKeMiqkcKE0HGs7oJe4k9gb6XA7mEmS
	duiVo+XdeEbuPI8ubfbo/Cbxu07eRvSsc1yt+evjIQvG/6bKPF3CrZB/wZF3pUvr2hz/
	u1qvrT2ybYxXmF5ZBfgvwvfCgW3VLoNHwXxSRBdNco+ejiGL/3creUfxm/EBoZk+7Xx1
	v8evqhtTiMMOUAtXeSaVftpWdnSeUmEliOyLxaRFBInKsrb+3hUCSsfuUZjW/y1RsAJk
	ktMg==
X-Gm-Message-State: ABuFfogWaNytxufDdgKP/4O+1OGMdic1LZrh/fRLVB++FiR5Vgmmg48p
	yy0kA2iq+5blQ/Dujd+nHYs=
X-Google-Smtp-Source: ACcGV62JhV+kZArNWkzTinE5bSSHbAWuE1J0PtSGg+KDea3WLdP3yaBwExF+UJeWwGke/j4C/J9jhg==
X-Received: by 2002:a17:902:650f:: with SMTP id
	b15-v6mr3975738plk.2.1539357988976; 
	Fri, 12 Oct 2018 08:26:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	x20-v6sm3525729pfe.131.2018.10.12.08.26.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Oct 2018 08:26:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 08:26:20 -0700
Message-Id: <1539357981-3675-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 4/5] blueman: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 15:26:28 -0000

Nothing RPROVIDES 'thunar'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/blueman/blueman_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/blueman/blueman_git.bb b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
index 947db78..8eb99ed 100644
--- a/meta-oe/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
 
-inherit autotools systemd gsettings python3native gtk-icon-cache
+inherit autotools systemd gsettings python3native gtk-icon-cache distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
     git://github.com/blueman-project/blueman.git \
-- 
2.7.4


