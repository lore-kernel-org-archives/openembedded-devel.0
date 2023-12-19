Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC808C46CD8
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6844.1702967275587428236
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SlM5lNma;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d3b547cd4cso8908375ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967275; x=1703572075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/w0l8OXcgiC2WQEGbt6J3Xy1fb9lJr8wsiISPkK46k=;
        b=SlM5lNmafIxru0GWv9nrhzQKEgPAy5p26yjBM03LT0rDbHC2K+KyRWFBSlW9LkhBiD
         7g8dHYOa+tT83VAgId051jlB36kYEb7Ev/HJoS6Cdbx5l8vUAHmRJ5x70zYqSEWp52qT
         iXobmuaRVDKJsHVITA1PrGmKrCmD5CWGVJpO5uZIaELcllqoYoow2zgEUEI+AHsnR65Y
         Ae9pNN2xA4dnQFXTr5kXSbvne6d5GubKgAGkOyDrcHJapBvZeLPUS6GLY29Y4Jm/8+YJ
         ASeZouoTJpG2GmN7GpiEgzvegKH2buQe9ztknZYj2J2Z/LCN+3rz8LtlUvjtwVCTVV0X
         z81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967275; x=1703572075;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/w0l8OXcgiC2WQEGbt6J3Xy1fb9lJr8wsiISPkK46k=;
        b=bHlQtEeiVHizXw7f0g+iieP2xNXglYf9Cy1hUeWCNsUHQlf9dZqBYJHo/bXz1zBXpo
         kM/oCj3BVPRxti+zzp5Yo3k16eTM/pkCLanNV4XiViQavqZ6bIKOb07gK+4ovYP/Bd85
         UsEue9V2TnMa6C5HS9/dyq9EufNaEeRmeyZOFfN92ttpYeT4p7EjruXPcEgHHb7nfNug
         +xwAZFKx6D/7HrZ5XOMW4uM4QYsUI8OIlRgSu5Lu64WyD/sLhOpg4WYVAgKrCCYmebiv
         /fN9VtWBaYoiUrVlOpHASuOQ/uUQKb1eW9ZrAEpir9KFn9As1wyQutNedmJ8RafuE2wV
         3O5A==
X-Gm-Message-State: AOJu0YxmxI8LiqJTNo1EJYI49N96JCrnCQzN5NwWfZjMi46k9n9flbJm
	O5enpWL2Sv9vdlQHIMd22ut0i3oFR8I=
X-Google-Smtp-Source: AGHT+IG/SWG5ugB8fc54/JWsmEpvn4KcwkiGDd51oXGvCmWBayIwl61zdHh8lzEDIt1OaMHyJpK4tg==
X-Received: by 2002:a17:902:db02:b0:1d3:d8eb:f8a5 with SMTP id m2-20020a170902db0200b001d3d8ebf8a5mr639680plx.17.1702967274939;
        Mon, 18 Dec 2023 22:27:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <20231215160103.2164505-1-leon.anavi@konsulko.com>
References: <20231215160103.2164505-1-leon.anavi@konsulko.com>
Subject: Re: [meta-python][PATCH 1/6] python3-expandvars: add recipe
Message-Id: <170296727443.1627685.16183941439646997177.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107617


On Fri, 15 Dec 2023 18:00:58 +0200, Leon Anavi wrote:
> Add python3-expandvars to expand system variables Unix style.
> 
> 

Applied, thanks!

[1/6] python3-expandvars: add recipe
      commit: 122e937a0e0f7986a36df0e4cbaf42d7bdd2ddee
[2/6] python3-frozenlist: upgrade 1.4.0 -> 1.4.1
      commit: 8cb3c9b8db52761d7384371baacdb8ac766c55aa
[3/6] python3-yarl: upgrade 1.9.2 -> 1.9.4
      commit: 038fd54f28ebc5c8d3de47b0a37d4a1dab555ede
[4/6] python3-coverage: upgrade 7.3.2 -> 7.3.3
      commit: 01bafc3eeb61e9ae78e096513ea9ff5f3c285fbc
[5/6] python3-cycler: upgrade 0.11.0 -> 0.12.1
      commit: 39ff8dc26c4cd742b5c93ced99ac4d4b31d4529e
[6/6] python3-aiohue: upgrade 4.6.2 -> 4.7.0
      commit: c754b8ec0c75dd1e8bccdfc45dcf9c2fa4979589

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


