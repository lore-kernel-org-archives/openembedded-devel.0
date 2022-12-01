Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5C3C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:14:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.46340.1669907671261179435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QOwFghRN;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id g12so2972734lfh.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 07:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FWnRMdsgWfVtkvnab0C31fAF8NVjnJfUNsE3twdG7G8=;
        b=QOwFghRNoHKeOzT6Q1+UrCnAQeOT6wyF4c7HM8x7aLBKXPsy7crrgY/C7AOV8MmCSw
         tYb/OCAcvBdWx5ZsTo2Yn4IhxwFuYJ8rbRweoHmMsM9uKH1dpwk1iTwfr/Qc8mkwxG39
         yQBUqLbKu4Sk90MDBAqG3r7BfMkYbpG0NzK05g24DN94GgZiChntIyOq/gD1XeO48Np0
         j5ZdTQXEjYyuoQH6pPFdHoRo2bUDdyQMtpH8jbiIy3LQoGQdnypv0ZvB7H+8i5hBXTIu
         fnke8clvmZgcqfusT4CF6F4WNmJR/YMw8eS0usnIuaGozv+RI2vrSgCNPgYgZKe/Dyxw
         Hcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWnRMdsgWfVtkvnab0C31fAF8NVjnJfUNsE3twdG7G8=;
        b=dVsSJeL4/6pUKVktKg0gO7B8z2QcyK7ChL77JntVmGlXSibCidQN8uFTQ+kA0P2r4o
         Lsag44HOpwlmJW/dmJWm+PqV958+qZNxZFAXY3H2GlIW+ucI3/zhPt937Ftd3XBhCeji
         kK3GmSZGDPIq5wdS+ETWz6xoyOpB0DkvD5alFnp3aLfEU7OpAACy6ijWrJ3thLt+evXP
         lI+jm5/b0Xvqy4daQtJrRZ1+2+44K08E1IAHKtEaVeh5gW+viMHYLPJBfdQNTQbUlJj0
         dAkm/xhYLseMtHr/GwnDOCzWYDLTro38ZrZ9jdXI7DEZPFqzHqKZEq3qzTykpgHn/yaW
         Xf2w==
X-Gm-Message-State: ANoB5plMG5OmGU/JXI4C7w14c+7RZTbOtmmy9FP/HaMjEgIywJHKuSmd
	pqZhF0+u7nwhL1SLnM1Me+aT9g==
X-Google-Smtp-Source: AA0mqf63E0C4Q6mfNLU3+Ly/YkUtsy/iAn07gSNdWKxQlzGpT56bzZ35t/+q/k3GzfQbo+yhrwsqsA==
X-Received: by 2002:ac2:560d:0:b0:4b4:b5bf:7657 with SMTP id v13-20020ac2560d000000b004b4b5bf7657mr21087463lfd.361.1669907669386;
        Thu, 01 Dec 2022 07:14:29 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id w8-20020a05651234c800b004ab2cb8deb5sm681265lfr.18.2022.12.01.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:14:28 -0800 (PST)
Date: Thu, 1 Dec 2022 17:14:27 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-devel@lists.openembedded.org, schnitzeltony@gmail.com
Subject: Re: Re: [oe][meta-gnome][PATCH 0/3] gvfs: use native ssh client
Message-ID: <Y4jE00Ay2/7BPTmV@nuoska>
References: <20221201134148.116754-1-alex.stewart@ni.com>
 <Y4iywSGqI+lA2qkV@nuoska>
 <dd3ef019-e802-d192-c608-ce30376d3889@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd3ef019-e802-d192-c608-ce30376d3889@ni.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 15:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99894

Hi,

On Thu, Dec 01, 2022 at 08:20:44AM -0600, Alex Stewart wrote:
> Hey Mikko,
> 
> On 12/1/22 07:57, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Thu, Dec 01, 2022 at 07:41:45AM -0600, Alex Stewart wrote:
> > > While rebasing the NI LinuxRT distro to kirkstone, I noticed that my
> > > pyrex container fails gvfs:do_configure with a meson error about not
> > > finding an `ssh` client.
> > > 
> > > | Program ssh found: NO
> > > |
> > > | ../gvfs-1.50.0/meson.build:462:2: ERROR: Assert failed: SFTP backend requested but a ssh client is required
> > > 
> > > 
> > > After some investigation, it seems that gvfs is configured to use the
> > > `ssh` client implementation in the build machine's PATH. If no native
> > > implementation is provided in the native sysroot, it will default to
> > > using the host machine's implementation.
> > > 
> > > My new kirkstone pyrex container happened to not install an ssh client,
> > > and so would fail. Since ssh isn't a requirement to run BB or OE, I
> > > don't think it's appropriate to use the host's ssh.
> > > 
> > > 
> > > This patchset adds the native bbclass to openssh, when the user includes
> > > meta-oe in his layerstack, and then provides the openssh-native content
> > > to gvfs through its DEPENDS. This is sufficient to resolve the error on
> > > my kirkstone pyrex container.
> > > 
> > > NOTE: It's a little odd to me that the OE-core openssh recipe doesn't
> > > already inherit native.bbclass - when it *does* inherit
> > > nativesdk.bbclass. I would be open to moving the openssh changes in this
> > > PR to OE-core directly, if someone can ACK that it would be more
> > > appropriate to do so.
> > Why would one really need to build native, the compiler host machine,
> > version of openssh? Why even gvfs is needed for native?!
> > For target or nativesdk the needs are clear, but for native?
> 
> I'm not sure I understand the question. Are you asking why the gvfs compile
> requires an ssh client in the build host toolchain?

What requires gvfs for native build target? I think that dependency
should be removed. I don't think this dependency makes sense and I don't
think it will really be used by anything.

If there is a real use case, then you could try to remove the ssh
dependency. You likely don't need ssh communication at build time so
just disable the feature completely.

Cheers,

-Mikko

