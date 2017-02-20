Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5A671D4E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:26 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id q39so12810256wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YhcugykTypl3dwNpztU/rRKLS7pIcpgoX8XYQcyL5ac=;
	b=DsngxgU5ocQpAEwiiYh96Louv/4IjRzjkvg+10Y5nQjo+23sME2z8+I3AF33IhfmsA
	vtAB/w+VVpjsP0JFkQUGeGny4/RWTi8IUzTKLxYXvd9svOX2EcXJIbChcftoJCU9d5nq
	jk+vdgaVo9QTdIVPmCl8CEn4VxQU5AsdAySwf1+sNbPh8nTdqg9jYI0bw37TzagLLFDQ
	O0Dy5bQGjdJr3BTw4XSAxmGvrpHocODuHNKlnf2so3BhtzGjE798KtQQdBB5crstxCOZ
	WeTTieszddrLRmjGELvtrpaC6CYbiUEmQw3QLl6Z5+GfeSJvWIiI5BdNfLLlnmrGqWoo
	FsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YhcugykTypl3dwNpztU/rRKLS7pIcpgoX8XYQcyL5ac=;
	b=OdemDdzT7IEKM/37n58JPljTgWVtwuyiIE7KStTqlPq9rMC1pBZuQb9T0nVyQAhgOa
	/SJRVhLAxQhqum5rjtXgpjUTgzEi249LrTQQC5co3pevaw/EwNWWH49XjharIORTrSQh
	NJUJFpWwNmFFdta6szRR95vrEudK7ll2RR6HFVRzsZbvwXuFvKuFvMRNq2/9oLnSJoKf
	c2QHfOypbsPSWhOeDOvebE4zVFiIBsxQwjQFhN+Ikg/8zyCOdbNV2OjBoKsuUst7hCSV
	UdP8beS/xiObWiPbK443woUchEjBzGbqLr4rRRUwHThCd4vpKHpFZMO8d8J1tbWSTZSZ
	ys0g==
X-Gm-Message-State: AMke39m2N++nG3NCJfegOJGnKOkrnpI4/bCZqktB9rfKJTq887t5Jm1mwwm43mE2TtVUCQ==
X-Received: by 10.223.148.230 with SMTP id 93mr16753067wrr.13.1487614047033;
	Mon, 20 Feb 2017 10:07:27 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:27 +0100
Message-Id: <20170220180700.29836-12-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/44] glade3: unblacklist - libbonoboui and libgnomeui are back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
index 67585ad..fd65536 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
@@ -22,7 +22,3 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
 
 FILES_${PN} += "${datadir}/icons"
-
-PNBLACKLIST[glade3] ?= "Depends on blacklisted libbonoboui"
-
-PNBLACKLIST[glade3] ?= "Depends on blacklisted libgnomeui"
-- 
2.9.3


