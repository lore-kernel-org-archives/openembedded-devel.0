Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu6v9-0005uv-OY
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:30:07 +0100
Received: by yxn22 with SMTP id 22so1634512yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=Nr8hWqXNLMwT0d2YB7N1qFDEpDV97b0AMuA8Qg/7s3o=;
	b=agFeM8E7vTeeKsEyttvwuL081i0nlyc/YsWdkaiSjLNRuo/xZ5cLCiMo09r5dlGUFc
	wZU+ycXInASZ0iRYIzH0hH9iiJjcGAw33sKRbEgR7cObvfA1X5sS3wFowCXlijBpfkVi
	REnEtGHF11u2Zx2uE6sde1NE2tL3vV1U549U8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=WdnRlu4xcEpWgzcHDNetqx9EQV4yYwhQ28gQLncN7nN7qURXoBOGb295k2CWKnL3Lf
	j/WVDC4+E2FdfUWvmExquCHge+wN17AkwvKk6fIkbprtWcnGrDPnV4+tW+12n3xHPg7U
	jbBt1Zd45y/K5/nbdEPP1UgGNPti+98XgojYc=
Received: by 10.150.100.11 with SMTP id x11mr7327282ybb.419.1298914121087;
	Mon, 28 Feb 2011 09:28:41 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v20sm1766910yba.4.2011.02.28.09.28.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 09:28:39 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Feb 2011 17:28:22 +0000
Message-Id: <1298914102-27047-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <AANLkTim3uRSJMCskYcUzpg2aGCwzmoxLBxJeMTztzLzb@mail.gmail.com>
References: <AANLkTim3uRSJMCskYcUzpg2aGCwzmoxLBxJeMTztzLzb@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] freerdp: rdepends on xprop
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
X-List-Received-Date: Mon, 28 Feb 2011 17:30:08 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/freerdp/freerdp.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/freerdp/freerdp.inc b/recipes/freerdp/freerdp.inc
index c75175e..0690d6e 100644
--- a/recipes/freerdp/freerdp.inc
+++ b/recipes/freerdp/freerdp.inc
@@ -4,10 +4,11 @@
 DESCRIPTION = "FreeRDP RDP client"
 HOMEPAGE = "http://freerdp.sourceforge.net"
 DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
+RDEPENDS_${PN} += "xprop"
 SECTION = "x11/network"
 LICENSE = "Apache-2.0"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 inherit pkgconfig autotools
 
-- 
1.7.2.3



