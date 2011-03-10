Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PxguV-0007EQ-Af
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 15:32:40 +0100
Received: by gxk1 with SMTP id 1so667476gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=GKvPUcOFH7KyUCgbRWQKHmeYjYzuivzbiCTLkvnNaIQ=;
	b=FQXV92NcWlNrofOT4lCpQubSqAq3Xeoj6wgqka5sGw+982o4w7Rj2MlZX2s1E+5r6V
	n341RIaz8GjjOHsamsHViPQZkH19mV+d9znXDwCGQIdKs/DkZou7jWemsvHj2O5DClEd
	6fYcIOuq1/cZyMwexe0892ninb6Q2Gz3bs3LE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=u/s7rtl781y2ILqi/R1Y3PJ5Z0JTe3h/1MP1LnfUdc1beKoMt+B94uHNUzrTHrt4fj
	tIcaICIFW5Qx96pBbQAzj8NUnS5+cXoKcGUPPoziMRJBNAu2eUncTnYbKG7rSR9KLkCu
	RDcH2OS1G967DtBtpSuGhn20P+TiglKnSu9TE=
Received: by 10.151.5.20 with SMTP id h20mr1114428ybi.229.1299767438678;
	Thu, 10 Mar 2011 06:30:38 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w6sm3962040anf.26.2011.03.10.06.30.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Mar 2011 06:30:37 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 14:30:09 +0000
Message-Id: <1299767410-969-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
References: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 7/8] xkeyboard-config (git): update to current version - 2.1 plus fixes
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
X-List-Received-Date: Thu, 10 Mar 2011 14:32:43 -0000

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



