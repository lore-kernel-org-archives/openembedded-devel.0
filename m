Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D15C47258
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:55 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.31429.1704682015005441325
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgUBVkkB;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1086021a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682014; x=1705286814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP/yjdM24pJL62hfIqCXYgNhZ8uxRXn7cvIQlwuvjPk=;
        b=PgUBVkkBpbsfjtffcjsSsWvpOzG1q6Ca+0qS2vaeCmkj9kzJ4jscztYX2OeTWZXec9
         SM/nf3wzqqOvnUh4YEfZjy6CodB4QRzZu7Y6gns3LNiFFRSZ2ZlEquPz/CtefMZCl8rV
         SZLhqGWcGaXuZ0+WyOCHidZ6wf6wycixOGbMZYVoS/sdZ40mBC14EM9FO0pMQxq/e83/
         +/bppheyj4bqoPBDGJR06N5phP8JnzD+ffD8MJhP6xyJYKydK8bdjVXRCxjtoTRWCxK6
         c3dZbctOQtg9SI7NXG8Rs3iFqWqcqPXySVz1Qew4+0XPsoU9ndLH8BpC3gkEmHz7vOYu
         I17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682014; x=1705286814;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yP/yjdM24pJL62hfIqCXYgNhZ8uxRXn7cvIQlwuvjPk=;
        b=CAMqzzWCA1jWs8RVlt8HoCnDSxCcPoN5P2KsigywsfdG5527/qMkdqOWfHHL3XOqCr
         XdX8u0SZaaDZeYKsuAInEHyIsC8iMW4uNraUnh1QJ3VF7bJy313UlgV/iodW6jicNAYS
         zirnSLY+U6n4Kss4F84TgC2rmRP0TzBUavtUP5LyQXEYtTvc/upMRa9yGtoCKMgs8EOP
         XQRn8IH/KhV0mrv1Q3NWOoi32NQ2f45cAYOURirxo1+Db45GwSuoEky3jirq16d6afp3
         c12jgraUZlINyNAJwZbpPqr687/py9VOlMvnSY7bOb6lHWmWW5xEYyxBSkUU7+g58Hok
         Pikw==
X-Gm-Message-State: AOJu0YzA0M9ob2bFrWo/4MiZqExA6XDdTwwJ9F4MqnWPpFSyMKPRCQDT
	3EaT2tOkXq3VsuGa6mQ3WqQ7pjBKA4Q=
X-Google-Smtp-Source: AGHT+IFXQyYegm2m6y4+QkdagnOwPC/z52f/lL+UUaXSqcxczW8GCrObwNLizhYIYkNub5p4lmrSvg==
X-Received: by 2002:a05:6a20:7f93:b0:193:fda5:8278 with SMTP id d19-20020a056a207f9300b00193fda58278mr4168700pzj.16.1704682014352;
        Sun, 07 Jan 2024 18:46:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179180-8011-1-git-send-email-wangmy@fujitsu.com>
References: <1704179180-8011-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] plocate: upgrade 1.1.19 -> 1.1.20
Message-Id: <170468201352.912276.6119686010394304822.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108097


On Tue, 02 Jan 2024 15:06:20 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> - Fix updatedb writing incomplete .db files under Termux.
> - Make the systemd timer run more consistently during the night.
> - Add an (undocumented) flag --ignore-visibility to plocate,
>   giving the equivalent of building the database with
>   --require-visibility no. Drops setgid, of course, so you
>   will usually need to be root to use it.
> 
> [...]

Applied, thanks!

[1/1] plocate: upgrade 1.1.19 -> 1.1.20
      commit: a4f5de220148ae176fd828963ee2f4e2cf7dc675

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


