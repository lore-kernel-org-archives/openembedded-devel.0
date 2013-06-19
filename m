Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4876AD29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:43 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so3310412eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0Jeyb+WMvzbEFkooandmMHg5sP0FVoqN6xt3Gl2uLxE=;
	b=HnHNpffK7oTFSVvTuOnV0wOJm7WnsQNNi6JDItD9I+F4J6UACSDpceQ/prRq1rU3kU
	OJ665u+dhnWmslUdYZevhsELBft+AuF9N/eMUT/TzuBioF1TdcIE3E5YBKC8b5j4zFjd
	k7GDyXMcRcoAT8QzXD6M0zCHREM9tTRLpDhKAfwA79QZaYdU9ZWIAk/cJVfwHTo1OibN
	Ow4hWcNlK9pSYzLTN3k+XmwVdbVWND02ERxmFMpQYCx+04AxBaK1Vc5LchPgxGdGOTCx
	p4bdSwwnNDRl3OMcK8RJKbW0gCAVC4GNhK6RZcST+86qVqtlSB76PLccUxKKMtjKqPXe
	nGJg==
X-Received: by 10.15.82.73 with SMTP id z49mr3665899eey.43.1371662983556;
	Wed, 19 Jun 2013 10:29:43 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:09 +0200
Message-Id: <1371662967-31734-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 02/20] tumbler: add curl to dependencies to make build deterministic
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:43 -0000
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
1.7.4.4


