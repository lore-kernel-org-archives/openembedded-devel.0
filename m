Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTe-0004Ay-V2
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:47 +0100
Received: by yenm12 with SMTP id m12so267559yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NRG0QF4L3ujkrUeqmf2xUNuuRfZlLOK1kvRc8mf7I4Q=;
	b=kLlFLtf5KT1TWSfoKpFrO7lmXUUYcHShdvXn5oXZtYbHyQpAfdG/mkrADkbEQM69fJ
	Nq9Jg33RQbgc+HdAPcCfjcqbczjVpRZdz/+M6W/cRTHSt+ch4DahTNcDmFWdMHY2Phwn
	PsWoy3BSkTzhnVPTUTIxPPfki9g8T9S9T7NhE=
Received: by 10.236.93.4 with SMTP id k4mr7626324yhf.114.1323825049238;
	Tue, 13 Dec 2011 17:10:49 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.10.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:10:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:28 +0000
Message-Id: <2058b129416216fb2d1dd55f1e29e26be7858aa6.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/8] openvpn.inc: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/openvpn/openvpn.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openvpn/openvpn.inc b/meta-oe/recipes-connectivity/openvpn/openvpn.inc
index 68bfc51..50483ea 100644
--- a/meta-oe/recipes-connectivity/openvpn/openvpn.inc
+++ b/meta-oe/recipes-connectivity/openvpn/openvpn.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "http://openvpn.sourceforge.net"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-PRIORITY = "optional"
 DEPENDS = "lzo openssl"
 RRECOMMENDS_${PN} = "kernel-module-tun"
 
-- 
1.7.2.5



