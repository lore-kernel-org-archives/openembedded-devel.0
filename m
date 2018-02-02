Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8AA71B2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Feb 2018 07:47:33 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id w69so3378623pfd.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 23:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4ITs6AMQf3dBeTuuvJM7xSn4MNCoDYdc6TQXBc2rKBM=;
	b=L/2yu1G2SI6JFyFsqoWzhlCGTP7nK4hxyjph7xLnSswFZPCpGLxKB26KI5rHh0ZC5y
	fkV6KA/bSmu8mMQhOmNHoEApZTfVcn7uNfsKizTM7W42xkE8jZsXkh8/bO/RghnNU62A
	dJFB1OF4aouHb8va1mNuIcOe+q5Wzv93whwXZKhqME4KGc0l+kIgRMpD3d+hjM6LMOP0
	KDQDQX82F6dBi0YVtk/n71Ewz4dCHOEpvlSjK4ypP6K+Vyu1+2OrUENZXOtAcHuZgB0L
	LfbCTo4+37wpWmwF2nU7N5ynrzt5m/rXq7GfsxZi5DF8XXOB7BzKZNBhlIrKeEOc7/az
	O4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4ITs6AMQf3dBeTuuvJM7xSn4MNCoDYdc6TQXBc2rKBM=;
	b=Wg0oWv9V9eleHqWnWoHWZljmyQiaImYKkFgNHkhQrZ9llBEBgRd27fHkaHLoR9mjJO
	MKbNrPNhSx+Pve986DxNUE82XJXnCUPvlBaHwLeqXOVn2xulE1B0Mq1XZOQQAjg22xRS
	ImR03/aohs+CQOqbpAqVNfZElpYBoHdubB1aeJ/C0uksOl/urx2Sv9sOB3JqwP9c/bF2
	whIFrzGf/ShKclK/mMkLwH78jB0gab6U0qLkpWaZ0BEE5dOOMyZmUvOigu0UsHPM5XJL
	DC/o++omrrS/UDt26gm+Eqc3paRhgarffduHOILLbkAUD5bvVVkBffzjL6W7lgtFr2t2
	ASKQ==
X-Gm-Message-State: AKwxytd2Ijpz6JBcfTuIYKmO5gEvY4Y2ZKLmO1SUCt4M2ncE3d+IqGYj
	yLrC/+D16i8BD511M5MBPXZTOA==
X-Google-Smtp-Source: AH8x225k72SiZ/+MHIj2sYp8a/uzvSk5ZBFh/KKyUyrDGLaOjax1wn3e5YiaKcRWtfeYalhuXgqQNQ==
X-Received: by 10.101.101.19 with SMTP id x19mr32396635pgv.347.1517557655340; 
	Thu, 01 Feb 2018 23:47:35 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::6dba])
	by smtp.gmail.com with ESMTPSA id 76sm2517441pfp.54.2018.02.01.23.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Feb 2018 23:47:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Feb 2018 23:47:26 -0800
Message-Id: <20180202074726.7424-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180202074726.7424-1-raj.khem@gmail.com>
References: <20180202074726.7424-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sysdig: Use makefile generator instead of ninja for cmake
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
X-List-Received-Date: Fri, 02 Feb 2018 07:47:34 -0000

Fixes build errors e.g.
| ninja: error: build.ninja:205: bad $-escape (literal $ must be written as $$)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index bc6fec0f1..67d06dcef 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit cmake pkgconfig
 
+OECMAKE_GENERATOR = "Unix Makefiles"
+
 DEPENDS = "luajit zlib ncurses"
 RDEPENDS_${PN} = "bash"
 
-- 
2.16.1


