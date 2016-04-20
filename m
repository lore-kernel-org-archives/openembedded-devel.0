Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF13760119
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:09:57 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d184so5300606pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DQs7wA3aeigrRqEHLFTTXD0bTMD+XZYdK5Zbw9H8/MA=;
	b=t1CCsWLtWzYSSvGxaD+676DGcu85TVhskrIl57l4s2Tn0hwqE4T1DtqHMNLnPOtxDw
	BbXiZ955mO/SRcRvoT/zsxEWQqiiPnFBdX2VgAl+JPfuwsSiSgHSB0ybigE1uLOzbE3D
	TcWqTTKYQ1fiQgPvzyzwo8Vmx6GWneByg3cG3d07KnI9FObZUX3BMPRJASGPoX0TG/bZ
	90P53gS/EMD1QVgamb1R8+q3UjWbg/OpgQbcUylBKFm6UUjCo+q4jaLQcvYFXAJhIMuE
	9FJ5eGfHdkW/85FbWFNZTI0GHYXv2ziMBSusFcknVryhTzDIzlw7+WAIBGNKJXEK0Wpc
	pesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DQs7wA3aeigrRqEHLFTTXD0bTMD+XZYdK5Zbw9H8/MA=;
	b=ENB7u+lYultLAgI+EmeF2yq+cWuvtKBX14IHZ6YOSlveHWwqTbgdJhkgG7YMsUulnb
	0GzlfGg17ShYksNWYq7HOSEXXr/kAwi9ByuJnhUtfI7lWQvGKfYa9F+nvh6r/5YchlSE
	VST+KHX1oX59KiXfGh6IWf5w9iiEL8Uhul2h432mTw9Kmv5XNl24PMrWjXpCBGkyyYwY
	aBEkUkc5Q1lB/nHycEIZTLeue5m7/RQ0MR/1yHtHDZxoVaH0K7ZpSp4WoV+R2pmlgQdQ
	gegb9NmNOGWOH9nBoKy5bJZOuVad/CX+zRtUTa/xJki38SK2E0LNsYhUXpzQO1L8HjTX
	dKtA==
X-Gm-Message-State: AOPr4FWs8IRrigsnkT4CjplduxR8dpZSYYoEfIyuK6QqdxlLzXydcteITWuUrv2NcwCvoA==
X-Received: by 10.98.24.78 with SMTP id 75mr15084305pfy.52.1461182997987;
	Wed, 20 Apr 2016 13:09:57 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	127sm35400283pfe.72.2016.04.20.13.09.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 13:09:57 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2016 14:09:53 -0600
Message-Id: <1461182993-22950-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461182993-22950-1-git-send-email-danismostlikely@gmail.com>
References: <1461182993-22950-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-java][PATCH 2/2] openjdk-8: use private libs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2016 20:09:59 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Prevent a non-deterministic run time dependency between openjdk-8
and openjre-8. Without PRIVATE_LIBS, if openjre is built before
openjdk, openjdk might RDEPEND on openjre.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index c68ac42..3189764 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -6,6 +6,15 @@ DEPENDS = "\
     jpeg libpng krb5 libffi fontconfig freetype \
 "
 
+PRIVATE_LIBS = "\
+    libattach.so libawt_headless.so libawt.so libawt_xawt.so libdt_socket.so \
+    libfontmanager.so libhprof.so libinstrument.so libj2gss.so libj2pcsc.so \
+    libj2pkcs11.so libjaas_unix.so libjava_crw_demo.so libjava.so libjawt.so \
+    libjdwp.so libjli.so libjpeg.so libjsdt.so libjsig.so libjvm.so liblcms.so \
+    libmanagement.so libmlib_image.so libnet.so libnio.so libnpt.so libsaproc.so \
+    libsctp.so libsplashscreen.so libsunec.so libunpack.so libverify.so libzip.so \
+"
+
 PACKAGECONFIG ??= "repack"
 PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
-- 
2.8.1


