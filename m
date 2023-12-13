Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A341EC41535
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:50 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.30709.1702451265470447696
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPq4x4g0;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b8958b32a2so5196201b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451264; x=1703056064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K03UQ0SviG6ho5ZJljgXF4jNCIAZpJ18vCgDRbkPqzE=;
        b=fPq4x4g0mgNpQH+q66QKWuJl/XVv+Zs66QtHUTBeq8brBHrdsQfV7tNe7AFncOdVH+
         FyIli06rRQO6xyWzFCI8fCLKL48UFEH2JnGOQWpTKCO5w4qm2W5FarxORab4FAgJfhid
         IJqDxUj6WZA+ydXWHcpLUzjDQVd3eQkNOoqUXvnQW+lalfuYcDfY6ztswy8EMvyjtjdk
         XdKq/fGBhxgBirop8jvbjJe3vhiTANI2G+vu2jlARUjLc0uG7AU4B+2rnd5P0lKOE8QB
         5mq6haMLy6DvZmBHV0oVzxtmgzuKB/wG81URVJ047X6AdjexYCSfmRFdKotXSHSynw1j
         wCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451264; x=1703056064;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K03UQ0SviG6ho5ZJljgXF4jNCIAZpJ18vCgDRbkPqzE=;
        b=tGAhRdLi0D9jF8qyi5bucCCIPesUc67cVhUICx13QroMKM54t7jNTGtxac/qUySh+Q
         ybZAso2PpIRYjz+kJIg7xUDWqo8aj3hDe3zE48zvcTZhbm4cBqzSpG7PYjOgXd0Q0mbw
         XWOUuT7oNY0sDH0h8TP3YuFjvEAONUsKBUl5VjblmO8dMdgAQpPh2Bt0P1uvQunsaww5
         c44mc4l9STlOUqpySrw93EnjLhv+iu86V00yF0PU2odfYLh2sX6GHABWSta6P+IG66Fl
         VnnQBuTfUCdwrVT7+5/p24pWDGt+r+TdMECMvCzOMcS6q27WYggAEz4Rrc6TS4rnc2DV
         8ZIQ==
X-Gm-Message-State: AOJu0YyhZAYmM1yePLrIWpIePR5ZsnsTER/PqgzruY0omNnzb+z9AK1H
	a2Cm4Sznml2JZrIfip5E1rluZhrGIR0=
X-Google-Smtp-Source: AGHT+IHLmgiM7PDwtVkP2CbyVOKwqhTqcPoaoyraak1D0jJkJqSQOv4NkOEZfD8bU9KiII6QIQenIQ==
X-Received: by 2002:a05:6808:3c86:b0:3b9:e69f:c08d with SMTP id gs6-20020a0568083c8600b003b9e69fc08dmr11004160oib.52.1702451264524;
        Tue, 12 Dec 2023 23:07:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, liezhi.yang@windriver.com
In-Reply-To: <20231212093804.1012506-1-liezhi.yang@windriver.com>
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
Subject: Re: [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder
 aarch64
Message-Id: <170245126382.133993.15578168101766633828.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107383


On Tue, 12 Dec 2023 17:38:04 +0800, liezhi.yang@windriver.com wrote:
> Fixed do_configure error when build on aarch64 host:
> error: cannot guess build type; you must specify one
> 
> 

Applied, thanks!

[1/1] minifi-cpp: Fix do_configure error builder aarch64
      commit: adecc463a3c090e5a9c54875a42047a427384f71

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


