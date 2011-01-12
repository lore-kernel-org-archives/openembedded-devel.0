Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PcvMu-00065z-Hy
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:43:44 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 46B0D49127F;
	Wed, 12 Jan 2011 08:43:15 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 12 Jan 2011 08:43:15 +0100
Message-ID: <4D2D5B93.50409@dresearch.de>
Date: Wed, 12 Jan 2011 08:43:15 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
X-OriginalArrivalTime: 12 Jan 2011 07:43:15.0468 (UTC)
	FILETIME=[5F23D4C0:01CBB22C]
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] busybox: move syslog config to /etc/default
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
X-List-Received-Date: Wed, 12 Jan 2011 07:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 12.01.2011 02:43, schrieb Chris Larson:
> From: Chris Larson <chris_larson@mentor.com>
>=20
> The busybox syslog syslog.conf is parsed by the /etc/init.d script, not=
 by the
> syslog process itself, so it belongs in /etc/default.  In addition, the=
 file
> format is *completely* different from the standard sysklogd configurati=
on, so
> while we should resolve the file conflict between busybox-syslog and sy=
sklogd,
> we should not use update-alternatives for it, so this is a cleaner solu=
tion.

Moving the file into /etc/default seems to be OK for me.

But i would suggest to rename the config file itself to busybox-syslog, b=
ecause it does not contain (default) configuration for any syslog incarna=
tion but only for busybox-syslog.

Steffen

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



