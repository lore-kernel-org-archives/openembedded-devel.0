Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXspi-0002gN-JB
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:09:48 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so476024eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=W0D3jmA3WVSFyEnt4bOcXnUe2X5yRRSHXiGoNObTx2E=;
	b=wM56knr+fDLXZdakd1n9ot3KOTlA44kwG8Ryvp9Pgz5sMuArJuVXlJNw4Oxg005+CX
	vgFXxIQR6GKVSfVZ7F2PJcSeg7yGXw31op1j24TLELequ+DfPKaZLGU6go4J3eii42hi
	8HpU1AwdvWJQeJPspmdZQim6OLNllOGJ253MYel4ebSqBk/SNex8jvzY3s7GVATAwFL3
	Fw2PaG2Ifb23rBoPgdpWXsGx2wTBhayKVYyQvEcb4xWV4VWiXfCBDeD81S0kFJi6foMd
	daNNnmG9qxKl86iRF9/pVf6/r/cPjbNUw7fy5WxBP4JUABuQACYyqQ72CfodWpeZwOVo
	l6KQ==
Received: by 10.14.194.2 with SMTP id l2mr62601425een.12.1352721350152;
	Mon, 12 Nov 2012 03:55:50 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f2sm15646402eep.2.2012.11.12.03.55.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 03:55:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 12:54:22 +0100
Message-Id: <1352721267-367-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
References: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 1/6] lighttpd: move systemd appends since recipe is in oe-core
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
X-List-Received-Date: Mon, 12 Nov 2012 12:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lighttpd/lighttpd/lighttpd.service             |    0
 .../lighttpd/lighttpd_1.4.31.bbappend              |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd/lighttpd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/lighttpd.service
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttpd.service
diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
-- 
1.7.6.5



