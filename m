Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NaCGI-0004yT-2v
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 19:05:09 +0100
Received: by pwi4 with SMTP id 4so3897239pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 10:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=aHk2jEgaP0AEthHeelNSmCTVmD+Nt+waTrlw17rkFfY=;
	b=OwjZYSei4wpbsnAkeQk+HpQq4/yvB00/BewwtvZun+fj7wCxUqocHAPLtv5O5U9uxj
	V2TY4wdPKsIAcTJ64gHPP/PvOS6UC+D8s92FLC4zlvzy9A5nNJM5ykzgdyRxFpku69+6
	WVeP1616oZB2z0XM80AC/I0qfvpUmwPBE2byY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ZxRlIPh78t2sYxl8EIizxOyuo3HBqEj1lN+laQKYJa9Vki0aST0+bQ1phcOY5KGNsl
	q6r7gl9teFwrNluLdNsoGKE+g13ZGjwdVvpZ8k1z7rxfgVJBwl4Axpile0V0tqWLaRaJ
	+Bdg3mD4RswuL0Nkd8/TwDHPN+A4wIEdJPBAk=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.59.9 with SMTP id h9mr4984035wfa.91.1264615363090; Wed, 27 
	Jan 2010 10:02:43 -0800 (PST)
In-Reply-To: <1264615116-13972-1-git-send-email-ynezz@true.cz>
References: <1264615116-13972-1-git-send-email-ynezz@true.cz>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Jan 2010 11:02:23 -0700
X-Google-Sender-Auth: 448b82ed12b00c6a
Message-ID: <b6ebd0a51001271002i7f6b608la2503c4884673387@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC][PATCH] udev: get rid of 'timestamp in the future' tar messages
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
X-List-Received-Date: Wed, 27 Jan 2010 18:05:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2010 at 10:58 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:

> This patch tries to get rid of spew of the useless tar messages durring
> boot
> process on machines without RTC, such as the Beagleboard. Example:
>
> Please wait: booting...
> Starting udev
> tar: dev/.udev/uevent_seqnum: time stamp 1970-01-01 01:00:21 is
> 14.122497521 s in the future
> tar: dev/.udev/rules.d: time stamp 1970-01-01 01:00:07 is 0.119201623 s i=
n
> the future
> tar: dev/.udev/db/\x2fdevices\x2fvirtual\x2fblock\x2fram9: time stamp
> 1970-01-01 01:00:22 is 15.118713341 s in the future
>
> [ more then 100 similar lines cutted off]
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
>

Looks good to me, we have a similar patch in MVL6.

Acked-by: Chris Larson <clarson@mvista.com>
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

