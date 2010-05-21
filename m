Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OFPEN-0005DL-FK
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 12:13:28 +0200
Received: by fg-out-1718.google.com with SMTP id 16so280638fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0VugEOU0Hh13o9UcVXT0JgvarPlzjMhHn7jV0DtVwJY=;
	b=HCqCvlpG9BAJZ2x1u1klxlUplpyh89Y35d+i+u7G4cpUAwdqD/pX6M4hq+cKOIYpGi
	Jdw2HdEklm1mlkaIX+Xt8UEbW23aPrDwmhIf5pT5/hVUs/Ah87to7/8k1LpHHM0z67o/
	jz9gJH+fT7hwuOaR7QUYRMgyjyL7xv8zCrIPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NVx8ObmHErAxSlGGRkFdxAG6leXFq9NYz6Y6M/Ku9Rq9s+FAg0JQ27b6IOBSG+Gdq6
	1h/4rqQhFUsCE04A968ayQEH/K/rdlv+7VIO0ShpNQDeyICwLzq5FWYCEsrnV/xKbCYo
	3CO7+ut2xpItPGCZxmYcmIr6i1qqGTHYcoFwk=
MIME-Version: 1.0
Received: by 10.204.137.89 with SMTP id v25mr40577bkt.13.1274436566554; Fri, 
	21 May 2010 03:09:26 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Fri, 21 May 2010 03:08:56 -0700 (PDT)
In-Reply-To: <201005211158.42460.marcin@juszkiewicz.com.pl>
References: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
	<AANLkTinAOE1YAoEEqHuOQoIWuXDJ_SZZL4wcWe2D9tri@mail.gmail.com>
	<AANLkTilad9w4Dh67o_qqPaTHJRTvLBKrI7YbkUNl4A6G@mail.gmail.com>
	<201005211158.42460.marcin@juszkiewicz.com.pl>
Date: Fri, 21 May 2010 12:08:56 +0200
Message-ID: <AANLkTinOiz46Ft8MqY6nFlyzPM-VqYvHrBj43xJVneJO@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem with building glibc
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
X-List-Received-Date: Fri, 21 May 2010 10:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Thanks, I'll do as you recommend.

And do not get flooded by Wis=B3a :D
>

Luckily I am far away from it...


2010/5/21 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

> Dnia pi=B1tek, 21 maja 2010 o 11:48:24 Grzegorz Toporek napisa=B3(a):
>
> > I would love to work with angstrom, however I'm using Colibri evaluatio=
n
> > board with Intel(R) PXA270 Processor (this is a students project and I
> can't
> > change it). Is it possible to run system built for angstrom on my board
> or
> > I just miss something?!
>
> Angstrom supports nearly every board which OpenEmbedded supports. Colibri
> is
> just another device. Build Angstrom for it, use it and you will soon find
> out
> how much work you do not have to do due to feeds with already built
> software.
>
> Making own distribution and then properly maintain it is lot of work and =
I
> would never suggest that for someone who just started with OpenEmbedded.
>
> Also one thing: do not use tune-iwmmxt for Colibri. This does not give an=
y
> special improvements for system. Add "iwmmxt" to MACHINE_FEATURES like it
> is
> in few machines already - this will give you optimized versions of those
> packages where it is really worth to enable that.
>
> And do not get flooded by Wis=B3a :D
>
> Regards,
> --
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

