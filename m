Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 64F0074B34
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 23:16:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r82so38605474wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7fiQpSmNG+D0Fw2wyuJZUjFu4j7ZAK8qPyYFnNobLaM=;
	b=dbRCI9hpLGJjre8INneFuYGx4F265xKoVxqcW6y8tjNa2Esgh230C/N0uLQiWfIGfV
	LxGRxCHlkE0uKQwAJs8sVlC7ib7YjrjBWRdTGJ64F/axY0LCPfMiBKjPo+wfaSvzfO6g
	yXgD0wf2hDwZ/py/5IVTQGp+A79c46bjJRUIKV7fi4GIxO9NtKGbwzyFfpk+TxZISNd3
	CG47D7j1N90hWckbteYASOLB0UJ8ohymfCxs7xj+1e0d6lbFyM8JgIAUMo/nLnff4DV1
	COu9SqbQZ2qle/x9ufXUflYNvNUD7OUHmd/q7dR5tF4MXdhaE8HyKspEebT8SxMvNcW7
	vnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7fiQpSmNG+D0Fw2wyuJZUjFu4j7ZAK8qPyYFnNobLaM=;
	b=M6DxULAApzF6mONlYATQYwcxP5uPVQ3/BfpjqEDBmWMI6+26OS+HY+lQ1UQEB+YzCE
	LR6AVt09Qqe3YPhqUrqsmugn2FuUYMX6F4lGn4f2GB+Rw72DXzv65eeiNQD956qtac2b
	G0a1K0UqXz1NaHuBDYazUTGl3yOObLL8BoB0g8/jI1o/BP50EeSRHxZ8VjtLO8LJsQzT
	tMyYJoWNNfnJXQINyA7oWAJwO7n3cWVZAeyZpkTJmAjx1wfvywR73P6TuL6G4YxhLhwo
	BbonnHLjJQmCXI0dLqAgLBMU0WkEryktxjNkDSrBiMT5lHvCeFQc3VpKmLBSl54Uf6So
	C2YA==
X-Gm-Message-State: ALQs6tBoLf2FMhHxH/ECi4EbJB/cSCYVoR/OPzJQd5Kyal73KLQWhoG1
	+3gT/B0Owu/bLQm+WmddZD7cMQ==
X-Google-Smtp-Source: AIpwx48Lw43oqaF6cfI0CzVk0L8C+itiiw8mvfp0ldRQLu5MEUOn+mSEE3yF9jAmY2ZsTCcHEvYO2g==
X-Received: by 10.28.12.17 with SMTP id 17mr5078942wmm.75.1522797396767;
	Tue, 03 Apr 2018 16:16:36 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC1FD091E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:fd09:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	m129sm2682099wma.27.2018.04.03.16.16.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Apr 2018 16:16:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2018 01:16:01 +0200
Message-Id: <20180403231601.5329-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180403231601.5329-1-schnitzeltony@gmail.com>
References: <20180403231601.5329-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] poppler: update 0.62.0- > 0.63.0
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
X-List-Received-Date: Tue, 03 Apr 2018 23:16:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.62.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.63.0.bb
index 696621938..143df3f73 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-Do-not-overwrite-all-our-build-flags.patch \
 "
-SRC_URI[md5sum] = "42b801f2defaccb6b6cf1bf783ee1552"
-SRC_URI[sha256sum] = "5b9a73dfd4d6f61d165ada1e4f0abd2d420494bf9d0b1c15d0db3f7b83a729c6"
+SRC_URI[md5sum] = "66a54da4896b1408611699feda5c1821"
+SRC_URI[sha256sum] = "27cc8addafc791e1a26ce6acc2b490926ea73a4f89196dd8a7742cff7cf8a111"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.14.3


