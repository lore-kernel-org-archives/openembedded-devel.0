Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IHQ2a-000864-Gq
	for openembedded-devel@openembedded.org; Sat, 04 Aug 2007 22:16:00 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l74KDg1R027857; Sat, 4 Aug 2007 22:13:42 +0200
Message-ID: <46B4DDEC.6070304@dominion.kabel.utwente.nl>
Date: Sat, 04 Aug 2007 22:13:32 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <9e4733910708041243oa0cf091x60a8f9f279ad2ba7@mail.gmail.com>
	<46B4DC9D.6030700@dominion.kabel.utwente.nl>
In-Reply-To: <46B4DC9D.6030700@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: gpe-list@linuxtogo.org
Subject: Re: [Gpe-list] check sum	failure	http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2'
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
X-List-Received-Date: Sat, 04 Aug 2007 20:16:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Jon Smirl schreef:
>> NOTE: package minimix-0.8: started
>> NOTE: package minimix-0.8-r0: task do_fetch: started
>> NOTE: fetch http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2
>> --15:41:15--  http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2
>>            => `/extra/oe/sources/minimix-0.8.tar.bz2'
>> Resolving gpe.linuxtogo.org... 85.214.40.226
>> Connecting to gpe.linuxtogo.org|85.214.40.226|:80... connected.
>> HTTP request sent, awaiting response... 200 OK
>> Length: 68,451 (67K) [application/x-bzip2]
> 
>> 100%[===================================================================================>]
>> 68,451       128.62K/s
> 
>> 15:41:16 (128.51 KB/s) - `/extra/oe/sources/minimix-0.8.tar.bz2' saved
>> [68451/68451]
> 
>> NOTE: The MD5Sums did not match. Wanted:
>> '0cfb89bf2596710543935e31ad1d5a17' and Got:
>> '24ec8a3fb25fd0e497a0c64270b47d00'
>> NOTE: Task failed: Checksum of
>> 'http://gpe.linuxtogo.org/download/source/minimix-0.8.tar.bz2' failed
>> NOTE: package minimix-0.8-r0: task do_fetch: failed
>> ERROR: TaskFailed event exception, aborting
>> NOTE: package minimix-0.8: failed
>> ERROR: Build of
>> /extra/oe/org.openembedded.dev/packages/minimix/minimix_0.8.bb
>> do_fetch failed
>> ERROR: Task 272
>> (/extra/oe/org.openembedded.dev/packages/minimix/minimix_0.8.bb,
>> do_fetch) failed
>> NOTE: Tasks Summary: Attempted 2473 tasks of which 2473 didn't need to
>> be rerun and 1 failed.
>> ERROR: '/extra/oe/org.openembedded.dev/packages/minimix/minimix_0.8.bb' failed
> 
> It seems the source got replaced/corrupted/compromised, could a gpe person look into it? I
> have a tarball available with:
> 
> 0cfb89bf2596710543935e31ad1d5a17  OE/downloads/minimix-0.8.tar.bz2
> 
> As the checksummer expects.

The diff:

http://ewi546.ewi.utwente.nl/tmp/mm.diff

koen@bitbake:/data/build/koen/OE/build/tmp/angstrom/work$ diff -Nurd minimix-0.8.original/
minimix-0.8.compromised/ | diffstat
 ChangeLog    |   10
 Makefile.am  |    4
 Makefile.in  |   20
 aclocal.m4   |  196 ++-
 configure    | 3762 ++++++++++++++++++++++++++++++++++-------------------------
 configure.ac |   14
 depcomp      |   60
 gpe-dist.am  |    2
 install-sh   |   17
 minimix.c    |   32
 missing      |   23
 11 files changed, 2458 insertions(+), 1682 deletions(-)

Something is very wrong indeed....


regards,

Koen




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGtN3sMkyGM64RGpERAsDpAJ4sTC6vECJPAz9LseK5mAHCJZBmagCgg6tA
COEnm0ENROxyiqNyZyak1AQ=
=OOlU
-----END PGP SIGNATURE-----


