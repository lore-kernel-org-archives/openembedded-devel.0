Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Olptr-0002Vl-Mi
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 23:10:28 +0200
Received: by iwn38 with SMTP id 38so973179iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Wm1DqPSQXiJCzgy4eFAxU/Nr5zeh86AcnDyqc4Hc7m0=;
	b=Jrpy+uaurjLfWyyk/r1lGiModWOllIWBr41hQL9yYx4mzVDSy+VZTjG55Or5BPJ4PM
	Ty3/au+U1e0SOSuX2WKwBc5LYKjPGNvSS3zLwIRogl/wdPnCBriPCheWZOyaoldR+Xwu
	LbDBtWsfNRP2gyLYQ+fADqHWl1O2nNVh+Br3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WNnitBor/b3NYZfzFcD+MUwAavfhqtobESllQZwsTdyIOo0If82xBo7bmuoqOrivmo
	fnT5PuNlEGiD9n7faVhNtzBn2J4ZY0bKqWb9cRujWuBXbiTc6S/u0owR+MjxiJSSfBJD
	10642lqrJQM+2Bp1B6kqhCGa41KNcl+POeXbY=
MIME-Version: 1.0
Received: by 10.231.191.74 with SMTP id dl10mr9805272ibb.157.1282165775788;
	Wed, 18 Aug 2010 14:09:35 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 14:09:35 -0700 (PDT)
In-Reply-To: <AANLkTinW6EWy5rWVHmQoCc_BsC=2XDdnoXWSgnh73Cvn@mail.gmail.com>
References: <AANLkTinW6EWy5rWVHmQoCc_BsC=2XDdnoXWSgnh73Cvn@mail.gmail.com>
Date: Wed, 18 Aug 2010 23:09:35 +0200
Message-ID: <AANLkTin0-uaqPsLGigEpmHyOPxyDV3SW_6qS0m2nPvfc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: etk is in obsolete but there are recipes which depend on it
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
X-List-Received-Date: Wed, 18 Aug 2010 21:10:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/18 Khem Raj <raj.khem@gmail.com>:
> Hi
>
> This commit below moved etk to obsolete
>
> commit bd75858d8e523dfbed244bf4046b5ce01eeee690
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date: =A0 Fri Mar 19 18:14:59 2010 +0100
>
> =A0 =A0efl: move epsilon/etk to obsolete, because they're not supported
> with newer ecore anymore
>
> =A0 =A0Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
>
> However there are recipes which still depend on this
>
> e17/e17edje-player_svn.bb
> e17/edje-editor_svn.bb
> comic-reader/comic-reader_svn.bb
> e17/exhibit_svn.bb
> efl1/eflpp_svn.bb
> efl1/evolve_svn.bb
> openmoko-projects/om-locations_git.bb
> openmoko-projects/diversity-radar_svn.bb
> openmoko-projects/assassin_svn.bb
>
> should they also find their way into obsolete ? or is there a new
> replacement package they should depend on
>
>
I think there are some more (which came up when I did bitbake -k
world), but didn't get yet into diving into it.

Frans


