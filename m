Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 63D236BA4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:31:16 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p57so1807642wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=1EIgkp2xJ5nKuxG3Hb47u8u3baarzQK3iey2/6o1tqQ=;
	b=jMHrP4JHEdAzyOVr6XBYC3c4SNSrHbiJwAvpGRtTGpVLI3Q1VnJi0o/mfi6EwcL+3/
	iCikvfSLnwKsTfCiKD/cIM61JPWmszq6ghZdNhvhX8krh1LvoqrQXB0NjA8yD7pTnhcn
	VP74NLg6vYnkQYRW33ibXsMQDf1i7wCElagSrxroBASDdIO8dPX03baB6JYwr4tuCrq0
	j2efi8XDuaz4DP0Cf0Y9GYrMn7jdCZxjPijMewW6oQLTPEhfRl/ERjF4DIRLfedQM2ik
	OC2pFerjQcWn/KbOxzpLA6s3gLxRwaUpBi4Ic0HPK94c0X+jRPfmvbtKIayPQi7oXGHc
	N/pA==
X-Gm-Message-State: ALoCoQmAFJPw4khUHvd/lQyJngSPRL7TDa4vrg9wv1a+C4RtqzZgJYyYpzoAYHNoZ4Kc+gPZEQEN
X-Received: by 10.180.109.167 with SMTP id ht7mr10686617wib.45.1377192676525; 
	Thu, 22 Aug 2013 10:31:16 -0700 (PDT)
Received: from lpapp@archlinux.us ([212.44.19.228])
	by mx.google.com with ESMTPSA id
	gg10sm18367056wib.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 10:31:15 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Thu, 22 Aug 2013 18:28:59 +0100
From: "root@myhostname" <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2013 18:28:57 +0100
Message-Id: <1377192537-9770-1-git-send-email-root@pol-lx-007.polatis.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-networking][PATCH] stunnel: Add 4.56 version
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
X-List-Received-Date: Thu, 22 Aug 2013 17:31:17 -0000

From: Laszlo Papp <lpapp@kde.org>

---
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.56.bb

diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
new file mode 100644
index 0000000..21fa436
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
@@ -0,0 +1,14 @@
+SUMMARY = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
+DEPENDS = "openssl"
+
+SRC_URI = "https://www.stunnel.org/downloads/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
+SRC_URI[sha256sum] = "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
+
+inherit autotools
+
+EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
-- 
1.8.3.4


