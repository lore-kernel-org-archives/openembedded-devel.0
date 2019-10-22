Return-Path: <marek.bykowski@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id 96B8E7CDC0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 07:15:26 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id u4so1838426ljj.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2LX6uzQ7xRa2w/VQWLvj69ooPjx3N3YMM9oJ5J9bKZU=;
	b=ugJYjdI9+eCwjFGJVR9d9MEWRstr78UKgI0BUA/mzYpbfYvCNt8EL5+JNmhfJrn/ji
	E1wjyPwCpp1DC4VCJgIpPuimIiMCrr9i7CACHDXxi9WeE6agoI80p7XbXv+7npU0tyPZ
	bJa4HZigu8ZMqMklKjQ4TnOqvbLyqUy9ycY52r77kh6LbjpVx/W1FIuq4+ZUHBuko0L9
	44WtML0MfyrF+rH++Dtzvy4JPBWj7kBGtYLKaJxg/67VKJ0Kq/lsSfBAXwRHYG53QNEQ
	J8lPVZOG/xPdQlWZs6R+kluHvmXOCllwsTyuZ5yVlPuHkcRLRFeNgB5wsN3C768L3stI
	Etfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2LX6uzQ7xRa2w/VQWLvj69ooPjx3N3YMM9oJ5J9bKZU=;
	b=PqsSbWvzbTMGLOzOovJZn/auHom/5Cd6v37BoydKwxhS6aj+9/qvKSuMzBnt8X/8Xh
	BPIx11Y+D53FXjaezX9wyXdvu/JiDBMvEuAnr0oiCo5RWUAC0UUUkhd+jaJNEosCxwgK
	p21Dibd63NAPt7vZ1SL7mYNukUSDveLORzCBLK4wdeUCTdU0FxUlpB8nWfdIUXmpJK9t
	0lVQCEudajC+E7TiO3H8JSguESOaalWqVf+6r57VqEeDZxIdofhu6mEhIrjrhh2JgXmY
	qerSiuEQVflanvQ0HGuippk05w9wnyBWVAAMfX0Rm3mRniY+HJqfBUUvMc3T/jskc2kh
	PmjQ==
X-Gm-Message-State: APjAAAWRLJJncgur2Tct72o7zMH7eWPrOj4BreoUbHpf9rmN5JQ1a+dG
	KPUOCm6N0e65y8VtqpTGEFA=
X-Google-Smtp-Source: APXvYqygpz0xKFVwf+5EhCaMHRTiGFJlRRYJ4DkNzAZZ60SwCeXS1wTftuRQmMt/JPtutgaB91CAag==
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr18036992lja.24.1571728526986; 
	Tue, 22 Oct 2019 00:15:26 -0700 (PDT)
Received: from localhost ([78.133.233.210])
	by smtp.gmail.com with ESMTPSA id o9sm5841092lfb.1.2019.10.22.00.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Oct 2019 00:15:26 -0700 (PDT)
Date: Tue, 22 Oct 2019 09:15:23 +0200
From: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20191022091523.60d5434a@gmail.com>
In-Reply-To: <0411e8da-91a7-f586-2d65-490e8c327c2d@windriver.com>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost>
	<20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
	<83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
	<20191021113018.3c684d51@gmail.com>
	<0411e8da-91a7-f586-2d65-490e8c327c2d@windriver.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCHv3] lmbench: Fix/clean-up the build for lmbench
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
X-List-Received-Date: Tue, 22 Oct 2019 07:15:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Oct 2019 19:42:45 -0400
Randy MacLeod <randy.macleod@windriver.com> wrote:

> We have had Intel employees working on oe-core / meta-openembedded
> for years so I hope that you will send the commit to that repo on
> github and indicate the
> upstream-status in the patch what we integrate into meta-oe.

Hi Randy,

I'm Intel (actually a subcontractor to them) working on occasion with Daniel Drogomir,
Charlie Paul, and Chantale Ouimet from Windriver. I have put the names as chances they
may be your colleagues. Even though I'm Intel I didn't know of lmbench Intel repo
on github - this must a totally different team. Sure I'll send the patch onto that repo
indicating these are the changes integration planned into meta-oe.

Regards,
Marek

