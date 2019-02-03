Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC8E07C323
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2019 15:06:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id e5so5609819plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 07:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vzcdQosakZkUbZ88sflNpCMSruLC3VeOOlv4T+OvCQE=;
	b=t8WSsVkWKdSMTpWJCoscGuBYFnBcvjm1FhQE58Zv2yH3qmJ6afiUxLRiBZbx+R1Q3N
	ZlH3z68rn5O3lFsXT9iGZb4LPlv677vWNr7f2QkPYTzf9LHgapoUv4zM6S7aRcIK6V6u
	JHasr77a2q3i/6knfVWBjakkri+kX5q0scJzw4HbV1DEqN6EnFvPf7md6WY4A6DU+u7p
	PRizvgAVMCyWqaQ0j0Q3amA60x3Ir3F8TUlXE3xJ6wbJNeF5uKlIl4RX4Cxv+nilt0+K
	BUL9LN0p5pUwujpZCGQcuY8eugm4Q0c5J7o1Yn0dqOkKJGSAYPLmLT24R03sbfxWRyL8
	7a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vzcdQosakZkUbZ88sflNpCMSruLC3VeOOlv4T+OvCQE=;
	b=taZ/hBmf1HuMJXnyGMPXeXZps+U1h3U41lp0RXTBCzNFLnMQE9WOUp+5TnFFFKU1gq
	EX/IEdsELatVlbGsJByP6ItqSkn1+MLyUPJbCXUVvREpjk9KW0dsIg1LiZyNcmuHx/YA
	nd+ggj8QSzLaoGu/6kVrZFqhDnzt8jEvH0QOpIoA4jhA2Jypq2gd7f3l8MhCIYMaWK3q
	DEEIUCRqg2aloY7Oo9XKkMUK7q8DBwjRcsssbvbgPLeqGGNJC3pyN3CbE5cGH42yE4nB
	8xd/XFIn4dU2h0VlWw53Gn9FX9VsZb2jvUdRZza8ZrIxLsFYvWl4lXyNNJyrWAPnyjRT
	lnog==
X-Gm-Message-State: AJcUukf2exHcnDs7CVklZ+v8fh82oO2kGgpD4DwUNG++iPeBq9ysyB/U
	IphSiYrLnfnBzhB/wEExvQsuTxPk
X-Google-Smtp-Source: ALg8bN5a+T6TNDVVX3Jq+PGNNBkNxhd63a4mRbmfEMHAXdWK+LZmmqCli7op7TX+6g2as+mmdUGdtQ==
X-Received: by 2002:a17:902:128c:: with SMTP id
	g12mr45976474pla.146.1549206384232; 
	Sun, 03 Feb 2019 07:06:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	a90sm24349645pfj.109.2019.02.03.07.06.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Feb 2019 07:06:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2019 07:06:04 -0800
Message-Id: <20190203150606.2484-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190203150606.2484-1-raj.khem@gmail.com>
References: <20190203150606.2484-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/4] rtmpdump: Switch to using GNU TLS instead of openssl10
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
X-List-Received-Date: Sun, 03 Feb 2019 15:06:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index a72b0d651e..5f78be4f51 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://rtmpdump.mplayerhq.hu/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "openssl10 zlib"
+DEPENDS = "gnutls zlib"
 
 SRCREV = "fa8646daeb19dfd12c181f7d19de708d623704c0"
 SRC_URI = " \
@@ -18,5 +18,5 @@ inherit autotools-brokensep
 
 EXTRA_OEMAKE = " \
     CC='${CC}' LD='${LD} ${STAGING_LIBDIR}' XCFLAGS='${CFLAGS}' XLDFLAGS='${LDFLAGS}' \
-    SYS=posix INC=-I=/usr/include DESTDIR=${D} \
+    SYS=posix INC=-I=/usr/include DESTDIR=${D} CRYPTO=GNUTLS \
     prefix=${prefix} libdir=${libdir} incdir=${includedir}/librtmp bindir=${bindir} mandir=${mandir}"
-- 
2.20.1


