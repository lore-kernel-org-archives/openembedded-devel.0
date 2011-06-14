Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWWra-0006RJ-UO
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 18:53:15 +0200
Received: by vws2 with SMTP id 2so5172805vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=AcBQ5o8A8Z7zoZ1YO7/2dZXI7zFKhuHlyOZyh1DlXq4=;
	b=FWSx8zLxA7VMOgi+VFWtlEIZ/PMYBcKMoCgSyMTlY9rnEO65y2Ji5u76CtOS5oorVl
	LuEbZA9mik4BXkk+8oXVs6rA/XrwttNwRubWyl6hGxg+1B6afBIbt4E4uaDcQc0DshU8
	fvDHgF36F5SfPj3HpN/YTCk3XCTwxe3h85r2Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XvVV1lkNlrzuvAca+4ygRcmEGeORZHhys0i5Wsqb0ozm+jRuHLgAgZFK2KVoBeXe/x
	eX3wjU8Su5ArJdyBU1mqjnGnPczrQjV7tPDTv7a1G7bo3BuogPpLAGj1VTR9DdqPpfJR
	KI1tRyZRxXNTksolfQ3ONtsJBvOoje0e4slK8=
Received: by 10.52.106.232 with SMTP id gx8mr771256vdb.236.1308070188957;
	Tue, 14 Jun 2011 09:49:48 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id bt2sm2307123vdc.12.2011.06.14.09.49.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 09:49:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2011 16:49:32 +0000
Message-Id: <c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 1/3] xf86-video-geode: add 2.11.12 version recipe
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
X-List-Received-Date: Tue, 14 Jun 2011 16:53:15 -0000

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



