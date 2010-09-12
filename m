Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oulkc-0007NI-Sa
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:33:43 +0200
Received: by iwn2 with SMTP id 2so4122860iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=p/XTGr6M998nMZwN5iLkMqNVS47cmBCNtG70iC8qOAM=;
	b=hUEdINoZwzddbyNbghV82YB8e/cYh6qWeMl8heCKw/llE3LZ7HPCltpYTjeuCNL99e
	Jd4mzmX9CATvIEoydy5LoPCIpBYvrjX+9ypVwe7//D8pJGBV/aVQEEFOvn4xtXB6XQ3x
	4ePWVfzttH8ACZSb3uweYll4/c3y91g8mnk5E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pn8SdQLWh7uc33ar1LosmZfsfRWgjKyD1636qNWIr0ABW/DQ12ok2amQCUEhVV4XPN
	z2A5czXolSlelx30AuTRU98cbY6syUhA7PyYIS1aU2PgrGtC59LVsYvfmOok6XQouhxF
	J5dQJxipMB5pQzIHRbXtUgV6lzZJ8wwWstwLI=
MIME-Version: 1.0
Received: by 10.231.155.7 with SMTP id q7mr4332123ibw.105.1284294778078; Sun,
	12 Sep 2010 05:32:58 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 05:32:58 -0700 (PDT)
In-Reply-To: <4C8CA2DC.40707@freyther.de>
References: <4C8CA2DC.40707@freyther.de>
Date: Sun, 12 Sep 2010 14:32:58 +0200
Message-ID: <AANLkTi=EALsQWTorEsz19dyJFX-AnStXdaHYJUy4iZXn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] insane.bbclass: Enable the insane.bbclass for everyone in a warning mode
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
X-List-Received-Date: Sun, 12 Sep 2010 12:33:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/12 Holger Freyther <holger+oe@freyther.de>:
>
> Make conf/bitbake.conf load conf/insane.conf that will INHERIT the
> insane.bbclass. Remove the INHERIT from the distros currently using
> insane.bbclass. Change insane.bbclass to check QA_FATAL to see if errors
> are allowed to be fatal, make SHR/Kaelios and Angstrom use that new
> flag to continue having fatal QA Errors.
>
> Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>

I am not really in favour of this.

One of the disadvantages of insane.bbclass is that it has:
PACKAGE_DEPENDS += "pax-utils-native desktop-file-utils-native"
This drags in several packages (e.g. sqlite3-native glib-2.0-native)
only to check if the .desktop file is valid.

By making this mandatory quite some additional build time is needed
(on a clean build), which is kind-of a nuisance and does not bring
anything if you are working on a display-less system (e.g. a NAS).

I''d be more in favour to split off the .desktop test and use that
only for those packages that generate .desktop files. (and make the
rest of insane.bbclass mandatory).
Alternately perhaps it is possible to create a var or so by which
people in their local or distro .conf can turn insane.bbclass (or the
.desktop part) off.

Frans


