Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web11.8548.1627145187473930623
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 09:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=Y64jLZjg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627145185; i=@fujitsu.com;
	bh=baj7FPaQkBNzZBP06DLcvVmY9TB8JpX4la0UWcWoo5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Y64jLZjgolVmJVApElO0KmbCj56d+kW2/0UuGdTpa2v0OEtEMfT6SjRtxSnfoNuBx
	 JC2frLF+O99PdH6zz4YGicg/6PBXKv0ATvAhQN2RrTzmnM66tdCDdQyVAK5aQRCMQl
	 PGLFko507XCk1mRrgtZB8VYZT5+zbLFbx4YLzGvA2UBerDj6o7Z1ucJ22OoreL7Bk9
	 ukTEi5I0iawVaDqtTyqzPzWb+QhgWyRbA+8wbJnX+UTzqqNHSrlbzv9WfOHxo+uEPh
	 DimGV+rjrXHDwAQI73J5o8vsHOse463EDKDPIzSMyLLmblzjqgm35cjlkzX469/LnW
	 A4gwROIz/q0tw==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id D8/72-07223-0E34CF06; Sat, 24 Jul 2021 16:46:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8MxVfeB858
  Eg9u3VS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owDB/4wF2zkr5hzu525gfEFbxcjF4eQwGwm
  iZ+HTzNBOCcYJXacmMfaxcjJwSagJjH91g0wW0RAX2Lp7D3MIDazgIrEi9897CC2sICnROPnm
  SxdjBwcLAKqEvfXpIKEeQWcJG6/WQhWIiGgIDHl4XuwVk4BZ4mJt/8wgdhCQDW7LjewQ9QLSp
  yc+YQFYryqRPeRp0wQtrxE89bZzBBzFCVmX25mgbArJGbNamOawCgwC0n7LCTts5C0L2BkXsV
  omVSUmZ5RkpuYmaNraGCga2horGuoa2RkppdYpZuol1qqm5yaV1KUCJTVSywv1iuuzE3OSdHL
  Sy3ZxAgM4JRCxkc7GE+//qB3iFGSg0lJlFfJ+k+CEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleR
  0egnGBRanpqRVpmDjCaYNISHDxKIrzqFkBp3uKCxNzizHSI1ClGY453PxcvYubYPHfpImYhlr
  z8vFQpcd6rTkClAiClGaV5cINgUX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvVZB7eDL
  zSuD2vQI6hQnolFNdP0FOKUlESEk1MNW01IvdquOYyfFtm+Hm+b5bHCYUpBfWbmlNePB0eq3D
  v2hPjrn8EjPWSea0BtZfvqnf+H5Gy+fAf2zcTfu/mdxdJtq/wWqfq9596W9v1RiTtc+mmHXu+
  aYaafd6VtKdbXKynd+6iktWuv0VKLJv5fedu/dh2WnHI+8XfFbbtKzRTzopUi3gbNqJgPZut5
  d7+Y5Pj+S+oVN4rMdi9irOh7dWrRH4lDi7u3el7THBBHf7EsmGlDW7A4/x/5trem72vCj/qBr
  V0Om/dr2dNGf3rsWSux0iPrrobHTYsUd8tUnVgTlrJeZmOD2z373K6EbcxUQnmQlHbe4kS9ha
  7T3+7JdE0/bypc1FwtqXlyZOYldiKc5INNRiLipOBABGfXf/bQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-232.messagelabs.com!1627145184!270051!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8659 invoked from network); 24 Jul 2021 16:46:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jul 2021 16:46:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16OGkIKt021705
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 17:46:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Sat, 24 Jul 2021 17:46:19 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nghttp2: upgrade 1.43.0 -> 1.44.0
Date: Sun, 25 Jul 2021 00:46:05 +0800
Message-ID: <1627145165-12120-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627145165-12120-1-git-send-email-wangmy@fujitsu.com>
References: <1627145165-12120-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

v1.44.0 changelog:

lib: Port new ngtcp2 map implementation
doc: Replace master with main
build: Add precious variables for libev and jemalloc and use JEMALLOC_CFLAGS
build: Add more --with-* configure flags
build: Add LIBTOOL_LDFLAGS configure variable
third-party: Bump llhttp to 6.0.2
src: Replace black-list with block-list
nghttpx: Fix max distance in weight group/address cycle comparison
nghttpx: Set connect_blocker and live_check after shuffling addresses
nghttpx: Replace master with main
nghttpx: Remove trailing white space after $method log variable
(https://github.com/nghttp2/nghttp2/pull/1553)
h2load: Add --rps option
(https://github.com/nghttp2/nghttp2/pull/1559)
h2load: Allow unit in -D option
asio: fix some typos (Patch from Jan Kundr=C3=A1t)
(https://github.com/nghttp2/nghttp2/pull/1550)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.43.0.bb =3D> nghttp2_1.44.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.43.0.bb =3D> nghttp2_1.44.0.bb} (93%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
similarity index 93%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
index 08b8552622..48ba5e314d 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] =3D "f7d54fa6f8aed29f695ca44612136fa2359013547394d5dffeffca9e01a26b0f"
+SRC_URI[sha256sum] =3D "5699473b29941e8dafed10de5c8cb37a3581edf62ba7d04b911ca247d4de3c5d"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] =3D ""
-- 
2.25.1

