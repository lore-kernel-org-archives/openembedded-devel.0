Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxt-0001qj-4M
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:28 +0200
Received: by mail-pv0-f175.google.com with SMTP id 6so1648285pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qPK1DM/JnA17DhjlOkMQ3zz+61aJ0i84vA6gO4dTNx8=;
	b=AiE4JyUjc84GozCiHISiU2iLqFrOwanlDSxv8ogPNDxLKQBiSofjvDuMrO2omLbnEf
	jUvA8kF6PN71yNGDXRYE3XnizuAXRofwzeyu3rVsfN/KevR5clwOokGyMCHw07eERFRI
	pQgmfTljXsC56eHj/tFQcWXCWPDWedXMSxjWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wIklq9UTySS4RoU+B+hgQqJ+ENBfRW5LakhyzeMFV7rezCsPqmf7FkXhv88SNE7R16
	K+IVBfDzX/nXlC+xsI4ckXmJrKHL/McrmMIg/VsA+JNI1e1B3VRePMy8GLRTiJ2sMNgm
	DO9sByeeaHFYDZEbY26Un+hhT2a2n8+NAWy2U=
Received: by 10.142.140.20 with SMTP id n20mr2634690wfd.334.1283027096237;
	Sat, 28 Aug 2010 13:24:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:21 -0700
Message-Id: <1283027073-12308-12-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/23] udev-compat141_141.bb: if machine is not one of spitz akita c70x poodle then it is not needed to RDEPEND'ed on udev-compat-wrapper
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/udev/udev-compat141_141.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-compat141_141.bb
index 2411fc6..c39d4cb 100644
--- a/recipes/udev/udev-compat141_141.bb
+++ b/recipes/udev/udev-compat141_141.bb
@@ -15,7 +15,11 @@ PACKAGES = "${PN} ${PN}-dbg"
 PROVIDES = "udev-compat"
 
 # Need udev with udev-compat-wrapper support and nothing else.
-RDEPENDS_${PN} = "udev-compat-wrapper"
+RDEPENDS_${PN}_spitz = "udev-compat-wrapper"
+RDEPENDS_${PN}_akita = "udev-compat-wrapper"
+RDEPENDS_${PN}_c7x0 = "udev-compat-wrapper"
+RDEPENDS_${PN}_poodle = "udev-compat-wrapper"
+
 # Remove hotplug RPROVIDES
 RPROVIDES_${PN} = "udev-compat"
 
-- 
1.7.1



