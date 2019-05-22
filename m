Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD6647D217
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 21:34:26 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id t64so2321841qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=l2cuharYbBf4tjikYsa+l+EUJJDZO9jUpp/8C33wAV8=;
	b=bUXEqEi06gewGtiHigT6kpp1dcWPk0zm79+sPa8KVgmUOtSz696fs2Bc19ZlRRLE3I
	tadcYrdZtiz3ICHZeyiTBT+5Gk0ucvGN2AU+55+oDkM9jwnr6x+gKoY9vBwULwHwXT0Y
	emMnYIRXgm9FfH12BEGp+W0jlTWYiTLNMpWGShn/stwdxUjKwnDhg50D2O4uKg5kZ5Za
	S//YZGPlhRQ/vVAS3IdOVhJt49+YxzuRxMdAU05xF88qCEEdVAR/HnGKgfyokGjNBAWX
	Ce54ymF6yZGdmNUo2P/JhR+u0zWvmavlCL+uHLfAk+IqrxM1R95f4yZPQ8XPJcEOdNiz
	S4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=l2cuharYbBf4tjikYsa+l+EUJJDZO9jUpp/8C33wAV8=;
	b=nlxO40C9+ngrDQd/aV0PGM81F5lvWzdakw8k+FdZe0c5r/6SIEDMPpe9yHlBMiFN+w
	zYrnmRlLnnOL3bUvtyypyKCbr0xoldqmC9UcBS5Gw+9PKcMW8tC1mYGoCUeE6TgFbiUn
	H+e/fe9KFovfCmAdot/yJ/iNDPVqxU3j9N61aEqwrxs21kmZEyhzlJfGgGwN0QLQ+ook
	kJQfaP/F1+o5fgNYG7U5Qits5XpXygaMMwUCCXKmxfUC+JNJDLFtcGmiIG4xpLNLkXVS
	Ihbq0XbU3FMGQNmEWEnDg7EJBuY1UmxMCFYxlQuXiR8E/GQn41PrxZgatdQWqhmKTJqD
	NzqA==
X-Gm-Message-State: APjAAAV0NE78rUdRVU955NXCeqf+2HIYmw4KbClylkbfp7BrhWrRQ6+C
	73Xnzp80ApL//gBxB510pokqOcHedF50ES28i0w=
X-Google-Smtp-Source: APXvYqzh17jRNIjSLLTXS5YV7sCtNbY3SRGEGu4VkHNZWDT8XO5M66eby7NW4ysL+dbXQVfyoPuGTyAngz4I1RQahzk=
X-Received: by 2002:a37:b287:: with SMTP id b129mr62679207qkf.20.1558560867799;
	Wed, 22 May 2019 14:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.6750B23534D@git.openembedded.org>
	<CALbNGRS52_LUD8pDuE-cXt5PK8Pqf-TZbFyQdcgGxQanZNx3vg@mail.gmail.com>
	<CAMKF1sqMxN5ic=X8n5yVPct_8DmUCPDCoKxmy9kMVbvYdBQWGg@mail.gmail.com>
	<CALbNGRR97eVuCgmrn06eSB6BM3tGHhaNDzMnTtbLAGd+HQMdtQ@mail.gmail.com>
In-Reply-To: <CALbNGRR97eVuCgmrn06eSB6BM3tGHhaNDzMnTtbLAGd+HQMdtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 14:34:01 -0700
Message-ID: <CAMKF1sq_N0buByYD9N3Xx4kox99yLmMdJX8N=8iLAM8TSbTS0Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 02/09: mozjs: Upgrade to version 60.x
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
X-List-Received-Date: Wed, 22 May 2019 21:34:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 2:29 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, May 22, 2019 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, May 22, 2019 at 12:06 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> > >
> > > On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
> > > >
> > > > This is an automated email from the git hooks/post-receive script.
> > > >
> > > > khem pushed a commit to branch master-next
> > > > in repository meta-openembedded.
> > > >
> > > > commit 8587370567e7f2f398ae1efa77989b1110d15a77
> > > > Author: Khem Raj <raj.khem@gmail.com>
> > > > AuthorDate: Tue May 21 23:27:16 2019 -0700
> > > >
> > > >     mozjs: Upgrade to version 60.x
> > > >
> > > Haven't found this on mailing list so:
> > >
> > > I ve done similar here and I saw that
> > >
> > > * musl patch can go (tested)
> > > * polkit needs update - current version requires mozjs 52.x (shall I
> > > send the patch I have already?)
> > >
> >
> > Please do. I am currently trying to upgrade polkit to 0.116 which
> > should work with
> > spidermonkey 60.x so if you have patches please send, I would be happy
> > to give them a shot.
> >
> That might take till weekend: am sitting on 60+ patches not quite
> ready for the wild. So I have to rebase (and test).
>
> Ahh  - and after staring python2 crusade accidentally: If you give me
> a bit more time I would create a patch to move mozjs build to python3.
> Found a patch which is a good base to steel from.
>

OK. I have it compiling and working on rpi3 and qemux86-64
see top 4 patches
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dyoe/mut

Let me know what you think

> Andreas

