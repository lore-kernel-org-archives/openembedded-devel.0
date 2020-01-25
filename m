Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4F89A7D6C2;
	Sat, 25 Jan 2020 09:50:05 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id i7so440871ilr.7;
	Sat, 25 Jan 2020 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nX+sjn3O5M1M4iqWHOpStetbtgpeTtpgh50fRRYq5E4=;
	b=sYj8n9hTIkPMgWJnnh/Aa4mLwbwjBNR5AFQd/YDUsCvuXYufSGjXJz1U3rpCNocFtU
	nk/g9nzLbkBNvjeLLjgMhQZKwDw4cCCdUBw7IqeI4yB9ILZFgYq/3diCHCGvfQeE8rkT
	qKwdTrRfVeSykKsOKozCXeC9YKKj2BPejxUiSSlALmocloJQefeRzmAY4fiHc3sy5z0W
	YYwL+IQoDUViay0ynmbYarehQjh/8OgdZO5fgQP8nAfIWqsE/uP2y0ndygQra4/5m+kF
	NsPBmatsZCmdu5myMQdzlCyJfEPz/6acK7eP3SBV9FJzfYu5TxndlcVXPYiC8iSmcu9c
	f2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nX+sjn3O5M1M4iqWHOpStetbtgpeTtpgh50fRRYq5E4=;
	b=o7WcCMacLLN2n7mPpg2InFthFJtKu4zKXN91jT2aSKdDel4A7xCEPjIcyX11CsN5Qa
	kA4BPNJu0HjqZdIa6S6ufxiypdBhjjfTySvAoQGmBcy39mgnaQwZmAupdK8jV2RohpTg
	3Jguj7IvMTlgPNBUGsDz48YQFCpPFXCCc6UmuWlCOOjrWTo0YN2PiSMwaSYqydsTRrm+
	hvqqwDG/MVamM8Xm8Vspbc1RhYDC81stz0GWroa/I8QVTI7MSZeJEJ2FmpdrIBbLSSJS
	G50kCfcN8mmJ6oikfqbzSlHpvKoORlGExh5uHGut9hlwcyXMgbQi8DJI0Aco1B83fqi+
	nq0g==
X-Gm-Message-State: APjAAAUIaX0S96leabcM8UrDkqeVBEHUnTQzunyzQdwJ5jximyb0Rebr
	mIPjMgqHuKV7CpNmSYCo7AveJozKEQnc9rfQoGI=
X-Google-Smtp-Source: APXvYqxIHsmfv/a6yxIVke71N6hH4LKAX7H4Ony7IzxpMKAHndWcrhto9hBrJitxk7XpSdl569bwWLMCPVMqbCk4OXU=
X-Received: by 2002:a92:290a:: with SMTP id l10mr6999201ilg.151.1579945806991; 
	Sat, 25 Jan 2020 01:50:06 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
In-Reply-To: <24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 25 Jan 2020 01:49:56 -0800
Message-ID: <CANx9H-DQYxz_mj-AxwjbJfm=FVbR=89rP3MjBUTY9OzoBsMF8w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] python2-less meta-openembedded build results
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
X-List-Received-Date: Sat, 25 Jan 2020 09:50:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2020 at 11:28 AM Khem Raj <raj.khem@gmail.com> wrote:

> On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Hi all
> >>
> >> Recently py2 is removed from oe-core, So I did quick patches to get a
> >> world build going. And
> >> here are initial failures, please help out with recipes your can or
> >> care for. Eventually, the remaining
> >> ones we can blacklist for 3.1 release.
> >>
> >> http://errors.yoctoproject.org/Errors/Build/97185/
> >>
> >> I will post more arches as they become available. If you want to try
> >> the same for machines/distros you can try yoe/mut for meta-oe
> >
> > I've actually asked Ross about similar failures, specifically in
> > [meta-openembeeded/meta-python] where there is a good mix of Pytho2
> > and Python3 still present. I've started to remove those yesterday, and
> > would continue with that layer further.
> >
> >>
> >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dyoe/mu=
t
> >>
>
> All these changes are now in master and its again buildable, with or
> without meta-python2, with meta-python2, its back to where it was with
> everything  building however, without py2 layer we have some work to do
> so if you are interested in this here [1] is initial list of failures
> I will keep posting more as we go along.
>
> [1]
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/ste=
ps/8/logs/errors


Now that I have caught up with meta-python2, I can turn some of my own-time
attention to helping with these. Thank you, Khem, for making it easy to see
the =E2=80=9Cpunch-list=E2=80=9D.

<https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/step=
s/8/logs/errors>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

