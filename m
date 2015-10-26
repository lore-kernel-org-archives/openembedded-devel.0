Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id CA23773D27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 21:59:17 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so132587111qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oRPABiAG6BA7SQJBHTDW2B4Fsq249XWWuppZnifqAvA=;
	b=Jle/xXJL2uz++zPAlAHiz1HSfX7DrwsMpEd9OJ1xwdAzon3DmucLkfdJUdeg+9ReOL
	l7ADRGfpAghuOItwtH3dQsHtYnzXcgCxNnKBvPFl+o6XdyOJ7dwwl26TxOCahz4hAHsN
	xpyiiZvMCjNbowOclWa8j4QHRvu+PFWsVhbzwMBvWVAIubT9d7yyS+2lpwvIJvAXH2qG
	j0tYBy7khZo6dy6aibKVvTCs+WsEoQbc7am94Y308HfR0k8cKhpOh+IdkKrbbspNifPP
	WNyc4tc08CNLA14zUlS9FKu5i5999SlzS2Ll/mOysk/ebT2/0Al0Sew5239mLJj0QrLg
	CIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=oRPABiAG6BA7SQJBHTDW2B4Fsq249XWWuppZnifqAvA=;
	b=dD/F9eXj7IFbRwuRj4LIQisU4V85MXqS+Gv/sCa/P5vkIlMiAfO8GhE4SNLXkrulFk
	JTtw9nANRsGXuo29pwU+7BS3dGUJDifOiAISSwDtmOswo2kyYOX7ZQHdz3+LwWgoOhe1
	O04ylDVKmb7Q8riP9zMj2z1RQatnO9ZaQJ5iGz1iQS2O5y2wRTl8z7r3roQh6Pj0M3mG
	+f50r6LDtJmOgY+ISrZLXMg+aLJuLq/hINlOIlbkOxYaQSCwfU7lJXGw2Z1ZWmcK8Xt0
	0Z2t4vztdgVDuebvltG9ySkQMDE8lAJUSGmWLysyMwpY9TAnPRRPvz01tTzBm6T98xq7
	aGJQ==
X-Gm-Message-State: ALoCoQmpPsiHnkhcfARgGD9DvMbMxCeWZoNr8BT+mZuuyAqPd4CMpjigprzt+9KLWN6zsVhIVEt/
MIME-Version: 1.0
X-Received: by 10.140.91.135 with SMTP id z7mr12572251qgd.91.1445896757811;
	Mon, 26 Oct 2015 14:59:17 -0700 (PDT)
Received: by 10.140.98.55 with HTTP; Mon, 26 Oct 2015 14:59:17 -0700 (PDT)
Received: by 10.140.98.55 with HTTP; Mon, 26 Oct 2015 14:59:17 -0700 (PDT)
In-Reply-To: <562E9F28.3070508@balister.org>
References: <562E9F28.3070508@balister.org>
Date: Mon, 26 Oct 2015 22:59:17 +0100
Message-ID: <CAP71WjyfHGBvVC7_g1xzqCJwNQveLj-F6-8WoB4LTkCEr3KB-w@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Updates to mesa and llvm
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
X-List-Received-Date: Mon, 26 Oct 2015 21:59:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 26 oct. 2015 22:46, "Philip Balister" <philip@balister.org> a =C3=A9crit=
 :
>
> Recently I need to get the llvmpipe driver running with mesa. I ended up
> adding a llvm-3.7 recipe and updating mesa to 10.6.8. Not sure if going
> to 11.x.y also works.

I was told 2 weeks ago that updates to 10.6.8 was too late for this cycle,
and Ross said we could cherry pick patches from upstream if needed..

As for 11.x, we have patches ready for next cycle.. As soon as we can
update master we will send them.

>
> I'd like to upstream these since they configuration actually worked and
> performance was much better. I recall some discussion lately about this
> process and wanted to make sure I didn't break anything :)
>
> I'll send on the llvm 3.7 stuff this week, since it should work in
> parallel with the older recipe. I do need to move the license file
> checksum into the version specific piece.
>
> The timing on the mesa update is trickier since we are trying to
> stabilize the oe-core release.
>
> Comments? Will adding another llvm recipe cause trouble for other
packages?
>
> Philip
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

