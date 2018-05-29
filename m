Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E717574C2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 22:23:48 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q13-v6so20825332qtp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 15:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dtv4hr3G0QP+HGzY5uiqXSDt6vu5hrBpzlv6yHTrw0k=;
	b=QPzwLlQNf16itOtAfN1TEjB6kmqqCyanown1bgInALjv4E969gMp6xr2I78cmPvmRq
	q1iyGy6APE6Sss6kHMdqV/ogXmP6P0zpGJUb38unt0m8jgsWuAWE+gGc8tl9t75CqR01
	FpuVvkDmf00ozRJHEEpE9e5WZ+ldvn88UoR6MgI/wEPdByzUb/HRu+FxkTF+VqHrmx+W
	kY2TeyckODkbrP4EuH8hUW/ddKsiE+3pcN+vJrkerrYjIvP89xjGVI5eiMcqqKGEPLQb
	MaVPsy9+XuQI6mWhc9NPjiWpoVK75zgfWu5C+IM33Zf1PYLpSd+fZVoYGTGf5tzLliDB
	YPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dtv4hr3G0QP+HGzY5uiqXSDt6vu5hrBpzlv6yHTrw0k=;
	b=XoRsl2J5kXrQ2vuCgMDS1Ld38fFo3c3T6DV8yUlp1YB9XrWLDZVMmFF+j0ySB38I8O
	ImaXVVbqRBaTGyox50R7x9hwfHt/rL56IaWk9KPFKIF1SCo23UQPXYAnXR0bgKdFzZe9
	neyF2HTuL+1Xnq5jbYnuOrZuUFIIqdv+sdZLSYX67Het1CsQrLcS7/tKgFbDqQZuHqMo
	+5bazKLDlFgYUJqNSqoQRsDfQ5ccnGZHGbVBjUYY97OLOdw0HrjCpTCkZyyKmfXHRovd
	+Q/NNkBD+geTSvJhQ6kAU4dvOmMjfHjPiZx1G3jsx78dpsPzo2RYP99HeIHbOgpgS/W2
	bERw==
X-Gm-Message-State: APt69E1+9CsXG6ASSPxYmQWLw2VgwZSJDQki2esttP6aZhTqXiiKgU20
	1NvWXeAwZ6fiyvEnbWnbkY9Qpr0cqBo1qQzbYbE=
X-Google-Smtp-Source: ADUXVKII3/T+3YeAODeRfkEJkLtNChj3oPsGieI//C5qsDS/ccU9G/qjXHCf+q5UjpeMKtwtwqcVwC4A4rvkHTY09AI=
X-Received: by 2002:ac8:26ea:: with SMTP id 39-v6mr287870qtp.128.1527632629354;
	Tue, 29 May 2018 15:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180510063718.16913-1-andrew@aj.id.au>
	<1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
	<CAMKF1sp+qOKAhA3K1OqLuPBwY3w2xNFkzSnoUsEY9okKxT45ow@mail.gmail.com>
	<1527631428.3392595.1389703584.53FF3C93@webmail.messagingengine.com>
In-Reply-To: <1527631428.3392595.1389703584.53FF3C93@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 15:23:37 -0700
Message-ID: <CAMKF1srL5ovf3FfNsk-S83djSY63gG4UyBmqGohvgEfJsW4qGA@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openbmc@lists.ozlabs.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Tue, 29 May 2018 22:23:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2018 at 3:03 PM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Wed, 30 May 2018, at 02:34, Khem Raj wrote:
> > On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> > >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >
> > > Ping - is there anything I need to revise for this patch or the
> following two?
> > >
> >
> > There was a review comment for you to adress, see
> >
> > https://patchwork.openembedded.org/patch/150467/
> >
> > if you have addressed that please send a v3 for whole series.
>
> That comment is on v1 of the series. This is v2, and I have reworked the
> recipe to simply clone the git repo instead of grab the tarball to avoid
> the issue that was pointed out.
>

Ok thanks I think the v2 seems to be missing in patchwork that=E2=80=99s th=
e reason
it will go missed i wonder if you resend than patchwork will catch it

>
> Thanks,
>
> Andrew
>

