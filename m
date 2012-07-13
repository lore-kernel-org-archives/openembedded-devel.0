Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbST-00080Q-3J
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:51 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247528bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=T1A/aqJ3dhsnY/2nzyv1wd3IigWoa+gQQPxRCnfOmlI=;
	b=gA1CHn3tkSfN4LGiMLEG9wyIcpgmNuw+D9UZiQDYA5D56dzjEkdRmaX2warIkkPtdi
	WwY0Y8mZHiI9MWpdEpHkmUy0uiJHAPvhMvAfVSOLna5QRJivwMlpvQUseQ/YQnTKghGl
	pIYJVPuQIwjeWBRYe8KsZbTc8lLSRtgZXMzh5lpCG1H3J1AFjJNC4XHPId5sFYntDmuq
	XxnaawCORQfsBst+lG+5sPmfhWYE1yp9idwoxMVdNM03nPwpR2Djkma424plm5Ld35Q6
	ErdEMh3qHbKAkRUc9QE5g6Al7GprnXQ7p6AdrMUtyRNcvKce1RIit8yUifU+DVx2T/P4
	IoXw==
Received: by 10.204.128.196 with SMTP id l4mr173966bks.21.1342168289281;
	Fri, 13 Jul 2012 01:31:29 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:23 +0200
Message-Id: <1342168240-7760-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 15/32] lighttpd: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.31.bbappend              |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend (62%)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service b/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
similarity index 100%
rename from meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
rename to meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
similarity index 62%
rename from meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
rename to meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
index df6dac7..b016bdc 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
+++ b/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
@@ -1,6 +1,6 @@
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
-- 
1.7.6.5



