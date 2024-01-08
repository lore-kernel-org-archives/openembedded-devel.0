Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73038C47258
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.31441.1704682023856788031
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4ubQoAi;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1264912b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682023; x=1705286823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD1Q6aEJD4FrIBsR6c2CoIX04BR2Eyw4wXFNa2zjGgA=;
        b=T4ubQoAi7PgehOijlPUCNhGAj+bTK9P/H4ABQUyXSnX4LA4fXoWE9YaQgWs2gTLD1D
         wsHoIRv5XlUX3vkbL34o+ycdgOLt11okVFu3DvT6FQfrxeoc/jgi3n4i3s0bNw1R7Geq
         vUGwd0StOkfc43VtgWmHj8TPTq+Bd8JDijepvSxNUsan0T1SuNLPwPKcuXreLdWh9US7
         83jfaJ/yaOvUPW4mC22E4ePvIw/+ZRZyW0ewUSfuVsGldejiqZ0ZPDdBo1D5P4NE6Bmk
         o8lSgniqHY4y2lNDIwXKQN9wHiZr+hULIYhHV/sQa7db+2CsiFYYVC2L6lgi0xVd1NcB
         BoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682023; x=1705286823;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD1Q6aEJD4FrIBsR6c2CoIX04BR2Eyw4wXFNa2zjGgA=;
        b=BvXtdzzzaVE+UjcqVQ1ukqb2sC3pdz+YH0EDykZFzW5Vrm2HXwIsm7B1JOMZHkZyap
         idSh5TTfJy7SRFrymCUBiRQntUEkEKXgUoeAzOh3c/iall0ViyCYoiw9qluoa8oTTSgj
         8yvB4EDuQURrYoFxbHD1YpAL5tBNaG0EVIfL3rcEiWSLUmE1BQNMOUKFBnu7/OyxrKo6
         97gXoUhz19dB1vzezK7HyoBQOyTsBnL6Wt6devavBTLtoA1Pw97do4FDEPYsDP5KbXQJ
         UWgGA718dL5BeIqEDib4SyTArD+Tyuv6vOM80t7Rr1rp/uK9pPwWhCcfuGh96xkLxx0f
         qXwQ==
X-Gm-Message-State: AOJu0Yz9VhdWba8PdM3ag8lhufNxC+gwdXsJyrxwB1SMV4HDC4fc1sqq
	blthHOyd6Xuq4/oQBl9six8=
X-Google-Smtp-Source: AGHT+IGfYAHYro8MhBO5yiQ1bezGUIipLTJ/o/4wkb4H4IIiKx/IptcnAPG4B57zdNTIuszL8zyx4Q==
X-Received: by 2002:a05:6808:17a0:b0:3b8:b063:5d75 with SMTP id bg32-20020a05680817a000b003b8b0635d75mr3892972oib.92.1704682023109;
        Sun, 07 Jan 2024 18:47:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20240102135106.1604473-1-festevam@gmail.com>
References: <20240102135106.1604473-1-festevam@gmail.com>
Subject: Re: [PATCH] i2cdev_git: Remove AUTHOR field
Message-Id: <170468202246.912276.10591165877920953602.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108108


On Tue, 02 Jan 2024 10:51:06 -0300, Fabio Estevam wrote:
> The AUTHOR field is no longer used in generating packages.
> 
> It may also create a possible confusion with the recipe maintainer
> name, so let's remove it.
> 
> 

Applied, thanks!

[1/1] i2cdev_git: Remove AUTHOR field
      commit: 3f166bfbb79115f4973cee43210a80ea7732d95a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


