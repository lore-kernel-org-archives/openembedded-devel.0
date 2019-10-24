Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 49D807F9B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:52:21 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 89so21403856oth.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wKI1I/k+YC5A/OaYCOKFIlWYKyNyZft5ACgAKordUk4=;
	b=EEqt1dziA+oE7sFmZA3gSSDNoc4C3xjTgA2Xpx7/d+typ2rR9gKtliqqTo15i9NTSe
	Xo8XGXLQEPxTeB+fJ/Y69wKM96UHtrkURloMVkNDbyGEZGq6pv1Wd+C3JOBfPColVHhd
	dmvNKhOzdcl9VHHS65VBafUW5fGVGcuAZkfVLrLgRFLdFt11bnh0C5wxcOgiXXlyqT8q
	My789BBgDs7oQVx1mArYG42ej9Wv/a7ayjyX+LdaEnHuHcRh52JV1AV7iS69ndRTx9z6
	WfxssmprsA6vlyJncCYk2CStLAZS9wDKFa7uHZsLe9eoItSalWdDG9bK5aKfKkpXXKBa
	EfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wKI1I/k+YC5A/OaYCOKFIlWYKyNyZft5ACgAKordUk4=;
	b=HrV5TBVdYz/6586FEt1FL3YSNLq3kpA6uW83qgP1q+e1fKwOPM9nGDsi7iTkZ9PYFv
	sO3MOVj9/IG7luQih2iC3rr149wp8FXp6SoXg5pJxF9Zeq9DMmcaFVGQ/6s4lNa8keIf
	/AX1Nn09fjpaMsZFeAATRfSxqHQzDe0ddQktx5VCORP/2AC2gVpmn/wd7IMbAJwM9+dG
	HARiovl1WesP3oXY7GH51LbTRaCVv2vVmSkjjcPhC3/NLd9F9sh59nLyCW2i6QsuOsKr
	oYybF9IoVtX5+yEsbpL9DeOT/ZOvfCigZuUQOW78nQHR788o1IFjyrw+E8CRH5/IpSLi
	AEUA==
X-Gm-Message-State: APjAAAVq17tyqBv25ZAYm1DcO6dZdbuJpMkP19hxismJY/2fncaXlBcW
	jfdOFs7Ut3tMAU000aOTRq/tA1qEqyWc0A==
X-Google-Smtp-Source: APXvYqwEQU2790HDtZInI0m9vTxLXpjE/g4snQN7pCuJUJ4XM49eajLffJMu00Fxt+67T+Uv9XSzZw==
X-Received: by 2002:a05:6830:1e69:: with SMTP id
	m9mr12960765otr.262.1571939541734; 
	Thu, 24 Oct 2019 10:52:21 -0700 (PDT)
Received: from alago.cortijodelrio.net
	(CableLink-189-218-29-211.Hosts.InterCable.net. [189.218.29.211])
	by smtp.googlemail.com with ESMTPSA id
	c19sm858816otl.6.2019.10.24.10.52.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 10:52:20 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 12:52:08 -0500
Message-Id: <20191024175208.19746-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] perf: Add /scripts to sources
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
X-List-Received-Date: Thu, 24 Oct 2019 17:52:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As of linux-next-20191022, we need bpf_helpers_doc.py in order to
build libbpf, which lives in /scripts. Otherwise, do_compile fails
with:
| /bin/sh: 1: /oe/build/tmp/work/machine-triplet/perf/1.0-r9/perf-1.0/scripts/bpf_helpers_doc.py: not found
| Makefile:184: recipe for target 'bpf_helper_defs.h' failed

See commit e01a75c159691 ("libbpf: Move bpf_{helpers, helper_defs,
endian, tracing}.h into libbpf") from linux-next.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8201c0cb60..a463eebc52 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -113,6 +113,7 @@ PERF_SRC ?= "Makefile \
              tools/Makefile \
              tools/perf \
              tools/scripts \
+             scripts \
 "
 
 PERF_EXTRA_LDFLAGS = ""
-- 
2.20.1


