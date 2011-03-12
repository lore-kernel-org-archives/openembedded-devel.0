Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUVC-0004if-BN
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:26 +0100
Received: by mail-gw0-f47.google.com with SMTP id 11so1380552gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=GKvPUcOFH7KyUCgbRWQKHmeYjYzuivzbiCTLkvnNaIQ=;
	b=A7ckfbuXCsgot1ErpPW4fiqDM1l9YbyIrqug06KNkVJuub1AkvbGDrgn1KQMYdrOcd
	9F9ScuXLL/ic53bx/41kOSG0ELhY0ZXh9TEhr8aVX4xbkUKsOCNEpblm2NiGC4wxLB11
	hQ88zct3DWWTKsM2v/KmC3yoPhi+bSCZASVkU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=objWN7Ugxs8z7Hv3U/pS5ASiTXhSD+j4xs09NLTqZHwxSM93j7oy7Sn7aCFNVZA+i3
	1n8eDbsIfIJZxwABzhhdDuZTmxTKS0nFHd3aiy6DGWSwSYnKMjBoEvsgOE2V94vHjpty
	EqsfdTE6Ag9x1JhgaFs3W8MWzKD6ssdAZhUlw=
Received: by 10.91.35.32 with SMTP id n32mr1429580agj.142.1299958066881;
	Sat, 12 Mar 2011 11:27:46 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:14 +0000
Message-Id: <1299958038-25216-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/11] xkeyboard-config (git): update to current version - 2.1 plus fixes
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:26 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/xkeyboard-config/xkeyboard-config_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/xkeyboard-config/xkeyboard-config_git.bb b/recipes/xkeyboard-config/xkeyboard-config_git.bb
index c627b51..f69a0e5 100644
--- a/recipes/xkeyboard-config/xkeyboard-config_git.bb
+++ b/recipes/xkeyboard-config/xkeyboard-config_git.bb
@@ -1,9 +1,9 @@
 require xkeyboard-config.inc
 
-SRCREV = "547ae8589afb208d7b44ffe1e0ff7aba466c2ee3"
+SRCREV = "9333b2f3f0e3f1724b7a5c04b8ffc5eafb96fefa"
 SRCREV_palmpre = "a961c7b00f077e8923e32192243db46b10a702b7"
-PV = "2.0+gitr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "2.1+gitr${SRCPV}"
+PR = "${INC_PR}.2"
 
 SRC_URI = "git://anongit.freedesktop.org/xkeyboard-config;protocol=git;branch=master"
 SRC_URI_palmpre = "git://git.shr-project.org/repo/xkeyboard-config.git;protocol=http;branch=palmpre"
-- 
1.7.2.3



