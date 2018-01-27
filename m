Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D6DE3788BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:09 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id q3so167373plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1KfSE9ECza2l2Me5PJII7x025kVjTPS38I9+IPpSy08=;
	b=q/SoLcorLIquySuU9s6vRemLDkX1imRFlP5L4QMfcsO6j2EP2gcTqMCQEul1vMDvSn
	yjyaSDhJFAC01+8pPuhbVo7EX6SXO8Ax9WwpxqeEO/uLyP535ilTpAczDvJ1iC4xagib
	BlBynor9yLrzBjPcIsfjW+bGMlWVNKbOaVQUi/QcSUdI9X4Uhl4lcXR+jXkrjbcBNyjS
	NtR5NTrL+qmKg9EwBGXf0197GIcBeAOzgZqx6MTZnL+XIKSTV8gZeKFUToRjA7UC8i5Y
	Cw7gfAcfx2ZLQhsnL8ZrLcLUbZdREqF0SbufoQ7V5xeexKBRwEZFW4CyFF8mkBsh1c26
	qi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1KfSE9ECza2l2Me5PJII7x025kVjTPS38I9+IPpSy08=;
	b=hgRO9eVdUwzY9nGQoWfCpLZUh6mJ6KoAzO0LaqivoJoE4gEHPX9yUXYMF4auWisQeB
	iS2WZC1aFuNMep5yobrrZWEM65SfmnX52NNIQkMQLMRWXxH7T19LoITUJwrxgMcqFRdo
	npdZJVKwOP0Et3z4BnncLOfBAVEhKdJojiuJ5TRrBwML7ZsedVvT4w/aX7KeICzjQfiM
	bIGLKsTnInQJCsBCJcb+nG6AUI2qMsu42Urv19IMqxAK6eGlj3oZvBNLfylQ3aODTiA8
	g2c2S8U2nQpa8agUCMFJAtQvyzbzgJvfrAKZ2NvP62KtpTg6RTXuhhIdFwhyJoADsWSF
	IpFQ==
X-Gm-Message-State: AKwxytfVWpZ0KfVaGtcymm6eLKEL4rNmUds4R/DRIiV/5Mv1kihpsf4h
	7ihx9GCIeF6YefdYCHrE2lXvGA==
X-Google-Smtp-Source: AH8x2248yJTLp7vzd9b3GGxUexUiOs0BPGqJwc/qhvyKn5s7l2jsPsH9YO7Jw3TUB/GAe2dnLH0e/Q==
X-Received: by 2002:a17:902:f64:: with SMTP id
	91-v6mr15529525ply.417.1517023511344; 
	Fri, 26 Jan 2018 19:25:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:34 -0800
Message-Id: <bd09ffb84da06c12cfd5ce272f8d0aa317332790.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 34/36] networkmanager: add consolekit only when x11 is enabled
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:10 -0000

From: Jackie Huang <jackie.huang@windriver.com>

consolekit depends on virtual/libx11 then it requires x11
distro feature, so add consolekit option only when x11
is in DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit b55738ef8d30d6aa92e2e644a50f4b06ec541204)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.4.4.bb        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
index bfd2aad..d5f456f 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
@@ -60,7 +60,8 @@ do_compile_prepend() {
 }
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
+       bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
 "
-- 
2.7.4


