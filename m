Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbHhN-0001BW-IB
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 21:42:21 +0200
Received: by gyd12 with SMTP id 12so2100281gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=AcBQ5o8A8Z7zoZ1YO7/2dZXI7zFKhuHlyOZyh1DlXq4=;
	b=ZripbG8h9HVo99Rqt12negynYZ4Sv2Qm4W3XINIOpp8bWO5AqN8hTqM4kTDE1ppGSd
	JsdDMUmY1Dqb5g0p+/cXmWWeFPNyhq5VnZFar+V3mEBQXWtFRprC2lBRTLHstUvrsnXa
	nWs2mU2QCqopyXtelmqa2lNHFbMBGOV84dUt0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=u3ar97uRFarRxAdal8uuLECKly/7PeBq0sIHUZfGEXgW1L0jsmYmk9JfDStOzBhAdr
	GnvWKlK8Pl63du3fTcCTppkDYQ9TcCMbGiRiK0Pm3luerUvOVkO9ZZR7vrHuoDlvRhdh
	fughTvkXU3E+ZfEHFLumrV5ooNXotprx4n91w=
Received: by 10.236.153.71 with SMTP id e47mr10037294yhk.350.1309203520743;
	Mon, 27 Jun 2011 12:38:40 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e24sm3675890yhk.51.2011.06.27.12.38.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 12:38:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 19:38:22 +0000
Message-Id: <0a7128c3166d0729292e664918b76cf5b7074fe5.1309203431.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 1/4] xf86-video-geode: add 2.11.12 version
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
X-List-Received-Date: Mon, 27 Jun 2011 19:42:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
new file mode 100644
index 0000000..d14d63e
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
@@ -0,0 +1,11 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8ad89d9d9a024f19d7dcc5acb044a42"
+
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "a99c521db731c2f1df309057a8465e4c"
+SRC_URI[sha256sum] = "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766089db1103b1c2d92"
+
+COMPATIBLE_HOST = "i.86.*-linux"
-- 
1.7.2.5



