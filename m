Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 55E0871DBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so15682488wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=F2EFK3qnmO+mUzMmjLCIj40veoyPfnysHxDAQH8DE6o=;
	b=Eg1ugLT1tVO2G3h7iTLXHrneUEzSBGY3YPj7c2ADgoIgqWlqu1cEaAUqCuQnKTK/wX
	CNOlBaFRnzAusEDcCuYAsK3T/9j9lsROTkJLMTygMH175a5FQqfFQKTIXENzXpimbs15
	Jc1wPFGgNH15/1ulBtPqtIN/hmdSktzSmyPz5m1Y0DB+v5JpWXK3PtSgUADI37AoZ4GU
	4OdxPlDLFED4vIJeU4O9S1cSp1rt3njdLbO+9B+WjppDl01nowpEalGfnKRUqLiCA8J0
	fQPrDN0wX6UX51W24PLd8hH3zSP65ltjUkulqRPeJO0tPElfoBDa0JGT2E3qgZDcHhZe
	otfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F2EFK3qnmO+mUzMmjLCIj40veoyPfnysHxDAQH8DE6o=;
	b=cywiYAc64RpoZh7XElffuVym4Dgflp3SEyitJ3hzuN+FNgnigYjzO/Lcrr+DUykXGR
	jNSwpEchnYIVevIsNcgB0vN9frG7VfTMDbUViP7EqndSerun015R7xkjwB/JM5Bjt5SH
	uDo+9Qkc77q5d7Xud+DpcNZjeFzOt5nDWMflAwoOQvPU2Gpfpv5hH8zw2k9JU45AFee/
	YZY8SHv5LDgNCUnEdclySR7F3ovG/tkxrZ/CLAmzsZCyxv6KbW2vF8wvm3im0r+yL2pd
	kdSlPd8pdXpQWD1/o8MvsCTc7CC7niqUKBlCQwLvMmU7jlYXFjDUsaCyQRHkaxS/7Bla
	+6/Q==
X-Gm-Message-State: AMke39mHzh+gtUDza4mnkos6IkB7nWL+IPBpJvZSFywsgiFV/6pdZkDa7T7RPbkHx6yOyA==
X-Received: by 10.28.198.139 with SMTP id w133mr20183329wmf.80.1487614043395; 
	Mon, 20 Feb 2017 10:07:23 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:23 +0100
Message-Id: <20170220180700.29836-8-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/44] libbonoboui: unblacklist - libgnome and libbonobo are back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index 3da6002..627f37e 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -19,6 +19,3 @@ FILES_${PN}-dev += "${libdir}/libglade/2.0/*.la ${datadir}/gnome-2.0/ui \
 FILES_${PN}-staticdev += "${libdir}/libglade/2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/bonobo-2.0/samples/.debug \
                     ${libdir}/libglade/2.0/.debug"
-
-PNBLACKLIST[libbonoboui] ?= "Depends on blacklisted libgnome"
-PNBLACKLIST[libbonoboui] ?= "Depends on blacklisted libbonobo"
-- 
2.9.3


