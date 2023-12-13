Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43EFC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:08:10 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.31082.1702451290487746394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S1QR/pzz;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so5559297a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451290; x=1703056090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ohIMN272p0aJb/stOm5/azjqKI8LGZQj6pGDK/wOQw=;
        b=S1QR/pzzPSx8EnR3/bHF6tyTeWtJKqO8j+P82PxhtJTtUyEBbIRVp6boCfVpx4c7JT
         Li2PvxcVLhCn2iwxxsnSoVdZ8zK6Vj4twq1Q85ZhIGpbFRBQwo74/H/xwT90GYNnz5f5
         CQe6VZwRT00hk5v/QxxVaNcVbpUVo3jv/ezPBK1N7m6MVTQBe7wvqiSiJZV6wv93hfEo
         S/lLx77QuIBSZ3NgQ3yHIYiwpdT+gCyKpgrR47eaksDujQhqXrskebQIcKYV/3JI9IzO
         B6G3X/ep8X18PMnIHzV0AK7F3br5ZrniQvLYagdhqtueKLpwoahcgJlvsLbnyXOQk1rw
         fikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451290; x=1703056090;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ohIMN272p0aJb/stOm5/azjqKI8LGZQj6pGDK/wOQw=;
        b=WzJ4phfgk9gBQH5hmH7plQ5Usq1zJdgKh3w5dy8AJtzOHAi+6PSP/gGiPR7ZksXTSl
         /r3O5yujsmNbQCR56TrFErEYLSSomImD0+73sNhypOpiwExvOEBcfD1cLRb75wrxw4Mc
         v41v2EDb5uITCsdgKYQCtT4Xza5xlsStbREq01kuQVEsFBzD6pkT6sA6sJTFM1VEbKty
         m53RBbT+8Y74SC/BWZXW2hpNvxS+7YGv6PTTxN+QVE5wac1ExhCg1632hP68/D/oganc
         Jh9Brf1xY6ue2Cwj4MqIhNDg5hZ0Vh+I0X1Z6UU+DUsDPojrQdOCjWeu/mE/aCc8WZyV
         LpVw==
X-Gm-Message-State: AOJu0YxskZ4pqvIf+XO34vFAdsrWfTbgmMDhwtDa+BRkCkgB12y7fGXp
	zTEkUVsjCfQPkVOzDmKHBRJxmiWD5rI=
X-Google-Smtp-Source: AGHT+IF7uLazOfiSxsfdXijHxxdK/23s4qdBFgEMzzzkyTD0kGRFqiiP8RqmAB1Y3/wcTNmO0U/RQA==
X-Received: by 2002:a05:6a20:8410:b0:190:eb70:c34c with SMTP id c16-20020a056a20841000b00190eb70c34cmr6723703pzd.72.1702451259950;
        Tue, 12 Dec 2023 23:07:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
In-Reply-To: <20231208125838.1723058-1-jean-marc.bouche@foss.st.com>
References: <20231208125838.1723058-1-jean-marc.bouche@foss.st.com>
Subject: Re: [oe][meta-oe][PATCHv3] terminus-font: build compressed
 archives with -n
Message-Id: <170245125922.133993.4250810764056985945.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107386


On Fri, 08 Dec 2023 13:58:38 +0100, Jean-Marc BOUCHE wrote:
> When building this recipe, internal archives are compressed with
> gzip. The compressed archives contain a header with the field
> MTIME (Modification Time) which is initialized from the built
> date. As a consequence, two builds of this recipe always generate
> packages whose checksum differs.
> Adding the -n option to gzip while compressing the archive does
> not save the original time stamp by default hence making
> reproducible package.
> 
> [...]

Applied, thanks!

[1/1] terminus-font: build compressed archives with -n
      commit: f60e4bfcbee68ea29c2c630b3fa5f4aedf500d95

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


