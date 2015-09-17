Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9720876FEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:07:00 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so6284334igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=eG1/wg4Gdp/gmz7uEVRS5+uVxO96iX/vs3AsQ/R956c=;
	b=Xg5xA/AKi53JThMTglw0Qa36KC6ivtRQFRBRwA4qf1m9Xl59aAJznRVDsKnVO1vxQa
	CU88qtSdviPdA7oE6+zaXgueHsmZMwkPdriEa2gV+OF4d3Pt5CsSgNT3+BBkFCQTW2lg
	y2SAmIxMp2H4uy2qvzue5h0lUscWnbBrPKoGsn3NfABaNsPxvLeL+ceqNToFjZWduio1
	tHfpHyFED0HUogMxpO4ADODF6l+5cd1IkxSaMa5TzMrnpKJwR1bFgzcxB0RngTQvebEH
	ITYfpz+8w+Sof0GliohrEtF99ZkNFWzOle5C46pP/N4mD9ET9nLsQ9XqhGF2lkPaFSH0
	KZsA==
MIME-Version: 1.0
X-Received: by 10.50.225.100 with SMTP id rj4mr23025186igc.78.1442473620762;
	Thu, 17 Sep 2015 00:07:00 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 17 Sep 2015 00:07:00 -0700 (PDT)
In-Reply-To: <20150917065442.GA2388@jama>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
	<1442450491-14912-2-git-send-email-schnitzeltony@googlemail.com>
	<20150917065442.GA2388@jama>
Date: Thu, 17 Sep 2015 09:07:00 +0200
Message-ID: <CALbNGRSspTfweFmjH4rr_8QZC+7dCOEz6oAms22+hpHpyb6_Bg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/19] gvfs: remove invalid PACKAGECONFIG[cdda]
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
X-List-Received-Date: Thu, 17 Sep 2015 07:07:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 8:54 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Sep 17, 2015 at 02:41:13AM +0200, Andreas M=C3=BCller wrote:
>> Enabling cdda requires libcdio-paranoia not libcdio. libcdio-paranoia is=
 not
>> found in layer list so disable cdda.
>
> It wouldn't be the first case where PACKAGECONFIG requires dependency
> which cannot be satisfied, would you mind adding libcdio-paranoia to
> PACKAGECONFIG for cdda and keeping it by default disabled?
>
> Maybe with comment saying that for cdda you need to create/find
> libcdio-paranoia recipe.
>
OK I can do. I think the easiest way to handle is ignoring this commit
and do the change next series. Please don't block the others (if there
aren't other complaints) because I am loosing overview what was sent
and what needs further rebasement.

Andreas

