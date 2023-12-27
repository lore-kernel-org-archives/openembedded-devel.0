Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8120CC47077
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.98072.1703665315612716428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DW2QniEG;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28b6218d102so3834615a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665315; x=1704270115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBlFZSTmtXFL23U7+OjrHIRVX3ATisb2rXlJidoCTp4=;
        b=DW2QniEGlBagAKjHNoNLyuaZ9PQ3nHp+NXJY2JgTFK5uDp8qI4L4/HzSIFSj7b6LNs
         9yy7a0c/NaTkwK+iq5PqKMGpcBnW03LniFwOKrNcDN4gpiv6dT21+2HsENNQwKNhcAVB
         CUhTgtJk6n68QlGC4f2NSuKN8L94ArKOVRGKjz9r9cBawcLlJ5+1PcrB6Yqy0YCYGBSB
         E/Qrgb+G0qJCkZoXe6aU6bb8HfyPVXqiYz+KB8O/q1Oit3XAbAFc7av1GeDA0F1fGn+S
         Ups5LHnItPvOPAmBGydDlA7AETL9qQttcJvoB09nJOdKlQ6M7rXt/o4SIY0CPeSvEa3S
         8q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665315; x=1704270115;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBlFZSTmtXFL23U7+OjrHIRVX3ATisb2rXlJidoCTp4=;
        b=Zf5xpyfYi0AXpzKevfoimptFd6LKnhjvz77P+4wb6QWodDZpfg2Y1+YG5omvUK1AgE
         G7uvQopto4xZ1NCUF5NTklRsKgI6nCpi1MZKwvDV30B0/CgQwSVY/Zbuh9N/9iR1C+S6
         YnIEU29UMXXu5C3H2L9p2EcOXQPohrkPUc71z035gbqjc3RYwqtJM/72ssE+KrsBkF4Y
         BMb3CD4GjsmeZaZjAJHGpmo7RRLOrCnpwZHFCm0PCTJeDZNowKrK2yKauqfYisVkvLw1
         AEqaMb/OUQSM16+j6Srx58ku7IdV8C4cnE7GhO2O1/cf1YK3rxwhilSpdaNjLlm1KIg/
         lDpw==
X-Gm-Message-State: AOJu0YzuBjnaUIDHyqwT9dCGFuqkoeaDRhJ0CJT8lkWFnbg035drNNUB
	SfH9AdgfuXY6RycNVXiX0exYrtZ4ay8=
X-Google-Smtp-Source: AGHT+IHymm7Da5DkWbOkjOd3BZiGZmYq29i+EGGKglI9rT8bNlF22ONoW0iD+RdRqgokiQYFX/adTQ==
X-Received: by 2002:a17:90b:4a87:b0:28c:3617:76fc with SMTP id lp7-20020a17090b4a8700b0028c361776fcmr2413167pjb.55.1703665315011;
        Wed, 27 Dec 2023 00:21:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221230457.3965350-1-derek@asterius.io>
References: <20231221230457.3965350-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-parse: update to version 1.20.0
Message-Id: <170366531440.1947762.13676458620587132722.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107863


On Thu, 21 Dec 2023 23:04:57 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-parse: update to version 1.20.0
      commit: aff8b4d6e727f48e5769d3adb750e31c0bfed7b6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


