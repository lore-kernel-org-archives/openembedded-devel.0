Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id AF8336F83E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2014 21:30:20 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kx10so32910pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 14:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TPtKzv+PvSc76srfEAJDYiPnzK9GEowHetckuMoMT/Y=;
	b=JRMlHzPIhX35b72arrbU7GvqLkzlmoTD7W1aoreeRukzHMrTeCs88CZWdsF7qTbtkz
	RzMmEp9dMtmqvMPiZsv+cXPXR/m5odVAjwgv4TPkLhQtDOF9+VjemToD9UqExg0IHhkk
	ayFKA/EIBYJvJjBoYMuSppQTANrnabXh7Ld5M9KfjW6A+6yaBIj/r4r9ZopwQRWbZkfR
	b/Wo8s9IpKWnXwzHK7TTiQ8GTB+kfQkLWuPWPVad8LclMrDOMUSebigX/EQnv87aF9Dz
	+P0HxWzLKuF1DAo/ifUV3Uk7GCY4KnROQpKi5+Mufx9L6e62q1lYqTqvA/0ZdI2AOpxh
	Qmqg==
X-Received: by 10.68.178.66 with SMTP id cw2mr33503372pbc.89.1396906221031;
	Mon, 07 Apr 2014 14:30:21 -0700 (PDT)
Received: from pine.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18])
	by mx.google.com with ESMTPSA id om6sm22pbc.43.2014.04.07.14.30.19
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 14:30:20 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Apr 2014 14:30:03 -0700
Message-Id: <1396906203-25158-1-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-xfce][PATCH] xfce4-session: Take the precedence over mini-x-session
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Apr 2014 21:30:23 -0000

If x11-base is included in the image, XFCE4 session does not correctly
start because mini-x-session has higher priority at 50.
---
 .../xfce4-session/xfce4-session_4.10.1.bb          |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
index f7aec5e..74289fb 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
+ALTERNATIVE_PRIORITY_${PN} = "100"
 
 # protect from frightening message that xfce might not work correctly
 pkg_postinst_${PN} () {
-- 
1.7.9.5


