Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5916471AE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:49 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id x23so664401pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/sG8jTDSkRgzHP1UjSSTiDTuW59zMdj9Hco3SHRz/7E=;
	b=M5DFK3/QRVPuPCbl5dll21QW8axZdiMGugUJ8bUa8Q0AlxcE7O6tpbv2eLBciMS9Ey
	uAUiYUIAwCWLaNJqJo5fALLuw4uwdJdu4BN+hEk5Zn8X5/+fn363vUoTpy+l2zhP+POA
	yVfuNp6hfAnX23/K6sP8FACkqUrco/PMrq+PR9ex7sNFuM0akQL2qdjoeJcHWVh9yHN3
	JNJKcUCSwO0E9gbi1KfjGTT6RBJlhid/qDuGM8NgQFX0DTCCWjg+tpVF2/8Mjeu9qpU2
	8tM+ee9R28pMgNib22rgzJuqSRhi0mfFV8TWQephy/qPY/kQcZILjqWk+r5K/jWoGe6f
	p9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/sG8jTDSkRgzHP1UjSSTiDTuW59zMdj9Hco3SHRz/7E=;
	b=KYCN9vJFJTfFwBpjmKGJ5afnxry/GqsDCUnO8RV5/26yVSImvWbYpPGVfrJlm1z5sA
	IrGfxa6L1bqp/akIvDW0e3EKHUV3NTFcYLXuwv/XEo2jq/bP/0GND5PcDeIVdgGxWknW
	ZeVupZzjYHdi4IGGTpqJHTmu5EafF6hvyKf3xkT9olGjgLf98fayWLuWenbbBV3KGUpz
	K22FEEyHLpyc76p6ICzvcq31UP9fiXyLKa1LVOqtCyMfhJNJLQtjLU7OQcPIrfxW/V6k
	8Pj9sAQ7x7JSh7zzmRtVKU3J6nV5E157pS5PBhr1P2MMJYax1xrxhOV4D5USrXtF0fP9
	95nA==
X-Gm-Message-State: AKaTC02BiOfYeukX8p/rgRs7Ab+gDlojQyd69nFJ+iulk+yl0zJeIfk3k7//wUvI3qH74A==
X-Received: by 10.99.142.201 with SMTP id k192mr3486844pge.174.1479892971136; 
	Wed, 23 Nov 2016 01:22:51 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:04 -0800
Message-Id: <20161123092209.23699-44-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 44/49] libcec: Add missing dep on ncurses
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:49 -0000

Consider vc4 options on raspberryPi class of
devices

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 32ab4b9..0ce7ea1 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -4,9 +4,10 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e61fd86f9c947b430126181da2c6c715"
 
-DEPENDS = "p8platform udev lockdev"
+DEPENDS = "p8platform udev lockdev ncurses"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
+DEPENDS_append_rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
 PV = "3.1.0+gitr${SRCPV}"
 
-- 
2.10.2


