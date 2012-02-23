Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdh-0004lM-DO
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:13 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so492439eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:54 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.101.134 as permitted sender)
	client-ip=10.14.101.134; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.101.134 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.101.134])
	by 10.14.101.134 with SMTP id b6mr704752eeg.81.1329999054454 (num_hops
	= 1); Thu, 23 Feb 2012 04:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=RWT5OkDPvZVS3nCBHnVWRvr+Nmin7mXy332UH9nReDE=;
	b=UeGIdj57UuQmr0tHqUsra5qH+64AIwm6kP1SjSHH4Y0tYWvtJk1cM9bsrhDf/uK9Jp
	1pkYKUCut4tXSJ2QzkLew1x5Xn8vso2U5bDX9RBg2Ox53x4PT7Low0sUhAnRXwusRvfz
	7bt/pHpEDurAu8EXBXw80o0E1Hv5WCTqKluN8=
Received: by 10.14.101.134 with SMTP id b6mr560656eeg.81.1329999054387;
	Thu, 23 Feb 2012 04:10:54 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:37 +0100
Message-Id: <1329999054-23112-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 06/23] systemd.bbclass: automatically install all *.service and *.socket supplied in recipe's SRC_URI
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index e779bef..b2d4191 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -80,6 +80,17 @@ python __anonymous() {
     systemd_after_parse(d)
 }
 
+# automatically install all *.service and *.socket supplied in recipe's SRC_URI
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
+	# ensure installing systemd-files only (e.g not avahi *.service)
+	if grep -q '\[Unit\]' $service ; then
+	        install -m 644 $service ${D}${systemd_unitdir}/system
+	fi
+    done
+}
+
 python populate_packages_prepend () {
 	def systemd_generate_package_scripts(pkg):
 		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
-- 
1.7.6.4



