Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF307C0AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:35:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m1so5520703wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=L9qnsrRWLEO9HJ7prD6qbnkNvO4HjzIEWp5ncV1s9NE=;
	b=RaHzwHmrJtSHvwj2EsZC/BmCIg3RPNrYq3NZTHJ2zqP+MoLPw33sqIR9JCX/z9p8Fw
	bELAL0R2KaQ4go/FpMZgAJLtglR+BWzYcBSwmWYtewnbLejehV6aUE5ftozR5gFPvoyn
	A9B1LXoRz2MMxc5vTVUxYO5m9MyivcoUI44d4SHEq4MjLgKVfemF+hTSBH7ZFXGplKql
	ZGZlxmy8odO/kCtIwKSOLiBtZmRmfhNmDWcsZkMfQoNP+6vwIgtas7JvGndOv/8QU639
	FATkizTOGzpOJA1Dbp5x7n8tq/8tESf1XGaszV5CWslcJrGxGPaXnddKrHB5/yP9lZg3
	9yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=L9qnsrRWLEO9HJ7prD6qbnkNvO4HjzIEWp5ncV1s9NE=;
	b=nCW4qctzWHyFvx1BNhHfZsKK6fZde3K+AN08YX6TT08T2wLVCfILYqb/gkY0szSVe7
	GCYI8rdIG2hpnzHKVqkdk9U9OxKxiJKyiaODSHp/2e/yXoU7FDqeptQ7d4W0EdF533Mf
	D2xODy23OX+0iO3ArwKomwArVBIDf5UMKRqFikCH4GqSE++9/ISqr95u71jVp87OjgBS
	JcJieBTwz6CNkVBqUcjoB71nZSxAaJ0pYRGB+cXDPr623Jg65t1+5nMor/ZbzfqmTLO6
	jvRyGWyLPirra245jNH+fakKPcwN2de3StWgHDQx0cFp36SwDBW0Feubm6DD6W3Dn7cP
	qHlQ==
X-Gm-Message-State: AHQUAua6IHVtuMZhO8Sh/xF13JExUlJG13ycAe4UNR+r7FUQ7r7387Z8
	TiahOjAJEyqQw3gP59kb5GAc0GkF
X-Google-Smtp-Source: AHgI3IbePHibXSGR14S9L2SCgTdRKCXoiPFI/zMxmN00GFktlID0f4S3eGY3qJQvCvshXAZVog1Dzw==
X-Received: by 2002:a1c:9e94:: with SMTP id h142mr1824244wme.4.1550136948917; 
	Thu, 14 Feb 2019 01:35:48 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id e6sm1258232wrt.14.2019.02.14.01.35.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Feb 2019 01:35:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2019 10:35:31 +0100
Message-Id: <20190214093534.10835-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214093534.10835-1-schnitzeltony@gmail.com>
References: <20190214093534.10835-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] jack: Add packageconfig for dbus add files generated to jack-server package
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
X-List-Received-Date: Thu, 14 Feb 2019 09:35:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 52559cb36..4fc9d12b6 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -25,6 +25,8 @@ inherit waf pkgconfig
 
 PACKAGECONFIG ??= "alsa"
 PACKAGECONFIG[alsa] = "--alsa=yes,--alsa=no,alsa-lib"
+# --dbus only stops building jackd -> add --classic
+PACKAGECONFIG[dbus] = "--dbus --classic,,dbus"
 PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
 
 # portaudio is for windows builds only
@@ -35,6 +37,11 @@ PACKAGES =+ "libjack jack-server jack-utils"
 RDEPENDS_jack-dev_remove = "${PN} (= ${EXTENDPKGV})"
 
 FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
-FILES_jack-server = "${bindir}/jackd"
+FILES_jack-server = " \
+    ${datadir}/dbus-1/services \
+    ${bindir}/jackdbus \
+    ${bindir}/jackd \
+"
 FILES_jack-utils = "${bindir}/*"
+
 FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/* "
-- 
2.20.1


