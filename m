Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B603F71E5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:34 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o16so21531195wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=92cR7WVhhZYl/NuLoO8g7oSjO6KSFAzf5T3TMzzcgec=;
	b=SGJO9S6wLJrTr8eXQE73eoXmszRh3661H07DGH2zHxaWrOmxeKbE/pND+Jqxqey/hn
	tvSzu7WjFE8GE8I6qn1OniU19X2yt4Inj7A7Cd/qg/ziTlYc9AVbt5S5Tpv8nVJlUhf1
	KfICXl19YRjH6dtCvNglyXgECgWwXebZ3xV/opDRvaaqPLQJdrlk2pqp4uxiM6sVvOiI
	1+HtPz8TWS/RmdIonekDgITQfJuslGXCpKklvSsUJjmLU7bpuB1U2nr8hAMCUHsyb4PG
	t8PTyf/K/VzaV/6/XnXt7MU+fOqL2c/8haZKn/XUV2LdckdbJ7dvFh59OMM0ND/yn9ha
	bIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=92cR7WVhhZYl/NuLoO8g7oSjO6KSFAzf5T3TMzzcgec=;
	b=aBU+tkWmWiVnk9huYMYGt8ztmZuzRmi6gbEUNdcK5YVHw2wK0VXzdCthjKpp/m3YaR
	ueR7ERrRlMw03qHl7sQfuildtOluLi9YKf0D0ANKAp/eyd7UY789DLWbo0PCT7tKDTII
	Ztu/D9Qfj7RyxlgJj+t9WYtPsnCAAGQyuyme753tB8LEAPq1f6mKOR2HPJ2ERMBpS4uX
	QwCHyI79tEKhAw276fDloK6VXQozabd0rb962WWjIW0JVutv1gkK6gHdQQHgMzPHx1VG
	mdZ6x1FPCQhDgn4wb4eLKugp9IYnOIXMnmN5nPmL8RhwxxLk0FMYU46egJX7TgMYpqhc
	m1TQ==
X-Gm-Message-State: AMke39la3XWf5qItanMHM7yKw9GuH4OwCTR09m4tHAsp4b4gg01uBaCJqHjUNqsBElnPNA==
X-Received: by 10.223.173.80 with SMTP id p74mr15709033wrc.168.1486933354697; 
	Sun, 12 Feb 2017 13:02:34 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:12 +0100
Message-Id: <20170212210216.867-8-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] libgnomeui: fix build
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index c4801a9..45219d4 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -27,3 +27,5 @@ EXTRA_OECONF = "--disable-gtk-doc"
 do_configure_prepend() {
     install -m 0644 ${WORKDIR}/gnome-stock-pixbufs.h ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h
 }
+
+LDFLAGS += "-lm"
-- 
2.9.3


