Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id DAFE87926D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:01 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id e7-v6so4969458wrs.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=q9JiEjYLNx5BqtKfDMYOcVO4tdkWLfrOTQItr50hscI=;
	b=TgBCjZSaB74DLgDzib8+k9LIvIBn7bBznv+0JJ0T7yftu0xkRxHGUwef+jmlGHr6T9
	lENsH3tB0kYX8gqNQpES4TCUWNgz8oOlK8uDM9PGPTHQPbDxv5I9rAtowOSfik5zbCzq
	TgfTDJd/sKobXp2JyIBiY2Kf3iIM00EARrXpCHzbQNy7Q9lmJbaIDwkgdWogALgsmFQD
	+sHkS8Q/O15b4g9oJCzzqZB8VF/MWSftPgivkpKPLIOzp/lzzrFiV+dz2a75rsXGFIvq
	SvULMl2Afj+h3cBW3MjFOR3q2e9K98iVtUo7ewMk4pjjcdSCe2XgKbtPVy1OwAGdI7G2
	0k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q9JiEjYLNx5BqtKfDMYOcVO4tdkWLfrOTQItr50hscI=;
	b=qGIzH0/Fz01VtqgSHQhoblCu6l8sm83t/xv+RRywK1IA/pteORw3l/ctqwz636R6xd
	YSUmbTUnnPaH/McCxiQo+uIj1QWn5E9+JMxdepCB4Y7CA6Hs+BiVmsqna3F2cOZUDtvQ
	BpsTpbmVdPkzjeAjq5QaLbVRFNb1+SRlxmjGdg8FEMqIndZYnyPeobk8Wf4ePP2bQS5z
	kUw1ccPbcUMAEuIXw9f++S/UyUXAS6suchTzf/5Qe5I1fCAG4D4suxSQe+rvOCraIMqd
	i4HfeHcsC+cdK7+shSQ6wkkQeZThlDxvgogjSl9JNBqXJ4MJ8+NkYLOQ7ItHxIFkIbe6
	w4RA==
X-Gm-Message-State: AOUpUlGgjzapwY+/AkKHdJBbEqEl24VV7BwaJW104bqCdFteiZ2vt/qT
	Ws/0GZyg2/vFIuec/TSrrhYMmAFx
X-Google-Smtp-Source: AA+uWPw1s2tp8++rUnRXREI6TSKT0Yl2Zf2hznmq4AFtgU9qLOSMqRbH3lCcFde6+71KeACbJ+9+BA==
X-Received: by 2002:adf:e887:: with SMTP id
	d7-v6mr19444908wrm.43.1534444082392; 
	Thu, 16 Aug 2018 11:28:02 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:38 +0200
Message-Id: <20180816182748.2400-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/16] fftw: upgrade 3.3.7 -> 3.3.8
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fftw/{fftw_3.3.7.bb => fftw_3.3.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.7.bb => fftw_3.3.8.bb} (93%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb b/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
similarity index 93%
rename from meta-oe/recipes-support/fftw/fftw_3.3.7.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.8.bb
index aae6ec952..09c692dc6 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     http://www.fftw.org/fftw-${PV}.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
 "
-SRC_URI[md5sum] = "0d5915d7d39b3253c1cc05030d79ac47"
-SRC_URI[sha256sum] = "3b609b7feba5230e8f6dd8d245ddbefac324c5a6ae4186947670d9ac2cd25573"
+SRC_URI[md5sum] = "8aac833c943d8e90d51b697b27d4384d"
+SRC_URI[sha256sum] = "6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303"
 
 inherit autotools pkgconfig
 
-- 
2.14.4


