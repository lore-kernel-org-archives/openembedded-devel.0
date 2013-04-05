Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOExe-0000G4-QC
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:18:20 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so1563732eaf.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ViNkKHBJfLaneK5kIMMHPdLuuVu3GqfcVLq760dn3TE=;
	b=KMheUVN64wSz8wzioKy9BqGiu8KDUHwhOxr6JoS4KxeydE/iNL562lh0Vd99RyXXn3
	zaGeLzJxSu3eqm1pEKpMWJu7+jLRrH6NGovMJKieleYHCRafWkx1H2wKhegwvFHWid5E
	+ARF0N9IjBBaF4bdDNDiE3TQdq5DIsQ/H7MVv/C/uOo5iG6gakTp0yLNCORWcQfDyY6A
	kgKetxa6Spy6DULR7r0cVQqwaonrvW00Ns5zUodIujjoHIlUEN4qKP+GnQ+8CWqJRUDB
	WnGcXg9aRyrSS+Y2jqhJ2J7hepI1BiTXt7kIgcFs+AwP7VDMPCCT9pznjn71A9JTWGhw
	IXuw==
X-Received: by 10.15.32.67 with SMTP id z43mr13991031eeu.24.1365199264339;
	Fri, 05 Apr 2013 15:01:04 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id d47sm17772159eem.9.2013.04.05.15.01.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:01:03 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:00:34 +0200
Message-Id: <68f72308d6f08d7e5406b4d980da45ac197ae45c.1365198580.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/6] zaurus: add note about mtdparts of tosa
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
X-List-Received-Date: Fri, 05 Apr 2013 22:18:24 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/tosa.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
index 961d674..280e81f 100644
--- a/conf/machine/tosa.conf
+++ b/conf/machine/tosa.conf
@@ -5,6 +5,9 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
+# NAND factory-default
+# mtdparts=sharpsl-nand:7168k@0k(smf),28672k@7168k(root),-(home)
+
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "480"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
-- 
1.7.12.4



