Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0DA6011C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 06:16:59 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id y1so5842543pgk.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 22:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P+f3Idjc/1bzF9SPn4hncS1TAH063CTqm33KqwMo/6c=;
	b=cCToicw0I/S7q0SOQN/OUxhlyUucVY8beoBftcE9zR4Tz5ze10ee/qmUlgqm7EQytv
	bPoihfBEQOo/rgKiLb8W65wzHn7zXk/cXLOLBBp8ny5Ivcqury7ptraT0oDVq7i9ken+
	HRDGUdPwptLC9NkiJTUJ9hmxGBxyuMlL1Rz3o7Np1U4Zloc5+MNONR01IBNYUfu0/0W+
	w2lR3qmF4ZXfkaCesqQxZgtJ+FLDRh9/PTbRYhaVO8slIn53utYsRZtoN1236ubId+ix
	ErHJLe61F1Ufb2VKPeNdA8uKBFrzKDvBsN5QEzDZgR3odNh+6VXVP7lGYjLAB37J1PRp
	TM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P+f3Idjc/1bzF9SPn4hncS1TAH063CTqm33KqwMo/6c=;
	b=avNha8Eckg8TxN864Mhqw/Ia68xjCE/yHyZkuEyp2WsM4M96YqQhJtL+oLUCa89BIY
	rLABaAV2UkrpvhCn1hpENG59xbD2zNpI/x8+XKFV//tAjljl/+q8o2adBPiYTEAEBDHc
	gOQ0Ry859vxAmq0hpqjXiyHRrXo7H5XhLcgNrzM9p8nFefIoE/mYG2v5hZSJm9qtsM74
	0cIjs+jWoY6kLtuoP+MCC6fSJfXz4OO/kYlHaGOIMn0YEKZ599elh79wMP56WxkwJr8B
	GvX46CdOAK95SVf9M3/voAMzdeAdSAnwV0+EXSAAL3foqNbkFZr5AQmHJH3cM5uCSKPF
	FKQw==
X-Gm-Message-State: AHQUAuZ+d5CQ9N/CSB6PZhaHDASzrMlSsyq497ESsWM/u3o+cvhmlPTT
	8Bs65xPGpnqi17logepG+Dk5ogr8
X-Google-Smtp-Source: AHgI3IYxcAxQBrdOC7S/ZDy5x1QEhFjTftEpAz1WAVu7ultR5Vbp+AN2Tyd+8+iajUYqorPstDu/aw==
X-Received: by 2002:a65:4101:: with SMTP id w1mr8952639pgp.257.1550297820103; 
	Fri, 15 Feb 2019 22:17:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id 62sm8395279pgc.61.2019.02.15.22.16.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 22:16:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2019 22:16:53 -0800
Message-Id: <20190216061653.19586-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] snort: Strip out DEBUG_PREFIX_MAP options and --sysroot
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
X-List-Received-Date: Sat, 16 Feb 2019 06:16:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Consider -fmacro-prefix-map independently

 meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
index a99138d3d4..c2eb95fe73 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
@@ -72,7 +72,7 @@ do_install_append() {
     mkdir -p ${D}${localstatedir}/log/snort
     install -d ${D}/var/log/snort
 
-    sed -i 's/-fdebug-prefix-map[^ ]*//g; s#${STAGING_DIR_TARGET}##g' ${D}${libdir}/pkgconfig/*.pc
+    sed -i -e 's|-fdebug-prefix-map[^ ]*||g; s|-fmacro-prefix-map[^ ]*||g; s|${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
 }
 
 FILES_${PN} += " \
-- 
2.20.1


