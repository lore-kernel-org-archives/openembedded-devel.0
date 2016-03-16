Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 162DA6FF64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:13:36 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p65so1446103wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5QdWDcMqjYqtuPspjOFzKccfqBUgf8j6PI43LGIyky0=;
	b=nLLZaCq8HeClYX7gSIwn+CwlUc1FGo0+d5GtlRhTvl/RTQLOPPTGFV+VUEnAcvG9o/
	891wJqlTjrHa+lcmB3Vm5hReHiTaFdoLhLX28N/v4AevIUACXkLW5bVg9hmdadDX0FWD
	8eQpdoh1dLI27Fm9zvILKnc2MBl8Jg72bv+X02tTQGK06HzUjP5CC8zkGb+eZ+NdQsiP
	BuQA6eGlNYd/SbhuVtgPIZP5VdV9GWwiubQ9ojPrFyjqoeV6gMoD4xUPGfz/VF3rpqCA
	ZG2ki30oxcdb0I6P0t+XVYUTC1YEEYczGBPK77xPZ3fau+xLgZFoFcbcBohJBB4z1lL4
	lbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5QdWDcMqjYqtuPspjOFzKccfqBUgf8j6PI43LGIyky0=;
	b=TYK5wUnoPkXwOGNTZfTwvi08mTFUO2Zz8OLGC8Jm8kxqCkgapU8dOV8elDybtqwslq
	AhtOxPeM3IXrD/+MK1lcTzQrXSplUrd9hZNUPIR2R5jMjxQC3hymsVJ9Zoos1TMbAXlc
	CmdMQTjYq+UVC9toNDuyKFKnCIkB6frQr0or7sVklvSlTASg2alXMBu2a+EBQSmNL3nZ
	rHWGTP9urghn38P+mmSr8ET0sMqMcpfBn9PJUwKQzZ9SXsx2viWCi06tbYGEr1w5+F0I
	R+Pm0YzKr5j3KouFMKIods6zjREx/FE8M/jSVevf3E3QxnJdll/UA1Ii0bAZ/8sED4si
	0rAA==
X-Gm-Message-State: AD7BkJJ3dovLOVK9LoJoUX8ixQ6+KKrjexBb53gplZcZgqxTYjBTalX/o/SidzrQNWxV2A==
X-Received: by 10.28.222.67 with SMTP id v64mr11217764wmg.14.1458166416626;
	Wed, 16 Mar 2016 15:13:36 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F57.dip0.t-ipconnect.de.
	[79.223.15.87]) by smtp.googlemail.com with ESMTPSA id
	h7sm27297646wmf.9.2016.03.16.15.13.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 15:13:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2016 23:13:21 +0100
Message-Id: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/2] gnome-bluetooth: fix compile
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
X-List-Received-Date: Wed, 16 Mar 2016 22:13:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes error series starting with
| Caught exception: <type 'exceptions.TypeError'> TypeError('expected a string or other character buffer object',)
| > /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py(22)<module>()
| -> PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index 77e9a15..d64346e 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -18,3 +18,9 @@ SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
 SRC_URI[archive.sha256sum] = "d8df073c331df0f97261869fb77ffcdbf4e3e4eaf460d3c3ed2b16e03d9c5398"
 
 FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
+
+# required for python binding
+export HOST_SYS
+export BUILD_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
-- 
2.5.0


