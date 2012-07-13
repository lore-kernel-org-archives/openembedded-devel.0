Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSh-00085u-Js
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:57 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247669bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=c+PrQcVvx0xVpUFTo6hsnM6pqH5trh4oIPAgVCVxLH0=;
	b=b33CtLNEuUOip3RG5zgltqUmpqDe96WJbh9Y0nQQpngJA/1+Q5kCdgvAAzTiunzePJ
	cuinBqFE4HFDO4g0tnwaPzEeqQxUFIjoOn4n6ZGnVDIVihSZLjCjXnn2aUSESQhwDDUh
	Pw+kMEPFWpqN8adyvG4pqkShkg+MHTwTsG7B2OZD2R/7DfRA9ei4gSk9GD7xDHxmLNk9
	ttStufmUIatevoWRhIsvYbN/Jmp2oJQDiY92v+z84QoDLSDas2wTwO283UlRqZWAWukp
	ICdRpOu5RftyYjPUQ5GJzsWszXduo0oLUtGKI/a6x3klY6fy87Qm9i6h9LBoO4T037Qv
	utYw==
Received: by 10.204.154.66 with SMTP id n2mr95384bkw.138.1342168303765;
	Fri, 13 Jul 2012 01:31:43 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:32 +0200
Message-Id: <1342168240-7760-25-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 24/32] openssh: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../openssh/openssh/sshd.socket                    |    0
 .../openssh/openssh/sshd@.service                  |    0
 .../openssh/openssh/sshdgenkeys.service            |    0
 .../openssh/openssh_6.0p1.bbappend                 |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshd.socket (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshd@.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshdgenkeys.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh_6.0p1.bbappend (88%)

diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
similarity index 100%
rename from meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
similarity index 100%
rename from meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
similarity index 100%
rename from meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
diff --git a/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
similarity index 88%
rename from meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
index de7668f..a708a36 100644
--- a/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 SYSTEMD_PACKAGES = "openssh-sshd-systemd"
 SYSTEMD_SERVICE = "sshd.socket"
-- 
1.7.6.5



