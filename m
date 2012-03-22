Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJM-0006BN-Gi
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:40 +0100
Received: by wera1 with SMTP id a1so2162877wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=8/7U+/q2iqr2VTACC1VzAY5iPSTke6YrbYSVaxeuh0E=;
	b=sZsfJhB+7oZSSkNLjgA5Tk+RvLq7U7WCWh7NY1m+769UKj2SuXml5a/exl5u19guf1
	hTojP1wgHB0hYkN5l9IQXF3RzhDyjJ3kCB+ILz+4T84u7c5hfM97lZ8DveDZ1Jm1NkKW
	BFizFGICfLlNRJ94JSbuBIIO0hXfexe+awJQ17K7yipKiauwyFJOeOni/NmFJEy2jrRS
	YMSM/3EdFeyNGNNJrhZBlo7kb6B2/YsZ0oxDudPFLG1B5lu/tvfK7/6yuULIzbdHq3o/
	3rX1iq9QfkaEYadXw035a/tPUUCt4xAQOlysNXRZzaeG+q7XeZicATKKTUPyYreaR6El
	sGLA==
Received: by 10.180.102.102 with SMTP id fn6mr401716wib.10.1332446385477;
	Thu, 22 Mar 2012 12:59:45 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:35 +0100
Message-Id: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe 1/8] systemd.bbclass: remove systemd_unitdir it is set in oe-core
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
X-List-Received-Date: Thu, 22 Mar 2012 20:08:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index a8c77c8..4e99a53 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -1,7 +1,5 @@
 DEPENDS_append = " systemd-systemctl-native"
 
-systemd_unitdir = "${base_libdir}/systemd"
-
 systemd_postinst() {
 OPTS=""
 
-- 
1.7.6.5



