Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ObTV0-0004lp-28
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 09:13:51 +0200
Received: by bwz10 with SMTP id 10so3637769bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 00:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=N9mwaUA9ShmYqt1VgHjS5Qc4q2LFB1ssQ5ZWCZwuDrw=;
	b=XrwUb10PMnmHNzFEc3So3Gn5aBuyeQnLOGfLoUoD8UJnsMqP1b8vuJW39QB63quf39
	390vJApkmprj6rXwEhOOtTuaGiYXDhOHHYs5EhoBBA7ckAjjzP3nSAI3Aaez54L2NAVo
	9Eqcbr0BhRSOXf4MUypqOEXuGoJVAK3Go0BhY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=b6LJEaH9zM4D6iMaSx9VDy/STqNA/0jq77c7Uf5p8dtNPP8iFL+7/h9TWBRxF1wrhm
	X3vlGH4eQyLLw+VfWwKoQOt4mGfF/Oefz6zH5432LpV3tfPyyNHNcfiit1t81pxVSeL2
	vvqNyKfo00t12q7XB4PjpZsyUYDXgkN2CAs9k=
MIME-Version: 1.0
Received: by 10.204.178.146 with SMTP id bm18mr6023932bkb.99.1279696406753; 
	Wed, 21 Jul 2010 00:13:26 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 21 Jul 2010 00:13:26 -0700 (PDT)
In-Reply-To: <AANLkTinsqL1X3cuCRDedYB3h8rhDP3VehMC6RmKZ_wLw@mail.gmail.com>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
	<i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local>
	<AANLkTikYdD7jzsJBNEK0MedOmM_jHIEcdCfE0APMSOqt@mail.gmail.com>
	<20100720192253.GN1512@excalibur.local>
	<AANLkTinsqL1X3cuCRDedYB3h8rhDP3VehMC6RmKZ_wLw@mail.gmail.com>
Date: Wed, 21 Jul 2010 09:13:26 +0200
Message-ID: <AANLkTikP03HJoz0VI_tg6tV3Z4bGYsYaAA2mVwNO4nYq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Wed, 21 Jul 2010 07:13:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/21 Esben Haabendal <esbenhaabendal@gmail.com>

> On Tue, Jul 20, 2010 at 9:22 PM, Stefan Schmidt
> <stefan@datenfreihafen.org> wrote:
>
> > What does not fit your needs with the current stable handling?
>
> It started out with a rather continous flow of changed from dev,
> causing it to be almost as unstable as dev. Now stable/2009 looks
> mostly dead.
>
> What I need is a really _STABLE_ branch, but still maintained, on
> which it is possible to base products on for customers which do not
> want to hear about problems with the chosen upstream build system.
> I realize that I am rather alone with my wishes for stable, so I just
> rather silently express my wishes here for the record.
>

You can create your own. That'll give you all the control.
Alternately you just could decide to freeze whatever version you are using
and only cherry pick some bugfixes.
If you are doing end user products it may be a good plan to do a freeze at
some point anyway, otherwise you're shooting at a moving target.

Frans (who understands your desire)

>
> > I would like to have a more continous flow of changes from dev over som=
e
> testing
> > branch to stable. As indicated in my initial mail. That would people
> working on
> > this idea and keeping it alive though. Given that no one seemed to be
> interested
> > but man seem to be interested to get a new stable/2010 branch the same
> way we
> > had for 2009 it seems the most practical way to get one at all, no?
> >
> > Other models will only work if enough support from the active
> contributors is
> > available. Without this even the best idea might die.
>
> Exactly, and this is why I don't really want to push my idea on how a
> stable branch should work, as I realize I would likely end up being
> rather alone maintaining it, which is how it is today with my customer
> OE projects anyways.
>
> /Esben
> --
> Esben Haabendal, Senior Software Consultant
> Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
> Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
> WWW: http://www.doredevelopment.dk
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

