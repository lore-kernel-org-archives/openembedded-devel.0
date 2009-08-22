Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MeldO-0005N2-Ao
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 10:07:34 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD006563F0 for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 09:50:03 +0200
Message-ID: <4A8FA32A.4010400@atmel.com>
Date: Sat, 22 Aug 2009 09:50:02 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A83BD15.7070006@atmel.com>
	<h61vvo$n4v$1@ger.gmane.org>	<4A8515F3.3070502@atmel.com>
	<200908202141.07520.marcin@juszkiewicz.com.pl>
In-Reply-To: <200908202141.07520.marcin@juszkiewicz.com.pl>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Sat, 22 Aug 2009 08:07:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

Marcin Juszkiewicz skrev:
> Dnia pi=C4=85tek, 14 sierpnia 2009 o 09:44:51 Ulf Samuelsson napisa=C5=82=
(a):
>> The reason for doing a script is to allow building multiple stuff
>> when I am sleeping or travelling, and as long as things complete
>> I do not mind the 10 minute pauses.
>>
>> When I am working interactively, I do not want to specify MACHINE
>> everytime I do something
>>
>> Maybe this is something that would work...
>> alias bitbake=3D"MACHINE=3D${BB_MACHINE} /path/to/bitbake"
>=20
> I do that in this style:
>=20
> for mach in LIST-OF-BOARDS;do MACHINE=3D$mach bitbake something;done
>=20
> This works fine in Bash and allow to do anything from remote etc.
>=20
> My last use was:
>=20
> for mach in `ls openembedded/conf/machine/at91*`;do export MACHINE=3D`b=
asename=20
> $mach .conf`; bitbake -cclean base-files sysvinit task-base task-boot; =
bitbake=20
> console-image;done
>=20
> To make it work you should have to use MACHINE ?=3D "machinename" in co=
nf/*.conf=20
> files or just not set MACHINE there at all.
>=20
OK, nice to know.

It takes less than 2 minutes to rebuild the cache on my machine
so it is less of an issue for me.

My buildscript will generate logs which is nice to have,
but I could do this with this method as well,

Also, my main goal is not to get a machine running for any
specific purpose.
I want to make sure that a certain machine will complete its
build properly, and if I do what people propose, won't I
sometimes miss a problem, because I previously built a machine
which worked OK, and then I use the result of that build instead
of the result for this specific machine.

Example:
If you build a recipe which has
SRC_URI_append_at91sam9263ek for the sam9263ek
and then bitbake MACHINE=3Dat91sam9g45ek,
will that force a rebuild of the recipe?

If you then build at91sam9263ek again,then
does it do this again.
If not, then I have to do it my way.

> Regards,=20


--=20
Best Regards
Ulf Samuelsson



