Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5266C10B
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 14:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TJl0467Tz40;
	Thu,  5 Dec 2019 15:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575557932;
	bh=l8eR9G6dUg3gJKK0exk74MnzudINsZiW1cYPWbXB+8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Suqi8g/OPOPc2C5U+q6g0Q3Qlrqi+gfxGwUXJE7SAtaD404cviyIlOU3OH3z3JkuZ
	uPKD0QhpEfE4e0V2YFSO0AJWNS6vr+NiA1g2WdhyyaQ/Z+jTUrfQ9if0Sl0WUjLPTK
	rb9Tkq3Fas+00IoP+XGHLGFhjzF952zkOCE0okBSREonLK7d7qnYmhT++m2MCgwAtA
	jld/IZQL36nFd/mnZ1M7sZDjMci2qSWuWYGt1sButRqkKwJtdjAmXz4HIaQ0IGDoHx
	ruhzAX8wPUxl23bYa2mIhlL+dazPWFpGPPg000p2tQJJu69vkJssT2g9JkT1OEh1dA
	Yri2PWU7bXQJqeB5iT4uxwd9W41c/op4BvkIdhV9gStXNjRo5YhMRTumxnGILoI/0i
	jaw6+HtoXEQ58yzW/b6XELOIZI0hvoAY29+Rq+Mc8oLhpSPej3+nS8h1Uv+4DBiSjb
	Iy2SRBVDnwotp678WfU5+Bt13de/IcYCvKHZcDRhp0iCyYBCqRgCxtLJGSjBYW6Is+
	AQLBH5MhWLlbICku2ttoK2gvC9xZyuMHvKj6irJH/UYqvZnSYxM3IVSCDAoA4Janpw
	/IIWhXLO9uMI/GyLzJBUwrrtXnhHuSq3oGEIwow9ZmDta+VU3SemA2Dnqhxcq37f9b
	Yq9dDuAhAkZOpl4O8QK85/CE=
Date: Thu, 5 Dec 2019 16:58:50 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20191205145850.GC3151@localhost>
References: <CANx9H-CNHDMVz4pNz=T1FpmsQ3hDcF=_nWM_a2PhM+KD3JWAPw@mail.gmail.com>
	<20191205123915.GA3151@localhost>
	<CANx9H-CLX8q67Xbz4ve24m_rQkLEuUOOE410JEOLo8h7dXnS0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-CLX8q67Xbz4ve24m_rQkLEuUOOE410JEOLo8h7dXnS0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Thu, 05 Dec 2019 14:58:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 05, 2019 at 06:33:15AM -0800, Tim Orling wrote:
> On Thu, Dec 5, 2019 at 4:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > On Wed, Dec 04, 2019 at 09:00:20PM -0800, Tim Orling wrote:
> > > python-pycrypto [1] is rather old and un-maintained [2].
> > > python-pycryptodome [3] is more modern and is basically a drop in
> > > replacement. However, the two cannot be installed at the same time.
> > > Instead, one would install python-pycryptodomex which does not conflict
> > > with the paths of python-pycrypto [4].
> > >
> > > In an effort to enable packagegroup-meta-python [5] and meta-python-image
> > > [6], one runs into the existing python-pycrypto and python-pycryptodome
> > > recipes attempting to install the same files to the same locations (no
> > > surprise, they are providing the same libraries).
> > >
> > > For the stable branches, should we rename python-pycryptodome to
> > > python-cryptodomex and PROVIDES python-pycryptodome?
> > >...
> >
> > The minimal change for stable branches would be to add RCONFLICTS
> > on python{,3}-pycryptodome to python{,3}-pycrypto.
> 
> this is only a python 2 issue.
>...

Adding both python3-pycryptodome and python3-pycrypto to an image failed 
for me in master with the same error.

cu
Adrian

