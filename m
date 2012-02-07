Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumtL-0003dQ-4t
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:23:35 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181830eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=sYL1WxX6kXKOlbPZXGqswx7Iqb2pNib9m4sYK2VfeNI=;
	b=Vq0+tWzseuS2Q+UkXNrEirr+92iDWen9JEi2vZOROJ6jy+sPwLr0uhlYSKfAwwDucJ
	I9gG/3e+XsK6dfMvw3vJ+vw9qWAFf4EI0FVzqlt6lPFLcGSSm9hE57DbIn9MMtJxDgPq
	yHHAsRSEC/WknJ9sAwE65E4d01TiMgl0xp/eA=
Received: by 10.14.99.195 with SMTP id x43mr6966228eef.46.1328627735120;
	Tue, 07 Feb 2012 07:15:35 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id z47sm66752182eeh.9.2012.02.07.07.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:15:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: angstrom-distro-devel@linuxtogo.org
Date: Tue,  7 Feb 2012 16:15:34 +0100
Message-Id: <1328627734-5293-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627734-5293-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-angstrom][RFC 6/6] angstrom-core-tweaks.inc: remove IMAGE_INIT_MANAGER
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
X-List-Received-Date: Tue, 07 Feb 2012 15:23:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 conf/distro/include/angstrom-core-tweaks.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-core-tweaks.inc b/conf/distro/include/angstrom-core-tweaks.inc
index b6b3fdc..a518334 100644
--- a/conf/distro/include/angstrom-core-tweaks.inc
+++ b/conf/distro/include/angstrom-core-tweaks.inc
@@ -70,7 +70,6 @@ IMAGE_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",  "udev","
 #
 # sysvinit, upstart
 #
-IMAGE_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
 IMAGE_INITSCRIPTS ?= "initscripts"
 #
 # tinylogin, getty
-- 
1.7.6.4



