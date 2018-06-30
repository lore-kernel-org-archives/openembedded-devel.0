Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id ACD9C74F78
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:34 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id s11-v6so1922526wra.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hCQ44fvVl4/u04qJmZqjBjFl78n3xyNU70S1qzaJBMM=;
	b=QUWATYJ1NwAWKvduc9snH8u/aoaebUwlf3ImIwpQjo64qeJTKSkBz+lRWskJOKSpP6
	15ipQnZa3CX6siH8rI7NVPAX3HB8beYZbmJnsMo0xMPQbEJrbbbsCZ3aGADG8oKUbC7I
	hc2cpM9LwWUCbzpRdTubd2+2reJP0uItu6ci+LOsTwa/gpRW5zwq5JxPDMBT4DUq63j4
	Q1iwQypYDB9Du5+FG+EM8C5kRmdfdp6soV3Ck394TqeKT0jsFF/my4l7Ax5jbyc8B+f9
	kFHkV1+59Orq1Dv4JXRHy9qOwGLgtlOlcbIJUsdF26ZlNExpT9eYq3rBDwykaa1VUvAF
	8k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hCQ44fvVl4/u04qJmZqjBjFl78n3xyNU70S1qzaJBMM=;
	b=QXs/80n/tmRjRdwjKH5RrgRkzmYrK8eOed7p6Ix0EyRJNdFgyXsQkyA83IxzsRwzcA
	R8f4cWyK/eCeSx5STMqON2FY6cMmt6D1dMM3miaPTZ9gSW98CsxPg1Z3FTldCwRUhDZX
	6ojBuPTIKlTeGMki9N6c8ts0TgIklN32K5BXxCz1ZdoStD1sv1eED1VcnlxEB8wTsAxO
	6CFNlsyogQThQ2tF3CztHoiQYRef2WsRFNVZUx5AKGROk4OULAYsx1grVbZ+pUe+ChS7
	f/ysCySnBjmjteVY80POnQKsk3W9K65WYLoqTHDRHvonMFf7t6Cu081rSgmJQ2GRltA8
	CT/g==
X-Gm-Message-State: APt69E3ZxaWfN3px/M1kD2povhOAJmk7pWK1ZPelfyRc6eL2+BMoi6yA
	IuRCCD9nFq5hSNvl/hYFu/e4VQ==
X-Google-Smtp-Source: AAOMgpdJs3Xdow2RFKElrUJDq/B239MOhPfG/QbUrivuVebcT1wQuOOIDPyxndF28lY5VF54N41iSg==
X-Received: by 2002:adf:9d1c:: with SMTP id
	k28-v6mr4062855wre.29.1530360215221; 
	Sat, 30 Jun 2018 05:03:35 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:12 +0200
Message-Id: <20180630120315.29414-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] blueman: add an append in meta-xfce to enable thunar sendto extension
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend

diff --git a/meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend b/meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend
new file mode 100644
index 000000000..c47522379
--- /dev/null
+++ b/meta-xfce/recipes-connectivity/blueman/blueman_%.bbappend
@@ -0,0 +1 @@
+PACKAGECONFIG_append = " thunar"
-- 
2.14.4


