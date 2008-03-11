Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ81C-0002tY-K1
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 18:12:15 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JZ7zG-0002Hf-C4
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 17:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 17:10:02 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 17:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 18:08:46 +0100
Message-ID: <fr6eau$tf7$2@ger.gmane.org>
References: <a7f8874a0803101037p1e156eedx32eddf87c45fb890@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <a7f8874a0803101037p1e156eedx32eddf87c45fb890@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC]: Is MACHINE_TASK_PROVIDER still being used or should it be phased out?
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
X-List-Received-Date: Tue, 11 Mar 2008 17:12:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Henry von Tresckow schreef:
| (sorry for the repost, but I forgot the RFC tag the first time)
|
| I am trying to fix http://bugs.openembedded.net/show_bug.cgi?id=3969.
|
| I basicaly have two options here:
|
| 1) simply replace MACHINE_TASK_PROVIDER with task-base-extended in the
| affected recipie
|
| 2) come up with a different solution that preserves MACHINE_TASK_PROVIDER
| and adds a suitable definition
|
| It seems that a lot of recent image recipies have used approach #1 and
I was
| wondering if MACHINE_TASK_PROVIDER  was still actively being used or if it
| is mostly left over from the initial task-base switchover.

A while ago I decided for myself it's up to the person creating the
image recipe what to use. Recipes are cheap, so you could just create an
opie-vontres-image.bb and have it added to the autobuilder.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1ryeMkyGM64RGpERAtGXAKC2eD+cSjU+kxPwGKbTo9D7fnPHWwCgiqdg
4V+FO4Y7ohOEz8v2/TrBuq0=
=gNVi
-----END PGP SIGNATURE-----



