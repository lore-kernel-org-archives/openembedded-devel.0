Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3V-0001fg-Lu
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:17 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=4Ot2JNGV3ZPpP/hcNWq6sMUdmGcQlP2Ef8pbGJNsZvw=;
	b=Bupb/lFz2OH1fQH8q25J7GY1cd1r0cE8ZLJwlO79tjH4H3vrLjTqRjvyZsynpaOp0V
	XbtsheUvvT0fP5HmsjZ1aoJnLllbLoaIzeawhUm/bQ3sT/5t7bNQakOjAbYdKTv9A/i7
	UWfAGlZ24RrC/UMbaq/avIViAbE79NijgMZ3YBMCWzeRR//dniqU4rALDi2PPhBtk51F
	iJmkKJOyMMazDAFRGgeGVb8MnHtCjIyDs/krdexDXPokt3b/AW8nnmXkc/m5rKnuk/Ps
	pqrMCBUiZA0dCt41EGzODJJSxmgjlDOcwuYz/8nNz9JqEsU8P3iwxqoRjX8IHN+SDWD2
	LQoA==
Received: by 10.180.79.71 with SMTP id h7mr12886587wix.19.1339364507366;
	Sun, 10 Jun 2012 14:41:47 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:43 +0200
Message-Id: <1339364820-2880-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 10/27] lighttpd: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.30.bbappend              |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend (84%)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service b/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
similarity index 100%
rename from meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
rename to meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
similarity index 84%
rename from meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
rename to meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
index 1341405..83ee4b3 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
 inherit systemd
 
-- 
1.7.4.4



