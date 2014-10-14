Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0B171919
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:50 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so27500wgg.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=rVfwM+PGSWbYEHL8+tN24J4n87OBCwe+e9i9MVc8oOQ=;
	b=GV6Jlx4JfI4uElKsuvYvJbOw8QNIalzzZMesPgWmGIYk8VkHl7puJlOuR7f3VmFBO8
	v1a1FwZQwKlm9JvrcD3yjbPeXoPGwZNq+69UhXfNwruztcpC4ecOk/Rxha79wsewXSu3
	lPNRxuV1xlFKVYtdrMQyrR1lJCBFP0UroznpOKJi2QK0utAZUjyR7wO9dlnhl0/Dmsif
	Ss6n5Kalxm/MmkQAhABPE2pAk352XXpz9BgSR/wo7L2Cq+bjQ1yNMfsi+b6yQLYI/rvT
	Bsh5Oin7TDS5yFZUC0WZLIGJUjt/8Bxr+nlzrhPHtruc4aWEy8u90cfXH0pPwxVLGXuB
	YWDg==
X-Received: by 10.194.2.168 with SMTP id 8mr8365258wjv.78.1413324891984;
	Tue, 14 Oct 2014 15:14:51 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:25 +0200
Message-Id: <1413324868-11856-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/15] tumbler: make build deterministic by adding PACKAGECONFIG for gstreamer-thumbnailer
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* disabled by default
* fixes:
  | tumbler-0.1.30: tumbler rdepends on gstreamer1.0, but it isn't a build dependency? [build-deps]
  | tumbler-0.1.30: tumbler rdepends on libgsttag-1.0, but it isn't a build dependency? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
index 9f361e9..5359545 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
@@ -17,6 +17,9 @@ do_install_append() {
     ln -sf ${libdir}/tumbler-1/plugins/cache/tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumbler-cache-plugin.so
 }
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
+
 FILES_${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
-- 
1.8.3.1


