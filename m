Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B306CC47255
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:49 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.198994.1703983125731306855
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVbJdUYq;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cdfed46372so4602635a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983125; x=1704587925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMVp7jeac7QUpdIRO1GCifJumHkl53W8r1GSudM7G1w=;
        b=gVbJdUYqcdVBXF1p5VwaX71x3pcLYkuTmiMQuqK/1VBjlaCLNuJ7gnBhAk5dHx/Kog
         ZSyrIvG9w4wT7iFm2SzAahOxTzqtFoHjzUq364WvYyRSyjY55Gqj/rMMSdlXD8yqvqMp
         Zc9aXa9ix4Yy+jhd5ESuhStw/o+9u2mRfCq36WAnha+8e95lflP+q9GmuqJa3gpp3iKU
         g4xCIwWdFT6cfrGHrwai+T3IV5kmsRWcCp/zGp2uVusOUkR9mAVJ6ja4y0BgAfXtvzpm
         qByaS7camUHnkpc3pw8+9jt/hqj5SU5ifc1tlFeD43cJbNHLQhUKHYH2yS2Gyj3x7X/K
         oC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983125; x=1704587925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMVp7jeac7QUpdIRO1GCifJumHkl53W8r1GSudM7G1w=;
        b=JPWCJoliliGZxBs9BPOHaKS9Xp0+eNcoLfcHmPAn7mW8/fm9vEFzsMQknbuihJp9Ss
         3YgpR6avbhRfw0dRj+2LTTjoIZ/IKJ5xYlctDNbVpukXPjseVX2pn5DkvmVaKaVtilPg
         Uyumelet0iA5/rkWmmrlSlWcXH4Uu3ui2qkZufnQ9PEB2VltsZeYvtXjP+U92VGHZfps
         fzYVJIZTrWyqFVUevXeQQrxPeWOUV1emU5P8yshykOwQR6hA3zG3Iqqep8pY2rd+y3fp
         kVCpcrSBgTv1SXjpd/o4zMfMCoXOxpS0a5w0eFrjQNVeAkQU9fy1PQKXBG01/u5UxuF9
         gH0A==
X-Gm-Message-State: AOJu0YyPnXQqNbl2XYmUdBszctb/0338EXT8GCXws3N797edUZhfSMUk
	dlrVn4IgwHCwTvRWvTmz9Y5RTKEEyd8=
X-Google-Smtp-Source: AGHT+IE54K34OWYsnHemkn26giOwqH+bORHZTAxjpaWbfz8lSCTiKUJSUAAvwmjVN+jtfbQUDB3e5A==
X-Received: by 2002:a05:6a20:948c:b0:18b:246a:d43d with SMTP id hs12-20020a056a20948c00b0018b246ad43dmr15009965pzb.15.1703983124984;
        Sat, 30 Dec 2023 16:38:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231227131513.332046-1-dmitry.baryshkov@linaro.org>
References: <20231227131513.332046-1-dmitry.baryshkov@linaro.org>
Subject: Re: [meta-networking][PATCH] networkmanager: drop libnewt
 dependency
Message-Id: <170398312402.873206.3615397278780620775.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107941


On Wed, 27 Dec 2023 15:15:13 +0200, Dmitry Baryshkov wrote:
> With the nmtui being now handled via tha PACKAGECONFIG, there is no need
> for the global libnewt dependency, PACKAGECONFIG["nmtui"] handles it
> correctrly. Drop the libnewt from DEPENDS list.
> 
> 

Applied, thanks!

[1/1] networkmanager: drop libnewt dependency
      commit: 4c8c1443776fe32305660541565cf3054c74a9c7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


