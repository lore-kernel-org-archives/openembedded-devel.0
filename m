Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UHhih-0002UN-RR
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 22:35:53 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so6740317pbb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=fvQSLtQBejTxboi7DWlLQLQmQmXaL2IJ2pK/OBj7MyU=;
	b=kVS44MNw9hjUYFcjDmDMGvOARXUQAodTrkOBxzHXCdIaZQBnukG/Lb46xraJrJ5ifr
	L2iwkF7iInSDkzPFI8+Swiyq4OLY6quRHBlKJf8iYux7TGqXD9uXuku46m7qlaWbM9xX
	DLU4RjvO4222fq6izYPYoog7YI8RLoPT2/3mcbBh9LxB/svVKFT2C1EmMMMriW8vRrel
	rAAWf7JQfRQ2toDGIgh172UdZXl/lLw00GJl98X8HSZT6InvfLuOTgR987WHmFZDrOQp
	2tYSDpRM86rBIaFfQX1EepqRR7tnGOQH3a/4kwVUQ302wpbbARxGM61Ulkq/kvjIuwj4
	FIJA==
X-Received: by 10.66.48.233 with SMTP id p9mr12578933pan.206.1363641542619;
	Mon, 18 Mar 2013 14:19:02 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ve7sm9566887pab.11.2013.03.18.14.19.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 14:19:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2013 14:18:43 -0700
Message-Id: <1363641523-19107-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] autofs: Fix build breakage with systemd in DISTRO_FEATURE
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
X-List-Received-Date: Mon, 18 Mar 2013 21:35:53 -0000

When systemd is in distro features we need to translate it
into the appropriate PACKAGECONFIG flag

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-daemons/autofs/autofs_5.0.7.bb         |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 6cc3b25..7d8cf17 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -51,6 +51,8 @@ CFLAGS += "${LDFLAGS}"
 
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
 EXTRA_OEMAKE = "DONTSTRIP=1"
 EXTRA_OECONF += "--disable-mount-locking \
                 --enable-ignore-busy --with-openldap=no \
-- 
1.7.9.5



