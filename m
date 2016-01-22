Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2620A6E64A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 14:47:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u188so18226140wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 06:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=AM0alaHOFBiEBJUhaoMW+RZMn0/ljEtasQNpoRaRYyQ=;
	b=RD8e6pMnlscXzNTDf4Ts+hN2raOPMppf/Fzyo/WgcnRZdMBHq5eTDn+A49y4RwvltC
	YxQjqOuo/8wQknEzfMuNZXZ/lwdLP2tVYqo0Yr14FjBK+fL+Dq6eq6ZNwc6MEt2wZeBN
	3s9aNQeqrpMUK2lt/ouzFvhAR0msnEuX0M6Ss=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=AM0alaHOFBiEBJUhaoMW+RZMn0/ljEtasQNpoRaRYyQ=;
	b=X4cK0ibF48e1W6yUwW7Rsd/UPn72ltTuTs31rQ3Hh351PI0JGiGVCQU5BjE2HX+faX
	SypxjAUzLatFppghaJEsQzkVgegF4CMegGWsm2xmqb7lEXH0rfggCOjtSZnFs1uMn3Jb
	O3do2PiYGsecB2XR2H2Gzes/jcZ3Ek18oh+ECAWpQUVxdv/e1bBzVwLmWKRDYtUutBkc
	7i5d+6xQR85vru7oB1592gV6OLT1l1fc97JR8YOSRmSef7y0Y4zm5+f7txcAs0/CV0aK
	bb47EIQYl9RF1CIDT06b8VhoLpSxKaiLmZArHyHFhq5OCrjqiyAM/86Qkqq1rx7NlakG
	L6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=AM0alaHOFBiEBJUhaoMW+RZMn0/ljEtasQNpoRaRYyQ=;
	b=ciOwsWzUYFHR4pQDpGLBcHkeA8gPT4CgjfmiFsDZdgZ3PcO/SeCx6tqi8Kk/A7u8U0
	6CoEvO01jcMBeZsunuC61ucBHCITBLt8k+SsGKATUz6LHAeZ3XkDxdx+sbx7/SvsseKE
	kSHs6onJz7TqhISxs6FZYe3v2kRBYygIKD8LiQU3CEDncdWZU9wVpkjgM6nFepnpr6IE
	sAVw08unFThHPS8z3eMFHtPnPQBA1ef1GW/TfBjk5I5PPJUPthrSaQ+7HHbEr3SZS7tV
	onncPbRm6AYVTijqxx/6rLENDI7NQdaZuUelgwGxnF6D6SFvKSMHB0pDchAHI3aWI6BN
	5iMg==
X-Gm-Message-State: AG10YORKqZDU4/bwxv33Lf3ws5jPoycROvqtDPMIE/tBjnJrO8hIxNZMoyv+0CWg+1+JLA==
X-Received: by 10.194.123.8 with SMTP id lw8mr3558005wjb.72.1453474049001;
	Fri, 22 Jan 2016 06:47:29 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-69-63.w109-218.abo.wanadoo.fr. [109.218.244.63])
	by smtp.gmail.com with ESMTPSA id
	g187sm3244247wmf.8.2016.01.22.06.47.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 06:47:28 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org 
Date: Fri, 22 Jan 2016 15:51:11 +0100
Message-Id: <1453474271-26539-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: [PATCH 1/2][meta-multimedia] gupnp: Update to 0.20.14
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
X-List-Received-Date: Fri, 22 Jan 2016 14:47:32 -0000

From: Manuel Bachmann <mbc@iot.bzh>

Update to latest version (required for latest Rygel).

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb |    8 --------
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
deleted file mode 100644
index c8c6164..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gupnp.inc
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c01aa6d3a78792b3a24591f036dd91f4"
-SRC_URI[sha256sum] = "205d47b950a1b7190df1115f454cb38a44d71aacfec75d4287299e400e139b69"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
new file mode 100644
index 0000000..ed07175
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "63346ef90ac5cd925c3a941f51d8bca6"
+SRC_URI[sha256sum] = "77ffb940ba77c4a6426d09d41004c75d92652dcbde86c84ac1c847dbd9ad59bd"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
1.7.10.4


