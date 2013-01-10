Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <noor_ahsan@mentor.com>) id 1TtFzm-0001KV-Rs
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:08:27 +0100
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com ([137.202.157.70])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id r0AArAaF020319;
	Thu, 10 Jan 2013 04:53:11 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 15:53:01 +0500
Message-Id: <1357815181-1896-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] autofs: Adds bbappend to add systemd support.
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
X-List-Received-Date: Thu, 10 Jan 2013 11:08:27 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Removed systemd support from meta-networking recipe
and added bbappend to add its support.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../recipes-daemons/autofs/autofs_5.0.7.bbappend   |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
new file mode 100644
index 0000000..f095d1b
--- /dev/null
+++ b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
@@ -0,0 +1,5 @@
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "autofs.service"
+
-- 
1.7.9.5



