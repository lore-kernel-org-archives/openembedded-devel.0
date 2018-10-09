Return-Path: <yisooan@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 58E47794BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 08:54:37 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w14-v6so486088plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=S+xjXVxuSaQSbxPuOUbWoO1hFfe80XMyitslroZbMKo=;
	b=p60/o2rxQtoCeJvjDktMwUEdoDGHBJ/+pyQnFX/tehDJXuvyWzuNLJmiIPOql1U565
	yIHhnfn24H41Bp9bPdAbbD6Ge/plAG0UaPZGE1XpIgTjSJhEkehjlpA/C2MwqMwkHHTb
	MRHRMwK15bb2O6s5g6EldTEYZpdcpy1nQ2e+RQ1Q0GMva7hh+amwYj2nqqutaP4e6H4i
	6UW6VrjbmYekaDAatU6PWT+qMgY9RMNCrHH4b2l+IE/wKLLGxHXlmnEpATwbj0RMPDGX
	mC1WSnkmTsPwQxDJJd7KWv3r3grL/ccG7a8SjlldgHbNaPu2ZozlOWs42lnB+uyoKXCH
	H13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S+xjXVxuSaQSbxPuOUbWoO1hFfe80XMyitslroZbMKo=;
	b=pF5/GPLSZ7qm3Qv4Uzzt65zMMUH320oocC4aIK2QOQtkK3l2kPg6zvLKv/fiTUPGA8
	/3o/eZ2uSmIWqbdCPAzPfBj1YBORsYYYJ/2HhOcQqBlJCUunyjx7SSA9lhHlYK4N9eXK
	/aJGzwm3NAeFgVoDKMZmw4SrNok4eSsOprodx8S0Wc+s5WZ0YRjU4TJVBfqORgd0avaD
	00iN/nJQ6dMeZKALC/a9trTcaTJEc2LlibYY+0KWmp7iVNS4MRyY68Jr6adoBzwz9Z1B
	U9s/Y5es1fSiGvk60Z3jAShseGDF7rF8svNw2BrvGL+Ti6Ot1482CfpSBsZ/vQkqkfiq
	Ro1w==
X-Gm-Message-State: ABuFfohZPfnAC4sv0AqOYXkEx9eGR/fj8IzpTP5ucwkTHtJAwzFVvqyN
	6MZdUJVw7fBhbi8+RE4dTtld3mGA
X-Google-Smtp-Source: ACcGV62W21zY9Sjbx0I6cISDADla1CupNCjom+hr+bEig4v0TWAQK3FJhjaNkwMsOhoOHgWoV2myrw==
X-Received: by 2002:a17:902:40d:: with SMTP id
	13-v6mr27698905ple.257.1539075277930; 
	Tue, 09 Oct 2018 01:54:37 -0700 (PDT)
Received: from localhost.localdomain ([221.158.206.146])
	by smtp.gmail.com with ESMTPSA id
	n79-v6sm43298487pfk.19.2018.10.09.01.54.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Oct 2018 01:54:37 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 17:54:24 +0900
Message-Id: <20181009085425.18140-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 1/2] babeld: Add Babel routing protocol
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
X-List-Received-Date: Tue, 09 Oct 2018 08:54:37 -0000

Babel is a loop-avoiding distance-vector routing protocol for
IPv6 and IPv4 with fast convergence properties.

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 .../recipes-protocols/babeld/babeld_1.8.3.bb  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb b/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
new file mode 100644
index 000000000..921f7dc08
--- /dev/null
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Babel is a loop-avoiding distance-vector routing protocol"
+DESCRIPTION = "\
+Babel is a loop-avoiding distance-vector routing protocol for IPv6 and \
+IPv4 with fast convergence properties. It is based on the ideas in DSDV, AODV \
+and Cisco's EIGRP, but is designed to work well not only in wired networks \
+but also in wireless mesh networks, and has been extended with support \
+for overlay networks. Babel is in the process of becoming an IETF Standard. \
+"
+HOMEPAGE = "https://www.irif.fr/~jch/software/babel/"
+SECTION = "net"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
+
+SRC_URI = "git://github.com/jech/babeld.git;protocol=git"
+SRCREV = "535184173fcde5ddc43020cd197d01d1ea0e9a8b"
+
+SRC_URI += "file://0001-Rename-LICENCE-to-LICENSE.patch"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	oe_runmake babeld
+}
+
+do_install () {
+	oe_runmake install.minimal PREFIX=${D}
+}
+
-- 
2.17.1


