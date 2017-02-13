Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12C1171DAD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 21:05:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so345538wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LsfZD6Tc6uKQxX/4TSS187uy6lHiGa4jnr/WGYMwgkk=;
	b=Y4JAyfRIobabBIUZZY/m0lZcP0jywAE0691nMqkYNrnxFRxUBSpzgZ4MfFDFcpo4lj
	QUTJ5Qz3FFsXAB3EqycjPwolrwFUM2zrdT5a9K6QrIKIbj4C3232FO1QJTMw/x6gBq9b
	AyGurpfCNEqsrqdybWP0VTtwSdT+ztwphxUU4eYHJqHZv44PJCPPztMqERIabNYntydU
	twXRkRKsP4bFPaJ/Q0n5u2ftzpTyG/OOXebv6niWg5Ej+zyMbxVX7KVftr5XwItcfRWi
	RYI7F3rLF66+cOG4DRY0WX2sBMhhzCiK8LzgFYjVXgXZgA4TY8oqifM7qlgtOwLfBE5l
	QaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LsfZD6Tc6uKQxX/4TSS187uy6lHiGa4jnr/WGYMwgkk=;
	b=jceq3RE/f3fy85N4ss+YMz1qY9SDDx03KW0+jmUbBJIyi6iExh2M2Hi7DbCSJBk15N
	i2QOM7qZXGxwWbd86GaOzv8TLYIi8ku/nt7vVON7dgn4Wnu6xLVLI8QZq6X4mHoFzjXN
	ziMtw+R2wCzpnYCj0XCI7+7jVvSs4yKc37S6XmoAre9mKq361yPuRuvq0QScKL5LDulU
	S/B04VJDQ1ixCDfom4zlG5howOz9AlmtG8Y9hY7m9CThaAE5QFu6B7Zu5BsTzpObhADf
	Fts4Lp0d3h6cmRWBJkBxGD2G3DkRqXm8HSMxnK9oXufrwpEB7//N3cKvDLGtVcC/aMo/
	UErw==
X-Gm-Message-State: AMke39mfObn3zMYlHk/LW/DiKtW5+PCeTMZAZP0ZjP87RU6qQrEWR7VYX60YcUxC+E+D6A==
X-Received: by 10.28.68.10 with SMTP id r10mr266810wma.68.1487019914595;
	Mon, 13 Feb 2017 13:05:14 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	g11sm12212764wrb.63.2017.02.13.13.05.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 13:05:14 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 22:02:08 +0100
Message-Id: <1487019728-19329-4-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH][master-next 4/4] openlmi-tools: remove blacklist
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
X-List-Received-Date: Mon, 13 Feb 2017 21:05:15 -0000

Build is fixed for bywbem, bywbem-native.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index cc8e829..b23869d 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -21,5 +21,3 @@ do_compile_prepend() {
 do_install_prepend() {
     cd cli
 }
-
-PNBLACKLIST[openlmi-tools] ?= "Depends on blacklisted pywbem"
-- 
2.6.6


