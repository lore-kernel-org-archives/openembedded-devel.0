Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmdU-0004na-Us
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:35:22 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so10119834pac.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HWkTiIafnQRUjESqb+2PIazCKgKQD9etatb5bItWgyE=;
	b=IpDmrfLmlo+Niv5UbiYoY0vlAewHrbgARoWWXY14vBN0c9HABl55Wn+1e4WF1gWw9k
	hd30ttgUqYnVVAuLvCBg9Rqf3NFHLtaReTACiPcPOxDOb1dv70Te8q5AJEWbsHBqLM4R
	FrTo/nvmY9DTPFhHsCBOa54ZihK1pPD7aOvN0bkeVGM+sQ1FM0vPXcARYSMWHhSgeZC9
	sd+NKdbwBT7z8bquLhyIhdV4DqMx+XG5013/fR65TUls2lBMYk1M+5giReMMWUBvB9uX
	79waqMmX/qYZDt8poDZOFVe2NTsiVH4z3diyj7xXk5kr67McKjHCveKQR09cypwziBg6
	jmfA==
X-Received: by 10.68.232.71 with SMTP id tm7mr177678648pbc.118.1357463633280; 
	Sun, 06 Jan 2013 01:13:53 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:43 -0800
Message-Id: <1357463568-26241-20-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 20/25] at: Add systemd unit file
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
X-List-Received-Date: Sun, 06 Jan 2013 09:35:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-oe/recipes-extended/at/at/atd.service     |    9 +++++++++
 .../meta-oe/recipes-extended/at/at_3.1.13.bbappend |   12 ++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/at/at/atd.service
 create mode 100644 meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend

diff --git a/meta-systemd/meta-oe/recipes-extended/at/at/atd.service b/meta-systemd/meta-oe/recipes-extended/at/at/atd.service
new file mode 100644
index 0000000..64a9015
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/at/at/atd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Job spooling tools
+After=syslog.target
+
+[Service]
+ExecStart=/usr/sbin/atd -f
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
new file mode 100644
index 0000000..d80cfff
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
@@ -0,0 +1,12 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://atd.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "atd.service"
+
-- 
1.7.9.5



