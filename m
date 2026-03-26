Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC6D10A88D9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:32:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50366.1774539145076557135
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lfUZJRg1;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso10248665e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539143; x=1775143943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8g9GDvhLEBoWJ7oSbaQrT6Mk4L2AoyDE2ymIcKRilY=;
        b=lfUZJRg1WaPLpfTfSwCIdztcHN3h2tcQNigUr3/Yb2OVz/8VB8GJEhuBRzkEhJbHV8
         Wqsh+IgpVR0IiOjezIBfqEcxACKsle9MLIdl6LZId6oWfVGO5l527zEYgo2iDhYumDMI
         wKw+voK3XC78CVxPIHgA8CVyTQFW4Yk7dkXvn1QACPXP4ZAkb9aMvWDhhzoDfS/f1aJ2
         /dcRhDG5TsELIS7G0lXk0DOM2cvi13BHQizGaA3gyRXZORrQxSU2SqYDfqjHznAjAn1P
         26VGeHxL++ZE3rLbRN+pn+2nWmtHCOZ14zVKe/EGagUdYn2D3C7rw1FEywqkINS+ivfK
         7xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539143; x=1775143943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8g9GDvhLEBoWJ7oSbaQrT6Mk4L2AoyDE2ymIcKRilY=;
        b=lpD1ty9PxsJecYWEJCM9tono9+SbVk72gSARdLKUyACCX+UVSKuXTTt9dMvxkT3KGf
         Tazk89HamHxJ71p7CpSoeG1UrbbsTi8oEIMDRLdv62bC+E74h7hu8oA6uCqesEtsxqsb
         E9Qn/q62+i9Ppzdo+NGWe9XNjO+YtKGw6BSbc0q7rA0kG/yI2zLRM0YSXgqR4Bg6UnK8
         p5/QoEFnZf9pOWPk07MPsLuIBMhwFuDyRx9dp+sc6Rt5KKf63QkA3Aycg4Ba4tnPzXd/
         SfvAf90j6CG9A94J1fX81XkLjTMJtUGUiaMRhv2t+WzlAwVTTDrrUjPXYbVnMKjsIYxh
         hMWA==
X-Gm-Message-State: AOJu0Yx9d7AaIsjh3gU+VebIHhfyR9/XI/lYRT6tQV4S3DkzOHRGybwu
	3jdBotQwr/jdivMdrggSkq35llplqTs2EGfqpO1lD7X/ykzm0OsiVrGGuKhlYQ==
X-Gm-Gg: ATEYQzyiJQQASTeqh3RTwUm7u2VPpQ/WKWAyPjdqe06l32nzWCNC2tW1tu8xOOV9wBA
	8cruRwc31L9+OkA8SklWnm6D6hUHgfr999kGeb95jH6xjjkdZACxmwLlRDDZ/sftfd/sZs5hBir
	9IJ556tPan6xouUDXsZm9xRBRxY+nnCd9cc+5N3lliHhUwBuzhFELxywVujRljxQ0oVwiti7sP4
	Tl5GwpwRlpvh5vvMUFXsNZwXnhy8OEotZPcoGp8sfaLVLLsWgLxot/Ya0WsA2XHvVnaTXlCdbNU
	sZiXhxQ3BJjXITPagz8RQEqAyUNS4T56pLWOvOS2VKFrowIF588QveW910XNIflwoi+H9qX14DU
	5ctN42+BAFJvhbVZwA7VHSR9TRMFyW6LveYbapwqEterKtsZIr4c9/dNls8WhlaAte3In4FjorG
	peyAxNO3q5SVs6qA==
X-Received: by 2002:a05:600c:c177:b0:487:2e8:69c5 with SMTP id 5b1f17b1804b1-48715fe2aa7mr119222275e9.15.1774539142455;
        Thu, 26 Mar 2026 08:32:22 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm66936295e9.1.2026.03.26.08.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:32:21 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC][PATCH 0/6] Fix some fallouts with Python free-threading enabled
Date: Thu, 26 Mar 2026 16:25:04 +0100
Message-ID: <20260326153210.2245962-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125753

This is supplementary to the series entitled "Enable Python free-threading"
sent to the openembedded-core mailing list.

Quoting parts of the cover letter from there:

===========================================================================
See https://docs.python.org/3/howto/free-threading-python.html
Quote:

Python support for free threading

Starting with the 3.13 release, CPython has support for a build of
Python called free threading where the global interpreter lock
(GIL) is disabled. Free-threaded execution allows for full
utilization of the available processing power by running threads
in parallel on available CPU cores. While not all software will
benefit from this automatically, programs designed with threading
in mind will run faster on multi-core hardware.

Some third-party packages, in particular ones with an extension
module, may not be ready for use in a free-threaded build, and
will re-enable the GIL.

...

Compatibility is poor for a lot of modules, that clearly spell this out
in their pyproject.toml or PKG-INFO:

     "Programming Language :: Python :: Free Threading :: 1 - Unstable"

or something not quite production level support.
It's still experimental for 3rd party modules, despite being officially
supported for the interpreter and built-in modules in 3.14.
===========================================================================

That being said, a lot of python modules included in meta-openembedded
do build and use the correct site-packages path after applying the two
series, i.e. the module is installed into ${libdir}/python3.14t/site-packages

The usual warnings apply: DO NOT TRY THIS AT HOME.
If it breaks, you need to keep both pieces.

