Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70479C46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6816.1702967233286272689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TcOIBkBJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3ac87553bso9271295ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967233; x=1703572033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBKL5N6GAIa6GZtScJCywLhfbsf3Ug6wdIXeS1yIoyg=;
        b=TcOIBkBJXXU6Zf0l0a43kkNDTCReOz1xV+LHXVno3kWgAw3uo5pa3Z0i/etifetR2G
         aasX8oUZOBbZIELmYTTACTby9KNVFZQ7Vj0X4bg1ircMu0yUrnmfnxukPHkINgLJ4oT/
         LvESLW7y+55T5tHx7QhqaoYkivKHUEkmwzCLfABF1tnM4zfDIgIP4lt7A08GSFNbhDig
         dJSLOn6Ddym8KsfQiIFRPk/J+ay+tTrZNcN+YLlMdVor525HG+/bRsLspjdsI0YM/m5v
         qGqQs3okekTkfDwQSrrn3LgvGOgFRWwbw3sIV/el1P9Un3hwZgI/Jw2E1IwUjYI6dsRi
         UFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967233; x=1703572033;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBKL5N6GAIa6GZtScJCywLhfbsf3Ug6wdIXeS1yIoyg=;
        b=TCl/UyH6Il8/zqKFDuLjNAgt07REMEd9OO/C2Xf0zq70tDsNKnfFYk/IkBZZSzEwBt
         bSpsyk3BbGx7Q9Qwd7WaVW58/NpZTnU9UmLm6xkypnnKgQiDNCfVfeaTlTCOJtxBeHnj
         YuSzN91Z+6QSZ+/oG2igc0X6kpxPyfx5hvegF1PD/ZgYJSJqwQekNbAqdlmVbejW6duN
         OGTqJc3sRb/0nGx1/7o7z1M76ynLG03qhyTxGTnokHQZWSbVh6yWALvQOhD4qqOXVddm
         vlRnoBDyn5+/rYQVaNWThCb/JxPWnPaY5KelUD86oER8zuMQOnyhC8o+ed4/3oRJ2NKY
         yiCw==
X-Gm-Message-State: AOJu0Yz+N25VyXI3Rnf/rDGr+WXrJqSVzPTIsVcqTXB0kXcXRlw81iS8
	UD0c4n34zS7azdyMQFlGDMBFodMUXBg=
X-Google-Smtp-Source: AGHT+IHaU/iQ+YNpdtwXSL5SwkW0FKNQz8JfhrOjld7Gcpdg//NuAK0P4tBXo6yCfWFY8JgF/5sY6g==
X-Received: by 2002:a17:902:ced2:b0:1d0:6ffd:6e68 with SMTP id d18-20020a170902ced200b001d06ffd6e68mr10457279plg.96.1702967232688;
        Mon, 18 Dec 2023 22:27:12 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214051343.1192287-1-derek@asterius.io>
References: <20231214051343.1192287-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-pymongo: update version to 4.6.1
Message-Id: <170296723186.1627685.3610421876634305736.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107568


On Thu, 14 Dec 2023 05:13:43 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-pymongo: update version to 4.6.1
      commit: 9b0bc6bf3c7b30a0c0b3e85bf53fc75c0c7a7d8d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


