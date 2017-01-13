Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 407FB60069
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 00:40:56 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 189so21207763pfu.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 16:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fWrg0O/uShJRe+PdYXKZUL9kFj2/envxbPwqUSOU0+s=;
	b=VkZZx/sML39m9O62ZzdX+7xXkYQyTaT3cicCAg5C9f632mlRn0Bew6Xn1GhuYB2P6z
	ohrT0Gf51AR8RBXDXBsd1KY2T7BvP5GVK4JX1u1DDcXoS8MnsR8eVl9aySjKMTvlfUDG
	NHmNslOjCIDTZP+XWjQGHala+WXlU+9kGN6Ez4cUMzcSLxVQjieFaci+Ja/q28xHK2lC
	t+RdE1PoH1W4zjxzrZLCUncr/t8uJgx+HvXOdQxk715ulEpwXJUMsyFBBzAVOn7oupFU
	fA/YITPS/1jsg/xxLb1PSVlSHfnmnn+sW8Z8fIPEaod5ausuQI9pa/7BpwbjTSIqCKeY
	54Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fWrg0O/uShJRe+PdYXKZUL9kFj2/envxbPwqUSOU0+s=;
	b=iF3xqp1FDD8yCZpUinT0PqSfTxT9CsqAGTjm40UXzQVUJMpNkMM3Dk/FAjt34tjYAB
	7onFNQS4nWtpN5m073FiAu8FoL+fbVPaXNbpVTq6Z7IVd/nV3wIla9ZSt0Ru/yjok+NU
	z6KAgpqDP1pTVuOb6hKh9rAc8xF+NFoAoTRbx7IGpZsl+3hTmhkx5tJdiKmp3jl5OQro
	gP9KN+7qXj944TPIDEvt/QgLdQPpU1W7WVuThmSeTTBWOgvp+QDRKn2quEC3rhHyUC9x
	dianxRvZGNad0IQACyIv79Z+spGvOkXRzVjBakgw/6xpXdVB9LmBkNF7wACihVd1z4Hj
	HtJg==
X-Gm-Message-State: AIkVDXJdnMEK2plLjXGcaPjYYe/hr2vPRMw8F6bkiGIj7INNgO7m3kXgifDmIVKdU1giBQ==
X-Received: by 10.84.132.129 with SMTP id e1mr25482551ple.167.1484268057231;
	Thu, 12 Jan 2017 16:40:57 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	16sm24261658pfk.54.2017.01.12.16.40.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Jan 2017 16:40:56 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2017 16:40:50 -0800
Message-Id: <1484268050-23566-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] syslog-ng: drop obsolete pcre PACKAGECONFIG option
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
X-List-Received-Date: Fri, 13 Jan 2017 00:40:58 -0000

pcre is a hard dependency from syslog-ng 3.6 onwards.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 4a66272..21d1748 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -48,7 +48,6 @@ PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl,openssl,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
 PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
-PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre,"
 PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
 PACKAGECONFIG[libnet] = "--enable-libnet --with-libnet=${STAGING_BINDIR_CROSS},--disable-libnet,libnet,"
 PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
-- 
1.9.1


