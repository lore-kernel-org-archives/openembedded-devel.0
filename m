Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UZGLm-00076W-EA
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 May 2013 10:00:51 +0200
Received: by mail-ee0-f45.google.com with SMTP id l10so1642851eei.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2013 00:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=xiq9Iv6HziuLPG6b8NkQfT6fLHXi6SPOTJKJ9ZCfag8=;
	b=Wzx+p7LHiLmY1vsTCky+BVmjv8GgkUXYSafkWP9MWhbnXZuV7noYqCUgDVmmEvqisc
	SQNnHMIAvTcO73ZhBFPBxAkrRX+1KSKRv7MHdW1s3r775RjBDYRqStgIsCPRvaQuL3QN
	2NEaaDG6RJXmhUxasnBXs8V6d/BNbRuXxFx7fSXNgdPjKR1BJQjt4S9YdQtEc5EdFtOH
	BEIeOreQrUs/icEelgs/bEhyk8GppjjG1z/Xh1jOrJn5L8qmMM+2Z4LpiTQRDs0KewNe
	RsgOjrcajMjlYCe0tRSDTu/Q3S+qzdkQisUfMQellLQKGV3WQ2u1k1N71DBSZ+UqX7j+
	SuFg==
X-Received: by 10.14.203.73 with SMTP id e49mr57499587eeo.20.1367826166841;
	Mon, 06 May 2013 00:42:46 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by mx.google.com with ESMTPSA id
	bn53sm31582330eeb.7.2013.05.06.00.42.44 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 06 May 2013 00:42:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2013 09:42:40 +0200
Message-Id: <1367826160-27218-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQm3Ox2COLOn00tzJG99dl/3paCPipUqofagbwm9QYqNR5hHVpyJkz+3BgtKvPMHYrBW0nQX
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-gnome][PATCH] libgnome: split out schemas needed for gnome-control-center
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
X-List-Received-Date: Mon, 06 May 2013 08:01:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 325912f..2ccf6cb 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -25,4 +25,11 @@ FILES_${PN} += "${libdir}/bonobo/servers ${libdir}/bonobo/monikers/*.so \
                 ${datadir}/gnome-background-properties ${datadir}/pixmaps"
 FILES_${PN}-dev += "${libdir}/bonobo/monikers/*.la"
 FILES_${PN}-staticdev += "${libdir}/bonobo/monikers/*.a"
+
+PACKAGES =+ "gnome-common-schemas"
+
+FILES_gnome-common-schemas = "${datadir}/gnome-background-properties ${datadir}/pixmaps ${sysconfdir}"
+
+RDEPENDS_${PN} = "gnome-common-schemas"
+
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug"
-- 
1.8.1.4



