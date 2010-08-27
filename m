Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op8Pb-0008RF-8Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 01:33:05 +0200
Received: by iwn2 with SMTP id 2so2950707iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 16:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=alKkoh06+U7nZpgIr8pINo3DvJnSKjr904gF5g7KJfc=;
	b=Bbasx8LLupuo+9DOA5cmiY6J/olAALGHLDd/xXhNfIQlNGYVcRnmcGG+jOzM8wZnte
	vOFRVrkKyrX00E0nbai7SoohruBkSym/Qzop0SfRGonKa9Mzkus/CpAMvJH/wKcO+v7H
	s2rLBA9joGbTgOdamX4Z/1uJALvnxZ/5WuRG4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=LXbgh5twI/Vc7vPcG46KvLW5BYAGVyc1IytIpn5k8EK8RxX64CN4AKcgqqzkr1lJbX
	QKLQCQj99FGubuf39CE6jwM6uIFq8iyLXHQyTlYXX/E1/DxOGv1oqQOUK4PXJkxa7QPJ
	FNviA1HUI8NKcvAqdRX4paKzN1N3+btRAQ7tk=
Received: by 10.231.15.73 with SMTP id j9mr1907435iba.23.1282951935282; Fri,
	27 Aug 2010 16:32:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 27 Aug 2010 16:31:55 -0700 (PDT)
In-Reply-To: <dd79678279f18baf8ab00a450671a8dc.squirrel@webmail.no-log.org>
References: <dd79678279f18baf8ab00a450671a8dc.squirrel@webmail.no-log.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 16:31:55 -0700
Message-ID: <AANLkTi=+TA+fDPpcsE+erXjv6npnSV9thU=JYWpTPUeD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk-immodule
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
X-List-Received-Date: Fri, 27 Aug 2010 23:33:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 27, 2010 at 3:33 PM, Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org> wrote:
> hi,
> I'd like to add something like GTK_IM_MODULE=xim in /etc/profile.d for the
> htcdream, or maybe, any machine that has an hardware keyboard
>
> how should that be added?
>
> gtk-immodule-xim is part of the gtk+ recipes.
>
> should I add a do_immodule() that check if there is keyboard
> MACHINE_FEATURES, and if there is do an echo of GTK_IM_MODULE=xim to a
> file which will be shiped to /etc/profile.d/immodule-gtk.sh ?
> And add that to the gtk-immodule package?

yes deducing it from MACHINE_FEATURES is a good approach imo.

>
> without GTK_IM_MODULE=xim I've keyboard mapping issues under the htcdream:
> xmodmap dream.xmodmap has no effect under gtk applications but work well
> with illume or xlib applications
>
> Denis.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


