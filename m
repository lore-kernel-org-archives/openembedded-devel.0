Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD4F7842B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 12:32:01 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 33so25355604wrz.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=fbS8NDH0tasSRHI3QKmZCaYpBsecWoKHpNP5NUpfvp0=;
	b=kFFqgxuKfSzYll0ZDMbaAaGsCiJ55vU/Jl+9zcpktpkqlMOEcATgyhjP+OF/Igpj3o
	z6Jkx2Frn+8zNY6tiVls3ydrARDibBC7lD6dMXGwsArXLvYx9mYCRoyT4/welYvfXXzp
	NaI9xFzNo1OZaZiq9n85zkWiH3/95mxY321jCQW1U0kOYiLzUeNUaysjGkHVQGQ9exKS
	smQ5fgnQfFWdvq/JMAwQAAAE072vr+hV7CSR+88JIYiurGp8t3SBlSOWUkjyw1qnpisW
	xEbQE7ko5FYIk8s7i5kQoBJY9xmSMDFhTS0bBvFuXVWHwQaeS9/WPX3rDPjDBPTRbWKT
	vmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fbS8NDH0tasSRHI3QKmZCaYpBsecWoKHpNP5NUpfvp0=;
	b=KIJNGV2EbT+6yTjC2ODCT5Oqu8FRpuC8TezpGDyLEfS1vCyZebGVdgfh2fONzRxu5w
	C5YIcnOln15EAWiVifkhEuGfOTvl3D5JvnwtbgtCxpAZG5U5r2dDaW3gP+x+xihClxuk
	djfYxMhwUpTHtZCxoV4LL8V+zFwyTHwS98EsXHDDUcDdHrJzORXDv9FWjeSic+emTLWN
	wn9r9+7Q7pp+Sa8RXokY1XCjUplXgbyyqP7s+dSY3FN/afbwPKlJfOxLapbxnnOhoJ0/
	E/yloD8TJRQcdGuvLLfIPTsbj4/nFiGkuQ+KwvycQj/oUFqReMw0dM6Mjkem/++v3V0Q
	FnIA==
X-Gm-Message-State: AIVw111hB9psW08lQXI9TYgumgZ6IPKMflvoIhIWRXMb38y7fr8ZFCF/
	Bus65r9GQTqx8pVu9xM=
X-Received: by 10.223.172.137 with SMTP id o9mr5810740wrc.275.1500640322174;
	Fri, 21 Jul 2017 05:32:02 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l46sm9396882wrl.15.2017.07.21.05.32.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jul 2017 05:32:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 13:31:59 +0100
Message-Id: <20170721123159.30696-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meson: set needs_exe_wrapper
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
X-List-Received-Date: Fri, 21 Jul 2017 12:32:02 -0000

Tell Meson that even if it looks like the architectures are compatible, not to
bother executing binaries: differences in tunes, C libraries and so on mean
binaries may not work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 7eeff4210..a09bc240d 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -65,6 +65,7 @@ readelf = '${HOST_PREFIX}readelf'
 pkgconfig = 'pkg-config'
 
 [properties]
+needs_exe_wrapper = true
 c_args = [${@meson_array('MESON_C_ARGS', d)}]
 c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
 cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
-- 
2.11.0


