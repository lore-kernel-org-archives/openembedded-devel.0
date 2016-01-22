Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7927316D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 04:47:47 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id w75so40487382oie.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 20:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9COpp44IQM1nnlmXCKBZctWrb66GXMo+yvH36U6f6XQ=;
	b=d9R85qK/DW4XHqt3+lgdPhFjwvnijPTfAYCWQWc9CED+9VIIDxERBRLF3MJWiU+slk
	JfQnoEHiSK/nmwT08WnXygaDG31lIav5SW74Bdx3MdVgMpWVXP/uq9uxEZyPuMMAbBsm
	38nyCg6ZH8WmdudaNvWzz8qnfZAoMTushLVnYkLi2Qq+Xd7ed1TH8eTx80yw1bIga6Wz
	Iwnt5481LQJlpBXhDdOrAM6LIHNhTHhvrqIFJSOv3WaHzyZ8d6X7EW4zkjTZEDUISRo8
	CKCYvFB5Gh07XH++fduXcpH+GyD73C5kP2nDTAmXMj8EyxxgdT99SydAhIMdy/8HsEmZ
	MQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9COpp44IQM1nnlmXCKBZctWrb66GXMo+yvH36U6f6XQ=;
	b=UYXLRxVjyBr3/9XQadfq43AFNTwNOi8gu+W+MYlpHeWE9vDY9A3uff0bkN4cFqwDMe
	JfGVVsdlSHEriDYYw1wHBgrP1N6Mlzhs291dftihACyyPoNhwkrjSUX104k+LK0VF3AM
	u9y5+EsS3gX0u+bQj/vgj1kTHqaxJyT2S6aBLegvfNxSrGAuTKRsNOhIDh35QbFZyAgB
	+hkXxa8367r41SU+WNAEueWlrrXHUiDL6D+rxUAW+i0ZlOHseUkmJMH/mB3lnTnxmsiB
	7/F9WUDHjARj6jwnfnGHFIipOO8Mir0+OUmd722l00VtcqKVDsSfKdEu6DCA0jTYPF/B
	Z1iQ==
X-Gm-Message-State: AG10YORvP4hBRwbFYTPaAAyNaiu71+LNTqEh+v0ipKcpZPmJGYC7Y/67BThxAo4O4n6htA==
X-Received: by 10.202.71.147 with SMTP id u141mr712042oia.45.1453438068014;
	Thu, 21 Jan 2016 20:47:48 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id s7sm2328905obk.17.2016.01.21.20.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 20:47:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jan 2016 20:47:41 -0800
Message-Id: <1453438061-29267-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-multimedia][PATCH] gst-plugins-base: drop obsolete dependency on liboil
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
X-List-Received-Date: Fri, 22 Jan 2016 04:47:48 -0000

liboil was replaced by Orc prior to the gst-plugins-base 0.10.30 release:

  http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=8e4314f0fbfa4957f8e84d46824d10178b106fe6

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index 8afc165..aa6b3a1 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "alsa-lib liboil libogg libvorbis libtheora util-linux tremor glib-2.0-native"
+DEPENDS += "alsa-lib libogg libvorbis libtheora util-linux tremor glib-2.0-native"
 
 SRC_URI += "file://gst-plugins-base-tremor.patch \
             file://configure.ac-fix-subparse-plugin.patch \
-- 
1.9.1


