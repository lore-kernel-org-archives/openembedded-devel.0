Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id A5EA46BD7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:56 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so342409eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=+q4x341R49sQKr4ZdIurrQHm0U6+gF7Iss7u/cqJjvA=;
	b=O5wfWgGMOgLTtrx6pmz/yUpxaXf9qcHZ87NbELHE4ss3WTeU8Tz7gTP/s5ehl6CeMh
	4Y0+kJVs9Vf/giprMZje0etUMJqvVYrn7KOGBtmGeYZxNche6o5MB6wJq2F/3WodYHOL
	NSg+Ts0TINp7NUK5UjlZH07qgdjDSXRs0/CtBuIuvUOIAdkeTAivco5Bxz11rjCElERn
	WFbAmB4z3D+ySTdSbzif+diToFE4J7VXasxzpL/ELX25cfuISFiqpBZ1HStMVEuEPdaa
	viovBF39HhbpErMIu3HRiCbBz2LJwObG8PqR6AeR5C3ksBloZdaGXeAUCrlFsPNFMNyH
	S7wA==
X-Received: by 10.15.27.133 with SMTP id p5mr4605095eeu.65.1377791456758;
	Thu, 29 Aug 2013 08:50:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm47199342eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:50:59 +0200
Message-Id: <5c9350eb81a3f955228a7ec74d37e6b2e5d17700.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 06/66] libgsf: Add PACKAGECONFIG for gdk-pixbuf
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
X-List-Received-Date: Thu, 29 Aug 2013 15:50:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
index 5dcd730..b9a9877 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
@@ -14,6 +14,9 @@ SRC_URI[archive.sha256sum] = "8919e725aadd785380350c8dec7427d82cf33164bc9a9a549d
 
 GNOME_COMPRESS_TYPE = "xz"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"
+
 EXTRA_OECONF = "\
     --without-python \
     --without-gnome-vfs \
-- 
1.8.3.2


