Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D88DC47255
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.198912.1703983111180192932
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlVePhlB;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso59059395ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983110; x=1704587910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbnToHkpBPPuPG4wrEB0yixXuxhbax53Nm/AbEgAcg4=;
        b=BlVePhlB8DawFBwd98YBRmyOSzAOX93bD1s1Zln0tjCvCk89e6oQRmz7552iWT/Ovx
         sY3k9zDN7GUfsczDFGpgqL23rR7Xne5ZFfpwKFkT6rcEGIjsobjyN05xtjRbyvNLrFNw
         5ZH+yHV3zeKEKnCraDmp/qGhcDLooR61/FlkakbFTGoBs6giYCNa+ZnUsDyWmXX56Xv8
         0f6bTwWfD4FFsXJdXAtMA9MOU8V2MJNfiHAh7j0es94LwQ8NE6gBWnTPG1GQeIPqIjOa
         GjSFhHUdN/I7fSpHndl5DpCv5pXiMF1b3TXfdMIbMWDhsrdcoEmDhVFyi3Q6R2jAL3oZ
         TglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983110; x=1704587910;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbnToHkpBPPuPG4wrEB0yixXuxhbax53Nm/AbEgAcg4=;
        b=h3Po9G4w6gR4sL+rnbE6YFXgjlrG0dIn8ktIxirn3AX1ErMcZ7nRxMjFdwwGhi5Sc5
         KA3rFUJyE68bRFxrs6Bwy8CN2VoFRRtXqDxu+EjDlK+d46oT8bpJaxkov0FgEiZECULk
         Uu0K9ZSvEahQh7lQJbBqUbibRgU99qEmmez2NUkcLzoKPB8hIC353jLVEhbCJo9KYiJ4
         RoHCDXeKCel05bYMkmdIo5NkdoDTGGOH5S1kv3NZHLkf4KmuJWT1VMAwuGgRFIFgYxdd
         I83TFCZUISToWZyZSrNuyFkfCQjuEZEJOQ5s+HWBvpeqALnYJABzp3JEbPVGcy/TULnw
         mc8w==
X-Gm-Message-State: AOJu0YxwBOpMxozn9waRslL2gsrdZNRur7IryW85NrW0saBJS60yIYbR
	dRQ9c/tgYJyIYxcv1mxzfj5TtKYeQr8=
X-Google-Smtp-Source: AGHT+IF7RyLryYqGzog2MIWV1tcpQJ4srbdgcRI4ggyCsRRVTaTGqF2FTohSReZr3vUdtjG5ySkRyg==
X-Received: by 2002:a17:902:9687:b0:1d0:6ffd:9e23 with SMTP id n7-20020a170902968700b001d06ffd9e23mr15146706plp.117.1703983110233;
        Sat, 30 Dec 2023 16:38:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574299-12902-1-git-send-email-wangmy@fujitsu.com>
References: <1703574299-12902-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.34.0 -> 1.35.1
Message-Id: <170398310952.873206.2664371288507361299.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107925


On Tue, 26 Dec 2023 15:04:59 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] libqmi: upgrade 1.34.0 -> 1.35.1
      commit: f690ea9e33d9ff80bb3e7434a5ce428c7a4a0c6c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


