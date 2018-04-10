Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id D33D774933
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:39 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id e22-v6so4463956plj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kkbO57DECDoBf+bySJ/TsTu6/viqsHxobvqcH0tCM2g=;
	b=oFHmUWhU4+HL7b3jMA4S+plQPs0VriLq90Dkyae6S0SSPkTk8A3HqL+bhR24O9X0fd
	1+gl0Eb86VSwCEV0BTkw3Sgy5soBgpv5LG5v9zrSsc11KGhPwGfdUsQv+7zfJrwxBqI4
	akzueJJ9GdbVgHJrXnCCAstwZM8Zjl1QBYyJRbEekb1h6ImB9BvHC5xt6Rekw7Onhz9O
	kzhrMGpiagXqdGQNDSZMuO2m0tr+3+1C+Gl0BwhxIEo7rWTvZGbNmXMYdzHZvczbjj9I
	QOFbI7wtr20iK6yMuao3yCUvka2KVDlIC52u124KUiDl+KX9NE6lzQGMsGlMMY7Or6E3
	Ravg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kkbO57DECDoBf+bySJ/TsTu6/viqsHxobvqcH0tCM2g=;
	b=tEw37kapS5z46wHY6Ug3rclgFtkd4A5uwOratDNLTLHHTWIYkxIQycl1If2j0QrgRV
	U0AiIWC9mhvxS89tZ/OZK9iY8kFbachqp22XPPXNHInuDFgS4bM8I4AOOZINhxhgZQDP
	QLgBZHuwB/Z6XyPCkWVapXaNLpRX/W52s4KWHXfQs0H4ABvSWB8UMKN72aIGf+qEfRVu
	gsrRMCZb5mgMfLOe7Mi0rpd/1Je6fJJ7ntJ7AmeFb62riB8Sm9SvYuavsilmwb+LIQNR
	xcUwMjBENPSjWBInu8dBteGPDE9bNzy7CJuynkeVCh9MzWbqMghHSLHSvLPysHyhHhzM
	jBCw==
X-Gm-Message-State: AElRT7G97+jTp/jfrY3st9C5ZlYzOw/GB/RVqsVPC70IisfF21el4vlE
	w98rNwsZitI2GTsymN40wYUcEA==
X-Google-Smtp-Source: AIpwx4+s6Hhsi23ceicD3+94LFY30VA4Hz9+h95LdfBfTO18SYaOjXK65QZ0EWP6X56Y0oValIP6aw==
X-Received: by 2002:a17:902:8a94:: with SMTP id
	p20-v6mr40804518plo.94.1523319760627; 
	Mon, 09 Apr 2018 17:22:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:28 -0700
Message-Id: <1523319756-8431-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 02/10] imsettings: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:39 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
index c00b193..8f622bf 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
@@ -7,7 +7,9 @@ This package contains the core DBus services and some utilities."
 HOMEPAGE = "http://code.google.com/p/imsettings/"
 SECTION = "Applications/System"
 
-inherit autotools gtk-doc gobject-introspection
+inherit autotools gtk-doc gobject-introspection distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
            "
-- 
2.7.4


