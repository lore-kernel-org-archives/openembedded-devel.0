Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FABC44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69162.1782634374830450639
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YHHlqJna;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30eac9abd79so819601eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634374; x=1783239174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQjs5L4pDQa9NRnwyedcmuSKR2Lu1a9JM6RMa855cQc=;
        b=YHHlqJnaNTvuoo/mwwEySgyx12gdtHVRZS6ojzXNjVLGB+qqaSXycOuEAYHnEPGJLs
         c/mSeYt9oGrdwBitt/wqde27ffPRKlfunJsjOnwH1VUPpQAWMQ9dMV72LWsKeKGlOK20
         mjuGITdCDW9FYNQrbwBfbHwLCSb080z3Y1A0lw7OdVPTkPCdeE4IxeHyz7iK4+QCrWc+
         4y6nWzesfKRJpKgKW2rdrfgMxqdOVcLuhib7GqK2RRjU2LpmBWB2go1yAXe0Mhql9viA
         ke4Okf7r4XdYv26BiagoJDNyWXQ8GgSmmnPsvKfXSlPP3CvE0kPZdNls2dRBBN5jxtVu
         yJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634374; x=1783239174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eQjs5L4pDQa9NRnwyedcmuSKR2Lu1a9JM6RMa855cQc=;
        b=jWmuRpnEERx0tWknEHG2A0+EiWDWLxD295XzWlu3eM1J09Dy4HELMqqMrBehqk11Np
         d8Ut0w7mGoeMhAgrWhcvfvwKnYOisVhECLbwVSxLhQ4jnTUfduv5OZRDGWgqweeLguHQ
         N7JnhAxrzbsSp+oVVr6QF8wFh9EWHnR7NgBj6b0iTiM0pCdZg8mJON5UAyVl6hrVReo8
         4DzduCapKrwGhoHgXbgf5NFPaejDPuwq0vnmBXUwFqhoddv3Tsb3kfb3VLA6Out3k0O5
         rZgHWM2x4KOYVykbRzlHKmzSazAxpXcgFU58mBR2rFoh4l6z1+qHokrFUD/mqhNmjhPO
         DB/w==
X-Gm-Message-State: AOJu0Yx7p9aOVPwRt5jkNu4gSNkwH7HWAFk3THzjzlpYQglEZ323evJe
	Gj+YsxvRu80EuWCkXFqwC82+AfNW0Tpz+XTqazoBSEnqOKjA1GEpNwdI4/Kz3J/lq5G83Q==
X-Gm-Gg: AfdE7clyUkMXoB5c07Ng+Ss/0iwvGtXzaj9r/q/hdfvAI/A9S/7afH53K0PkpS/mRcg
	kte1ik1xDAi3GhmwazLrGW5wUJ/nw2cZDsn/5JdLkZofONfehq4shnOyS8P9O/1qaugF97Giw1q
	Y4+XBLXAnvHVWjpBFevlZlLxvothek8v9Hiw7dKM1jybViRywfYyvfXRXd4rBuAkCmMhZ8zYd1z
	aulCknD/LGUz4RelwKfvGiCu9XxzqhEkBIY5gCvXIVbrqiYmMiOTQTH0Fplx6aQd4NEIQiE9J44
	8Hj8/QvcATM8BwFx6HqxMpRY4wBKRqUIQGUaGda5pSZatR8z61a3YGU8OokUgKU68RrwR8tMfGU
	ckjwVeLVtp8djISaJ4R5R0twdU0ETA0MfpiGwTHBzulBbk6Royemou/uCV/Xpr7AYrDcFpDVhZd
	9xVIDr9WqH1JBi/CZ1WvL0UYK4FQA6rTKatYx/Q/nsKrn6lv9GUOmJCfvPmzkfBTXE3p9L/s7Vq
	ZfCajJUAiSJgaxfbfT3WgMsCyCVozy/0MsdQqUascEQyefzEMWwXSjA3BVFApnaDSdj2HYpWHk8
	xRlGPRgmrzK0AT4GwkAZGYCPqoxR+A==
X-Received: by 2002:a05:7300:df41:b0:30c:7fc9:ddef with SMTP id 5a478bee46e88-30caaf5aabbmr6554230eec.10.1782634374184;
        Sun, 28 Jun 2026 01:12:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 097/128] libcrypt-openssl-rsa-perl: upgrade 0.37 -> 0.41
Date: Sun, 28 Jun 2026 01:10:48 -0700
Message-ID: <20260628081122.178348-97-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127907

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ssl-rsa-perl_0.37.bb => libcrypt-openssl-rsa-perl_0.41.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.37.bb => libcrypt-openssl-rsa-perl_0.41.bb} (84%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.37.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
similarity index 84%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.37.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
index 90df019fec..4775d12b7f 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.37.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
@@ -4,10 +4,10 @@ HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::RSA"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=399bd4de06d233aa49afa7c47cea8117"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/Crypt-OpenSSL-RSA-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Crypt-OpenSSL-RSA-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "917f7312532f8f4af4f3acbf6ba10e0151f8577d2ef1f38e1035229be86eb6f4"
+SRC_URI[sha256sum] = "82fa839897b88e9c245b6265f3be26d3bc879cae4c7a8151fad4a307c3366822"
 
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 

