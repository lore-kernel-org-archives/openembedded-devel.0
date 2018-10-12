Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 085A579BAA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:26:25 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 78-v6so3988478pfq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6ydyjHhi28ffMRUE21hkZjT/Lc6yQOo6Vg5qTZX2Zms=;
	b=SE1HbBgIRTgtfxiMYFvAPcV3DhN4TXSa1D4/2zgIdz2kooaeZYvwvteTa+doC/hTrU
	l3uFG/VbbqoJBYl0DfDtchJW7ctUxdOb/iF+sybq8UwBhRSdQUP6kNPoFsi2GKfCK3NZ
	c/bpwcZSsC9g1r+xGJgx5HQO/WHAv41UhyXPT3eeTlnYdeHyXa5IeWnqxcD+GmbaE6dd
	DBNb++bqSshOWHsIubon4lGSwUD1qBgMNt8/HyDLN5GfUp50byWHl5v+TtPw3PObYxc2
	fERlFzj89VWwMeOCMDHNB0OWZFKfVUCMv28SXSchqqvUobuHOfeAbfsVxJ8xsb5WRQxw
	EGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6ydyjHhi28ffMRUE21hkZjT/Lc6yQOo6Vg5qTZX2Zms=;
	b=rcCarNjsqBs47BTwbl4cgkhU3NwuWvrE8IJXLyI6wD65ltJu7FYAOcvKh3VZ0ZqGtx
	Qp3v2tmxerMP5lOjcS5qmEenwtPitfZMNntW1yp6N0oTG92ad8xnJD4s2w4Utgae/Jjv
	EFcbEzpw/8pDGfRe6Y321c9k6M6RTCpY3Ri+S5BfQ2Gd/sgpphXDuvgqObSOII0/7C+K
	QGDKPTEoTyIBzfkumzoT0S/BqwWJIrV3kjd63yobqMUPTrXAsPcuqSqZni1EUd8tqkIN
	EtQc3pa69BL2U5H5MipxCMNGdrgjmej5dswM6unFtRzPY6WQcFtR2DkjrEI4vXGaqlmf
	UMlw==
X-Gm-Message-State: ABuFfojBuLNgYfUBuocc516qYg/ZF9QRBs255qfYB6+2S+wgSwfG1FLa
	doKYyktHhcAujfEkU9i4HLENjIBf
X-Google-Smtp-Source: ACcGV60+lkB7V+HdmE2aU8owvN5dqwLJ6M1nuNabqBHvfxfTNhX4CuJxquESWgmQ8pYCzQbhirXJKQ==
X-Received: by 2002:a63:d0e:: with SMTP id
	c14-v6mr5840480pgl.281.1539357987170; 
	Fri, 12 Oct 2018 08:26:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	x20-v6sm3525729pfe.131.2018.10.12.08.26.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Oct 2018 08:26:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 08:26:19 -0700
Message-Id: <1539357981-3675-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 3/5] directfb-examples: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 15:26:26 -0000

Nothing PROVIDES 'directfb'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 7907c5c..a9d29dc 100644
--- a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -15,7 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
 
 S = "${WORKDIR}/DirectFB-examples-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "8b60c867af295481c32a8c7fc5802307"
 SRC_URI[sha256sum] = "9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a"
-- 
2.7.4


