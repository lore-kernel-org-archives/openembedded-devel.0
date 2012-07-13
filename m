Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSK-000812-9B
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:33 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247550bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=q6mIi31gp1liWI4yNhpyq8iXmsLJqMG5462XQZ2jnJs=;
	b=BAwy0Cy427bmxFrCxMGdyKgdpw9CS9ecnntUhJ/jis33zhtKvrtOeYoIFPh0m2iACu
	26uP7HymFVbAi/Fl13uJgQJymQhmq/XS9Zf6Ui0JFOFE4y3hjBu9YTTs8UBFd8TKPVS7
	/HvLLE4TF53cgT76e9987j9b51miQa5LRYv9YumCfwX7WU4tDu54+86PEFDmDCNlisC4
	1pOZ/I5SPYD+JP5PkDQ817zMw5VprD9/m0QHJ9XjnF7GnxqIJmLzsd6N0UPIWcgc6SGl
	l+2HITDEN26BtFV78ClJEwz3jV8cecJE/XUeY+Y6L7ogsNWBLfOfsehYtO2lNBhrBBgR
	HPTA==
Received: by 10.204.128.196 with SMTP id l4mr173631bks.21.1342168280463;
	Fri, 13 Jul 2012 01:31:20 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:17 +0200
Message-Id: <1342168240-7760-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,V2 09/32] polkit: meta-systemd rework
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 ++--
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
index 2383c5b..ea82e37 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -1,6 +1,6 @@
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
-POLKITAUTH ??= "systemd"
+POLKITAUTH ??= "consolekit"
 
 PACKAGECONFIG += "${POLKITAUTH}"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
diff --git a/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
new file mode 100644
index 0000000..9528b9b
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -0,0 +1,3 @@
+PRINC := "${@int(PRINC) + 1}"
+
+POLKITAUTH = "systemd"
-- 
1.7.6.5



