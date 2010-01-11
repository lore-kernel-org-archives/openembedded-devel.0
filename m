Received: from mail-pz0-f185.google.com ([209.85.222.185])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NURyl-0002xL-1R
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 22:39:18 +0100
Received: by pzk15 with SMTP id 15so13539865pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=1+fn4AQakd3fLnenpX1CeYrKPmX43rqWq/n7XZoiVgY=;
	b=rrQC3GHOdCvx9IGOvEEd+VhnWdwClNul5xJ2PiUNL0zVQzThXkHO2zUcAG7drKobgH
	t0jdpB3shJTa8j/sIbRpCktJsb1vY35Qp+glYjxljXVd9o0ddBWLODLE4Y8D8RyfFGJu
	hjn11GquM8cGOZv6jMXVi+vqEted002oLte3g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fYa+938bIihYrUTVTxR6ehGDNcH3sF2aGfd00KcX4zddO+L5OdFjwacXKXf6G/P6Vk
	JeA7DcZHPQJ3EHwgL0yqmFISHKrkAedzigvrz8HC4O9A8Poe546Zs0EromFPwXuDzyl9
	Xn0qAi8s2lAj0yAFdrk/7g5P4ZCvDBswGuyTo=
MIME-Version: 1.0
Received: by 10.142.59.11 with SMTP id h11mr2861016wfa.154.1263245820758; Mon, 
	11 Jan 2010 13:37:00 -0800 (PST)
In-Reply-To: <4B4B3301.2090808@balister.org>
References: <alpine.LFD.2.00.1001110722550.22930@localhost>
	<4B4B2B0E.8030501@balister.org>
	<alpine.LFD.2.00.1001110856460.28813@localhost>
	<4B4B3301.2090808@balister.org>
Date: Tue, 12 Jan 2010 08:07:00 +1030
Message-ID: <6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake and e2fsprogs-1.41.9?
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
X-List-Received-Date: Mon, 11 Jan 2010 21:39:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yes, there is a build issue with e2fsprogs 1.41.5. I experienced it on
a slackware64-13.0 host. It is not a Fedora issue, it is a bug in the
Makefile. If you look in the Makefile you will see that the e2fsck
dependency resolves to something containing "-lpthread".

Why this doesn't cause issues for anyone else is beyond me. I can't
even do a native, out of oe, build of e2fsprogs 1.41.5.

-Graham


