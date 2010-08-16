Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol54b-0000dE-5w
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:10:17 +0200
Received: by gwb15 with SMTP id 15so2116088gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 12:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=PAVABVZAdKm9LQEFJa0/EqGvqkvQiw9NHH7mIpZQD5c=;
	b=fCb1OLCaEly79/0t317z+qwgBxuteyAwLJTTCsDz6IOk4lKrFmBojkN6L5h5v2Kol7
	pJI3VdxFDQs8Dg5m9R3U5BoDrowNCvF9hciqFa278cUocCENlWFPoBGe5L7wXobcJVbL
	bCVw3EICVlobueo63If4PAG5fYKtnGer281Jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=H1cG7xJ5gURDrs+QoSicevQM8TPvUlOsXlDtfJlvNT53LErlkIkYPqgoNxUH6eErCK
	qyyCs3WGfpMzD0nXTpXx2Olf5/K03ThsumQM2Q6MKo2/lA30JkfQCXlk3vCfaqbCtLt0
	/CPF4RbMpf0ppPxHUc+nUzn0OVXBPGikaNUX8=
MIME-Version: 1.0
Received: by 10.231.13.77 with SMTP id b13mr5386014iba.28.1281985799045; Mon,
	16 Aug 2010 12:09:59 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 12:09:58 -0700 (PDT)
In-Reply-To: <20100816140055.GB7983@zlo.nu>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<20100816132317.GA7983@zlo.nu>
	<AANLkTikB5uioXp0BwFg4Gj6GV9MjgMmyOgvjLLOwS8fh@mail.gmail.com>
	<20100816140055.GB7983@zlo.nu>
Date: Mon, 16 Aug 2010 21:09:58 +0200
Message-ID: <AANLkTintRqf6E25QK0ahqVO2dsNvZKrWVaY4VoxrAyJH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 19:10:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/16 Marc Olzheim <zlo@zlo.nu>:

>
> In the case of coreutils, that is 6.0.
> GPLv2 is ok here as well. The problem with GPLv3 here is that as soon as
> we incorporate some GPLv3 package we need to provide the abilitiy for
> customers to rebuild their image (Right to Tinker), which we cannot and
> will not do.

I do understand the implications of v3 too well. My previous employer
also didn't want GPLv3 in their products for IPR reasons.

I've reverted the coreutils removal and re-removed 7.1 and 7.2, so 6.0
is still there.
As you have an interest in this recipe you might be interested to move
to 6.9 (which seems the last GPLv2 version).
Also I would greatly appreciate it if you could see if you can move
the recipe to BBCLASSEXTEND = "native"
And this
do_install() {
        autotools_do_install
}
can also go as it inherits autotools

Frans


