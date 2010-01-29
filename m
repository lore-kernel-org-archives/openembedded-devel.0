Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NbK0p-0007qF-MO
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 21:33:50 +0100
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 30 Jan 2010 21:30:19 +0100
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 30 Jan 2010 21:27:08 +0100
Received: from [192.168.1.116] ([95.244.130.46]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 30 Jan 2010 21:27:07 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1264615116-13972-1-git-send-email-ynezz@true.cz>
References: <1264615116-13972-1-git-send-email-ynezz@true.cz>
Date: Fri, 29 Jan 2010 15:44:29 +0100
Message-Id: <1264776269.7864.0.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 30 Jan 2010 20:27:07.0525 (UTC)
	FILETIME=[97D57B50:01CAA1EA]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Sat, 30 Jan 2010 20:33:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-01-27 at 18:58 +0100, Petr =C5=A0tetiar wrote:
> This patch tries to get rid of spew of the useless tar messages durring b=
oot
> process on machines without RTC, such as the Beagleboard. Example:
>=20
> Please wait: booting...
> Starting udev
> tar: dev/.udev/uevent_seqnum: time stamp 1970-01-01 01:00:21 is 14.122497=
521 s in the future
> tar: dev/.udev/rules.d: time stamp 1970-01-01 01:00:07 is 0.119201623 s i=
n the future
> tar: dev/.udev/db/\x2fdevices\x2fvirtual\x2fblock\x2fram9: time stamp 197=
0-01-01 01:00:22 is 15.118713341 s in the future
>=20
> [ more then 100 similar lines cutted off]
Nice,I had the issue with the bug device.
Denis.




