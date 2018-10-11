Return-Path: <yisooan@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0F57B79AE1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 09:33:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id f26-v6so4111302pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gbBf8cuU6JZaRURSCUistSPHE3chocL9JkmhQFpDLts=;
	b=pAqjEGhFu5aPoi9A9wxHyaJOseVxQa+bkGDbhznYwe3GTP26rLzEmr9kiyiYi6WFAf
	ScVzSyIm3nwMRws4+uj1c2i63mZ039+VI1wKpL3VsS3YWIUJhflvF8HH84DFyutoNB1S
	mYP7XYMa07Rt5cchQ3EsRTEGRf5CvZwBY9QSyQ5AuTQPjAfwcnUV2TdHzYoWABJhxUZF
	YP5ceQNLHSOxFF+VZupFewhoMvg9x3QQP1LUx6Yz0OrjCsWloI5Wtj3HdRZC0uDRyW2f
	14KzoiE85vG3O8wrWsI7/EbVSRkFmNHje8WfHkFQqGX1Omd8ex3gTQ0S8hWgBKQGXp8e
	Lqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gbBf8cuU6JZaRURSCUistSPHE3chocL9JkmhQFpDLts=;
	b=cHBgZKg1GIC8CDOnMBlSwgIFbCld4dYGavT9KtVaCA/7Uh0ag9xO1VnZJ6FX8ly/TO
	S/S39L0ZBr2+/UbyCO4+gzC7hjL4vF3GX1zMFVMZN3Y5mnOTAHabR2jl6dI81WJu2v8v
	oq47o8vxnYeD16IMwfMQEnxZ3O7Mbmfd5sDsN/LWaULvYYld+0N+EPBqbmIMdYNiQ92/
	0TizLVUpFEiMW6xaQg8cS2sICeTEL+7E9+wImf7R/zOM6LBDQZHBN06vc6CEnXEFGfY0
	FnK10zBKwLmO+PKrrMkDuUjaFOp8dMcCDtW1R0Ox7SPW7azBCSmD2PU6+Orl9lAMFt+B
	CkUw==
X-Gm-Message-State: ABuFfog3DiyKP5Da0mXoK+nEna0gOsCQzKW5sV6rrQXLJ6hIa5tPbnl8
	tSSYCCu1p2/x+pH5TYu0h+XHay8lJiY=
X-Google-Smtp-Source: ACcGV633DwYpiL/kJkQoFmwGFIZuMWcpEu/aX2/tTuK1biORB1gJ3nDxWLLki0lE/wq2hsOpVpZGng==
X-Received: by 2002:a62:221c:: with SMTP id
	i28-v6mr814813pfi.196.1539250440702; 
	Thu, 11 Oct 2018 02:34:00 -0700 (PDT)
Received: from localhost.localdomain ([221.158.206.146])
	by smtp.gmail.com with ESMTPSA id
	y19-v6sm46003573pff.14.2018.10.11.02.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Oct 2018 02:33:59 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2018 18:33:07 +0900
Message-Id: <20181011093307.5530-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking, sumo, rocko, pyro, morty][PATCH] babeld: Add Babel routing protocol recipe
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
X-List-Received-Date: Thu, 11 Oct 2018 09:34:00 -0000

Babel is a loop-avoiding distance-vector routing protocol for
IPv6 and IPv4 with fast convergence properties.

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


