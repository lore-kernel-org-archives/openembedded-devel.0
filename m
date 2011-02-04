Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PlNZP-0008OG-PJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:27:35 +0100
Received: by iyj18 with SMTP id 18so2263783iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 07:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=TfWGcm/obhiRRnMYhtHArB20l+XvgB2eW36i+r1N+JA=;
	b=KhktAB0GfyTGUlr16IWFP1gcUc1cBLG8HyXNCL3AEvmpIMjV5xWbhx0RzfzAlupkf5
	BeBjG3qBL2js6K5QuTcJ8Sl0zAixNugopY/VnRILfdrQCYjXeei66ZUgDHnS+zrXDp/w
	wIpsfuypRc/YWC6fVqGq1Wlx4jL5YvMOsJnyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GJiYM4Kj4CiOfN3+wWMK1LVjyjcQzxmcL4kD7rZ21/RvU+i+lCuBgd9rUP+nUVK3Gz
	1LO03a9YrbUJy9UfrZ0tCsBMmnC6S3JO9z3Fe11cv/wj2HTog7k8syOVddKvy46DUHh2
	4U3ALchw5Bm/KJLoST381xl1zIwOb/KRcT/8Q=
MIME-Version: 1.0
Received: by 10.231.40.12 with SMTP id i12mr439616ibe.183.1296833197330; Fri,
	04 Feb 2011 07:26:37 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 4 Feb 2011 07:26:37 -0800 (PST)
In-Reply-To: <4D4C1464.4030609@mentor.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
	<4D4C1464.4030609@mentor.com>
Date: Fri, 4 Feb 2011 16:26:37 +0100
Message-ID: <AANLkTi=o+QW-K2VG7WBFFTrshxhD1TDMbqx=EbTxDj5h@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Feb 2011 15:27:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/4 Tom Rini <tom_rini@mentor.com>:
> On 02/04/2011 02:57 AM, Frans Meulenbroeks wrote:
>
>> What I see is a lack of interest in fixing the existing QA errors.
>> I've sent out a few error reports to the list a while ago, (on recipes
>> that I feel not comfortable with), but unfortunately that did not
>> result in any action :-(
>
> I want to address this by itself for a moment.
>
> Do you have time to grow your comfort level? =A0Did you find the (nominal=
)
> maintainer unresponsive? =A0If we want to star making more things fatal w=
e
> need a few more of the people that are willing to go off and work on
> everything. =A0The top-of-my-head count is 5 people and we've all always =
got a
> lot on our plates.
>
> I'll admit it looks daunting when you start at it, but it's just software
> and at worst it'll just not build on your machine for a while :)

The recipes at hand are:
binutils: I don't feel like touching that one.
cups: there is someone bitching about that this is 1.2, but he
apparently prefers bitching upon resolving the issue. Probably the
best solution is to drop the DP =3D -1 from the 1.4.4 recipe
libsdl-x11: not really sure what it does or who maintains it (actually
somewhat surprised that it is used in console-image)
python-sqlite3: also not really sure who maintains it.

And yes, I could try to fix these myself. I used to work on everything
and tried to fix things that were left dangling, but some people in
the community are so unforgiving and negative if you make a mistake
(which can happen if you work on something new to you), so I basically
gave up doing that.
(and yes, I know if it is something you're not familiar with a patch
can be posted to the list, but unfortunately lots of times patches
(especially for areas that are less mainstream) the response on posted
patches is nil).

I am just reporting this as result of the weekly testing effort and I
have no direct interest in these recipes.

Have a nice weekend!
Frans.


