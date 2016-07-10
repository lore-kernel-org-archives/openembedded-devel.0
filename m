Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9508D601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 12:27:25 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q62so1386589qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 05:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z/2P6RHxvEMxZaFtLFB1wwrtMOteiy+AyLhQ/jvDrg0=;
	b=klQuAmnoNNKgZBW43aXeMAdA7s8y0veK9RUcjFNjJHe/KbQ2lUrZnEGVI5K7DEAqu3
	hdh9zQmaVA9W6a3c8IXHEjRPAlmHUcl+9Z6z3RyokQohEV9TVIBn6+6vF0q4oBvXbbeD
	7F/R2YwvAPcsXkSG46c7QuWB+9MjS09wcXRRyPtt0M96Nw1MfmuiPg/7Zq6KwVn08IhD
	iymb/2U3Rzlnaxx/rzFUcSBp9vY1DfPhOSU9GDwAtgM0lkXuf4D5ufkyIDUBPCfkrhOR
	EGj2NBUlxVgpq54B/E7gHwxlvoiZ0OO4JCxkcu7mPVCAK1pZKebukUF+T2n0HWxm7U9t
	ScUg==
X-Gm-Message-State: ALyK8tKAphqKLigfZWLuK3pY/Z3fYlb6p9YuUQ5o/4Av/bcOxe2ysyInZpQlsif8aPN7zg==
X-Received: by 10.55.212.147 with SMTP id s19mr19205613qks.64.1468153646009;
	Sun, 10 Jul 2016 05:27:26 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 59sm1356879qtb.21.2016.07.10.05.27.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 05:27:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 08:27:17 -0400
Message-Id: <1468153637-19826-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468153637-19826-1-git-send-email-derek@asterius.io>
References: <1468153637-19826-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-vobject: add RDEPENDS for the package
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
X-List-Received-Date: Sun, 10 Jul 2016 12:27:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-vobject_0.9.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
index d5fd9db..aa2ffdb 100644
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.2.bb
@@ -8,3 +8,8 @@ SRC_URI[md5sum] = "ccf66aeb1c896d8c34ac62a8b4e7ecfb"
 SRC_URI[sha256sum] = "8b310c21a4d58e13aeb7e60fd846a1748e1c9c3374f3e2acc96f728c3ae5d6e1"
 
 inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-numbers \
+    "
-- 
1.9.1


