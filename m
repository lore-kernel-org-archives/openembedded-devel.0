Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1PFg5q-0001Nv-Mg
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 05:46:05 +0100
Received: by wwb39 with SMTP id 39so832165wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 20:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=r63zphnKyefFV998QqEHFT3+JbjeW4wAkQsSfmIBw2c=;
	b=RXi9ZZ138j7Bjmh3GTVfvVKY8VoEU+BLUEul1JAlOMXx9Yz7RN2qyZAjePGUm35rUY
	MLwWmoq+YOmPm0ROMmBZH+1cK5MV7fnqvLAEFPPVyFc8Or5ltMX05z1nV9QcmVLvvVbY
	41vlK0Ano7I71rRTn2XGKljvzRBmmYI55oeHM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=iMiqZvwZ7D9WLKDYsCzSevYMId3hOWFAOKN0Y+HCsgR34ohAvEm9S9nakxhDgTekFk
	vl0r43cCUjYAGqJxQFUGRwGz8NqeW4AIlNdFIhADFzCuigUSv67iARePdEwOadzL5pa7
	/jgYVZmQw+BrJKSC4T8BP3Ap012NIGeRxAWnw=
MIME-Version: 1.0
Received: by 10.216.50.134 with SMTP id z6mr8396591web.15.1289277555597; Mon,
	08 Nov 2010 20:39:15 -0800 (PST)
Received: by 10.216.22.139 with HTTP; Mon, 8 Nov 2010 20:39:15 -0800 (PST)
In-Reply-To: <30166055.post@talk.nabble.com>
References: <30166055.post@talk.nabble.com>
Date: Mon, 8 Nov 2010 20:39:15 -0800
Message-ID: <AANLkTi=5W1Sat-egZmbeQv6B+PX+Vatabq=2+YZw_wGx@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: [SOLVED]Network init script error??
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
X-List-Received-Date: Tue, 09 Nov 2010 04:46:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Looping in the OE developers list on the issue described below.

It does indeed seem that the ifupdown package init is referencing
/etc/network/ifstate (which doesn't exist) instead of
/etc/network/run/ifstate.

Mike's point about having the /etc/network/run directory linked to
/var/run also seems like a good idea (so that ifstate would not
persist after an unclean shutdown).

Thoughts?

Steve


---------- Forwarded message ----------
From: roystonvasey <mikestocks@madasafish.com>
Date: Mon, Nov 8, 2010 at 7:14 PM
Subject: [Gumstix-users]  [SOLVED]Network init script error??
To: gumstix-users@lists.sourceforge.net



Dear List,
I as many others are having problems getting the networking to start
reliably on headless systems, wlan0 in particular.
If the network is restarted '/etc/init.d/networking restart' wireless and m=
y
CAN networks come up OK, on system halt and reboot they also come up OK.
If power is interrupted the networks are not starting after a reboot and
require a manual restart.

After some investigations I noticed that there is an initialisation script
'/etc/rcS.d/S39ifup' that is run just before the network is started with
'/etc/rcS.d/S40networking'. The script looks like it clears up any hanging
ifstate files.
#!/bin/sh -e

case "$1" in
=A0 =A0 =A0 =A0start|restart)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ -e /etc/network/ifstate ]; then
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo -n "Cleaning: /etc/netw=
ork/ifstate"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo -n >/etc/network/ifstat=
e
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "."
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;;
=A0 =A0 =A0 =A0stop|reload|force-reload)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;;
esac

However the actual ifstate file is created in '/etc/network/run/ifstate'.
Adjusting the script allows the network to come up properly even after a
power outage.
I suspect that ifup checks ifstate to see if the interface is already up an=
d
doesn't do anything if there is an entry in the ifstate file and ifdown
takes out etries as it brings down the interface. Hence a clean shut down
will clear entries and allow the the networks to start normally on start up=
.
The other observation is that the '/etc/network/run' directory should
probably be linked to the '/var/run' directory.

Can anyone verify that my findings are correct an see about amending the
init scripts?

Cheers Mike.
--
View this message in context:
http://old.nabble.com/-SOLVED-Network-init-script-error---tp30166055p301660=
55.html
Sent from the Gumstix mailing list archive at Nabble.com.


