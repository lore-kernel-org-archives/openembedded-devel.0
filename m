Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B60A10A88CC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50107.1774538516342538518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C+I42fKG;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48704db565eso15729465e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538514; x=1775143314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPoynLXB8jcTJt/fzYxmwXmamVHIe/nRLH6j+7xbPfw=;
        b=C+I42fKGVIpYakDLRbaErGhRlBAvLzK+kv95Udm3lCw53/oDUer2fVX7LKZyNfcf4K
         YLMySISXHLql/0czHKRkhFzSdnF6SQVUxc11ehbkxA/iNbfquhd6Ohwr1Fndu9tj0fmE
         QeGtgRLquWsNeReJONExI+P7t+ZSdQmmG9UYOf2d6MTDnADRGuaJbJymkaQgIAo2oGfu
         /UNa5f3t3AyNUC2POspH1nvwsUOgOJbWsFluAku8aTPWg1/leqKA6TvAAguliyRxbg2N
         xwjd2tD2vXssZXqnCs8htuilGaNK89Y77NL5+t9vjZyJVSdThxc0M9q6IymF0G9l5Xiu
         HO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538514; x=1775143314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPoynLXB8jcTJt/fzYxmwXmamVHIe/nRLH6j+7xbPfw=;
        b=dN4RH80IJyOMzkRhxnS8EANDr7OTsi4IuIIdGGRaq2hnWu1XzRAhUdLO2DKHnb8x9b
         vbsAmejn0ggoOFSELlFMrxGhaRShLT9NpyAkU1ZmR9buDudS83JjPXSJUrLO7/fhbSy5
         rq3iffPKesQXe6eoGgmSn7m9nsHf9DRBwsKCeyL/SRjzB9qWmPrwOpPs2ZC7Qp4M3NBW
         Dmv9h0r8xCUXtm0+CvhmPTHRORDhBHod+QX5n4qa9fhzQv8b96TOr+BtIWlnb8DNPtdZ
         KizU5skPNYPRJameEgzz0XspLfNvsxVimWScOufCBqofzgGTuwXxZTKwYPgo2Wgls+wz
         q8pg==
X-Gm-Message-State: AOJu0YyRShPck0JJVu55johaiBdOZhtaLE7hAsw/9IGgbbFFvpYyo+Cp
	q12Awtbv6We+D/bCQtc5msP5azAGqlA1a68h5WAmLuMyzdld8G6yOM+mGRavVg==
X-Gm-Gg: ATEYQzxkjChR95ZDyHw65EMqiwqgm4fJcD/pSpjd/W0hYO4LF55Mch2O1mVIILd3QP+
	NHORgPna3DkQo2ChIT3NheAGSFzqcGXP9ud4szuCvmfKzpnZBvtKzx9FFJsVFzvcNjzLBZ7vSu2
	04YXLNZVxDmltrGnNVx/AAPF/pvJJMllUxilidnRPH2XbNYs4mJbdJFYNCWCkuK+A/wuayJy0Dy
	hBGCYGbxZdswAdtjrf3PQ8foYL/nO6RvHjKpls6keEh6w1cDBiB5Y77gnRDHFEw6nZns11UbZ8+
	4YmjDRCcAYlLXWf8ZrNyNew+fYjWQVgPrhK7N5ndttwvaJgwUqtTGS3xIdaLGsslhvdHPq9tZQJ
	DgrSL4N2xNJmorSpm4UmG3oZS/CFGokDhmhEOV7c2XnI9SigAQHRtfcp+FZBiBaTJPNEmnFPRxj
	sqXz5AImsfhjGR3cKzPzVz82CU
X-Received: by 2002:a05:600c:4893:b0:487:2439:6266 with SMTP id 5b1f17b1804b1-487243963b6mr14960235e9.30.1774538512012;
        Thu, 26 Mar 2026 08:21:52 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:21:50 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Use PYTHON_DIR consistently
Date: Thu, 26 Mar 2026 16:14:25 +0100
Message-ID: <20260326152143.2224099-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125739

This is the supplementary series of the same subject sent to the
openembedded-core mailing list.

Here's the slightly modified cover letter from that series which
also applies here:

======================================================================
The Python main version includes the ABI flag, which can be either "t"
for 3.13 or newer if free-threading[1] is enabled, or an empty string.

Previously, the PYTHON_DIR setting in python3-dir.bbclass was not
suffixed with the ABI flag, a.k.a the PYTHON_ABI setting.

Since PYTHON_ABI was always and still is an empty string, many recipes
used "${PYTHON_DIR}" and "${PYTHON_DIR}${PYTHON_ABI}" interchangeably.

Add the ABI flag as a suffix in PYTHON_DIR and use that in recipes
that were either using PYTHON_ABI, or manually constructed the
PYTHON_DIR value from PYTHON_BASEVERSION.

This is a preparation step before adding the (still higly experimental)
Python free-threading support in Yocto.

As is, this series is a NOP since PYTHON_ABI is an empty string.
This series does not effect other recipes.

[1] https://docs.python.org/3/howto/free-threading-python.html
======================================================================

