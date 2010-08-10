Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oispj-0005Au-4s
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 19:41:53 +0200
Received: by ewy7 with SMTP id 7so4065337ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 10:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=SW/IrLbO0bRq6p67eRUYdmSbr897N9WoTiLz0Jd3TP8=;
	b=GcmoJHMpVNBl4X8qOomI6V3KSwQ1wVfWbi9qtM/2QDcDTsBpjI1MRNxGVu1zW77B8y
	f9v9qTw/n18eVPa7AI+9iSZ640IvE4EapL6iWq9aRqK3GhNZlY3QnJsIxHiN03mkisO0
	zgtCuijKbLNxyFHwf5nb20LdmvP3deLNUNjKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pj76IkTB8GbVzsj3LGl/TaZtMU3twoiZCzbDsVtJjZWsONYC+t109M2cOFN8OfF4Ui
	KwMmBe+MCOn1Qz70TpP38vRr0jUjRqO1KjgOmVmHg3BKmUCah/LCoIJVCnULzx0P1aOO
	jdEK5fe6cdWyWGcqbuVFVsyRwXDCAXehJzYPE=
Received: by 10.213.28.145 with SMTP id m17mr4581210ebc.66.1281462099448;
	Tue, 10 Aug 2010 10:41:39 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v59sm10117341eeh.10.2010.08.10.10.41.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 10 Aug 2010 10:41:38 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 19:41:27 +0200
Message-Id: <1281462087-4693-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] add maintainers to distro conf files, move or remove orphaned distro's, remove obsolete distro's
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
X-List-Received-Date: Tue, 10 Aug 2010 17:41:53 -0000

Dear all,

For me it is totally unclear about most of the distro's whether they are still used,
and if so, who maintains them (and who to contact when there are issues)

As distro's are first class citizens it seems like a good plan to identify 
in the conf file who is the maintainer
(yes, I know we have the MAINTAINERS file, but I am not too sure whether it is
up to date and not all distro's are listed there).

distros that have no active maintainer should either be pruned or moved to 
an archived or unmaintained directory or so.

For all distro's I tried to identify the maintainer. 
In that process MAINTAINERS was leading.
If there was no entry in MAINTAINERS (bad sign:-( ) I've used git blame
to find out who created the recipe/was the major author of it.

At the end of this post is the list.

Proposal:
(0) maintainers listed below but  not listed in MAINTAINERS, please claim (or deny) ownership.
    Ditto if you are maintaining a distro but you are not listed.
(1) add an explict MAINTAINER(S) line in each distro conf file
(2) owners of a distro that feel that the distro is dead, please remove the distro.
(3) either remove orphaned distro's or move them to an unmaintained directory.
(4) for distros that are removed (and maybe also for the ones that are moved) add a
    note stating that they still can be found in git (see openmoko.conf as example)

Your feedback is appreciated

Frans

PS: it is by no means my intention to remove anything that is still in use/maintained,
but I feel it would help us if it is clear who maintains what. 
Also having dead stuff around that is not maintained is probably due to lead to 
frustration if a naive user comes along and tries to build it anyway. 
Guess that is better avoided (note also that the code still remains available in git)

amsdelta-oe.conf
  Not listed in MAINTAINERS
  created by Jonathan McDowell in 2006

angstrom-2008.1-legacy.conf
angstrom-2008.1.conf
  Denys Dmytriyenko
  Dmitry Eremin-Solenikov
  Junqian Gordon Xu 'xjqian'
  Khem Raj
  Koen Kooi
  Marco Cavallini
  Martin 'JaMa' Jansa
  Philipp Zabel
  Richard Purdie
  Rick Farina
  Stelios Koroneos
  Tim Ellis

asusoe.conf
  Not listed in MAINTAINERS
  created by Rod Whitby in 2005

celinux-test.conf
  Not listed in MAINTAINERS
  created by Marcin Juszkiewicz in 2006

chinook-compat.conf
  Robert Schuster 'thebohemian'

colinuxoe.conf
  Not listed in MAINTAINERS
  created by Chris Larson in 2005

foonas.conf
  Tim Ellis
  ?~Xyvind Repvik

gmustix.conf
  Not listed in MAINTAINERS
  created by Marcin Juszkiewicz in 2006

iphone-compat.conf
  Not listed in MAINTAINERS
  created by eremy Laine in 2009

jlime-2010.1.conf
  Kristoffer Ericson

kaeilos-2010.conf
kaeilos.conf
  Marco Cavallini

maemo5-compat.conf
  Not listed in MAINTAINERS
  created by Marcin Juszkiewicz in 2010

mamona.conf
  Rodrigo 'vivijim' Vivi

micro-uclibc.conf
micro.conf
  Not listed in MAINTAINERS
  created by Martin Lund in 2009

minimal-uclibc.conf
minimal.conf
  Michael 'Mickey' Lauer

nylon.conf
  Not listed in MAINTAINERS
  created by Martin Dietze in 2009

openmn.conf
  Not listed in MAINTAINERS
  created by nslu2-linux.adm@bkbits.net (!) in 2005

openmoko.conf
  retired  per today

openprotium.conf
  Andy Wilcox

openwrt-sdk.conf
  Not listed in MAINTAINERS

oplinux-uclibc.conf
oplinux.conf
  Stelios Koroneos

sharprom-compatible.conf
  Not listed in MAINTAINERS
  probbly also created by nslu2-linux.adm@bkbits.net, but file has been touched by several people

shr.conf
  Martin 'JaMa' Jansa

slugos-native.conf
slugos.conf
  ?~Xyvind Repvik

ucslugc.conf
  Not listed in MAINTAINERS
  created by John Bowler in 2005, content is mostly from Rod Whitby (2006/2007)

wrt54oe.conf
  Not listed in MAINTAINERS
  created by Chris Larson in 2005, content is mostly from Marcin Juszkiewicz (2005)

Distro's mentioned in MAINTAINERS but with no entry in conf/distro:
  arago (Denys Dmytriyenko)
  eRouter (Jamie Lenehan)
  familiar (Erik Hovland)
  Sonkei (Rolf 'Laibsch' Leggewie, Matthias 'CoreDump' Hentges)
  poky (Richard Purdie)
  openzaurus (Richard Purdie)
I know some of these have their own git.



