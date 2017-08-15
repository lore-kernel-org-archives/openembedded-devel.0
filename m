Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3161F782CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:47:54 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id f11so9277314oic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Y1lPrWF56B5SSmmiaOc2y4Vi1m0VYZs3ucJbwe1yXsU=;
	b=KhB2PkB3tMf2NZ1ztV9uIe7se9Z4MIliEXZBjcU45N4mw249OoqNGhWUUFhXTClLkO
	WP5g4ov1yZpKBi5K5epwPWFBjDx4tJr3B7jY+RFJJL6eHgykPZT6CSu0fcw9bdFfr7DI
	8TImACw40UOAIoShkSziQoonp5gqYY1pO1bAlgmsFNLWdC729NktkXhkXM81lx5FmR40
	C7NfOpL0VIXKxTaUb87wPE186cru0/pSqNj9WwoJEaGfFRo6yT6NUHcMBtSVKsi8hSod
	ZURNTvN6Db/WedS7TSKd+lnIaa///zn6bRx/JbLM/xzz74HMYRc5juP3V9y9h9/BgZnR
	R8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Y1lPrWF56B5SSmmiaOc2y4Vi1m0VYZs3ucJbwe1yXsU=;
	b=RPF+D48CmKdajrTKEtRjpqziqDMzbfTJ2ln6Pa/+37QKAuQ5IMZShIqaGcJXX43was
	KSVeV8aD6iD/r4E3rrRl7jZx2z9slzyDTvoM49wvl42wj0EMd+7URC5aFv3ZkH3sD6/P
	wFEzHVDhkYpCA9mDUmp/hE1ivNZq9rhwnsfXJqGzurNde30PxXHSYvfiJZkvvquAsmq4
	1lWCUi0j80uotJcxKKLnSqe1DLavw8P4ESsyKIZSG5wV9Gt/sc+svCmlcslDiBl4PMkS
	ReqrIsW9HBnT5rwwCFC9FJ8RgNJZzKks4jA2eL2ZlvHU1oGNqkkUISzvrfzi87PYZt6S
	xBUw==
X-Gm-Message-State: AHYfb5i1/Nt3Cfy2OrsnW2uGElr8uXdQEadM7sWb+Z96cG8oYdhzeyw+
	9BA1ZhieMc4v0l46aYg=
X-Received: by 10.202.1.80 with SMTP id 77mr35367911oib.180.1502808475783;
	Tue, 15 Aug 2017 07:47:55 -0700 (PDT)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com.
	[209.85.218.52]) by smtp.gmail.com with ESMTPSA id
	d189sm16723339oih.1.2017.08.15.07.47.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 07:47:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f52.google.com with SMTP id x3so9224793oia.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 07:47:54 -0700 (PDT)
X-Received: by 10.202.66.11 with SMTP id p11mr33486484oia.267.1502808474385;
	Tue, 15 Aug 2017 07:47:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Tue, 15 Aug 2017 07:47:53 -0700 (PDT)
In-Reply-To: <CAHUNapQ8zxvaEdn51D0kN5C7JVRpQJq34tCuqamMEM0fm20LRw@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapQ8zxvaEdn51D0kN5C7JVRpQJq34tCuqamMEM0fm20LRw@mail.gmail.com>
Date: Tue, 15 Aug 2017 11:47:53 -0300
X-Gmail-Original-Message-ID: <CAP9ODKorOG_0ks1BEWTiMSoadvPk7mnEdUffPys4COBcFwBWQg@mail.gmail.com>
Message-ID: <CAP9ODKorOG_0ks1BEWTiMSoadvPk7mnEdUffPys4COBcFwBWQg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Tue, 15 Aug 2017 14:47:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 15, 2017 at 11:43 AM, Trevor Woerner <twoerner@gmail.com> wrote:
>> My recipe is a lot less customizable, but OTOH that makes it
>> quite easy to move to new Chromium milestones. If we're able to find a
>> balance there, I definitely think we'd be able to get a lot more done
>> together.
>
> I think it was a mistake for meta-browser to have recently added a
> huge number of patches supporting musl. One commit alone added almost
> 700 lines of diff for musl support (not to mention the subsequent
> fixup patches)! Musl support should be kept and maintained in
> meta-musl, isn't that the purpose of meta-musl? If users want musl
> support they're going to need to add meta-musl anyway, so it's no
> change from a user's point of view. But 700 lines of patches provides
> a heavy burden for anyone trying to maintain or update meta-browser's
> chromium, especially if they don't use or care about musl support.

I tend to agree and I also believe that upgrading much of this patch
will die. Khem would you be open to reworking the support after we
upgrade? So it'd remove the patch refresh from Raphael and Trevor's
shoulders ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

