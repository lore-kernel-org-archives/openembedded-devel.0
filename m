Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD309C54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 07:52:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6555.1785397921376076111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 00:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YFXddMQo;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47df43bfb07so691755f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785397919; x=1786002719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUmqhR8b23bVTV+i4MKYeGfSR+17XH+6QLd+/PvgS4I=;
        b=YFXddMQoNzqccGvLnbmYgdoXz7fMMav10na2YtvGtha3jer5Qxzgw8xMtEBcnCy4bB
         M9J91jXJOWJ9BEhYHH9QSsfYV8WWamA103UfZQxTZXdTX95X5foX4YVnfrXzybQF47jF
         HGLKp6PeL9qUJYF5qqT6QdkKVjnsWqsWefPYGJssC+7zJhQYRyxATTogBZkdM566W3zs
         nbXjk9U8NvjIgSN2aEsTAENt0UpUqlf7o/ILwS8EHpWtUZahJ5uq+A7eEQpby12Uq+Wy
         nSlA9y5QcruqYiGg/V5XUGr9eovbTM1D2IGhmiRWC19Dfrw6poZDBJ3opneb64PodDv7
         1FrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397919; x=1786002719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dUmqhR8b23bVTV+i4MKYeGfSR+17XH+6QLd+/PvgS4I=;
        b=LNR8R21E0vOh3oUZiP8sCfYitmBRStqFS71tD1/yxmhoR8M0ADGp6wC7d2Fb+VAnD0
         XItaxspCJ7uC1wiWtaPB7m5J4v3qarDQkn3g2Pj3aUvPMRNteVc/DEUhSxofwCohfVNQ
         PdR2ZDRK/vZ9lDEP2ra4088Dx7ux3fr7kk+a10o9lwjIczYfhyOHq/r2RVWB1kyq21+/
         kJVj9nw9B2BMEUlowqDZZvN64TouBdCw11Tccp9Ql34ZlDt4z7i5SE2xUuHiClzBqpdU
         U0YDQamSHE46Z5MFRydnb8qEetGEo+JIKpPYcDz3eE4IEou4WsRFzeZcF+enOieEbXdU
         65MA==
X-Gm-Message-State: AOJu0YzQF0gG3/9wkZM7lw5ksmAehcBTHKm+0hnoGOtjbxcygzyFB8gH
	C6uVZiWkv9UOv9rNGm7QaUhe0gohwUkC2gvaTjK6QOfrpZsK0DQa4srS+WncXj2T
X-Gm-Gg: AR+sD10d3W8rVdTRGhcc7WQThNgIF33TOg51gHn8Ixpli+KKoES2rAsbGS7rWeFGUmg
	V/sbBqHIWX1BKENrGzz6qFczEaq/wi2muxNWbp4A5V+/EuBtdoQ2u/GmbsgQmB2WLR2yghO2lPT
	KGoXeDr/aSFH5AIF+ViRW3OnQg2z++MTQhsq+vNbOF1/hsfTLl4nhL2NH6EMjZhsPX0NDJuhvkl
	JXrpEAZF1Bh2krfvY0Rsm7aIzg6Ia0ZHcMiNvJKVEcuyneFGzeSvuKwm/NzBvWPSa33ywAkYhGh
	vPfy+1Jj64OHP9EhY6xoAQUH9hquh5I8vehpkGaHmyehYZ2nNff1rFF3AGg2OOeeQdpMn4tEO5c
	TqnWM6qHNUDx46MrWq9s84gscwsKb9ieQHMo/ebza3ickhcJw9M7dqxfEah7mYbdsbBdT4T6gLN
	/lX7JoSsbE7nVUcYyPHtD3q0pS/Y+uoxifqMZFGigBjR+vytA3ASCoL+xic///R4FTlBBIEmXSs
	UM=
X-Received: by 2002:a05:6000:310e:b0:47f:7e8f:d62d with SMTP id ffacd0b85a97d-47fc80bf52bmr1917041f8f.10.1785397919391;
        Thu, 30 Jul 2026 00:51:59 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2.33.127.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc877dafasm3701879f8f.0.2026.07.30.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:51:59 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] boinc-client: also add tag information
Date: Thu, 30 Jul 2026 09:51:53 +0200
Message-ID: <20260730075153.807969-2-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730075153.807969-1-locutusofborg@debian.org>
References: <20260730075153.807969-1-locutusofborg@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 07:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128567

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
index 27e3202de2..9b77e6833e 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
@@ -35,7 +35,8 @@ CVE_STATUS[CVE-2013-2018] = "fixed-version: fixed in version 7.0.45 and later"
 
 SRCREV = "3422898505b74c637a4b530a94b63be90bdf025b"
 BRANCH = "client_release/8/8.2"
-SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
+TAG = "client_release/8.2/8.2.15"
+SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH};tag=${TAG} \
            file://boinc-AM_CONDITIONAL.patch \
            file://0001-scripts-Do-not-check-for-files-on-build-host.patch \
 "
-- 
2.43.0


