Return-Path: <jandryuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7D5C74A5B
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 17:57:11 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.983.1678730231311835070
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Mar 2023 10:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=og6iTj4K;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: jandryuk@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id s12so14044072qtq.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 10:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678730230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf25XsgAkiY+5VluxPJcvEf8B4LLN8Z2+NrjbNM8QEo=;
        b=og6iTj4Krlhp6h1NkL3hUs5LrIvLuAIYAPalliVJFW4TMWS1fNUd5PFguTycLow4EA
         uUKuu8M1SXVeKGGP709Dc0a44gik3VJCLO/IPBp+xwAsJf1Ji+a/oRc6jTx+s8MF3ryH
         OBbKbmomYRvH4qJCv+NXTj1i3XSmgw/LmNHg84cFPbA/hEiDxjl+/oG4nmHEYtxGwgow
         YKz1q4HSbjWYhbTh7OxK9B1lB2JhqbH+lxeTcAaXIxRlw4xw0pdEHb7XBGmKk08yjZYJ
         l67kzO/mU+cxAf3ilXZTjzpHgy5VR9M/D6GmTAWzU8tHttFmczHBXwi2kWpIPb9pMG43
         BbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678730230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf25XsgAkiY+5VluxPJcvEf8B4LLN8Z2+NrjbNM8QEo=;
        b=Y6TxKSvxVV/gYpuB4q1Npt39LAGn3Nv4pXWDFOWde0UAkffiAuKyAAElowTKsniqzJ
         5ynWLA/h0pfzN6GtN/R9DOBWF6yU4dts+b4fxX95LFKqC+CvYAAnHzfFPQelEjNnZRF0
         2W9GIC3qtxBrsnMP5nPW4ObdcqUqEdj0EOifDit+CKH6d1IsBdX9nbaeafs64HJn24m7
         g9ikMZdjTnunlfnWpmawIucyBKnWiVvWXArrFbxsAjFukyD7B6G1e5dUJcz8rKBcoRup
         fR8QL8NUs6E9Ldk5yTb/OjiGXoLvqdlmfG5lUJDE9JofXRlTgSMHFq5ouNv+2IDs8btc
         yEzA==
X-Gm-Message-State: AO0yUKU/5QukxBaLLvpPRwYw/J+UAvrF/rdT4WStxEyn8rbUJue3UX+3
	ui+zDDf3ibMY/DLEhoqY2mk=
X-Google-Smtp-Source: AK7set+Zb2fbcegx6Ss+s7lU9OFsKw2NHwUxAc+zJxZDPN6kevAJeZ1H6/DWFwvmmzARXrAfvXHIOg==
X-Received: by 2002:a05:622a:1b86:b0:3ba:1696:87cf with SMTP id bp6-20020a05622a1b8600b003ba169687cfmr25346549qtb.44.1678730230326;
        Mon, 13 Mar 2023 10:57:10 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
        by smtp.gmail.com with ESMTPSA id d3-20020a37b403000000b007426ec97253sm115693qkf.111.2023.03.13.10.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 10:57:09 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: crogers122@gmail.com
Cc: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH] xterm: Remove undeclared variables  introduced by backport
Date: Mon, 13 Mar 2023 13:57:07 -0400
Message-Id: <20230313175707.21513-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310153634.3376415-1-crogers122@gmail.com>
References: <20230310153634.3376415-1-crogers122@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 17:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101514

Tested-by: Jason Andryuk <jandryuk@gmail.com>

