Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 11BCE71D42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so15682716wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kYyTfp9Fm80EAORDrwuVAloEySr0N8FgskOJLEylGWI=;
	b=HJpP+yI9EUgOV5t5DuDHGv9j/ftIdtMnyk5BQhARfMw4qUaq46LGVbqjd/O6zk7IQV
	uUptAs9hueh1ou634JVzD57x6mdbh7s89EDt8SW+tyYJxtaV5mNTC3/l/uEBc0SbdYSD
	E2qPW3Iref7EGfe5DG0l3mrFpvnI5xfxjcgcl7zQ8hk69A/M3Q3YUZO2dEK5OfFOyD1H
	nQNN8jrg+jgJ45Sf6WP4hM9y7zsBuNGY7wi8UJWtIP8/jfxph1/fmUNKoAamAXroRmCE
	BLiStUmxQSNY/1xqz6nSIL6bKuDJhvqhlf4BLzDS/yeBnQ5cXC5v9RcjJmnrBz2mV+Fu
	fIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kYyTfp9Fm80EAORDrwuVAloEySr0N8FgskOJLEylGWI=;
	b=ln+pG5si9qPnK3AaCDhJ9KFWDAYF/aKK+lscAx3gIvsA80XcvLmsb9g78rqln/C2eU
	Zft86UfyslN5UyrV74XsO69ltM/GJx/mFIByH+Lzq9W4D5RJQ6l0DYRKZ/YJ+3nqE+U1
	hw7PsEht121VhpCCrr6UL30h67VpDD9hbLDMn+H6PATsB4RsDXM5L9MGl/JamEc/BLmL
	GwxzZ5FR7E0uAoze0uMcYpvsiVCYdAMx7SGuQHiNSOw+vN/v7JfDJpdHz8O57JioXemA
	6Xwuxo4rHo2cfI2l08Oe7VVZvyfp/rR9kf6Jqp2KJH0gx/D5Ma8I+cMGZLHhuteWXyOd
	J76A==
X-Gm-Message-State: AMke39lhljoMf+5XuGeUbOBrgS/hEll+11pIgTxnL6+TMwfhiHOb5lZ3NoDWPK7/I3CT4Q==
X-Received: by 10.28.145.210 with SMTP id t201mr19381105wmd.42.1487614046191; 
	Mon, 20 Feb 2017 10:07:26 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:26 +0100
Message-Id: <20170220180700.29836-11-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/44] libgnomeui: unblacklist - libgnome is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index 4bc11fd..45219d4 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -29,5 +29,3 @@ do_configure_prepend() {
 }
 
 LDFLAGS += "-lm"
-
-PNBLACKLIST[libgnomeui] ?= "Depends on blacklisted libgnome"
-- 
2.9.3


