Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MGyvq-0006rT-SP
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 19:28:19 +0200
Received: by ewy20 with SMTP id 20so599627ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8pB5nr4aCuqI8V8eJ3DUHeo60BZFmpYlNBYPyFPqa3o=;
	b=K+Bu83X8vrzZnjSLwCifT6ltzFwvD/c8+EIPV/wNgxCKcBAjx35eC/1hbxcxjQzQ3M
	rpEpjQkLbpjdiW5+Ttcdaffc8avxOR13eH609+LsgRA/KhEaRdTqGuQom8P9upvj20kg
	L4fpsWpweU/OMK/SYAs/bF+NRHWgObdHvvb/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NNGCEgeXDTl8Cz2y0yT47uTAgPs/wYkM5dl5VN+D0721FE50OM9GKqRlEVzLl5dUyx
	PNC+LySEJhuFJuoGu16/Ztn95RNGoewU1XVxs9dhtcjxyaGf+jK+APje4Nc/bRuF2LYS
	/byOS7k6f13fhUrA4t2QYWvMmpWQqogSu7SYI=
Received: by 10.210.43.11 with SMTP id q11mr3138961ebq.73.1245259069932;
	Wed, 17 Jun 2009 10:17:49 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 23sm81577eya.29.2009.06.17.10.17.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Jun 2009 10:17:48 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 19:17:40 +0200
Message-Id: <1245259060-23210-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] Angstrom: fix OESTATS_SERVER host
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
X-List-Received-Date: Wed, 17 Jun 2009 17:28:20 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/distro/include/angstrom.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 60f2e55..18c2af1 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -342,7 +342,7 @@ SEPPUKU_AUTOBUILD    = "1"
 SEPPUKU_PRODUCT      = "Openembedded"
 SEPPUKU_COMPONENT    = "org.openembedded.dev"
 
-OESTATS_SERVER      ?= "tinderbox.openembedded.net"
+OESTATS_SERVER      ?= "tinderbox.openembedded.org"
 
 
 
-- 
1.6.1



