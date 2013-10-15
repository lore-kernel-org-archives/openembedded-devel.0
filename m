Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id DD8486D11A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 00:03:26 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so13709eei.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 17:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=BtxmNn8b3hqePVpHpMLAV1EnupzXK895YTyvmgoNj6o=;
	b=oUqHS6dibiOkfuFhFaIsAX9z4v1EG87QES9xi+Uc7cTnXLMTbovrBDpoiSdK9/WAbH
	doNfmjXM9Uo2JwFoziah5HuvA1ntimLfRKqCJtmr+PyNxm+0vmO5gG8JSYesUSe5mHLA
	znA4hnIiKCMXQqswBxNwctzAm8htmD3lE1Cc78CMOBCHuMKfg7fiqQyJP2L1ET1r2o1b
	XaG0n0bjh6rlBl8ow+5zr8GoVg8ihl1/nUgc3RXuJ8i1ud2TwSA+OTLiQe0lRzIm+4CF
	mZerg38SkFmKHDrBAPyYJFqUQVqpinhSIBek4Zv4QXPav3XhiH5NPqrteRifKUqoHXLE
	+DSA==
X-Received: by 10.15.64.1 with SMTP id n1mr60916160eex.15.1381795407609;
	Mon, 14 Oct 2013 17:03:27 -0700 (PDT)
Received: from localhost.localdomain (p5B0A21A3.dip0.t-ipconnect.de.
	[91.10.33.163]) by mx.google.com with ESMTPSA id
	f49sm159345944eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 17:03:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 02:03:12 +0200
Message-Id: <1381795394-21464-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-gnome/meta-systemd 0/2] fixes for latest oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2013 00:03:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andreas Müller (2):
  orbit2: fix build after automake 1.13.4 update
  connman: follow oe-core to 1.18

 ...LAGS-instead-of-INCLUDES-and-fix-problem-.patch | 42 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb  |  1 +
 ...connman_1.17.bbappend => connman_1.18.bbappend} |  0
 3 files changed, 43 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-INCLUDES-and-fix-problem-.patch
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.17.bbappend => connman_1.18.bbappend} (100%)

-- 
1.8.3.1


