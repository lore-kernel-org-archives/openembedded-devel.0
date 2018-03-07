Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEAC78A21
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:41 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e3so435477pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=07vI/0B9qdzoMLwha3+G4J1U1ydqoXqTjCWuy98uKdM=;
	b=WFr4y0vBCoCo44e8Wo3aXMXTFJPy6ItXZuyb5DiaI88aJFqEpPx1cTmERuYBP7PC92
	urVtZZJSLf8/3ED608AzHwJbKPUOUABaStKu8825VDYKIbdpyFHG7cemjt61NLJwc11W
	9BYfdmdM4EosppaeLTo9cuytnn22lkKAQRcEbTGh1uAja5lSXyIg4chQSsO2ur7zooFK
	OIxcmQcYX3T7OiSfsoSDzXpbZEVJeyboJe4nfqt/PKjIiLkWc1HbD+x00hC9IU2+NH2p
	wORNsSEoFkV2/O4wf2E+0ee62Ox8eIgHnjya8cFh7kCqi3IxabFXCQ0wJYAaL9yvID00
	Z6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=07vI/0B9qdzoMLwha3+G4J1U1ydqoXqTjCWuy98uKdM=;
	b=p2kC5Cfw+PhG0QpE1FNhfWeCQnSSkI3PpsuKIV6crd5OwDRyEzMskq+FeaQS+4ATUy
	3+4ePTBjpO8wakQduaoc/w9WaeXnh/pw7+7LCxFKmUfEKZCclOBG0U4s5ivqiNwrVdHW
	grCPv5XfCt5m6euvOaSnb+gIcqOrG1Sok4w/n+QrHK1JSWGJRjlDuNv/b3RzYAUT/WMW
	p5l7UgImPOw0sRHR1Usm0P4nUol61lOTGuwdvY5m9S6eshwXcKhDGSg3B3U7eiHlqT+u
	/ojVrq38UyOCvuzHu/9Zjm6svz331/n/WL95QjieWR12elKpZs14udvX2u76YnxRQqfQ
	J/AA==
X-Gm-Message-State: APf1xPCVrsJNu8SwjX3SI61qzQINuoaixct8eqDfYmaph6Uisyh9rb74
	H86XpocgqczqG+VPB1JtLOCvRA==
X-Google-Smtp-Source: AG47ELtX9lWnEW63ILpf3iPgNaA/+daNxF1D/4XWBqsZIMPHSuls+5Ysw3odUSCtGzrw3HRQutvdFQ==
X-Received: by 10.101.82.1 with SMTP id o1mr17257513pgp.37.1520395423526;
	Tue, 06 Mar 2018 20:03:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:18 -0800
Message-Id: <1520395408-19266-15-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 15/25] libgxim: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:42 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 5bf7c6e..7e4c330 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -26,4 +26,6 @@ file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 EXTRA_OECONF = " --disable-static --disable-rebuilds --enable-compile-warnings=minimum"
 DEPENDS += "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native gnome-common-native"
 
-inherit autotools pkgconfig gettext
+inherit distro_features_check autotools pkgconfig gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.7.4


