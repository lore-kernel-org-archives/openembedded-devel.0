Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34E7D6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 20:22:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p197so3469875wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RPtOaKC4Q+IHwIRJmk08JcilUCfSzUAqTej8o+4P+Sc=;
	b=Ie5Z9AV3UXZpQVdEPhifVKhovwPcKEcXYGHt2zKWsD3yskTvir/B7qHHuPQrjEUZ60
	nhu0GT801PLCZC6UTJExFFkKt0Nt5N/tnBTzb3D3JpAenTgGyXXzxohdqsBcIfTyt1p1
	Xe2q+FcwC1LCRtbpKIxvK3AHlFGZeQwARkrC6JMV9jGDAtCHCOj7ndkFifsl96YX5NVU
	/SRS3LHIW2jmM71RUn2/x8i8DY/p/Vg4jhGHHIjh5krsLQr0mlWNgpDX6NFeO0kHHy+M
	XC97hCqQrCkWcE5s3EioRAcI8HTVSvOwWcqM4HyUr/FHRtjm4Ox6gFDOlp9jQhtuZTaP
	CBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RPtOaKC4Q+IHwIRJmk08JcilUCfSzUAqTej8o+4P+Sc=;
	b=dXvNg1JtupnP7p2GUai3wxayetQ5cB4ccDuzJ7K/yeo2sKnS7UByCEvhkUqXnHgW86
	fXniYgMTBDILK+hEeRrCd+rtXXV57fdn2NjA6EQ88BYZ+EP486AqpfbXBYQAXSUO+SrZ
	SYACfKh+SI1EIKWqewWv3An15lExRnOC7FP0SXdde8vPH3GuOHjUFbleTxrnD5f8pEyU
	/VvkeEKLLnRd0wDQcl/Ib1Ns8Z46iKpM1RP6HuD74z9Swv9wguxksipnZ5E77uXb1zRm
	qEvjjLuFaOjRD+Yq0z9qvUNPbC+Vopo8HjX1p66VRKQ9PEt/7LS7xfCCO4/UCT+A2FMG
	7a+w==
X-Gm-Message-State: AA6/9Rl7jBNSbssBr99/al33rGvihd5NiSC7IEt4It96KLbmzOOUjw170ghDGljXrLD/OQ==
X-Received: by 10.28.113.80 with SMTP id m77mr5739471wmc.18.1475266965621;
	Fri, 30 Sep 2016 13:22:45 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D54.dip0.t-ipconnect.de.
	[79.223.13.84]) by smtp.googlemail.com with ESMTPSA id
	w138sm6111590wmd.1.2016.09.30.13.22.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 13:22:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 22:22:31 +0200
Message-Id: <1475266951-25848-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1475266951-25848-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475266951-25848-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mpd: disable automatic start at boot - service is activated on demand by socket
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
X-List-Received-Date: Fri, 30 Sep 2016 20:22:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
index 5c574c1..0fed867 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
@@ -53,7 +53,7 @@ do_install_append() {
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "mpd.service mpd.socket"
+SYSTEMD_SERVICE_${PN} = "mpd.socket"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = " \
-- 
2.5.5


