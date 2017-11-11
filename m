Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 96D357863B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:11 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 9so1935786wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DVrfzYv7XYL2Y+N34sB77d61ANmpqQ+o10aJjQqcAsw=;
	b=THCW4IUJPLTfVBFNQ1GxZP01IBdBHIIq1WnBYqhFZS39W0DvR/hhWoXt2XDYsQyULG
	lZWPduLsLRkrh3x01nemd5zG5Df2R0ngibvjElPiqGKECRolfPoDhSclRZMyvutDW6ep
	yEm4l5xm9h9lcyJ7Fjr0P7g0D2G1pPzjvhZ5aaFayuwOx20L8MfxWtwRjaR3YdqDB/QL
	zuO0EZNUZ0AJovVMyFLdeLOKSOFeFRVBSFnqEKFz5itIWIOXQEXfTQn5PbOPinQVw9Mm
	pege4T29nmgX3uBB0AZIyw7TxMDaMnyuhXUYY5EiBoWD3BBCBOpNj5eLYnBb8h2q/5iH
	gq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DVrfzYv7XYL2Y+N34sB77d61ANmpqQ+o10aJjQqcAsw=;
	b=AquexBUpqy7zvSxlk162gdQEUV36d9hZSthnw3BNzKQhndNysVi5w96itI1T21lCO/
	3FNzOrbtpkSFzfLyZnJi4FqxDM96zM3/4oJr+ORHlEb35Vixw2xgEBqXg7ZenizzZ3IN
	9Vtl2mj9IY4hbtZmrH73NxxckzGcM+gR/aJsWhjmjUs1UF9AVlmfXl/TjPhHJ+T/AY/u
	mT5ZMpIi10UQpB4B7mOkl2L65OQtqu4J/mMWzf+GHHbd3WRSCpPfxr8qBKQ4XflB0E3f
	OqeyKQGHPEt4mNFLuuV4Ul5Lm6GEmplpCeQsSccQxiQHHEBgok5IKmVWId18SO86cfPC
	uo3Q==
X-Gm-Message-State: AJaThX6C8A8QjyFg684egcIz9q0j5hPAJdSlA7ctsw2NgTEiqB/HfeTH
	QNEUrRLReqTJi/gbXAEj0ajF1Q==
X-Google-Smtp-Source: AGs4zMaGyF9q9Q0ZzjTiKEs3TrDsh/r2sAQJdPouN4AfTl1STX0UPxrPq5efD93Yj316i5bApd2Wlg==
X-Received: by 10.28.101.4 with SMTP id z4mr2673260wmb.77.1510407012713;
	Sat, 11 Nov 2017 05:30:12 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:47 +0100
Message-Id: <20171111132950.12570-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 10/13] tumbler: ensure thumbnails work properly
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

After some builds link tumbler-cache-plugin.so is not prperly created causing:
| Failed to load the cache plugin "tumbler-cache-plugin.so": /usr/lib/tumbler-1/plugins/cache/tumbler-cache-plugin.so: cannot open shared object file: No such file or directory

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
index 1f5419a..1786eff 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
@@ -15,6 +15,12 @@ INSANE_SKIP_${PN} = "dev-so"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
 
+do_install_append() {
+    # Makefile seems to race on creation of symlink. So ensure creation here
+    # until fixed properly
+    ln -sf tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumbler-cache-plugin.so
+}
+
 FILES_${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
-- 
2.9.5


