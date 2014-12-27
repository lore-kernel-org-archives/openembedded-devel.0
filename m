Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDCA72658
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:23:02 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so14528778pdi.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=fy0I5th29kycNJQ2JpOVhHyjqkdZB1AGlWAVet/3Pmg=;
	b=q58jvHJsp6U9OJwZzwWZ5sJAfVRmdf6LvfO8tvu/40/fHJpXSy9/XgO8WO8O+3Crt6
	H3rw1Xcu3L4TWoBs0KNd7hDAYue1ghrpdmUssjbf5GRY+ueae+psydfLx2b0oaZpmpWy
	kTn2DLJWIxrXTr76OnB6XOmwaXb1Wa7q2CnGbTWOiGWmFaQFzZEyK8EQ+x+VRN+sZz72
	Hoyl5ll6CWdrWmkjuMYvYOc7L8mbjWZj7FyzX7qKrRm+Yk5tAhFeRnbX3M0aUTxGbfHC
	HrDXLHOrgSogywwK5g5ueO1Q5JUDjpvBF0zJsdDFDZ7WAMUkbvhY4c3XVUX+g/QkTmpQ
	ldgg==
X-Received: by 10.70.37.4 with SMTP id u4mr39010350pdj.40.1419700983846;
	Sat, 27 Dec 2014 09:23:03 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.23.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:23:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:13 -0800
Message-Id: <f9f2548e1833de07716c450312810e45d1377f11.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 26/27] mplayer2: cleanup empty directories
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
X-List-Received-Date: Sat, 27 Dec 2014 17:23:03 -0000

From: "Belal, Awais" <Awais_Belal@mentor.com>

The mplayer "make install" phase leaves an empty
/usr/lib directory seemingly regardless of the setting
of libdir.  Remove it to avoid a packaging warning.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 446562c..7c04ff1 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -141,4 +141,5 @@ do_install() {
     install ${S}/etc/input.conf ${D}/usr/etc/mplayer/
     install ${S}/etc/example.conf ${D}/usr/etc/mplayer/
     install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
+    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
 }
-- 
1.9.1


