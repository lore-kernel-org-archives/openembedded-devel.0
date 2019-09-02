Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id F3AC17BD9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 06:11:36 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r4so11714629iop.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Sep 2019 23:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/2UGrwz2qnxm6xiXXccMYG6JaSMKvGnh37GNRbqnShY=;
	b=NAq+qxw7f9keTZuaapr5wTjehjMOaSaxyV90umWXRMTpdhspCjKFimMVOVdomErWeZ
	82l04pYdKCoQur/o2bnksnKhOE4b20c9kJ4VlNY1+j9xzFaGwDse05EpwAheQVQ8pOsb
	ZGyW3RB/KFCzO9p4cV+p+Bc6wMCjxtDV2/PIsv44ltFz9HLCpRqD/O3QVobKbeVixaKX
	UUmERfiAcf4JGYWXloQQoAI8qbxiC9hSJNZywE5kV8NAFrVrFauch/y30cnCthAHXd5o
	vipGXoTAKpmlqTyJI6eypfAfZ0H2JDux12GaY1rlNcCOi1IDCEmn0V6f/WXuvqLvyz4G
	NHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/2UGrwz2qnxm6xiXXccMYG6JaSMKvGnh37GNRbqnShY=;
	b=uhs2x7TLcRJ9htsIUU1PP4/fEe2IQJNIVH0px8bwYfXURzxbeCiyu+i58SGTnIX7qI
	NVpIEFq9pMCpZQKWp78HSs8oq/Oei/UFl2F0K5smxxcrv5IFJvF34U6SQaU0+u+SfW6X
	IUQKg3fr2IW9ESXtQNqutupsxNN8Y5GYo9Gzfa/i8O6hzxPdxK6AU4AeCxLOfRly4eD6
	hLnOrpkY7pxafLn9aE2A4nCbAyF0h7ohM/+of03FB81cMkw17xw6Sx/sQ0k7CgvBClOw
	SbTnzee4/whd2Qmx4i1xRK39qVShzTzPS2AiEaiPoIptwd79GegpHvP9DaSm71BWPhUC
	L60Q==
X-Gm-Message-State: APjAAAWZ/pmIauZUx7gGdsZ3Y4qXQRyrb4h0GM+Sl88bHoS0sSAHLxVU
	URt/2wgzX34dNlKCVUlbJlCGNVjG2a1bJCU+pbd9JQ==
X-Google-Smtp-Source: APXvYqzB3a3eZx7M6aXNdHgz4WgFVw/IIx+Tnk9rUtnTEvrosviUKEWQ/zku7GFZAgZEuS7QzMgKikJNwLX+7l1oeu0=
X-Received: by 2002:a5e:8402:: with SMTP id h2mr6828968ioj.38.1567404697161;
	Sun, 01 Sep 2019 23:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190830101427.14200-1-schnitzeltony@gmail.com>
	<09091b50-b2fd-4f65-469a-fc797b2c2540@windriver.com>
In-Reply-To: <09091b50-b2fd-4f65-469a-fc797b2c2540@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 2 Sep 2019 08:11:25 +0200
Message-ID: <CALbNGRQxcMY5GdTbvT3uJDA7P+mJAmYPko=FWX+HUCF7Zp8Hhg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [mexta-xfce][PATCH 1/3] imsettings: upgrade 1.7.3 -> 1.8.1 and rework recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Sep 2019 06:11:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 2, 2019 at 4:17 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> It seems it transited to gdbus a long time ago but we didn't update
> accordingly in imsettings recipe.
>
> https://bitbucket.org/tagoh/imsettings/commits/ef1c6a125455fea998bcc1a26fc546f9e14a16cd
>
> commit ef1c6a125455fea998bcc1a26fc546f9e14a16cd
> Author: Akira TAGOH <akira@tagoh.org>
> Date:   Wed Dec 22 19:59:40 2010 +0900
>
>      GDBus transition and revising a lot of code.
>
>
> Regards,
> Kai
Thanks for looking into - will check what change is required.

Andreas

