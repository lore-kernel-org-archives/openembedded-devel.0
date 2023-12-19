Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B84C4706F
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.6828.1702967259640332318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nFlFg2n4;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ca5b61f101so1440749a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967259; x=1703572059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXyPOgmxM4jMBp8Ch0pbbWsSNhDYrvE7ZkSUxf32tQQ=;
        b=nFlFg2n4qEAWuH7jM8B7FhtZaecqds+k7d0d7KoXv+3as2iid18AVVk9ue8KRymA/s
         XHhNIgdej0nkz7kmpCEkGSzCMvil9DXhH+tgO7oQAML/a3qqDXSlkPGNeZhsSNgS5j7Y
         zQNoLew8LVCyax6YBC8w+lFBDrxxPk0qTwymfsQnCha8ZHtOSoXUoV3MtElDjQou4sOx
         +ks4i+Clb9ssCuVZyt72Gx19rBJKr1MNc5gh/JAshTfhzqFrkNfmL1hXKNy/LkBJdlhv
         QC7lfaj2JfQSITRtBYE7dzQox2E+BmskgCjRN+5CioN7kRoW5FSOu76wtuK0IwLTE6Tf
         dqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967259; x=1703572059;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXyPOgmxM4jMBp8Ch0pbbWsSNhDYrvE7ZkSUxf32tQQ=;
        b=o4R8shEBjeWJlQ3jTxwFVIgjvBdxK06bXR5FEEZlFyOH0g1xGSwD0R72RSfWuuAYdX
         pmBjNltujR/PscJLZIwlSHbDkmjiUG8UwHomZy75aazfbRcw7Xtr8EdNooNvF5+8vf2O
         xGcjiZNS/3MYt13L7E4a97t56EwGAxC5log8DIZhxjVR8Nhysvj8tK9ZNSj92e5Ev/jE
         2EOD4X7SDWI+VpHqsb9a4qCQhs3MCEHEQmiV4yh7gunw3JdvjDONgNckvELBu0Bq28LU
         ObY/DfITiFu6kNRJLhnysyieDIcaUrcgUUcXTnEHknsl46l+qqRbvCUJtHVkH36NNElr
         aLlQ==
X-Gm-Message-State: AOJu0YxK0kcfrP2WflfTptoRIGOOa6HJtmStv5ylM67OU3zGJRiZA92U
	pkFAD0tHp+5Mce7Cjx/ILzxVFYMOg5M=
X-Google-Smtp-Source: AGHT+IHRpg6XoD50/c6RAMb907UhraagU6/hh6f+NdNxT3LTk666FiDIAD0SfWiJ7ioPyao4sJzohw==
X-Received: by 2002:a17:902:8bc8:b0:1d0:a0f2:afac with SMTP id r8-20020a1709028bc800b001d0a0f2afacmr8015182plo.131.1702967258990;
        Mon, 18 Dec 2023 22:27:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599413-1539-1-git-send-email-wangmy@fujitsu.com>
References: <1702599413-1539-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-eth-rlp: upgrade 0.3.0 ->
 1.0.0
Message-Id: <170296725791.1627685.968631406819440632.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107598


On Fri, 15 Dec 2023 08:16:53 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Drop python 3.7 support
> -Add python 3.11 support
> -Merge updates from template, including use pre-commit for linting, and
>  changing the name of the master branch to main
> 
> [...]

Applied, thanks!

[1/1] python3-eth-rlp: upgrade 0.3.0 -> 1.0.0
      commit: 8ec035da44d652f872e910ccf0220d47c667cdb2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


