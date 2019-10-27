Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADA4D7FAA9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:59:42 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h9so8734051ioh.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=asCqGrotRwTjr/6KgU5dEzfMqXj4UJ+tZZz1hlb2++A=;
	b=iqJIvETTIIWjyVv8usKMXz8kTgAhEve9kh/ieqHw0tz1rnX1oescOFat6904nSqiar
	dfs0Mx/XQpMd2PpyRw3FCJ+UcZCbVlP5Ibq7OKyhqDeIXMiIwtTvdOYIUDhh36Y8LXDM
	8I+coPeolREx69I8Qlz83k5vRqQVPl0ylMb2So3CxMYvLDggIUjbAG4mpfKLMW/SJnaZ
	z6Ixje82sNfm+ufkw3RBYiT24iBtgHtTREa0ftE0RKOI3XWSyixKUdSyoHX1UREB80E3
	Ut63FiHWOTe8j9Z96N4aZ62Opp8ngfWGIl/xJLnchMIDWTVfL4b6wjkyKDMhgBWWuPGk
	vcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=asCqGrotRwTjr/6KgU5dEzfMqXj4UJ+tZZz1hlb2++A=;
	b=hYYsKzx0uC2/Gt/u3e8RXOsiuANuD+wswnQDvLdithzFseC+OhWOBiy3xiGQgyZdMZ
	jzEJF8LGhme1zN5frxG4fhNCEqaU14IpwmF0Gl1kyxbItthcgW1zVcOyO4ZjRIx4lvU4
	RFw20taKBA33Spemn/9eU8Ugr4Y4EgDAG9r3bH7B5dqEIsq/sx8gdIkIwGDijhB1OPat
	NC/Q1CbgjJ5tMc6LbVAe9e0mGdA8IhdxkL4txrn2NjhyYdy0J4ZiKQre88nRE80k+Zb9
	mD0sPyrgKv06MWIt0wMKDwqHkPF3FKiF0Ew+Nm/2Wg/DMYZS57Cq9vsOhM6tZA6ib7HK
	huiQ==
X-Gm-Message-State: APjAAAVHjMiIugtdgvmBBBiz/98sBAYVFYaWfAtvyPTNKOLlL4I6P29W
	wberNylyLDdm7TdrPnvzboL2mfc6ULqAjWtFtrWOng==
X-Google-Smtp-Source: APXvYqx92HOwlWxPRYbTTia4+9RwfkjPAGlk/qscQKz2lIKokT7sU9aDxrN47hmRxlhXt9gTpypJGJb+KDGb9bXLdG8=
X-Received: by 2002:a5e:d502:: with SMTP id e2mr3150816iom.224.1572220783471; 
	Sun, 27 Oct 2019 16:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
	<20191027233545.4146-20-schnitzeltony@gmail.com>
In-Reply-To: <20191027233545.4146-20-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 28 Oct 2019 00:59:32 +0100
Message-ID: <CALbNGRS=zdR0MdRFHc8M7tODNNavN3tQaM1pQdLim0q6_Vn-KA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 19/19] ibus: initial add 1.5.21
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
X-List-Received-Date: Sun, 27 Oct 2019 23:59:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 12:36 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> It is a depency for gnome-shell
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Aargh - it was improperly tested - please ignore

Andreas

