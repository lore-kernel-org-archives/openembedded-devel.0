Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QGTLL-0007cx-L2
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 11:53:36 +0200
Received: by yxn22 with SMTP id 22so1664674yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2011 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=ey64FEf83LXpfqaGIPukAmRD+SaHvak1hBJmn3Bn8pg=;
	b=njXdxKwp6fnBMhUgn6droKwcl14FaFVudIc9JARvIc14dwgv0Mn9GyouqLNKaVb/6i
	a0Rgcvjf+iTzMcjyu5KylwDStsX+B/nT61TsdwEsqvuCIe1AS7c8TzJwMJoX8mQ75LtP
	1iXh/jSU5hpWCDW7iW7WhlSQAjv8JlAcQ2hmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hvPOxqlgopiMFVvMc+1JL7vYbAfo12UuJfHBVG/uSCE+V9mXR2JsdXk/Gqhao/aMTK
	DCEoGwo0ixXHlQn6PwTg8YtaIWZBPXdDxN9a1n5x4RSUm9P1d3kZ+/UBjO1JSGR7QnPF
	jFkauBo+iP8di+632QCeceKm04x1iCBUR/b3o=
Received: by 10.150.251.29 with SMTP id y29mr1946978ybh.181.1304243456711;
	Sun, 01 May 2011 02:50:56 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id s16sm4629207anj.0.2011.05.01.02.50.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 01 May 2011 02:50:55 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 May 2011 15:20:48 +0530
Message-Id: <1304243449-12028-1-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Sun, 01 May 2011 09:53:36 -0000


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/zeromq/zeromq.inc |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zeromq/zeromq.inc

diff --git a/recipes/zeromq/zeromq.inc b/recipes/zeromq/zeromq.inc
new file mode 100644
index 0000000..b631d98
--- /dev/null
+++ b/recipes/zeromq/zeromq.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Socket Library that acts as a concurrency framework"
+HOMEPAGE = "http://www.zeromq.org"
+SECTION = "libs"
+LICENSE = "LGPLv3" 
+
+PR = "r1"
+
+SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
+
+inherit autotools
-- 
1.7.0.4



