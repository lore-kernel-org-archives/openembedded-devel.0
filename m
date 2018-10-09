Return-Path: <yisooan@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8450260778
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 09:59:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c25-v6so581799pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EV5mj97bx+u0Vf+2ujzq5wIPMx3pnD30fp/jG01f/FI=;
	b=TY/QIfXXKPD5Wzc75dqb+GQfx2hjVhMeDFeL1+e6xz/F/Fmjb6m6Qlc14r1Vfv5qdU
	VrwJOyw7x3SSvcTiWv7os/ftF56SKznRQv0YRR+bTk3WZNvfTZZ2yFhdzxReoOew63WR
	81vcn4Xc/ekA+huyYZ0Uxg+WAD5Qa4hRZe9yGx+611CL4vINN/O6ljfVEAtF5PXsCGUe
	AND9oHzJu7Ktz00rVWBdOZRG3H08UandtOkvNJ+47Wqm3wEMk+AlpeqStWHCHtrtFSoc
	I+isG8g1NbpSE6H5MRKnZCkWcGScTgU2964vx+/eCkV+PpJXf9alkVZgI7jEJDCJSrSp
	U90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EV5mj97bx+u0Vf+2ujzq5wIPMx3pnD30fp/jG01f/FI=;
	b=hMTX057sXiKNVTxZOkUMFnLhcwD9V10+hI+YwwE3v5ty7oaxqkZskYLn8KdARBPyZX
	dhK9kT70MaOhn9Veqtnly8JsFwNPDn1NyZ71F2+7oDR/FDsdW3KQeiP5+tDX2ZRrdCqV
	QR2ef6FCC4qztDRLH3wQXqGX2TfJx/JktC0pI8Q+PTqmkVHOS7I8TYfdhhzbtIZuw96A
	pMTPjRymHWbqiG++kTN1poN8hD9XI92+PGPwROfzeWZcv9kLEXCPGOPGfaPzBhmxQj8e
	pEq2pi7aLCFBs/mk9PPA6uOf8zm4yaOuifayEV0q1xBXRAOMoI4qexp4khx/WGaUUcJS
	G8Pw==
X-Gm-Message-State: ABuFfojDGLcWFEYxzKMQvM1QmF+uyAV1MU5kOFvDe1yiWTZuAs9ZqbxH
	2OdNOWbF3xGqSfk86Zsno4KRZtA5
X-Google-Smtp-Source: ACcGV60vUvYva3PYHfw5XZANsz3nk8tD/0y3QHR4xtCbzEp7JP3uftVJLuiy6eb/k9PLPjvyM3qvCA==
X-Received: by 2002:a63:5d03:: with SMTP id
	r3-v6mr25145446pgb.445.1539079155012; 
	Tue, 09 Oct 2018 02:59:15 -0700 (PDT)
Received: from localhost.localdomain ([221.158.206.146])
	by smtp.gmail.com with ESMTPSA id
	g65-v6sm32717333pfg.98.2018.10.09.02.59.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Oct 2018 02:59:14 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 18:58:54 +0900
Message-Id: <20181009095854.21858-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking, v2][PATCH] babeld: Add Babel routing protocol recipe
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
X-List-Received-Date: Tue, 09 Oct 2018 09:59:14 -0000

Babel is a loop-avoiding distance-vector routing protocol for
IPv6 and IPv4 with fast convergence properties.

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 .../recipes-protocols/babeld/babeld_1.8.3.bb  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb b/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
new file mode 100644
index 000000000..8f028474f
--- /dev/null
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.8.3.bb
@@ -0,0 +1,27 @@
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
+LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
+
+SRC_URI = "git://github.com/jech/babeld.git;protocol=git"
+SRCREV = "535184173fcde5ddc43020cd197d01d1ea0e9a8b"
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


