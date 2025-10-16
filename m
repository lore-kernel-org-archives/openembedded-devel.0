Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1D6CCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:44:40 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.2809.1760600677015552522
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=xumyDEj5;
 spf=pass (domain: thaumatec.com, ip: 209.85.218.42, mailfrom: dse@thaumatec.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d5088259eso56831166b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1760600675; x=1761205475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uh6uVh6B0qG/VFVAWZRf1AdsfICFeaUxYCA3/kbg54=;
        b=xumyDEj5ikdjcW8BtnT/zDLcXDlYtqDBtI4lFMnw8pQ2OXMSIvJntGkhcMz2xhYu7G
         MN3fYXfbiJw+BN9W0YuChq36kAKGKThQsmraZRJmQvdp9G+HwwjCSWSIVIM/Sd+vCJ61
         VZhVhMIue3h3q7GjokWVGeTPCh6BFDhL1yarGbCX9LU1cq476gOHF8nl4HI9nDBuS7rY
         mJcvcvwn6moqE6b0eJZUe4u+dW8zCX2a/x5Qjj3N5yt8kUf4T+ZDeG0TBLIK2WxcsKs7
         U6jb8J0E12ZxP/OGuxqW3TLgfZWlo+atG9MeoBB3XrfEdWeUStqCuOXmuFiL6TWj1m5e
         WNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600675; x=1761205475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uh6uVh6B0qG/VFVAWZRf1AdsfICFeaUxYCA3/kbg54=;
        b=T6EfmkIvvdIvmFSwTyEUlGWTy2G2X8u4DyPyYCT3SvWXBs9DZ/KOQIH7tPYDhNpKpv
         I8x6xB2QheGSckeYMuzzzwA0IsLP9qG7sKcOshgFLABa2XGxbzYdIkLYNFmJXz1e9Ira
         RMsFB2wIFp/huTO0lmmXpIY7ukFy7rT8VrJhsrBM+VJB7RngbknszCJrW0KH1yB5LgKx
         7StWXvc8fd/kJAcN3pFJKqOTmMmHYD72DgYHZfeYItqDFozciIxdzse/Ol2QindYwM5r
         HtDCjvPTKrXPbYTT/3tfDHl8GayRZnMdjJbe63cx5yCVgKGO8A4pj6t+7/Rr6kzF8joy
         3QsA==
X-Gm-Message-State: AOJu0Yw61Q6EXfCOw9FnCZAD9jGbggguKEMAPVnjQT2ToEcc+Nd+x/+v
	IytmEltQlYiFF66BibCD9SfdBjlMt0XfMh7kNMiXsn7INxvSmFdx97TO6taXvIABJVKKkLAkXQg
	EUQcX
X-Gm-Gg: ASbGncv3pANB2SDtFr9pD5cH6JNYRVURSfyU8ybe2UDeI4XZlg/FL+aAzx1XJ9D5OW2
	a9oZJLR4ZUi6hdd9FWj7TQx3t9NHgiesw6dAmB1SBKgHDukbElNc53c6Yg1XQnDHHVvCKdF1hg8
	CV+ZDpTfp1y9dxmAa1l7Y+BT+Q2iH1nKZIYmHDyF6HqkpYanr7azixGJcyKJmsl1E2WEPyLRaNw
	yivE7RbKQ4jK1F1IXiAn21en1aTz9sC5m7d0BT4uDLHgy4sGrCMKO76h0nX2VC6ZmXmwimVIvC5
	+rsjQHh1iFGCy2U8jpG4eyNf0Wr7EQ4ZKfZrDEtPuNFDZy6E5LaYQSk+WDW+SZCQZrulmD+0UwE
	7+ICl2G0B9y/ocakyuPXvf3RmiZ2t4YWGRDIkVgdgRyfr8l9t2qFj0ssjkaNLcbpKLJBLQey/h5
	Cm/Kw=
X-Google-Smtp-Source: AGHT+IGmUgsCN1lY+zv2WQeqyfVgkQlyP93OCSDLOiS0xc/th+ybUlMnrpj6PWwXORN7Ln5ywopQnA==
X-Received: by 2002:a17:907:1b1f:b0:b3f:fcc7:6ed8 with SMTP id a640c23a62f3a-b50aae98249mr3172888866b.29.1760600675229;
        Thu, 16 Oct 2025 00:44:35 -0700 (PDT)
Received: from fedora ([185.186.156.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba459ba2sm447667366b.34.2025.10.16.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:44:35 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH 0/3] cockpit: upgrade to 349 and fix some issues
Date: Thu, 16 Oct 2025 09:37:42 +0200
Message-ID: <20251016074104.85537-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120719

This series includes the Cockpit package upgrade to the latest available
version, 349.

Additionally, the recipe was cleared of old-bridge PACKAGECONFIG
leftovers, and coreutils was added as a runtime dependency to make sure
cockpit-certificate-helper works correctly.

The changes were tested with core-image-minimal.

Daniel Semkowicz (3):
  cockpit: Remove old-bridge leftovers
  cockpit: Add runtime dependency on GNU Coreutils
  cockpit: Upgrade to 349

 .../{cockpit_337.bb => cockpit_349.bb}        | 15 ++++----
 ...am-Create-src-common-directory-befor.patch | 34 -------------------
 2 files changed, 6 insertions(+), 43 deletions(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_337.bb => cockpit_349.bb} (90%)
 delete mode 100644 meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch


