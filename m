Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35318C41535
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.31075.1702451258022718905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQz/Ltoy;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ce72730548so5849582b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451257; x=1703056057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqcMWDKIgc5Pr7ld8CCddftIiKaO3pJN8B742eK0sfE=;
        b=MQz/Ltoyquy6UD3RJT/OWfb1tWSjYRBoaL39+d9TGlIqXG2zF5EmFAPPvyydXiNx4H
         nI5cpXYb0j9b4J+McqZ0O8kEoSzTCOFcouHZCobN+dSWBpSU7lbxeyKjTX/1dYRrnT2j
         pNxJPGCQig+FTabg3ZSJJFloanLoOgrnViPjy+iuxP/7OvnWEkF4mAuF5FLf3UEhYOHZ
         yjUT4IGl/+sI0HMCNukPnv2PZeS93MhfsINzs+HfxE6jkvGig+uxjQTfsnk7WBDuf9bJ
         sZVE0MEborGkZAzn2ybiWPIGdUNuPD7WlMWC6aTjC2MDSNukBFOxitkACI5i+f+TDoVZ
         MH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451257; x=1703056057;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqcMWDKIgc5Pr7ld8CCddftIiKaO3pJN8B742eK0sfE=;
        b=B5fzYarKO1fK2a4HNJxzSmaXu59EbxvLHDKkW83zM08tdU2TZ/L0pJPqKgkztTLRBS
         jsIvJHHziUoo45iOqS/Ps4iHCywF+7WHnQTaNlgJeGK1LP4IBS+HhTbVdHfc2XEBPtPs
         84EFkICY/vGeFm0RyRonSudHwdeaM8tYbfJGiei4E1gWqwOM0JiMcuzNjCxbROPfwwnx
         fX4TK/MgpnR7oqrj56iPezc/nk51hkGxZLEVLMpeDw510/epi1df0jr6T5BtVK9SPImp
         ELlQ/umDwEt7G+Az9xW0lK2jmOdwEI/PcxxbrU6xlfZ2n2AQIAee+lqA5pXz5kK7JzbG
         FNOg==
X-Gm-Message-State: AOJu0YxlAT53d2YWAVjKaL2vo/IxRqo/oNkR01pnZkGQHJSkrG2TtN9d
	IZY2IOqtW/I8CC/Yz7JWDmUBXdVRKAc=
X-Google-Smtp-Source: AGHT+IENe4DHnRAnOAZnpruO/0ewcm1oiOb5Hu7t3N/jeg5+jM/rAQmwRfwSQoHY5y+mVHK1uL7iHQ==
X-Received: by 2002:a05:6a00:1acc:b0:6ce:4a30:853 with SMTP id f12-20020a056a001acc00b006ce4a300853mr9060811pfv.29.1702451257234;
        Tue, 12 Dec 2023 23:07:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Petr Chernikov <p.chernikov@yadro.com>
In-Reply-To: <20231208054757.1466187-1-p.chernikov@yadro.com>
References: <20231208054757.1466187-1-p.chernikov@yadro.com>
Subject: Re: [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from
 extra_oecmake
Message-Id: <170245125660.133993.1006521853362378038.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107376


On Fri, 08 Dec 2023 08:47:57 +0300, Petr Chernikov wrote:
> Old versions of abseil-cpp could not be compiled using C++ Standard 17.
> For now this cmake flag is not needed.
> Mosh compilation fixed by specifying c++17 standard.
> 
> 

Applied, thanks!

[1/1] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
      commit: 190f7b50ac3d7d30cf9d31167fb74f7146c3c8ff

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


