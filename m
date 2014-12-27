Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2236D713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:35 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so14573255pde.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=v3jKJ1Df5BgLyRE/Roz9HskQ60LOuyeINhiSlW1KAf0=;
	b=oOWaXUKMsxSTXB2IxbHZ8sxeH5Vb7hjrU+fZH/f42PX12OcODLo1TY+5h2L+aVJ84y
	6GJwgbg27tJUGJysojao7ERh4JP1lxtsGc+FfTJ2XZIx2rY9Y9bjOYzPH1gj25AuWGA1
	+Lt0tUQLbEQOQg7hMURlCieuvnpoJlOt76kY6/jxtyTbhdSBZnVO1tQygbOqfJOHjDZS
	c0s1tfSETKWqi71EUQZj8Xh4ubkpFuWeRTPNYwyDaanQGY740f9cNE6CumuWYHi6JUBx
	b3ZOLBZE9vsw/oxvWb2hE8tkI+93AhJJviAXxj5P1EFMGpVjXpqZio3SZmyI8O5rbx2Y
	7RKw==
X-Received: by 10.66.150.74 with SMTP id ug10mr77845668pab.68.1419700956342;
	Sat, 27 Dec 2014 09:22:36 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:59 -0800
Message-Id: <6db21347aab2dccd6f205aa6f60b273f70c8e331.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 12/27] iotop: Drop python-distutils from RDEPENDS
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:36 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* nothing in iotop is using that for normal function

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
index 111b072..d629245 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
@@ -20,6 +20,6 @@ do_install_append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
 }
 
-RDEPENDS_${PN} = "python-distutils python-curses python-textutils \
+RDEPENDS_${PN} = "python-curses python-textutils \
                   python-codecs python-ctypes python-pprint \
                   python-shell"
-- 
1.9.1


