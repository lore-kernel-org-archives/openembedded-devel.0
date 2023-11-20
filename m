Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BCBC5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.43623.1700452289934174477
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMxcdegH;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5c9d850a0dbso8990377b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452289; x=1701057089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yftQTRGPmVzJnq6Q/rzIsZFEujIK5d9pwDkAff1f1GE=;
        b=AMxcdegHf9Zxw+ZJNOwWIPksZSkJHuC5uWqIpI9pwUhP9iIqCpM0gc3VTHjgbNlVpj
         BHOchVZVun9yBIywTYTr8R3U8NfMGVNMVQ6tMOwEkoCkDsNcJmcUlOe5kbtaAGtnmShS
         zj+O9xomBIXB9yLwZ+fFN/hg81kJk4Fa+O18V+CgjSl9Z2cz0QUVoRG8aHPCFlencDma
         DYXwLLE3uWcc19T1rMK6U3IPM6pZ61awjOHVxXqf762mH6zzzsK3xry8Y8wi4gYn1bb3
         4uOHe5yJVs5llw0xEs62JGOwFD70E5BtNkjBIjJPCdDCg6fzN7G+Vuh4oQnl/07FczcU
         KKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452289; x=1701057089;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yftQTRGPmVzJnq6Q/rzIsZFEujIK5d9pwDkAff1f1GE=;
        b=JWYh+dQIkiq8KX2Z8PyATMGgzfjGRvXIwnHWiGbqdmvje1Z8XZyBaDrl5B7SxuHC9E
         XJ//kqolhrUyy7r1nFvlvGsTwG31ALVkH8B+VWhOGK/pu1cfeY+ywd+LUMqdj7s/iS77
         UA2e7xYeJKC31fcnRUlHQ6nMW9Jd3NAyHNe5WH2uml4tECr2CdFF7/yRSnpCXTsBlv/V
         JOGqDHTQXnbD/V+M+uUArwkcQAcltgs+Ysf9442hAs4CkRJJDktnh11ao8o3nXWwkmp4
         muLIDTtoG7ZEo6S4Gd2pfTH6N4xiGZPeiUNg2sd0K9syHLcth37gAadUcjRSHGM2lHom
         Pr8g==
X-Gm-Message-State: AOJu0YyBStgEhJOqJ1p4ruLkCipeIYH2Lo6Vsm5pmDZPT7VRdBGymOvw
	rKpXoKsDSm5WELB0PgDYdU+1pzI/sq8CVQ==
X-Google-Smtp-Source: AGHT+IEVPQ5QbezLF/QT17sKYL/96lt7pIP+YyvbWn+UwslHaC/nxm0HBrDHUqwLymXHTy7WZUD7TQ==
X-Received: by 2002:a05:690c:4783:b0:5ca:876c:39ad with SMTP id ha3-20020a05690c478300b005ca876c39admr1144812ywb.15.1700452288922;
        Sun, 19 Nov 2023 19:51:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jan Vermaete <jan.vermaete@gmail.com>
In-Reply-To: <20231116183956.26469-1-jan.vermaete@gmail.com>
References: <20231116183956.26469-1-jan.vermaete@gmail.com>
Subject: Re: [meta-webserver][PATCH] netdata: version bump 1.43.0 -> 1.43.2
Message-Id: <170045228791.1416826.5763973750111569217.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106944


On Thu, 16 Nov 2023 19:39:56 +0100, Jan Vermaete wrote:
> And fixed the upstream check for new versions.
> 
> Changelog: https://github.com/netdata/netdata/blob/master/CHANGELOG.md
> 
> 

Applied, thanks!

[1/1] netdata: version bump 1.43.0 -> 1.43.2
      commit: 0f87d09d110a1c7c60707273d39ae0966b5daea7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


