Return-Path: <prvs=10032bfe1d=holzmayr@rsi-elektrotechnik.de>
X-Greylist: delayed 378 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Apr 2019 19:52:40 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.221])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB7E7D6B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1554925961;
	s=strato-dkim-0002; d=rsi-elektrotechnik.de;
	h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=Hw8XueYSaYo6wIeqwu1h8alTI4Y84eX3HGrPFPwPI9k=;
	b=ro4UEUOCZlWW9C/vuG91RAnEwDiPa0Q7A3eWrQbiTmPPDhQA8Xcsal1sPaI9F5FWqj
	LmgkBAWv9Es72dPtG7nynn/b5h3f1+DkQ3U2D6MPKmjru68emH5zzsphQV6Ehcht03eO
	hm/pwFN2rukQ43cltIK+DqWPSz8LXOboIWt4KDnJ0WWLRHFByui+8psrmuT08TBanmqp
	h9dSnzYcK7ArevIpcFc3K6IP3TAAzX08GWFTKJ/FfXX3mehgekUbGl3lrBYLGaSw7QPs
	a0NPygf7QjyykTvStMgYdu1nV07dDfwOZf35wD2SbMmg3RpJnKTw6DHWefS0bMGfzUOI
	zEig==
X-RZG-AUTH: ":fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/Kpz6b/avroGOv0c9sak1tqOWjLU3UFhR6"
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de by smtp.strato.de (RZmta 44.18 AUTH)
	with ESMTPSA id Q0b788v3AJeJ6p3
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Wed, 10 Apr 2019 21:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1554925219; x=1555530019;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Date:From:To:Cc:
	Subject:Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	User-Agent; bh=Hw8XueYSaYo6wIeqwu1h8alTI4Y84eX3HGrPFPwPI9k=; b=I
	j9VgdRd8I6IpMSBI61gdyVwXF0eg8Oc1R2xgD00+DFQZvLQvHJ34o2Ck3x5k9D/3
	vKZLxFIoE5EsDVdWYs6ZiGmOk1kCefWPPVx5Q2hSbYhbs3k+mPQM2IdtIIuNTLQW
	SiCLMWMsv10xNQ4U5i44ZM9PQjtqfbzEbmI0FZPYrc=
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v18.5.3) with ESMTPSA id
	md50000157343.msg; Wed, 10 Apr 2019 21:40:19 +0200
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 10 Apr 2019 21:40:19 +0200
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 178.27.67.144
X-MDHelo: jholzmayr.localdomain
X-MDArrival-Date: Wed, 10 Apr 2019 21:40:19 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=10032bfe1d=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
Date: Wed, 10 Apr 2019 21:40:07 +0200
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190410194007.3hs4efbdwg5z3lei@jholzmayr.localdomain>
References: <d5eb2bd0-173b-79b5-922c-a1f0fa097552@balister.org>
	<CAMKF1srN+kBat8eKj_tw_7y_pv3zWWjAu92L0abCYQFSnfGXcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srN+kBat8eKj_tw_7y_pv3zWWjAu92L0abCYQFSnfGXcA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Scipy, this never ending thread must end
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
X-List-Received-Date: Wed, 10 Apr 2019 19:52:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 10, 2019 at 09:05:19AM -0700, Khem Raj wrote:
> On Wed, Apr 10, 2019 at 8:27 AM Philip Balister <philip@balister.org> wrote:
> >
> > Over and over people ask about Scipy.
> >
> > I've built lapack and created an image I could natively build scipy with
> > before. Since FORTRAN isn't normally built, adding this recipe to an
> > existing layer isn't a good idea.
> >
> > I'm going to create a layer meta-fortran for this recipe and then start
> > collecting the wisdom of the community to create a scipy recipe.
> >
> > Does anyone have a better approach then this for creating a scipy
> > recipe? I know people have been really close before.
> >
> 
> I think this is a good idea.

+1

> 
> > Philip
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
———————————————
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548 

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


