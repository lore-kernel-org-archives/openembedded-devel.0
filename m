Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id E5D776A9C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:17 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so5781101eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=rbBxUzxhM+kaTKKB3bCP9jsxTtjwdh8IvwbZwSWBuYg=;
	b=EtTys/S+yUZLWApN3q5d/m1oO0oPniYw5hp/G4ZVzpZWMrjJUwewQIbti8MS9StjXG
	Lk35cTogkCU+eLRV1FN82trvJQ2wJ6F+PhQN92DraLCTkp+nY+8ocwIvDljqfas/Oa8U
	h/POu1jXgZUyGX1GCUZojNK+nw14yT675JxaLrvjm8drC+qRx4YkKG4IYPAozkW5NJMZ
	AVbqYW1aMymBRrQ4O0vIa7FaOZac3ZnidR7cIuZFhkTPsIbpm9/0sHYhrIPgBO+0BFPD
	sxhKq1CgaTpSvmGV5OdlUSJuefoj0v+TYZLVJPbMsfrvhGnskAOSoM0ttWus9XoNEYXF
	xt6g==
X-Received: by 10.15.35.129 with SMTP id g1mr14630902eev.110.1370929038599;
	Mon, 10 Jun 2013 22:37:18 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:23 +0200
Message-Id: <1370928876-14423-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 02/15] tumbler: add curl to dependencies to make build deterministic
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
index 93a95d5..402762c 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus speci
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "dbus-glib freetype gdk-pixbuf poppler"
+DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl"
 
 inherit xfce
 
-- 
1.7.6.5


