Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.7741.1586003793319593380
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 05:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=w7EPYENu;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id D263E60481;
	Sat,  4 Apr 2020 14:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586003791;
	bh=z5YVBZ1IedOQN89Q9ALaySEjeAQtAAMBByfan9/yKQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w7EPYENuh3FbNP9S8CTSPp4MQbXZ1CToKxk1lr6s/OEEFVjCSvvqa8TujZAIgFOci
	 3820LpeoZZTU0IFGxA44O6Uvp6eP55JbDqOvHF42Siym3ig0TWgjllwMA3woFOMlhD
	 Ygj6d0/VIx2Pdu+dEYalnCWJqPddmRHsmcczaxfDhgZ+bDlkxQSuLmjgmIAboHs5rr
	 4UajojjMyU7xbUP/IA3pIN8eKigRECilv/8TAUfOactm0tr82fPV67x8DLY/ZcNbfB
	 Vfmik8MqC2xGhIp9B1Rkr3JOlF6e/DFhnbfZOBwqQOpwdU7BZp/2lWdDbVM7W+opZ9
	 ZOm1OlVSW0Dlw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 5/5] igmpproxy: fix upstream check URL
Date: Sat,  4 Apr 2020 14:36:01 +0200
Message-Id: <1586003761-12873-5-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>
References: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status igmpproxy
<...>

INFO: igmpproxy                 0.2.1           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
index db96d48..004433b 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
@@ -8,4 +8,6 @@ SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/${BP}.tar.g
 SRC_URI[md5sum] = "3a9c2cb42c1f5ee0cb769a4884545641"
 SRC_URI[sha256sum] = "d351e623037390f575c1203d9cbb7ba33a8bdef85a3c5e1d2901c5a2a38449a1"
 
+UPSTREAM_CHECK_URI = "https://github.com/pali/${BPN}/releases"
+
 inherit autotools pkgconfig
-- 
2.7.4

