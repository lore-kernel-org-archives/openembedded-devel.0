Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03476C46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.6842.1702967274056937413
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gf1sQvPj;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d66a0d10dcso1172543b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967273; x=1703572073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFJeS4qOhf28DogY5wZNHeNmASUCSG82HGGEgjX37R8=;
        b=gf1sQvPjH4u3/EVWC58JhjKe/2Ug+HM0dV0bNjF89r21jBxY0VLAL6ZLflum/qRVrE
         tACIRfu0VrmX6Hz9rUfrQzetcWD1rrJD7RIbCj/mnUennZf4D/K+9R9wCrcinZY55E+6
         NvkERS82oxxqZxyQH8UWI3mXX1gAV0T0NpYJMNggW+NpPeqNET8GNyNlDN4FBIhUNLUQ
         WwcWXwluQoxqpuOWlvmbgsdA0ypsSqbF5pP665CmsMzrQPlj8bWVQX6Dtm8nKXfEGGOv
         c/RwaQ6Tr8qFRiI6mmeqyeVjFPLTnKm1/zGyyIW+ZsGFH7fQWVKn+sLrIZioSI9awM6/
         C/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967273; x=1703572073;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFJeS4qOhf28DogY5wZNHeNmASUCSG82HGGEgjX37R8=;
        b=w2FEJVfIFqw3CYjjuZjjAGPBzzvOcLfNM9zraot0EtWa7tFXEROvXjiWBeyOdbAAFG
         DlWfHjKF2i+bj1pLjgD9fMni6r4PY3MwgVZRX9LYblQ4ULHm6S4C1v4jNXH+yRZSYLXQ
         wWVNil9gkO6SnH7AVzQWfsoHDdUMWTFadDcbSPfjb2G/Uj6nVHvfdLjrhE3HcZeOcK3J
         uzCVyV0ZVgTi5SzmBEkdv6LJrNuxI1yHaTQnuzaJ1vrhXqrSzEJrx3erRY/OtCwhIXdx
         mAiyR+OXu2Ne8HZswWKFHzGRMwLEPFbTkPvoURFKxc8cFwDIEPci1EYWuS7A2/tcNH0p
         7IMg==
X-Gm-Message-State: AOJu0YyT6ncsT8fh+QShbDvDgKgxFGAgSbcRV/wHNwgthrmjxU/94UmC
	rSQwSh5DCbZSMGXFSBGVklgHSTNfJQc=
X-Google-Smtp-Source: AGHT+IFOShhVRvku/q5I1SXdDzHVhPeydwWvcQVDOX1r8Iiv30nwKbmXgSuIWetUA7MqatMOh3tkAw==
X-Received: by 2002:a05:6a20:f388:b0:18b:251d:d6fb with SMTP id qr8-20020a056a20f38800b0018b251dd6fbmr8218489pzb.1.1702967273402;
        Mon, 18 Dec 2023 22:27:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702619685-4145-1-git-send-email-wangmy@fujitsu.com>
References: <1702619685-4145-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] paho-mqtt-cpp: upgrade 1.3.1 -> 1.3.2
Message-Id: <170296727271.1627685.15898403193438665799.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107615


On Fri, 15 Dec 2023 13:54:45 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Fixed generator expression for older CMake
> -Bad LWT message in async_publish.cpp sample.
> 
> 

Applied, thanks!

[1/1] paho-mqtt-cpp: upgrade 1.3.1 -> 1.3.2
      commit: 3f844d4136cf5033dfb9b20012dc218d3610e658

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


