Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UMuvB-0007SI-8b
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 08:42:17 +0200
Received: by mail-ee0-f50.google.com with SMTP id e53so32412eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 23:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=5vdTMmOPJ+jjAXVdbTZQ7VKs20JTbcirCvBHBSZaFZ4=;
	b=dJyYYZmLasOphNeCrcx2ebASbX56NgzpCvJr81HNmRBu8iys02IC7qfmRrXRgfr0hu
	ByjBe+YH0Q9HCzNYRVXoAw9V/qWpIV5aOmrnKtUeJuoEPTAByA20RcUt/rKBJqQCc4fb
	WL56JEkmEwd/Z6ij18xQSBb0zmPhTjT5rnPZcDKwcLfEC8yXfgk/nM5w77+2R64XmT7K
	/bs4j+SZu/f1v3lauo1cO/vTmLPeyx0oQVtyKjFYJwOMV5fOf0zefuFUDdvMfv5iJ5hf
	kDY0Y64Wy+pN/5+dKcIYzNyzrFZNeAh1RPFuS8m8i9JJmmFYbope+jFAiQ9PjfvG7qPf
	JF8Q==
X-Received: by 10.14.216.2 with SMTP id f2mr45642155eep.44.1364883908123;
	Mon, 01 Apr 2013 23:25:08 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A51.dip.t-dialin.net.
	[91.10.58.81])
	by mx.google.com with ESMTPS id s3sm458591eem.4.2013.04.01.23.25.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 23:25:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2013 08:24:51 +0200
Message-Id: <1364883895-24252-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce, V2 1/5] exo: inherit perlnative and add liburi-perl-native to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 06:42:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this fixes build on perl-less machines
* perlnative.bbclass adds perl-native to DEPENDS so remove it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index 4fdfd48..6aa1056 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -2,9 +2,10 @@ DESCRIPTION="Application library for the Xfce desktop environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 perl-native cairo"
+DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
+PR = "r1"
 
-inherit xfce pythonnative
+inherit xfce pythonnative perlnative
 
 # SRC_URI must follow inherited one
 SRC_URI += " \
-- 
1.7.4.4



