Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2ADJ-00043V-Jv
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 01:47:14 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so3026650eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2013 16:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=VkVfv3od3q6094qhokV3pv/vQKIpPhlnELv28kFvTes=;
	b=U4ZeamCb7XwA8hRWGhEcoQUjs7wmu0EmN5ibLNZvIV7HLeA2XkMJ4ffdUm3Zn/caSJ
	S7m9uMtfViHOm4hwTqQOZDIwGrFLq7yRLRDZKFCeWBD3U/0O5vc/FT2pSubPsMKwEXGR
	NhB/NPyVfpPzWDx1/ms9j1QBL7cCZ1Jjdx7MQVnLuyVyTE2tCBf4RlzhPm/wykHGrQ4P
	67yexDSKwK+tNCK9QGIIdi+t37UctF5+NtwTNN9GPnuJD+k7e39u7ABA7/w9PmscrwoV
	NlZM/DmP3/MYOBeoSdyTYp3ZrQeC9oyPii5onmyk2laH24E4yMoGPOe6rD4nuLa39u2m
	4hIA==
X-Received: by 10.14.193.131 with SMTP id k3mr66249758een.45.1359937886447;
	Sun, 03 Feb 2013 16:31:26 -0800 (PST)
Received: from localhost.localdomain (p5B0A0847.dip.t-dialin.net. [91.10.8.71])
	by mx.google.com with ESMTPS id j46sm21263378eeo.3.2013.02.03.16.31.25
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 16:31:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 01:31:10 +0100
Message-Id: <1359937872-26028-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 2/4] packagegroup-xfce-extended: add xfce4-mount-plugin
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
X-List-Received-Date: Mon, 04 Feb 2013 00:47:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index ea4bd1e..d4f91fd 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
@@ -39,6 +39,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-weather-plugin \
     xfce4-fsguard-plugin \
     xfce4-battery-plugin \
+    xfce4-mount-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
-- 
1.7.4.4



