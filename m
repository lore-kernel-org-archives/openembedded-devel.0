Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33E6C61D90
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 20:46:08 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.4320.1700599561295043577
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 12:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+CxiRP3;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b6ce6fac81so3668566b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 12:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700599560; x=1701204360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lax6i95Ys9uSCTfpCLjq+5pAAX5Grmauq4XkzBQcQb8=;
        b=k+CxiRP33G9quAkHcgXWcT+HHWtgdr3ztsnwdpXa2LksJravSLkn6klikACiB2ouvV
         ecT6Fl9kRT/qzS0bk1casrt7TIRWcGBbdwKTh5unqe9e7E/4hWK8J8WEmpruojOL85Gk
         0+GIOk61yDqQdJNr+7BDXvGuPcOle5ZPNeS2kRLXFp1S/GNZti/S+6l6wYOOvYiZjZVm
         2EEuQg8bDBLNv/FA98dyq5OBB9wjiYU5MRRDEpx1Hv2ZtN/NvVS5kHAwnO9Tg7sgvosT
         8f6dMmbabYppdGk9GSTbVKin0PhGlly3NQrDonUpgB80T3H1wnzWqh3dnGIcb/gtGm1c
         /xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599560; x=1701204360;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lax6i95Ys9uSCTfpCLjq+5pAAX5Grmauq4XkzBQcQb8=;
        b=b2hZbWI9sHYphSQH53kjsXYu4y7J57If6yBdTg95J4anLZx1oRBh15gU46rCEDJ297
         4BhPaIGdTmfovdaIkGwVK78tyubzfWoeWKkhYMQ4qwwMRfJvjC+gQ81hMLsXpK/k732t
         eVnfhYj4sK0qkBpYHP8IURUvNSr+CwRRPC6jR0JFZWbE0ljJ64xhgHQE0pvsOZWYTbTg
         nxO1khRkZqSS2VRumzq+073m15IpTgrpfysI2ZhPEWAFU0ydHJQqRJ8LwCBoyS1fAJWH
         HG5sHFyMAZaNWfIlceFfbBe6wO1qLc0WfIT4VTmtcS1XujgBQe0yRZPk7Oez317wO/3o
         5hXw==
X-Gm-Message-State: AOJu0YyWq2e6GDf/4huG79Yr3/7NwdBepChxupndJfPiP+Zt2GgSTlff
	9yqbGz/RXWCfqfKnQQMqbu20Py33lUoH7g==
X-Google-Smtp-Source: AGHT+IH3JD+cWg+HmPkT3XNNIWoqoHEXoNmeKAcp4cnen3ODHuDrQ+u78uW5epI3+GMrUZ8QhZHBZQ==
X-Received: by 2002:a05:6808:1144:b0:3ae:1675:700e with SMTP id u4-20020a056808114400b003ae1675700emr682304oiu.36.1700599560357;
        Tue, 21 Nov 2023 12:46:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id cl19-20020a056a02099300b005c1ce3c960bsm7142465pgb.50.2023.11.21.12.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:46:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231120150901.24756-1-f_l_k@t-online.de>
References: <20231120150901.24756-1-f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCHv2] flatpak: Add packageconfigs for man and
 docbook docs
Message-Id: <170059955984.4811.7160169898233717557.b4-ty@gmail.com>
Date: Tue, 21 Nov 2023 12:45:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 20:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106983


On Mon, 20 Nov 2023 16:09:01 +0100, Markus Volk wrote:
> 


Applied, thanks!

[1/1] flatpak: Add packageconfigs for man and docbook docs
      commit: b5ca85bbeb3629cad07ebffbee6a48e69645630b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


