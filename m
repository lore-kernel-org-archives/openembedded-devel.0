Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UN9WT-0004vL-0t
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 00:17:45 +0200
Received: by mail-ee0-f42.google.com with SMTP id b47so442330eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 15:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=MeE8FvkWBMSWPYyUGPJAb1+XH/8B+RftLNuChetV458=;
	b=EnaVIim/ODwHWG5MNtxCOeoRw1udm8ke3ntGJ4oJ6qZhxINvdtZ2wo7M/X09T4idAF
	c+Fz58eycwzzqZovsZpfNH02LdAFn4U+3Lzt7VgVZFMrSXTnhOcHJgBPPxfZ7hMBpIEj
	OEu+/KVhJjKN0u+8KBfhu4ghiotw5T3jDA7zC/UuJurEzKM9rix3HJnQ3GooOzP1fvwi
	klnALtn3HdzHpD4K0jRCj1jjdBWjeeZVzeT2noPR0AfKYKp/WjoXuigp1COUfVvBh+I6
	WcBwCdE7hktAR6J2X8CiCyUxKG8FcGMddgfj3P+/S6zMFuWik2RSoVRkfR/0MTWceqOd
	cyOQ==
X-Received: by 10.15.21.1 with SMTP id c1mr53135637eeu.36.1364940034932;
	Tue, 02 Apr 2013 15:00:34 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3CF4.dip.t-dialin.net.
	[91.10.60.244])
	by mx.google.com with ESMTPS id d47sm5204412eem.9.2013.04.02.15.00.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 15:00:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2013 00:00:17 +0200
Message-Id: <1364940019-23226-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce, V3 3/5] exo: split out exo-csource to exo-dev - it is not required on target
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
X-List-Received-Date: Tue, 02 Apr 2013 22:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index f16d544..63fc7ea 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native"
-PR = "r2"
+PR = "r3"
 
 inherit xfce pythonnative perlnative
 
@@ -37,4 +37,7 @@ FILES_${PN} += "${datadir}/xfce4/ \
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
                    "
 
+FILES_${PN}-dev += "${bindir}/gio/exo-csource \
+                   "
+
 BBCLASSEXTEND = "native"
-- 
1.7.4.4



