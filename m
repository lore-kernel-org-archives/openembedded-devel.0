Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IiqxY-00061m-TZ
	for openembedded-devel@openembedded.org; Fri, 19 Oct 2007 14:28:13 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9JCLLUo016782 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2007 14:21:21 +0200
Message-ID: <4718A147.4000306@student.utwente.nl>
Date: Fri, 19 Oct 2007 14:21:27 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1Iinn8-0004il-BP@linuxtogo.org>
	<74d0deb30710190309s4c794a0gbb960a983ce41c9e@mail.gmail.com>
In-Reply-To: <74d0deb30710190309s4c794a0gbb960a983ce41c9e@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev	conf/distro/include/angstrom-2007-preferred-versions.inc: add	file for locking down almost every package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2007 12:28:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> On 10/19/07, koen commit <openembedded-commits@lists.openembedded.org> wrote:
>> conf/distro/include/angstrom-2007-preferred-versions.inc: add file for locking down almost every package
>>
>> ** THIS WILL BE INCLUDED SOON -- REVIEW IT!!! **
> [...]
>> +PREFERRED_VERSION_bochs ?="2.1"
>> +PREFERRED_VERSION_bogofilter ?="0.96.0"
>> +PREFERRED_VERSION_bonnie ?=""
> 
> bonnie++ ?
> 
> [...]
>> +PREFERRED_VERSION_dbus ?="1.0.2"
>> +PREFERRED_VERSION_dbus-c ?=""
>> +PREFERRED_VERSION_dbus-c ?=""
> 
> dbus-c++ ?

yeah, it breaks on any PV with a '+' in it :(

Incidentally, it also uncovers a bitbake bug:

Traceback (most recent call last):
  File "/data/build/oe/bitbake/bin/bitbake", line 134, in <module>
    main()
  File "/data/build/oe/bitbake/bin/bitbake", line 131, in main
    cooker.cook()
  File "/data/build/oe/bitbake/lib/bb/cooker.py", line 565, in cook
    return self.buildTargets(pkgs_to_build)
  File "/data/build/oe/bitbake/lib/bb/cooker.py", line 470, in buildTargets
    taskdata.add_unresolved(localdata, self.status)
  File "/data/build/oe/bitbake/lib/bb/taskdata.py", line 509, in
add_unresolved
    self.add_provider_internal(cfgData, dataCache, target)
  File "/data/build/oe/bitbake/lib/bb/taskdata.py", line 360, in
add_provider_internal
    eligible, foundUnique = bb.providers.filterProviders(all_p, item,
cfgData, dataCache)
  File "/data/build/oe/bitbake/lib/bb/providers.py", line 254, in
filterProviders
    eligible = _filterProviders(providers, item, cfgData, dataCache)
  File "/data/build/oe/bitbake/lib/bb/providers.py", line 231, in
_filterProviders
    newver = "%s-%s" % (newvers[1], newvers[2])
IndexError: string index out of range


for thing like wirelesstool ('28') and jpeg '6b', it seems to access teh
nevers[] array out of bounds.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHGKFHMkyGM64RGpERAk0hAKC3MfD/V0ZRBdHwocdY+fKteQzkuACgux/w
09gGusFRO78mVxdWGFtvc3s=
=q2Dj
-----END PGP SIGNATURE-----


