Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE4660AE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 19:37:00 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u68so4577410pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RpqLoI2w7yaExdciXXGf5y196fzAde1/I3HbLwbV/P4=;
	b=Zw2lz8OSLb5GMgGn8cR4XOFtE/DJgJOFDvN648xWkiy34EI04SZynNonKZDAfJjD7g
	adngyNLtvflt+pbaej/wR+ZTq9cSBoeTprWwXsJpQlGRgjxlj5zAzIwFsJ5XPhgxv2Yi
	fGwdBTjmHI6iqGmlgXBd0CF0RxB4dOgTawaGQFaLg37tqpLpD8I4SEE9jURSkCH4fnx2
	bQ1MN1BmnCHNQMWIXrPRJ7cuYMUqmyIsfhushtXYmlcuUR4OnxeHHZXGH0QkKMawuFwV
	qDkYXhnm6y80Jq7NleXyQflEPM4x/Owbea4EvwldkDoKMx/AueQ7MUwYNp9uxwA9pbPD
	3IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RpqLoI2w7yaExdciXXGf5y196fzAde1/I3HbLwbV/P4=;
	b=He4jSfPwtkqJ1Sjt+kcFWmhI90ak7M0Rmx5N1NZONJII/1dmW/NOra+4gJeIv0lewd
	vAVKodoMwmf0OwzGgrMojmNjOsnB0buu2bnvWqbzZkzQXFWhRTdkAr8nVg4P1iI/IYCE
	Gv75YdcVS9KEls6R4oobQFngaUOVx12eAO6CeGJVg7AuNg8rE9WcyHJZ2oXASDJoFysU
	1UnksYchjoZ0xDkNPCb5datu2Nhm3yi5gQbqDagp7zqeuymdKQNi6zzN9H5asFuCuUc0
	Gt5Ik692freXx1ICOQ9IyI83/ipG2p4VZDhjt2VqXkZh5oM/ILR0mthoPR9A3cwy5ryT
	4a4w==
X-Gm-Message-State: ANhLgQ246nLXx3Yqw2IrqQp+BKy9xxhLWkQ5QjIlAhVyBhAoQiuEybet
	pjwJibGoFQKt9S+KlrUwmRz5avMcinU=
X-Google-Smtp-Source: ADFU+vv+4ZJ9vW7pd+0lRDS6WLg34+swPE78+XtqXBl+mBFl6twS5hAz5ZkCOrgs6Bj4s3E5adb/hQ==
X-Received: by 2002:aa7:9f51:: with SMTP id h17mr17936255pfr.206.1583782620604;
	Mon, 09 Mar 2020 12:37:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	s11sm16221436pfh.7.2020.03.09.12.36.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 12:37:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2020 12:37:08 -0700
Message-Id: <20200309193712.1028142-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/5] wireshark: Inherit mime and mime-xdg
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
X-List-Received-Date: Mon, 09 Mar 2020 19:37:01 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: package contains mime types but does not inherit mime: wireshark path '/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/wireshark/1_3.2.2-r0/packages-split/wireshark/usr/share/mime/packages/wireshark.xml' [mime]
ERROR: QA Issue: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: wireshark path '/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/wireshark/1_3.2.2-r0/packages-split/wireshark/usr/share/applications/wireshark.desktop' [mime-xdg]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
index b2bcf5fd96..91a7e1a36d 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "5f5923ef4c3fee370ed0ca1bb324f37c246015eba4a7e74ab95d9208fe
 
 PE = "1"
 
-inherit cmake pkgconfig python3native perlnative upstream-version-is-even
+inherit cmake pkgconfig python3native perlnative upstream-version-is-even mime mime-xdg
 
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5 plugins', '', d)}"
 
-- 
2.25.1


