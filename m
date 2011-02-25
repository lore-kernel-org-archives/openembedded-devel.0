Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PstP6-000746-AP
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 09:52:00 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 14263491283;
	Fri, 25 Feb 2011 09:50:41 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 25 Feb 2011 09:50:41 +0100
Message-ID: <4D676D60.1040909@dresearch.de>
Date: Fri, 25 Feb 2011 09:50:40 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D53C412.9090804@dresearch.de>	<1297339435.2178.23.camel@phil-desktop>
	<4D53F6FE.80604@windriver.com>
In-Reply-To: <4D53F6FE.80604@windriver.com>
X-OriginalArrivalTime: 25 Feb 2011 08:50:41.0281 (UTC)
	FILETIME=[14CEE710:01CBD4C9]
Subject: Re: base-files vs. FHS-2.3
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
X-List-Received-Date: Fri, 25 Feb 2011 08:52:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 10.02.2011 15:32, schrieb Mark Hatle:
> On 2/10/11 6:03 AM, Phil Blundell wrote:
>> On Thu, 2011-02-10 at 11:55 +0100, Steffen Sledz wrote:
>>> While dealing with the /var subdirs i hit some differences between Fi=
lesystem Hierarchy Standard (current FHS-2.3) and the base-files package.
>>>
>>> One point is that /var/tmp is symlinked to volatile/tmp but according=
 to the standard this dir contains "Temporary files *preserved between sy=
stem reboots* ".
>>>
>>> Also /var/cache is symlinked to volatile/cache but the standard descr=
ibes "The data must remain valid between invocations of the application *=
and rebooting the system.* " what i would read in the way that /var/cache=
 should be persistent too.
>>>
>>> May be there are other differences.
>>>
>>> In my opinion the symlinking in base-files is buggy and should be fix=
ed. Or am i wrong here?
>>
>> It probably would be good to have a version of base-files which was
>> fully FHS conformant.  But there are a significant number of OE target
>> systems where it is simply impossible to comply with these requirement=
s
>> since there is no persistent read/write storage available: the only
>> choice is between flash (persistent but read-only) and ramdisk
>> (read-write but volatile). =20
>>
>> Clearly, placing /var/tmp or /var/cache in a readonly location is
>> unlikely to produce any useful results so linking them into volatile/ =
is
>> the least bad option in that situation.  Any change to base-files woul=
d
>> need to be done with some level of care in order to not break those
>> kinds of setups which do work today.  I guess it should be a DISTRO
>> decision whether or not to adhere to the FHS in this area.
>=20
> I echo this.  In my experiences the default filesystem should be FHS co=
mpliant,
> but there must be a variant that works for specific embedded projects t=
hat
> simply do not have writable storage.
>=20
> The ramifications of this are that /var/tmp, /var/cache are both transi=
ent over
> reboots.  Almost all applications will deal with this gracefully, so it=
's not
> really an issue.  It is something to be aware of though when doing soft=
ware
> integration and validation that the problems must be able to create tmp=
 and
> cache files over again if the data is not already on the system.
>=20
> The important things when following the FHS really are R/O vs R/W suppo=
rt, as
> well a boot vs run-time.  (i.e. things required on '/' vs things that s=
hould
> live in '/usr'...)

Ping!

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



