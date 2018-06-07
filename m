Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 51D117557D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:52:23 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id b14-v6so6197875pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=cncf5AXiYZHL3mCYSWPeEkGVnuvVpLneg68OMLmRFhQ=;
	b=UXWXbj8HqjTq7VBQy1ua8+bSP5XzeGgoGRc6KHcjVy/8Y7wxr1MjHc6wydQrYOYxXl
	61qi3+nFvw7h5sIDS2pJbXk6d7MMGGy4SNobRTUktULpsWAhWhi9YDqSqMTK50EF3hlY
	r+MfxsicfPJg5tooCi14KDKt32/fZ1Z0DpLRcOnx4dt2lmAXi8qbKthNU9xKYIEuZ24r
	OKuP75dmKcm8lSSZfp7XrTiAChkfhSGgX1gTrJHTnMczom/UGuWDjdkmSgiTLfvPA/gX
	FxQ3iog9p0QF+tmxOajGNCf5SuIR2n7aWWMGhlyyz2CanL2qbaZYIKTln66Bx02qZK5V
	+iTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cncf5AXiYZHL3mCYSWPeEkGVnuvVpLneg68OMLmRFhQ=;
	b=TVj6UDhw0q2qq6UGtnvCUkAcfBDZ8wXeryX9ZGf9s6gUd+zWugMDxInZ5LS6Dr1wD0
	HdBlFAYnNJsLNUbR6fYtmPiJfGlbwlpPermr+4k4P7Tj4jNKpUYomkNtoIQM/Q6c9AkN
	6YnW3TDHKjTRj72C8vCQSR9oQ9E1l7rNoPNNbXAwhp+/xOjTFbWZ9lLiVFNohH0pT7Qr
	R6wsCoHsm73KzgMRpq0gFxKFRic0tcxUOemzsoXPJEJt9QVZkcHap4tx6jjxPQmXPoZf
	yXBRJBDt1eKIc+pHCm+2lJmrQCCw8jKDE/KnV8qwcgGxkmfo1SbiLnbfLyUvcYp6PUPD
	Iqdw==
X-Gm-Message-State: APt69E2++SRWFgoe8GUlycGIaQGHgnRcDobE4VvtGQDyBYhvR2wUzDM2
	4Da2UTLrZTFmlR0q5pGNJDY=
X-Google-Smtp-Source: ADUXVKI6CMg0u24QlPj0CiCOHeFVfw/OrYd/r42RqCqXZtiNT1/JZyNSpjTBF2d6byPFdZE8iOJnQw==
X-Received: by 2002:a17:902:ac97:: with SMTP id
	h23-v6mr2175498plr.140.1528379544369; 
	Thu, 07 Jun 2018 06:52:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:143:7168:4d6f:f251])
	by smtp.gmail.com with ESMTPSA id
	t21-v6sm18675481pfi.22.2018.06.07.06.52.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 06:52:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gamil.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 06:52:15 -0700
Message-Id: <cover.1528379391.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Rocko][PATCH 0/4] small pull request
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
X-List-Received-Date: Thu, 07 Jun 2018 13:52:23 -0000

Please consider these changes for rocko

The following changes since commit dacfa2b1920e285531bec55cd2f08743390aaf57:

  python-automat: fix build dependencies to avoid download during do_compile (2018-03-12 14:43:28 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded rocko-next
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded/log/?h=rocko-next

Armin Kuster (2):
  wireshark: Update to 2.2.11
  wireshark: Update Package to 2.2.12

Philip Balister (1):
  protobuf: Fix fetcher failure for rocko.

Ricardo Salveti (1):
  python3-asn1crypto: add support for Python 3

 .../wireshark/{wireshark_2.2.10.bb => wireshark_2.2.12.bb}          | 6 +++---
 meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb                 | 2 +-
 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb    | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.10.bb => wireshark_2.2.12.bb} (92%)
 create mode 100644 meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb

-- 
2.7.4


