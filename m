Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC987C187
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:25 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id c123so10904813pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lAvvzMpBj8+MsMcIaFyD56IUc3PoAxgvMHPDTpVcgzc=;
	b=eu2m7zPEtBUj8FXF7P95YQsxwpT+JMtTdCVplka3krc30wperZxfZ7Leva1hW9jFiy
	V7mwKc/8MpYWVT6MOk6oH4ik0XU43b0E2reWKYko3CHCYk8YvaZjoc4p2DuEZk2wyrUA
	Suhyv8hwXgsBiaPzfqLUa++KJugmjkzmq+EICztwMpEoqvssH0bgcp8XvDLgIJPSQTMK
	UWNLNR37cABrXa1i0MUdZ7GWab3vAMCWDN5Duvp2b5x6TywWxvipz0gdY0hVNZK4TuP8
	o0POGxrHHAL4Cbuor+Psmzp701x2w1bo/vbW8v+uQMndyapQaRXXH8ttsohYvFRPsRhv
	6KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lAvvzMpBj8+MsMcIaFyD56IUc3PoAxgvMHPDTpVcgzc=;
	b=WfQnYh3n3wPdY4/OMsOm614tKe0rqTvh3BnRcMyZA8R71WfjcFB49p9kZTxxDeYdeg
	Kgp1+OiOJoaUoffAVZqm+QymJAWsF2FwokKxDfeNAhD5n/EHQudJPr1d09V+9/42MbJL
	l9yFqsIV+QIcAsgbdZYpeGW0/sw2ZwzAhAeyqYJtwc5EM3e8SrFOARg64LEkff/cHVfu
	+VH7gLs2Z2woPNVio0g/0ojnm1pSb/PxVC4hPqrmQqSbBR8AOl3m7/vghot2fYcXuPji
	VtAX/p8GbWdnWHinhMWw82BxTLvQ3JiWyMHtfEzkQbKv6DAd2UqE4xhyGPjrF/eHtb8W
	7tfQ==
X-Gm-Message-State: AJcUukcLOfdxu0aUau8k0yatokPjq+XFeGrxvGpAjzMCONP7RyU3rtC/
	lrIctrBLNfNi+weLeM1IKkmG+z93XRw=
X-Google-Smtp-Source: ALg8bN4WndD4qt5Cs2NpoceyoRcN+y8me011pZoTf8ykLDA3uBtvFwzH4xtzzVNMF/TaDhaF44bhJg==
X-Received: by 2002:a63:bf0b:: with SMTP id v11mr26892229pgf.302.1548826165945;
	Tue, 29 Jan 2019 21:29:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:09 -0800
Message-Id: <20190130052911.36336-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130052911.36336-1-raj.khem@gmail.com>
References: <20190130052911.36336-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/8] asio: Update to 1.12.2
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
X-List-Received-Date: Wed, 30 Jan 2019 05:29:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/asio/{asio_1.12.1.bb => asio_1.12.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.12.1.bb => asio_1.12.2.bb} (80%)

diff --git a/meta-oe/recipes-support/asio/asio_1.12.1.bb b/meta-oe/recipes-support/asio/asio_1.12.2.bb
similarity index 80%
rename from meta-oe/recipes-support/asio/asio_1.12.1.bb
rename to meta-oe/recipes-support/asio/asio_1.12.2.bb
index 28cd9c0e19..ee548fd3aa 100644
--- a/meta-oe/recipes-support/asio/asio_1.12.1.bb
+++ b/meta-oe/recipes-support/asio/asio_1.12.2.bb
@@ -16,7 +16,7 @@ ALLOW_EMPTY_${PN} = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e73f311a3af69e6df275e8c3b1c09b5"
 
-SRC_URI[md5sum] = "037854d113024f57c9753d6326b339bc"
-SRC_URI[sha256sum] = "a9091b4de847539fa5b2259bf76a5355339c7eaaa5e33d7d4ae74d614c21965a"
+SRC_URI[md5sum] = "312e53385e2daad10f08d57f91ad3431"
+SRC_URI[sha256sum] = "4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
-- 
2.20.1


