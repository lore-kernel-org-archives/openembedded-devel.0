Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493ECC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.6787.1702967284271170957
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Owsic412;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6d2350636d6so3669249b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967284; x=1703572084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QURRmSfRRNJ75e6iaFXvryi6muKplab/tgpARlxMeY=;
        b=Owsic412NpcKRMmQe3dgVFVWYjvl7+HXvyxxm0RqM83AeCxggsuelNjyuvq/HR8UJW
         VmBTDReMZz9gwokzrMPViG7jSTaaFEaWJcWs/h7G5ugkaXNZu8ebpF+AGwULd5bv99xh
         e7UyW5UaDmHXWKa+w/qwf/DAsCY3ByjBOo5wS+Ar2Fk3Zn09/w+PoLdE/rxxSiy8SlOK
         EqERL2y397DvRlTz7hIvHgnua1q7cJVyy2nAFexmJFQqFOVnZ8W/9fF2MitiYEEA4Y3q
         4tOrHHYeMfREw3WE0xbR+raHEOqA83/jc1YVpLTfwK2vWfpCrWtZa8kt9ri1h+Dh+l6k
         nx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967284; x=1703572084;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QURRmSfRRNJ75e6iaFXvryi6muKplab/tgpARlxMeY=;
        b=letpxIh7aUXPwvtpcB4cNHUwnVOnZ2o0mn/55oUMCu0ejsFleNo+Tidt5Wu6U3FYGI
         owXSDX6GFNl6wLkoINnwVipcoqsBlpivUuYKD8FPU4rWwq6umf+hB+kpIHBKhMtmvjxR
         8QVO8ECAaIOSNdOExG2aRrsavRjgvd91Dl4DZ0QDny0eFXbN4UGsC22EUKFDz27DZg9a
         17CDVOMYiNYD5rUVYCn45/TvHjZVBa+ZT/a4go4HrG2SBJaOkqJyuJkpXZanjiRUTSCA
         +gfIXnGOZVAITD8Blq8cUj9EsZFZeIEVRbA9hFsOXVyqijcXw016+L/2S5iLQxyMGsWM
         gdpg==
X-Gm-Message-State: AOJu0Yz8q4E/9SG2oXNYrMTnbicy9duEqHv+RUvG7WrM+PWdPnOQeWQP
	cpHU7YugnisFKLA5umtkD/o=
X-Google-Smtp-Source: AGHT+IG9zQq5EmSEbiK4dMJ/2PidGGHusNBdKowdQ/YnR8HKwsfsBg7G9vafWMp5tsS9i9uaBSjL0w==
X-Received: by 2002:a05:6a21:498a:b0:194:74c8:5b3 with SMTP id ax10-20020a056a21498a00b0019474c805b3mr2471525pzc.112.1702967283580;
        Mon, 18 Dec 2023 22:28:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:28:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Joshua Watt <jpewhacker@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
In-Reply-To: <20231218204651.4055447-1-JPEWhacker@gmail.com>
References: <20231218204651.4055447-1-JPEWhacker@gmail.com>
Subject: Re: [oe][meta-oe][PATCH] redis: Create state directory in systemd
 service
Message-Id: <170296728288.1627685.6996733357803627912.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:28:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107628


On Mon, 18 Dec 2023 13:46:51 -0700, Joshua Watt wrote:
> Configures the systemd service file for redis to create the required
> state directory before redis starts.
> 
> 

Applied, thanks!

[1/1] redis: Create state directory in systemd service
      commit: 7e7f670f4b38d07985e24980044cd26cd346cc76

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


