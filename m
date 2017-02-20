Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9359A71D86
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id q39so12811470wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8mHW4RI66OgrAvTioj1Lkm/t1S/4TZjUOjauR8A3Qak=;
	b=KaCAr2DHMMhqUmpAiFa2XlxswTnstCbhzUU2OOohfaiiG7lvYv75FjxhbRiYz715J/
	8mLSVJHw4MdL9QqkhC2+shdP6+P/YAWY6oDBIYRMpyJZSE2wr9l3ti0Ms8Vf1MXb+wVE
	TvN37g43Z9Ul7s88ITPevlcx1yFGy5BPW2UtRkZdzvKbgxWLYMBOjLLH4Z1sW1RjgKIm
	MFNOWXgr0vUcsUuKdyyo5tQ4HLOUj0FDY7H4rFcHryVYBOS5XveUfwxz5wJoYBkZxj1Q
	IOX/MQwZ+Ar9FaTAbus33lvM+0XrZorvAABSzAry0CzARsIivLp6+Mbr9zGHUn/55JiK
	9T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8mHW4RI66OgrAvTioj1Lkm/t1S/4TZjUOjauR8A3Qak=;
	b=BouohCuHOq6Yv4+AL70u9RVbyr4YW9KGDa8KsCEwQ9tNSa0bglHmxTf247Dza2gOEI
	K7DLWD7g6G/fLj17+o3NoE3hxWEpJyaH6plVVI5N5/G1sflLiFtaLqVP92tKJ9dNmvWx
	fpKg1D6Y7IamgRbS+8/Iw8y+6ULGrAH6uk5yW8FMS2ht//27WWOs2PB0Zh75JOSy3uAc
	I68ZjGfI9KpXthQPqWcV8cs+3UYsIcC90K5MwpR5djfyiEbI49ff0vZEd71fNa9tHKB2
	q//knCVQftltto32t52Ure/gcmJ2eYBdVXQxVfP+HDlCDqu35AuF5JHhSEH/m5Lsl+q2
	vg5Q==
X-Gm-Message-State: AMke39mrsDFtMN6cfulgHqvVgSaa76MrBHbOq7PvZtyIyIpL4g072uyiMmFSwXaeqbV8Lg==
X-Received: by 10.223.173.148 with SMTP id w20mr14251936wrc.164.1487614074592; 
	Mon, 20 Feb 2017 10:07:54 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:56 +0100
Message-Id: <20170220180700.29836-41-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 40/44] gst-rtsp: unblacklist - gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
index b31a7ee..b78bcaf 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
@@ -16,5 +16,3 @@ EXTRA_OECONF = "--disable-introspection"
 inherit autotools pythonnative gettext
 
 FILES_${PN}-dev += "${datadir}/vala/vapi/"
-
-PNBLACKLIST[gst-rtsp] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


