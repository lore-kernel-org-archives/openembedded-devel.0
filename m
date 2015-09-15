Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2576E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:05:58 +0000 (UTC)
Received: by ioii196 with SMTP id i196so213723701ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 15:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=z6g6EOsEUo4AhwlQ7OPP2AwAAKwm9kuEDyl0GoK7R9E=;
	b=PH6Tx2PONzntRE+/hjD2VH7Wa5RNTyMsiUnIeZJPn1V5tzEKOdtvz9qkDFvzDUtAVg
	aLtiZYbxwf1QoelaiZ/l2FZzQfT6i67NNRowgPbCnil81z4zwA5Csr/mHGvu6QDyovHM
	FzhTXJytbSmiLZ9yDxnYtDSNADLf708qo0bdPyNwW+0HLK/nKL7iJxF5oE7By9q0U/lJ
	tPhWESy9Ek5ubx6qMpB7W0GMZtusP7X6tPTOLg81bjEcfymWiSNKMn8gru2tpa2Zrg3P
	fVMguwD7Hmw8LbWORFynRzLtATA3w+auf6lFaBiHkwMTyoOthZALkUlV1UvCdwAfwjOX
	rlQg==
X-Gm-Message-State: ALoCoQkrETjTJcOLTdjNmn/RHuj4WXFYxYoZfNjNUcoO4dVtXMs5MIBaGOTi2KhJbpD3JWcaGlAS
X-Received: by 10.107.136.87 with SMTP id k84mr37341735iod.26.1442354758425;
	Tue, 15 Sep 2015 15:05:58 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174])
	by smtp.gmail.com with ESMTPSA id kb10sm547841igb.4.2015.09.15.15.05.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 15:05:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so213699996iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 15:05:57 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr36228403ioe.37.1442354757284; 
	Tue, 15 Sep 2015 15:05:57 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 15 Sep 2015 15:05:57 -0700 (PDT)
In-Reply-To: <1442352220-16868-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1442352220-16868-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Tue, 15 Sep 2015 19:05:57 -0300
Message-ID: <CAP9ODKr+10wOu0UvLjc7HmO5V1sZMx2FZC9qogb9W+uRrJaofw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-networking][PATCH v2] lldpd: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 22:05:59 -0000
Content-Type: text/plain; charset=UTF-8

Hello Fabio,

On Tue, Sep 15, 2015 at 6:23 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> lldpd is a 802.1AB implementation, a L2 network discovery protocol.
> It also supports CDP, EDP and various other protocols.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Sorry for not raising this before but there is an error...

...
> +PACKAGES =+ "${PN}-bash-completion ${PN}-zsh-completion"
> +
> +FILES_${PN} += "${datadir}/zsh ${libdir}/sysusers.d"

${datadir}/zsh should be moved to the zsh-completion package.

> +RDEPENDS_${PN} += "os-release"
> +
> +FILES_${PN}-bash-completion += "${sysconfdir}/bash_completion.d/"
> +RDEPENDS_${PN}-bash-completion += "bash"
> +
> +FILES_${PN}-zsh-completion += "${datadir}/zsh/vendor-completions/"
> +# FIXME: zsh is broken in meta-oe so this cannot be enabled for now
> +#RDEPENDS_${PN}-zsh-completion += "zsh"

Wait until tomorrow to see if Joe has any other feedback before
preparing the v3.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

