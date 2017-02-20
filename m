Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 078ED71D97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:38 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so15739787wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ke5JNl8snB9YJNsQhixqmAiznx83aOjMRZQ8gbMvlFs=;
	b=Upyp0RnwVXYC7w2OmBYdJCISRRdUXgWIw+yGxKTiPnhC/ndyFeHTkgqX0DYaLtmI0X
	/wUzGzmstA7kzk8/K7arc/vSNW9iP/UhRkAkCBjHHkiearYCCTUQwkQv71feVxbCaK+K
	NNmjoBvMLcHkiOccLzlty/HBpPhqHx2uJqBvYM7Cto13opyvaTNbwwTzDLNgon2Q45Q2
	y9Jt7fAyJ5tOxPaUHqIG3/JAySJmDmjluIKwoUixp4yGwp1+Eh1h7KgUCAZ6faOcL+a5
	Kvs6XxR3ZJGajo8dbguC6QMxc48b5Ulve1JtoNbqw0/oJFebaWfarCexIgBFAhFQncqd
	DfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ke5JNl8snB9YJNsQhixqmAiznx83aOjMRZQ8gbMvlFs=;
	b=keQLOuY4JO01vrSNcTO1k3xqht0hrhkFEpIGsO6BjgBiO+ewvxxFIuEHRoNTfTIguL
	PJiUIfSoF2MKXvzAlOzzZlVogyITri+0MIg0ZjSn6CAvaI13e8N7gZxV4Hsl/X+z9s5C
	KAqbmJRJqLb/ET3SIWgB/jjHK429UebYsc7ExsxeLSs8dzRNLvdDhQQJ7UGYoITkloyn
	dcdeLNW2Fas4rOmQL2waKxLW+RsgdtpoBigRcDP1BRa5cAYh6lWkAdVTAnpuF2HL0Nyw
	+WnOXOWmKvmTFxpW0zHLqM9KmqKdnhntI8zR3qUhui1ZWMwE4L/vss1YxNxCPEtjDrAW
	xY+w==
X-Gm-Message-State: AMke39nCdXTX9vtNCBiaaaHd2IUxeu0j8XCq6SQNeEdGXtRc5kNMmpNBxvOhKUVvg/kfpA==
X-Received: by 10.28.229.193 with SMTP id c184mr12764216wmh.83.1487614058162; 
	Mon, 20 Feb 2017 10:07:38 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:38 +0100
Message-Id: <20170220180700.29836-23-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 22/44] xfce4-verve-plugin: add dbus-glib-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
index e11c433..5795160 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
+DEPENDS += "dbus-glib-native"
+
 SRC_URI[md5sum] = "ddd0190ae56f6117dbcf9ff2bf5a8cbf"
 SRC_URI[sha256sum] = "a3196f818c7ad57d19cd6581e168fd2b9f96de070246aea70c35ce2e5f9d9c84"
-
-PNBLACKLIST[xfce4-verve-plugin] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130622/"
-- 
2.9.3


