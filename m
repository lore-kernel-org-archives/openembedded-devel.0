Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD8EC46CD8
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.6786.1702967282526112991
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jc2wpgfC;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cda3e35b26so812964a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967282; x=1703572082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nx6htR4gjpJjOWVTSonCw0sUVUFDotk5HdRehXIOgsg=;
        b=Jc2wpgfCZAoI5iYc6jVvnE4ad75KYZOCDWx+57RWUMrEDm+evNfJV/CV99ACePjlu+
         T79FyYKxwkm1jgR4Z5NrX2NuErbDcrRShWlsiABph0MMDsj50ixBz+xRN69E6qCTbJhy
         ix2RfAaoGtZAJYDSsTyqGZExfcDZWBjDWMt86BJeyK9foDSK2nc+RDguzZ0S1FaOvaOQ
         YPNZ//2zVD0t0w2R0qKS2ls7FMfaokHBWfLeb+SFmSmP/xy3WgwTSCnqALMG5SHJOazY
         gao7OqFDSl5ZCzciKQZetuxGodvZpUF1M3lpdOycMm3occGHLLBjyN2sFeVbTrKrch9k
         nVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967282; x=1703572082;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nx6htR4gjpJjOWVTSonCw0sUVUFDotk5HdRehXIOgsg=;
        b=ZHDmky8MMZkTWuSwfTIQW23HNtVaMEKXggDkPXXbhrQnc6BtIN5ejW9AXlu3oH5WIt
         1bunh/EHQFjiecIxOKHKlBUWSHchTD+2KPLJMUqkWTCmtDy3A/YlcubiwDkmSBOLu+WZ
         5hEQaJCdwjF+LqzETdgojs5zJ0+bdwpcfkDTiGeh8ODwndwivL9bsDS46fA8gd7ZKjsL
         3AeF6YLI7HNWJu8LaCrhncTwSsBnDyzL/8WIrgY8QfaO783KgVs2JF77MU0GPsxeAfYi
         e37qA01ENRz1EsMtzUsBzKg7IjBFxxaR8gcW5gP+YQk8CbEmqUVHza+5Sctn1g6qVufq
         p2mw==
X-Gm-Message-State: AOJu0YyDb041jyF+Nb+2ql/qyljlEiRTDTEBzZAbvT0XYUEkptPR3/gn
	lb0i1Xzmpt2XMnA95D5jefw=
X-Google-Smtp-Source: AGHT+IE0CGeAC4odmilCypwLiEAcZ6fzHWVw6GORKjuh13NaiT0lRpXjKbQLnShNwbM1YvwrV7MXRA==
X-Received: by 2002:a17:90a:d147:b0:28a:b494:ae80 with SMTP id t7-20020a17090ad14700b0028ab494ae80mr5384002pjw.85.1702967281920;
        Mon, 18 Dec 2023 22:28:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:28:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231218133747.28222-1-alex.kiernan@gmail.com>
References: <20231218133747.28222-1-alex.kiernan@gmail.com>
Subject: Re: [meta-oe][PATCH] mbedtls: Upgrade 3.5.0 -> 3.5.1
Message-Id: <170296728124.1627685.13371846518412143799.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:28:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107626


On Mon, 18 Dec 2023 13:37:47 +0000, Alex Kiernan wrote:
> Use canonical URL, add UPSTREAM_CHECK_GITTAGREGEX.
> 
> Changes:
> 
> Dave Rodgman (12):
>       Header updates
>       Fix some non-standard headers
>       Update documentation
>       Add Changelog for license
>       Update license for p256-m
>       README improvements to 3rdparty section
>       assemble Changelog
>       Fix typos in changelog
>       Bump version
>       Update BRANCHES
>       Update Changelog with bugfix entry
>       Add docs re Everest license
> 
> [...]

Applied, thanks!

[1/1] mbedtls: Upgrade 3.5.0 -> 3.5.1
      commit: ebe950c8e9c8d57953ec50c323e015a92a4204ae

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


