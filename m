Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PLD5l-00069M-Dx
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 12:00:50 +0100
Received: by wwb31 with SMTP id 31so168848wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 02:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=QiqJekp3wIj/zAAKcEEOPAWys21W8rIQvIXFOMW9ptU=;
	b=V10W+W7+xgh9CHtId96ks4zhLEchi4dWm5b0NewbsWrmqaDeV4YKaVUkbwUxt4N2XA
	y2G0rUdMKY4MeZswLCaylua0KxMI1x5mtqMpgOXuWmoKpsWJj2efapC+3S/6XQDITDeS
	4EhTKFzDrmPytqbpVaE17oo2MjTy7TQqbavSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rA2011ivozVFYajZeIkKpLXVY1qiDUONMkuhDyOSYq9JRiruAf46WqmqH8cmO3O0lJ
	CcKr+W51/WMMdiXAovAa4PvpD0Yv8XwFIcVyk2Jg57G5NszhEbskw8wUzo8Ky2GLL2sr
	5LdLW4u4OczpuKzNJsyWAhCAc68BwfcZwGqoQ=
MIME-Version: 1.0
Received: by 10.216.52.11 with SMTP id d11mr710081wec.0.1290596371874; Wed, 24
	Nov 2010 02:59:31 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Wed, 24 Nov 2010 02:59:31 -0800 (PST)
In-Reply-To: <4CEB1349.6080602@mentor.com>
References: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
	<AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
	<4CEB1349.6080602@mentor.com>
Date: Wed, 24 Nov 2010 11:59:31 +0100
Message-ID: <AANLkTikRdtg1U3gd6z3i0_UkifMgoRnSgSj9OW2dSL37@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Wed, 24 Nov 2010 11:00:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

It looks like Poky's handles the issue differently:

http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/autoconf/autoconf_2.65.bb
vs.
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/autoconf/autoconf_2.65.bb


and similarly

http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/automake/automake_1.11.1.bb
vs.
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/automake/automake.inc

Any opinion from autofoo experts?
TIA

Andrea


