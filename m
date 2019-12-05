Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1227F874
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 18:11:55 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id b15so3814267ila.7
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=obI+SKqgFwOWFrTaQXy3xGPIYno3VaJ6Bk1z3MQNKZE=;
	b=Y/kcvxgcrmuJl4YnlwxGj4v4Wqa3NNosv7i9q6nV0Ncwh47DulLVyB2hstmgtJgpu3
	hsSPK8XbNusc47uJyiFKF0bpvb4sLyL6SdPbE1Z+eejlf8PNvAspOXndY7HLvWH63XQH
	h+iGd4bEoKtSdATsho6JUtMG/3DgrTv031iQ0dhgz57J5S8EQ+Col0X6+C1BiEBQOssw
	KNSEkAc2h/hozs/o0ok+XijC/BYuV5BqIFqtmS3NsAx1arQtycEdgpSu+7k20mHK6AQV
	jBOn9JacWqvBWaRYM/45H7Repwkc2wwJp+eoUF4wp/27lF7VxThkZ85QyYIEZZeRaCrp
	jZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=obI+SKqgFwOWFrTaQXy3xGPIYno3VaJ6Bk1z3MQNKZE=;
	b=nIRiv5iuIaW8Hn6wWaD29UUyUbNoQURtZmowF0UelbF/7r6ce3DKiGGP1IM6PcKd1h
	x/i+JAS+zfn81EB8EMg9qx1Vo2JaahMgkDzUGk6tavi6qhlqORGPGQwyGaJ0yoDYplvk
	dgwBvW5Wc2XKZS8kwCiEWdacnv2qhKWBgHPoBZAIp0EXiqDFFDMKQYjuK7iarfpDfU2x
	7iz4IvEvAAv8Va1mpXgruIH5pWcUSz1CoJNKZdr9XmaMC3Y8rahnwXCKMSXZBMcA4ODa
	QLMbzRcZ/JTbmOQXwe33Q3MryRt/oFWk6Jxt+KkDn5MYG2rkC+mC/o39PUmcMpjahdnb
	4BYw==
X-Gm-Message-State: APjAAAUkNvDbVW6ulH2QEfFvamMO99nLMyD1iLC4kspTUjcXM8LMlh0d
	YHWv28warAZVqxHEWWN6VKheatZh8Kgu9oRro7qWcg==
X-Google-Smtp-Source: APXvYqzRqGiG8rVL4NQpo8IcvVgiffkoKVxPaHk9Gca889Tu7WMdavz/EP4L5EXDCCRuud+gIjxy2WHitjKJ77m4QI0=
X-Received: by 2002:a92:1092:: with SMTP id 18mr10290258ilq.198.1575569515988; 
	Thu, 05 Dec 2019 10:11:55 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-CNHDMVz4pNz=T1FpmsQ3hDcF=_nWM_a2PhM+KD3JWAPw@mail.gmail.com>
	<20191205123915.GA3151@localhost>
	<CANx9H-CLX8q67Xbz4ve24m_rQkLEuUOOE410JEOLo8h7dXnS0g@mail.gmail.com>
	<20191205145850.GC3151@localhost>
In-Reply-To: <20191205145850.GC3151@localhost>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 5 Dec 2019 10:11:13 -0800
Message-ID: <CANx9H-BGkGgK5_eMabWeBu+x0qJddFfdW4fW0iuJX177w1Rytw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: [thud, warrior, zeus][meta-python] Conundrum: python-pycrypto and python-pycryptodome
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
X-List-Received-Date: Thu, 05 Dec 2019 18:11:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 6:58 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Thu, Dec 05, 2019 at 06:33:15AM -0800, Tim Orling wrote:
> > On Thu, Dec 5, 2019 at 4:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Wed, Dec 04, 2019 at 09:00:20PM -0800, Tim Orling wrote:
> > > > python-pycrypto [1] is rather old and un-maintained [2].
> > > > python-pycryptodome [3] is more modern and is basically a drop in
> > > > replacement. However, the two cannot be installed at the same time.
> > > > Instead, one would install python-pycryptodomex which does not
> conflict
> > > > with the paths of python-pycrypto [4].
> > > >
> > > > In an effort to enable packagegroup-meta-python [5] and
> meta-python-image
> > > > [6], one runs into the existing python-pycrypto and
> python-pycryptodome
> > > > recipes attempting to install the same files to the same locations
> (no
> > > > surprise, they are providing the same libraries).
> > > >
> > > > For the stable branches, should we rename python-pycryptodome to
> > > > python-cryptodomex and PROVIDES python-pycryptodome?
> > > >...
> > >
> > > The minimal change for stable branches would be to add RCONFLICTS
> > > on python{,3}-pycryptodome to python{,3}-pycrypto.
> >
> > this is only a python 2 issue.
> >...
>
> Adding both python3-pycryptodome and python3-pycrypto to an image failed
> for me in master with the same error.
>

Thank you for testing. I=E2=80=99ll follow up on that for master.


> cu
> Adrian
>

