Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B92AE69EA6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 15:17:25 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.21913.1733238235998822314
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 07:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXR5MLWq;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ethan.twardy@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a790d6e782so23601725ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 07:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733238235; x=1733843035; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjfkVGBRTFBLAJpMvhES6EC+t93TU9YilBU2l34K19I=;
        b=iXR5MLWqUDmzF/dsLKfl24SfDNvrnqeApsmRnsatY8UF5uBAjS1LqF2SOwBhtV2iSZ
         aPreNClntueUmKx8/opK5avrQ8clVViS7H0k+MuRtSIPCnEL/o4q7ZCJawTaj3NPzNrl
         88InjcEBNaG9mtjD5TyFZT83qCofjW44G6OiCjwICDHAEvVeXwDS+s44Be6ao1JMNmY9
         QQq2IWtnfzMGm8nNk2o7ej8IJl2iQO0rxXm+Jj8yVCoNGY0F+z3f8MaRL/lLatr2r98E
         61chPs0VWNgwi+HHYtdxDRnz/D0w7W6pESgWgX6P686jKhsI4aQ12K5N1KPWDGkvCrZD
         tW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733238235; x=1733843035;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hjfkVGBRTFBLAJpMvhES6EC+t93TU9YilBU2l34K19I=;
        b=cJ7cBasSVDlMYlNdQKVjmAfl9L46wVlrS5kMmJSHfWVFNvx0dlr1yzbh6k0u13EPMo
         WGFPrK3hSlTxQUMFZgE3gqbfFZ1l84Waipvqde24iADwAM2QyhzMjMdIlQVsZOs1JGQd
         8+uYwRLIM2T9sHKj/wBSJQygSoRcR0mjseJIy8S3yO5XVDA2GxHfB6TD98MxrxV5OzDC
         /TXR/Jn+tdDB7Q4C3cH/tc5CoHdUvIrEuUI5p6ijEH/S/1CXhPaFjsqpeoLHmfT9cpr1
         XhTe2W825p5VY6lSWDtuw6Bw8nMmoRjQgpLE/vMJCXNwnyTqCdKicRJf5Tar6cH4H4EU
         2uMw==
X-Gm-Message-State: AOJu0YwCG3qw864JShZkLWIALknfIGIJ43BF9ahXiKiWs4V8xgg35beq
	GyzwLgSF1YqlkhKHIaNXrOJBkDfqw8aLhba9UPdfzom1baUg5vue
X-Gm-Gg: ASbGncscf1xjo5oVXW7fT27GZErlmCZjsgol9mC8BOSYdmeKMQ6Iad0edsqL6H07Gvv
	o/gii2KQ7/efKctnj7grTMpyrKN4CqcDDWS95+QXqEAYAeeBNcYM640ZhUC+j1bGkceOg79rD4L
	lBfijE9A9EKBPkhy6HSeGz5J1XHd6CZ+u3F0rhk+GuMndpNvMFvH0Bv6nMN0P9AP+9BERMTN371
	PGQhgmk3Xa4Zf50WI+SjnhyXpMZPMijzNkjmKgsliTPSPBCEsvEOU7q345q6swsbSYBQJH/ejQZ
	taOPjzHq0lhMaUWUqP6m1T+csJ4Z
X-Google-Smtp-Source: AGHT+IHKuOiY68Jec/s7kouR7RJyMum9hVNgbbP9VzH3t5yYV7jTOWRBqHYkI5E8/oCoZxMq/L2LfQ==
X-Received: by 2002:a05:6e02:16c5:b0:3a7:d792:d6e9 with SMTP id e9e14a558f8ab-3a7f9aa3d27mr34928515ab.22.1733238235092;
        Tue, 03 Dec 2024 07:03:55 -0800 (PST)
Received: from localhost (h135-135-92-85.ashwwi.broadband.dynamic.tds.net. [135.135.92.85])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a7d8534282sm22443055ab.22.2024.12.03.07.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:03:54 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 03 Dec 2024 09:03:52 -0600
Message-Id: <D625OBSZYCB3.CNBANSTUR7WI@gmail.com>
Cc: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: Add glib-2.0-native dep for bluez5
From: "AmateurECE" <ethan.twardy@gmail.com>
To: "Khem Raj" <raj.khem@gmail.com>
X-Mailer: aerc 0.18.2
References: <20241124165419.24549-1-ethan.twardy@gmail.com>
 <CAMKF1sqq7iu2AiQxBX2eqQX0P_sO1of_5ioCp7u5nj2hodYxcA@mail.gmail.com>
In-Reply-To: <CAMKF1sqq7iu2AiQxBX2eqQX0P_sO1of_5ioCp7u5nj2hodYxcA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 15:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114182

On Fri Nov 29, 2024 at 5:28 PM CST, Khem Raj wrote:
> Thanks for the patch, it is not done on top of master it seems. Please
> rebase it on master and resend if patch is needed for master
> otherwise mark the release branch in subject prefix. This will help
> route it correctly.

Thanks for getting back to me, Khem! I will rebase onto master and
resend the patch shortly. Please forgive my question, I'm unfamiliar
with the OpenEmbedded development process: I'd like this change to be
applied to both master and the scarthgap branch, since I'm currently
basing my work on scarthgap. In that case, should I submit two patches,
one to be applied to master, and one to be applied to scarthgap (with
[scarthgap] in the subject line)?

Ethan

