Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D2CC5CFC2
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:26 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.43619.1700452285724037034
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KaZg5MuZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso2273036fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452285; x=1701057085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDH0AtQ5e/hg8Tx0QYX8zuTTxZefP3TyPjnpo79RcZw=;
        b=KaZg5MuZK1smV964ZQ8OtM9/aI5tkfR3A7Xh6U/0fAQ639UG+72WEuuXpCrjR6MY6I
         t0l9J0CIgw4URmTeWHxoBPpvd9EpgaN79kg6xi8xouQbNyoSTf/JRZxAtHBNy343k+Wg
         HlEurVJQ+uJEpsYHMQo0THowKOz4l8mb5IStvVjIHe98/r4Ff1NAmkWf5eD/v0BdgyM2
         iKOFGWPQUNk6uHCKA7AwoUIkQZB0G8GTrk4b2tomJcxpLcHY3INqtltlR9ANZLbLVHe2
         7CEuRSfiNjL+Vlxd/BYYSIaeijuVNhKwSrMGUaAtsoP9lvhNaUPBdue9+usqkZUzHCHj
         xc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452285; x=1701057085;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDH0AtQ5e/hg8Tx0QYX8zuTTxZefP3TyPjnpo79RcZw=;
        b=YSwtsvB9rnGXo2zDsxBYP/CqFIWGm50gRpSxaSoJKJT+hOMcgEUig53JLs78dQ2z1a
         V90OOrBOsdO3+PK7uXMbsJJmC+M6PrPl3yT4HOKs6COBswpqh+zn8s9mV+yR7qzEgzPs
         lao9eDfIbfM9xJzmPnhjYP1kLTP6nzI+CsDbbnG/FUTvI3iCKU2pTlX7hyMsieQXNgOM
         yY/fD4vaCKC/dH1INUh0YWGHt0mZ1lMK5H31HpU4GbZ2ToXL7tJhpckgjanuV6NCIkHF
         0+vTCEAgmqCxDpm7vKPRuakF2f2qEg3qjayqGAEsVXqfWwrl5LWAt19O409cPYpPj/+J
         ZxSA==
X-Gm-Message-State: AOJu0YwggnuucPrOeKDlcB4I3n0RbEaGNqpJojzRy+ifEc0todkZbWGP
	bTdTJvVGOTEFwMXTHwFFDKFoLVQpBkhQMQ==
X-Google-Smtp-Source: AGHT+IF7xazzjP8lRjvxYvlPAWbNp8AwvGmlc+lDVN2c1vW1IaueMx5BhMcv0oGp64B8N1QiVz6t1A==
X-Received: by 2002:a05:6871:331e:b0:1ef:f127:34fa with SMTP id nf30-20020a056871331e00b001eff12734famr6864456oac.57.1700452284933;
        Sun, 19 Nov 2023 19:51:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Christian Eggers <ceggers@arri.de>
In-Reply-To: <20231116165715.18848-1-ceggers@arri.de>
References: <20231116165715.18848-1-ceggers@arri.de>
Subject: Re: [meta-python][PATCH] python3-gcovr: switch to main branch
Message-Id: <170045228397.1416826.1508977959683880548.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106940


On Thu, 16 Nov 2023 17:57:15 +0100, Christian Eggers wrote:
> Branch "master" has been renamed to "main".
> 
> 

Applied, thanks!

[1/1] python3-gcovr: switch to main branch
      commit: b630e32f33d230b478ce76573607807313a03d13

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


