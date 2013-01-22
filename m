Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Txfbv-0001Qy-E8
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:18:08 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0MF2TT5005267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 Jan 2013 16:02:31 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TxfN1-0006Og-5M; Tue, 22 Jan 2013 16:02:39 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 16:00:41 +0100
Message-Id: <1358866841-31063-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] [meta-systemd] dropbear: read configuration from /etc/default/dropbear
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
X-List-Received-Date: Tue, 22 Jan 2013 15:18:09 -0000

Patch allows to specify additional parameters (e.g. '-B') by reading
/etc/default/dropbear as a systemd environment file.  It applies
$DROPBEAR_EXTRA_ARGS which used already by the oe-core sysv initscript.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
index 4fba3f0..813788f 100644
--- a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
+++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
@@ -4,6 +4,7 @@ Requires=dropbearkey.service
 After=syslog.target dropbearkey.service
 
 [Service]
-ExecStart=-/usr/sbin/dropbear -i -r /etc/dropbear/dropbear_rsa_host_key -p 22
+EnvironmentFile=-/etc/default/dropbear
+ExecStart=-/usr/sbin/dropbear -i -r /etc/dropbear/dropbear_rsa_host_key -p 22 $DROPBEAR_EXTRA_ARGS
 ExecReload=/bin/kill -HUP $MAINPID
 StandardInput=socket
-- 
1.7.11.7



