Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSe-00085z-2x
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:53 +0200
Received: by bkcik5 with SMTP id ik5so2247708bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=TQvPBRJfsXHbTFa3a3acJe0EVRBzzIx2xrSZ0R6LO2c=;
	b=VMSP9Lt7oyty0OadNQHSivgxRQ+GS3G5O1mL3e8FaQcrn4wXTL4Lq7YzDey8RMtRin
	YJD2/GVVL+QKlwd5nvu3DOKKnkiiC2s7qmOtPHOEWqpd1HybOOBfFlre+y10JCgIhmLO
	+aIojjYovUEerzKg3rzVOKY/li2yabO3xH1RLXsaWhm83DBTArQCO1GYTF2ZmOfGybMB
	Rom+T8CU0+ay5T1ZC16+1gL9YO77AVzg/fSMOqhHFbx95iGuUtGoKQf58/ZlbKEMd//X
	7t9hwYS0nFji8Q+PHW9IyI+dvmHdcmIy0/GwcwXjzD/qiEJylr8cEi4zkDLIr1wCCTqY
	dkxg==
Received: by 10.204.154.66 with SMTP id n2mr95174bkw.138.1342168298155;
	Fri, 13 Jul 2012 01:31:38 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:29 +0200
Message-Id: <1342168240-7760-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 21/32] connman: move systemd support to meta-systemd
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
 .../connman/connman_1.0.bbappend                   |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/connman/connman_1.0.bbappend (84%)

diff --git a/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
similarity index 84%
rename from meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
index 167165f..a9d13e6 100644
--- a/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
@@ -1,5 +1,7 @@
 inherit systemd
 
+PRINC := "${@int(PRINC) + 1}"
+
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
-- 
1.7.6.5



