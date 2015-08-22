Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id A61F376ABD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2015 09:34:28 +0000 (UTC)
Received: by pawq9 with SMTP id q9so69122065paw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2015 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+P95EFYsXlPmTXXbOZoE8ynG3wuc578SrB0HbJ6b0a0=;
	b=TwJ3w7UNZ0/wjNLu4tU4oUkt47/e5t6LNvWOD+mSr+ckEariuXWew8gKor+0Yqh4yV
	PWoHyC81oOQAxrk2gHWPQXIDp2NWc5dgc3A+6kCdLFEfh5k17HsgI54I+2fJQs7mPHIB
	iksWVpveQdsSEUekfvZi0/HIbTuY+wWkoyWczcIO0RtcFd3VfoB+i6poN6zZ4DcZg/rm
	hGrt6u/becq+lo2YyqLfb93RH8cdBcS9+evoycunkHz9/OBzsSmZfSrzVGcglrogNYr3
	3YACt0dd47czz+CKhSVWpCW5t1RQSa+xz9hIZGAvxLcJyRGlCxVmfu+c4GssPcUTcpiM
	RBFA==
X-Received: by 10.66.185.72 with SMTP id fa8mr26502247pac.44.1440236069407;
	Sat, 22 Aug 2015 02:34:29 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	ob4sm10473325pbb.40.2015.08.22.02.34.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Aug 2015 02:34:28 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Aug 2015 19:34:40 +1000
Message-Id: <1440236080-12661-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for libproxy
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
X-List-Received-Date: Sat, 22 Aug 2015 09:34:30 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f472c98..ae63150 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -129,6 +129,7 @@ PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
 PACKAGECONFIG[nis] = "-nis,-no-nis"
 PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
+PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
 
 QT_CONFIG_FLAGS += " \
     -shared \
-- 
2.5.0


