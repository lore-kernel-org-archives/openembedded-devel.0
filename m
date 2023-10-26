Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F164C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:22:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.201595.1698330149501537546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 07:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IPRZ5ZxR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32003aae100so1314388f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698330148; x=1698934948; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=as02HYC2/d1MZlkSz74d0ajl7RcicTeskbW9LBTizxo=;
        b=IPRZ5ZxR+WNUI5OE9IbRftdCXNSbW41NxrLl2V5h+f1k7Mdxo8sunqaki/vi4IFd7d
         Er6TGz7t3YjV+UQ5XgBfZUog0CRf4V9GcX3RNXjrvVE2jH+kwy0LpgeyOgOkLtUGGnYi
         zUfnJGGKiR2arO180Tb6HvS0rUB53kEjA4dZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330148; x=1698934948;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=as02HYC2/d1MZlkSz74d0ajl7RcicTeskbW9LBTizxo=;
        b=S+3SV2QnhLP2lOuvrn3vL/rEOxfzNc++G+wzuLogmvo2Obz3vxAY2VwzTMlGbEV0nc
         d9kZvk23T3mw8AYQSiyEgngsSQFHKbG0qqFuEK47j3BT7ueIEJjWlthI+zJbbHRCQKmi
         Q8s5IieoPl1NO0CFsrpnw0pfsZYRDvtwC9kpjuxa1SjrKLQ+VI+ebjUNaI8O6hWZldkf
         s/s422bDkUfnVvwWXPah0S4MoBaFLUsxIYdRFXQllP+T7C7lx4jelwxh6mzTKnzMo7Ch
         41CKYS9NKH4gZL7KaXDYolxYQeYQFBAwiE42yxa92KTYM2oeTUeiuva0t/C6IcZKAsuj
         THOQ==
X-Gm-Message-State: AOJu0Yw0HBR3ckUI2Tyo+54J+VbHUuzCYV5Dd0qEGg8WPfP/vuqyAv2W
	3C5VtNhbWInRdCjBiwKPR7Ujqn4XkWhhv+DphOM=
X-Google-Smtp-Source: AGHT+IHdr8ICbW075LiOv7i4I4z+AxTHN/UROLQ1QCAmYdZcgJkV+PhcbUlE6XFGwfEc0hlLKKwZTg==
X-Received: by 2002:a5d:6d07:0:b0:32d:c705:3e5 with SMTP id e7-20020a5d6d07000000b0032dc70503e5mr3710074wrq.15.1698330147768;
        Thu, 26 Oct 2023 07:22:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id n15-20020adfe78f000000b003197869bcd7sm14420511wrm.13.2023.10.26.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:22:27 -0700 (PDT)
Message-ID: <f928e9f7f4e98eeb45db886a70b26cd7c292702f.camel@linuxfoundation.org>
Subject: meta-oe source mirroring
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Oct 2023 15:22:26 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 14:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105754

I'm happy to say that meta-openembedded source mirroring is now working
via the Yocto Project's infrastructure and available through the
project's source mirrors.

An example successful run with master is here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/19

Nanbield should also work.

kirkstone is here and is now error free but does show a lot of
warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/27

dunfell is also error free but also shows warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/31

I did have to disable two recipes as one uses mercurial (the other has
it as a dependency) and the mercurial checkout format changed between
versions. The mirrors from later releases don't work with the version
of mercurial-native from dunfell meta-oe. Disabling it was the
easiest/safest path forward.

Currently these are all scheduled to run automatically. If we can fix
the warnings, that can stay. If there isn't a desire to fix the
warnings in stable branches, we'd probably disable the scheduler for
them since we have a policy of no warnings on the autobuilder.

Cheers,

Richard

