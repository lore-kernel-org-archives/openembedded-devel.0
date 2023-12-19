Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF41C47072
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:26 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.6758.1702967245814144825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCvF/r+c;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cdaa16ada8so730305a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967245; x=1703572045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Br0+EPMs8gfUt1Ax2M0Ul+J92bbWYSRA/XPzF4d2Dk=;
        b=VCvF/r+cNdFaz3XJvDYu3uSAiS/lipryUoNfHq0UgPofhaJTfa2SjwQdKIEnoNK//h
         iNzo/cxPKJqXU/7GK/zw27+0NdYgj+882VYvOlJ/amOP8XdHJGFJiFZ9ekW+cyPDsU3l
         H7x4vLUtC/8zsACia/dglgZkDew8TmBqto4YraBA8KdN31T2VkXtnIaXFDdnOTnl+Rj3
         SOtNCNbO40OXpu1vrej8wcI6ejCBXQwYmojxWFAjmo5U39gfYSf2cw7qn5jByRwAj4E9
         tHG9C5fNd2vb/hBnID9HvRCIw0KFpARS04zG8rtJi3w9lrmpNcAlcLhAqujX7ur6MmC5
         XFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967245; x=1703572045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Br0+EPMs8gfUt1Ax2M0Ul+J92bbWYSRA/XPzF4d2Dk=;
        b=Od78WbVlMbFGlLZCLhrpOYQpeiHlERHdzm+No5xUvdcanYICg4m3JwnCvDgZ4+ujgB
         jTwQdcK2LP4RWU5x2oRaG/BZDXrM9wV93YlDalI3angA1gP4yd572R1KGD4fFk9ocmsM
         bmEWBwn23cVOKA3WlzDtKkhiUKrK+3ELbGxdLjwHIzadAM1NqsbxEDEaN4EJdbmb+K4w
         dQ8Gy76n4Qc5UYmE4UYYdj93LKWNy2Xub4t1NxubMBxPv/VEc0eFJYI1zkI6mPqGvS8W
         NcOxjiwDuP7/Aq9+4+uIMdPljfrkxs6XJZ3MWj0l14kNRCEruBE0T+myo7keOIQDaqJZ
         Z8GQ==
X-Gm-Message-State: AOJu0YyG8TcVA4wTsAERNHbD4VU+7xcB2sUYeyp7KUQuQrB8qBci3pAN
	GVS7jhG42QjJEOl0xkQaQbE=
X-Google-Smtp-Source: AGHT+IGkVaTRruOd8TEUdwQZTnDhuGyNKgvUa0j55pUcCYtFCR+6FoZZ3le3EJBN/UUsykV0sD4AOQ==
X-Received: by 2002:a05:6a20:13cc:b0:18b:3ec7:3a71 with SMTP id ho12-20020a056a2013cc00b0018b3ec73a71mr8478357pzc.52.1702967245158;
        Mon, 18 Dec 2023 22:27:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544041-27880-1-git-send-email-wangmy@fujitsu.com>
References: <1702544041-27880-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-google-api-python-client:
 upgrade 2.108.0 -> 2.111.0
Message-Id: <170296724440.1627685.17013557921649554446.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107583


On Thu, 14 Dec 2023 16:54:01 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =========
> https://github.com/googleapis/google-api-python-client/releases/tag/v2.111.0
> 
> 

Applied, thanks!

[1/1] python3-google-api-python-client: upgrade 2.108.0 -> 2.111.0
      commit: cd7ab6db720fa7bfb7f6bb70137b095d422bcca7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


