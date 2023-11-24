Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D56C63707
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.120991.1700784069003348523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+HoTkgy;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cf856663a4so9649085ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784068; x=1701388868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3aSdV1etdS4psUGKC6B30t9jdmJqeW2prV873nucXg=;
        b=H+HoTkgyQDma2R3jiUpporWOjEwTNzUd7dtUnlLf+Q1AWPmILfmvtvtSTq9bfHi4Mi
         W+U81R/tOTFQaFC54VUcN+9E2WANOFMD9b6yrPuyNMkn3e6+cUg6j9LojnNN+uW3WSKQ
         RADcpCSmOZzlXCHpHCAy69U/w3NF0G+0P/DVboI413VWBg0Fngz3Q0HByjq5JhE4Fl8g
         5acLqIoVJyT1s1XmJBJYEq9cdEmL5RA440tyoJz2eydgBvoYC4gCLn5ytHlE7mBu71WG
         5pqrBdh7brlx7rscn/3zsel+EIzwRZn8ddMMNqikLvXUxXWwWv98W+f5cSlwGzKCyzZH
         LGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784068; x=1701388868;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3aSdV1etdS4psUGKC6B30t9jdmJqeW2prV873nucXg=;
        b=hbdgn1TnuI0Kt+UyKLrNz2aTU4NyWPK7dWzNBOszHN35ruSx3WMcGkT3skgDbP+YZi
         ePA+ZotsNHZYdEHyhq9M2hPyvoF2Z9nILQ5iYLkDUOTpIQEQtnfPFNrDmaK76sbE/TpK
         HDBhYSD5hBHA3kWgiwtbzwL9oxytxn6yBn002Kde2GhD9oZCPrdKy7F/omOEhbyYIsgE
         setRAceSd8m0UwluI12Y6mW1TSipGyYbKOBe8wFbUiQS3mLA277G7bE/NBxK7xaRz36L
         lPK2VRruu1AMxvVQt+pid/P0P/XvrB5c/OZJmnMxbDNEWfrMZhuA60UnMN//iyT9eTu8
         GbrQ==
X-Gm-Message-State: AOJu0YySaDOVOdxG5fLhCPgaHQh1EnTHxMw8ZmpUQF81v5jmNuSC4L6g
	3zJgEpTG80Vj/0cCc0j9cqUpgEPB1L/x0Q==
X-Google-Smtp-Source: AGHT+IFjxHqJckhh4Ix9mz9FMs3yi/C8ZWEMzooOmAq10ALjBaShhWr/Rfr31/Xyi8O/v6cRaI3sdg==
X-Received: by 2002:a17:902:ce88:b0:1cc:53ed:cc78 with SMTP id f8-20020a170902ce8800b001cc53edcc78mr1091022plg.15.1700784068066;
        Thu, 23 Nov 2023 16:01:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634662-8194-1-git-send-email-wangmy@fujitsu.com>
References: <1700634662-8194-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pdm: upgrade 2.10.1 ->
 2.10.3
Message-Id: <170078406726.3118595.9725425674040196626.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:07 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107038


On Wed, 22 Nov 2023 14:31:02 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =============
> -Create virtualenv for conda base Python. #2409
> -Log the response text when pdm publish fails with HTTP error.
> -Improve the error message when a specific package can't be found in the lockfile.
> -prevent wrong project name (including space and illegal characters)
> -Fix a bug that PDM cannot detect namespace packages correctly when creating symlinks.
> -Fix template files created by pdm init being read-only when copied from a read-only PDM installation.
> -Don't reset the build backend when asking for import.
> -Never wrap the output of the export command.
> -Forbid global project in conda base environment, since it may remove conda-managed packages.
> 
> [...]

Applied, thanks!

[1/1] python3-pdm: upgrade 2.10.1 -> 2.10.3
      commit: 8bb82a69ee64fc8b400f3e5e10aa0e4d65cf6f60

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


