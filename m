Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PEUkK-0005LP-7c
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 23:26:57 +0100
Received: by ywo7 with SMTP id 7so2034863ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 15:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HtSNj9FHvOvzw/55L4dSYaWfe1gr/ofvdEfW8btpjMQ=;
	b=M6ztpewIW9JADMvNbma7Shn394Ta9FvmgNe37LnEzuxKhLtykuJi6TCh1KZmyibbV2
	sLjyKb8VMMQ7MmpKU7XBN2tmNSas05hEO3MzYf+E9FbGG39zsgqVJ0TOg1+i/sSF5YKG
	oCW7mE1goXYF6Hn4HdGiZhfa/nT81psv53cs0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tpXIkQN3JPfeqQIhhQk7bAJr5ZU9rqFwCJuXDRVfJM3DPn2nlyE/nT6cwb4NxXyB80
	3DXLzlIynDqINJQ7WLkfuAmyZBd1HpknQ4mfERGmleuZ613UDH0o+gM/XJDwXcyYPeat
	kKPfzZP6auDFWxsi2aH94bjTdG5XJjcH2TEBw=
Received: by 10.151.26.7 with SMTP id d7mr4369760ybj.202.1288995962248;
	Fri, 05 Nov 2010 15:26:02 -0700 (PDT)
Received: from localhost.localdomain (201-95-46-2.dsl.telesp.net.br
	[201.95.46.2])
	by mx.google.com with ESMTPS id z16sm1311775ybm.4.2010.11.05.15.26.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 15:26:01 -0700 (PDT)
From: "Angelo S. Mavridis Bartolome" <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Nov 2010 20:25:40 -0200
Message-Id: <1288995940-1827-1-git-send-email-angelo@pynell.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <angelo@pynell.com>
References: <angelo@pynell.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Angelo S. Mavridis Bartolome" <angelo@pynell.com>
Subject: [PATCH] recipes/fluxbox/fluxbox_1.1.1.bb - Fixed depends for libxpm recipes/initscripts/file/halt - Fixed poweroff when booted from NFS
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
X-List-Received-Date: Fri, 05 Nov 2010 22:26:58 -0000

* Fix to halt courtesy by penghb,patch by angelox_123
* Fix to fluxbox compile with libxpm by angelox_123

Signed-off-by: Angelo S. Mavridis Bartolome <angelo@pynell.com>
---
 recipes/fluxbox/fluxbox_1.1.1.bb |    2 +-
 recipes/initscripts/files/halt   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/fluxbox/fluxbox_1.1.1.bb b/recipes/fluxbox/fluxbox_1.1.1.bb
index 55a747c..85f4c8b 100644
--- a/recipes/fluxbox/fluxbox_1.1.1.bb
+++ b/recipes/fluxbox/fluxbox_1.1.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Fluxbox Windowmanager"
 HOMEPAGE = "http://www.fluxbox.org"
 LICENSE = "MIT"
 DEPENDS = "fontconfig virtual/libx11"
-
+DEPENDS += "libxpm"
 PR = "r1"
 PE = "1"
 
diff --git a/recipes/initscripts/files/halt b/recipes/initscripts/files/halt
index d8cab22..b869966 100644
--- a/recipes/initscripts/files/halt
+++ b/recipes/initscripts/files/halt
@@ -20,6 +20,6 @@ then
 	hddown=""
 fi
 
-halt -d -f -i -p $hddown
+/bin/busybox poweroff -f
 
 : exit 0
-- 
1.7.3.2



