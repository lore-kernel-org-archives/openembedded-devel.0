Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6CBC46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:25 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.6818.1702967237957920340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HyO7SwLA;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c701bd9a3cso1777500a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967237; x=1703572037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vs05qtN3CYRuIy8EtG6e0+Z/qPuFF6WoVl4yArvplrE=;
        b=HyO7SwLA22QvVHWmLlzrbaqbWFUpOfcl+ZE3wTo8ntN2gZIPB7nsBaFzTWjYFPLwGJ
         o1Tj9eYu2TrLBsKUd2iqG2ECcDqLzVyr3CgXh9vKoKBDIeLxlEh2PJ6ArzHiRJRFuDqa
         MoojikZ/HNhLCkFYf/VgukyIAWTuPL/xPCv06NRZwmr666tVCMxxn4QmatloK8HGiyhN
         0T2lk68HgHj/Yc2ot6EQ4Hs8QZAWQclqPEBsu6qcxw7xKInR8q6htqucqEZjMeOp1CHc
         JKvhranBS7puXk2oJYD7NQC3NhjrLhvpCyVFj0QHaWiJAKkHJ/g53juZft8VcI2ijuoe
         RTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967237; x=1703572037;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs05qtN3CYRuIy8EtG6e0+Z/qPuFF6WoVl4yArvplrE=;
        b=UVmW0VPGVRKlBTJOLhmN8JUYJ4GshVwc7ZTet1rtYRiYRJgE6bJNRx6vhF1v+3y4ol
         Vzj9PJkh90sp2N0Tm9cTdzzn+Sk5TMrxBjj5iH+vi6xDn+OCuT7wCDEl3JFMhSBzA1E3
         AdOJpL5d78sHCNteWik66BOtCQ04WF43Jeb1aR51ldwM6GbqBluACKKUiM7i+wtEc11c
         u33k2QkkuT3jr5jTECEV8YlQWrEP2Oh7gX4Qhdo4wvffrKCTluw77dKCqv6sPV7fdPzl
         qF13EWfD/Qk/mKXsZu92Cyfk5FemsXbpLaN2E+34GE6wjpKFwpyIcnC5m69fLRw2MghY
         bBcg==
X-Gm-Message-State: AOJu0YyHKg+o1DqXr4ZqkutnDFU44WksX1RvLWTT1OTzl+1mVT5iy2IM
	zfdN8ZgTIlipDYRYMuNvrt1N99Xvxuw=
X-Google-Smtp-Source: AGHT+IGVEr5KPfv0TEq5d7u8Quq5PCp9XdtfHtarUBFBFcMHaU93t4n8Jo6wrwIYEvzMm+eSQXgJ8g==
X-Received: by 2002:a05:6a20:1612:b0:194:91f3:cd0e with SMTP id l18-20020a056a20161200b0019491f3cd0emr806719pzj.57.1702967237350;
        Mon, 18 Dec 2023 22:27:17 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214053725.1214842-1-derek@asterius.io>
References: <20231214053725.1214842-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-bitstring: update to version
 4.1.4
Message-Id: <170296723679.1627685.7031300561905576949.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107574


On Thu, 14 Dec 2023 05:37:25 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-bitstring: update to version 4.1.4
      commit: e650892546d0789034de85c90b331d96fa155250

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


