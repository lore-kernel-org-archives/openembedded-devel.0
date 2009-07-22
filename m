Received: from [209.85.219.223] (helo=mail-ew0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MTbQn-0000J6-CM
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2009 15:00:25 +0200
Received: by ewy23 with SMTP id 23so170929ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2009 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=b27CPskmZStcYr5bahA70ADp6o2Mmt/fxhzZp7hwmqE=;
	b=nc5uJ81R6UJzDcKGYmuaD8UhlbQgXfhcgwBWforfTGNZCLStE65ETykiW7V2auR8M2
	kEmBg/d84cFPDqH6raGFWtY+s8/ty4lsDiZEeqoRR8/pOHTD2U0Do36u9X+8wyXz3uTK
	6J+b7kfgWMNX8/FftAbC5OOBbwqInFKKGxFYU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=m2H3KuVo9Tl/44AXZDkum1FS6ItJ5hGBYaUCT3IkN13FjMvTqTTNczHZlURGKzkHpb
	siH6dz6/yb11nJYka6dbFXEhwQPHzK9MWQs+JgP2P/Uwmb4XpfcLqjgmp677hI/ySmFp
	EAuBkI/5VB4obQ9eTdCq6wOFHf7DtVRPVRPaE=
Received: by 10.210.88.3 with SMTP id l3mr996645ebb.82.1248266774405;
	Wed, 22 Jul 2009 05:46:14 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm1227810eyf.38.2009.07.22.05.46.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Jul 2009 05:46:13 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jul 2009 14:46:10 +0200
Message-Id: <1248266770-24788-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] dhcp 3.0.2: fix QA error
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
X-List-Received-Date: Wed, 22 Jul 2009 13:00:25 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/dhcp/dhcp_3.0.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/dhcp/dhcp_3.0.2.bb b/recipes/dhcp/dhcp_3.0.2.bb
index faf22b2..2ce8083 100644
--- a/recipes/dhcp/dhcp_3.0.2.bb
+++ b/recipes/dhcp/dhcp_3.0.2.bb
@@ -2,7 +2,7 @@ SECTION = "console/network"
 DESCRIPTION = "Internet Software Consortium DHCP package"
 HOMEPAGE = "http://www.isc.org/"
 LICENSE = "BSD"
-PR = "r8"
+PR = "r9"
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/dhcp-${PV}.tar.gz \
 	   file://noattrmode.patch;patch=1 \
 	   file://fixincludes.patch;patch=1 \
@@ -19,6 +19,8 @@ INITSCRIPT_PACKAGES = "dhcp-server"
 INITSCRIPT_NAME_dhcp-server = dhcp-server
 INITSCRIPT_PARAMS_dhcp-server = "start 30 2 3 4 5 . stop 30 0 1 6 ."
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_configure() {
 	./configure
 }
-- 
1.6.1



