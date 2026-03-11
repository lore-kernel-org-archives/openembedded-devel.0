Return-Path: <gijs.peskens@munisense.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68B3FD0654
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:22:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15757.1773217325078917406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=NSypBRLO;
 spf=pass (domain: munisense.com, ip: 209.85.218.45, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b941bb3e23cso958747066b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 01:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1773217323; x=1773822123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LBg0q8aFgf2NHXI+F7mcWNjWVpd/5Azy8ko658WWve8=;
        b=NSypBRLOFXFJREExft2uYWGdH1/a7mROsitMxltFNkDFbXef3cw+Mvupeu+v1jhC9h
         8O/j7CEZR8JRwOwOYAktXVvlgU6hJg0CG8oYYHPmI1Uesm7Bj53qCxaMFyTSBYBdzevE
         /bkM35395ESS0njR4/Wf+mLosebl+uwPhdlc9gkgGOF43IWkj93MREYAXZn21OQAg/M1
         U70xDv9voD/sYOJFQA1KOJgXAip8OpzyMISpKL4j57PWkzmvqrpjRmmQCsD3AaT9nfQQ
         e/deQrI3Y0Tl5fXybUH6stJwQ99UNLcW5epVU4EbDgOwlON8JLS83DEOzEXOgszH0P2Q
         W3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217323; x=1773822123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBg0q8aFgf2NHXI+F7mcWNjWVpd/5Azy8ko658WWve8=;
        b=N3gN50HhrXatQoVIw+6YANOiJPcaE4jfuSxhA6TkwJ3BTYmTyQsvJHcW2rToKVziVg
         SqN+h5P0aUlD8ogpjhP1XOWJaDfn8kb5x6z9i8TJy3s7P4UBRcTD+MAQpIQxihAn+SMp
         3efRjysaaqdX4yya/HJaU0A1pH3VIMd0dBVkD2gs4qaGgbUjVaalDGzv4Sl+r2HQtWZv
         2SS75ATjHm7/2cGzeIhLyj2uNGr0U7s4QuOn2KZ+nnx/2gsP1CDAKv1f+pP68Lr0y18H
         fJ7cuYp2nZyyj5WK6C3Dl/pqcEIWkSegsDqC86dk85v18eDBdNPaMKzOdQPtVXRqA8h1
         149w==
X-Gm-Message-State: AOJu0Yy5zv8eFw3i2Btj62qcnIFEznHidFuoM92KUP5eaZT9YcUk0156
	CTiBXXBNpqMpYV5gzIFfUQnGVHGKJPvhQ+yqfM2e29fslv3pOcVrLAj+uCadkl0JoWW7gFSjq78
	rxTe1Ygw=
X-Gm-Gg: ATEYQzwIyGZkhTZ77Ayyj1lSW7TyCF8+2QGD9SxkAfyaMf2y9WE7lGkCFGjNQ+ZrFot
	IL0SFGFtLUpPGh7DJgwiqDML0kXvmbLnhtLkHIKZwYxsplnAaLu6e7iMaYV6Y50UYIMQvUeL9i3
	cjhRPEnecC++S8Y6p/vNjbjwG2PB7xGke+eYauOyd2KwwUg87BqJQ8TC4E6Bk5TQGsAGsQ1gNbJ
	JATEpmH6YgPDyIOlLxm/16Q6dASi95TcVmmSEitO9ux7Af+QqIsoWhY4TFYxkfDghuHsS4MPuRu
	Y3MU76UzXi5AOXdfjFkR/ogBd9IX5I7Kehu+quPh/f/XPBwlnmwKV/QP1SOHWR70lS5LhcymD7P
	DQlM30Kr9vHUYWZlcnF+IbtwC0w9l0kusL7D6lQjJd0bovsV3EpL44QPN+Xbb2U/li1cj7TFY9f
	bQOcVTtmXhAi0HYHIEt1vcpclaiK+awibfFMCJxKK34L2tQUGNinQD+0ZmH0llhoaQB5LSFdc7p
	6XLYuYmlZ251o5WTA==
X-Received: by 2002:a17:907:86a2:b0:b93:7255:2d5 with SMTP id a640c23a62f3a-b972e133dd7mr83492466b.7.1773217322390;
        Wed, 11 Mar 2026 01:22:02 -0700 (PDT)
Received: from gijs-peskens-ThinkPad-E16-Gen-2.office.munisense.net ([2a00:1708:3ba6:500:f314:c4a5:a3b2:cae2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97313230desm23993366b.26.2026.03.11.01.22.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:22:02 -0700 (PDT)
From: Gijs Peskens <gijs.peskens@munisense.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: upgrade 0.13.3 -> 0.11.4
Date: Wed, 11 Mar 2026 09:20:34 +0100
Message-ID: <20260311082153.258506-1-gijs.peskens@munisense.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125065


Fixes public CVE-2026-3731 libssh 0.13.3 is in master and whinlatter. If
the policy is to not upgrade, but instead backport the patch I'm happy
to do so.

