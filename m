Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466E9C47077
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.97651.1703665284665731481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3i5GWTG;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28bd623c631so4188185a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665284; x=1704270084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qc3uepHt6mOWvjxeUY7vV9UPEDV8ELfagQyXFejxyKw=;
        b=S3i5GWTGTl78sylTTFqxUWPXTkYWtTgX/p9ldDy9mapnZ56XSXdGQ95WsOLf16uGyk
         09UJxo1S68V9vWx7ljkWlHXaUoK9L1bycnfAo58D9gPj3U/dp+nKX0CRr1IMojFJHKKw
         pQABGGsabTiKE8k4+/s0kXdpvabNAryo5JDXPFZb1X1iic13TSqHrPqmeEqsbkeSA32o
         B3kiJTU/iWpN7n2AUPNPHom9cbfItF2i46SDWbyds0xUJUQ9DwryzMlWOJ6AQwWI3yOr
         8k3NCgcg/7eNs2CXitsZLJOhEnFU7KZQf8PO/TekcTxoprngTp/dlWg4TjFoI9Cd7yqM
         IJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665284; x=1704270084;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qc3uepHt6mOWvjxeUY7vV9UPEDV8ELfagQyXFejxyKw=;
        b=gLzn5gUo4cmL1o3VcaWCCASfOMKD1uWu1qwqzIb61sEmqL1hmpOhue8TMqHVWA1SH7
         CVRlG1Wp7aP9Jq6S3ytEis2v07zU6W1pGsD3cH1B5W31R9LYVShm/sUOV7srk9hFFjS+
         GQQcTXDCUSpIxjHHRFTyvaI69yA+bR2eo4+JKfs8a9QpGQu3p6w61mNqYTDGAlPFoc6E
         xhflPgQYmvpyDMgV6tm0/SWI8vLeCjot1cAwf/7juU6rC/R+qCNqohvucJc/iIRwygnn
         WAQrXxnIAkUVsmBtNxYM1XCwP2fO0OQqcaGCSVgGwgQjFhdS4r3cO/xt4rgKQd7cefq0
         QTqw==
X-Gm-Message-State: AOJu0YxGBZoFe6YzFxkMgzOjaNnKI37vy8iOYyAZeu3+UDjhcZLiu70I
	Pfx18n8D9vqJyZD+Pd15/q8=
X-Google-Smtp-Source: AGHT+IF7eajKMhfL+c/3F2gDVNMTnUlR6+7LggAETrni8+Z5Fb7I7YCS63M3cYx1wy4daMmpSLdprQ==
X-Received: by 2002:a17:90a:9307:b0:28c:7a2c:c690 with SMTP id p7-20020a17090a930700b0028c7a2cc690mr1331194pjo.7.1703665284106;
        Wed, 27 Dec 2023 00:21:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220223849.3814301-1-derek@asterius.io>
References: <20231220223849.3814301-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-wtforms: update to version 3.1.1
Message-Id: <170366528331.1947762.447392012359493520.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107828


On Wed, 20 Dec 2023 22:38:49 +0000, Derek Straka wrote:
> Updated the license file and verified terms remained the same
> 
> 

Applied, thanks!

[1/1] python3-wtforms: update to version 3.1.1
      commit: 34a49f38c57cfe2cc61ddbe28ad9165950f1fa0d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


