Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D244A7F65C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 16:51:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u8so4827093wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 08:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=B8s9gBl+7w4QK4W7Spf/CRddeOoOQtV3MF0/l2/1dDg=;
	b=q1teFVY0OpwCKPoSLWRKq97tWv+jOn96QkwBk+dV/LYyQ4878YPfL+85nfRWSCIASR
	+B2fb7N5RJcUdq+iwC7JCwPHufx1DEV9xhyyRnFFDBZJTYhSXpXm/11v/J8bVTkOlZrF
	80KaliJWH1vJ2mI+GUn/pHMlEMY8JWHh7oIyTXlPq9oibuzHVqN9v4TAHjV3Rq1KfWZ2
	2Ynqr1bQQ6Jj/IVT3k84Bz2cMWd5v/oY056oqZf0WPHG/g+jMxuJ/VaGmxoJrQofcdaN
	qc1XxOQ5NUweHQeOnH7Sd/cZsiZTmeRcqYbxzhUMNHVz3Yn5LeRqxJdedrLSgl7bj59/
	Lb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B8s9gBl+7w4QK4W7Spf/CRddeOoOQtV3MF0/l2/1dDg=;
	b=LHADmhJhaRJkE4nAfkm2qFemcpz9JmS9wioaEqyAMvrqTcBOFjK57xipGxjZm6nnsS
	77MCDazaq9RMPTHJ5wHZChe8Ku3wBDrW9ci1jmm5RtffzSC/mztDGnGrEjsZmEKMx4Wt
	RyhO/r4gJ3hjb8PABGKfk/u0X1n0HbS+FmfxXLVzA4pFLbkniTkZvetHr11RBACtKqiH
	i41Agi6S1Yx5QAk8ExU6Htmq6/9+8D8o92IxrRxKzBg9dx1seygpJFVVCZkm7mxh9Iv+
	FE0lcH2YT7zEzjDPzk+CbbuXrrrwrI+JitaZArtQufcR2crlbtmpNTODczqgN7KirIEh
	KzoQ==
X-Gm-Message-State: APjAAAXDwcgpNUr68v/+dk77b1kidUgabTiJ1gmDcqy+mWQ58Se1IXSO
	8H1BPogSNLsjppx/7KmZiynkcJiN
X-Google-Smtp-Source: APXvYqycOIDU4nYh5BHtJEIGhJMOvDCAn1GVCqlXo5cdUFNQcnqiiaci9WQ4mh3QLid9JO+GL5IM0A==
X-Received: by 2002:a1c:7f4e:: with SMTP id a75mr7433060wmd.128.1575219096282; 
	Sun, 01 Dec 2019 08:51:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id g7sm6228088wrq.21.2019.12.01.08.51.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 08:51:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 17:51:20 +0100
Message-Id: <20191201165123.12699-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191201165123.12699-1-schnitzeltony@gmail.com>
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] nautilus: add tracker-miners to RDPENDS
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
X-List-Received-Date: Sun, 01 Dec 2019 16:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nautilus does not start and complains:
| (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings schema 'org.freedesktop.Tracker.Miner.Files' is not installed

Thought I tested that successfully...

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
index 789a11dfd..a256ea95a 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
@@ -30,3 +30,7 @@ FILES_${PN} += " \
     ${datadir}/metainfo \
     ${datadir}/gnome-shell \
 "
+
+# mandatory - not checked during configuration:
+# | (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings schema 'org.freedesktop.Tracker.Miner.Files' is not installed
+RDEPENDS_${PN} += "tracker-miners"
-- 
2.21.0


