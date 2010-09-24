Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzEv8-0007F8-BA
	for openembedded-devel@openembedded.org; Fri, 24 Sep 2010 22:31:03 +0200
Received: by iwn2 with SMTP id 2so856341iwn.6
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Sep 2010 13:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=dk49BXLSeyqR4ziaL9Kp6Ae8JgTqkaltTSfRKmZzC2g=;
	b=mjamX/iF9JI5f2WsExHJETjLqqB+bx4q1DBw/gnWX1n2MkbznXStyYjdO3vnL4Ou+n
	YE5mhCcNCHroxYhrLxtV/AqzxlyTUmIAwoCEu7rONeaG4IihBn4mdqEd8YuMMV01euLC
	PshpBsAOWQyzRxMu1GQOb+JIRux/yU8JYt0G8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=X3X9VLbuqDhCrAUk8egxZoqgb8E86dgTXVBnNDNnP4Kz1PKhJ7pjVqe30wrbKhRl+T
	Akq6K6lgBnXaYZnkwgCf1g7G4rbSAYQYW/xM7PODTTcyYFgyoT3pzeo3aI8O5nrfMC/I
	MXrUsOHKpACc0+cgHtYbvxwK381h0B7y8c7tk=
MIME-Version: 1.0
Received: by 10.231.154.75 with SMTP id n11mr4454802ibw.40.1285360254622; Fri,
	24 Sep 2010 13:30:54 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 24 Sep 2010 13:30:54 -0700 (PDT)
Date: Fri, 24 Sep 2010 22:30:54 +0200
Message-ID: <AANLkTik4OGdeazaQbURbzDS4FSDDLPrrCT43YEQ8YJn2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: navit svn fetchg issue
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
X-List-Received-Date: Fri, 24 Sep 2010 20:31:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

bumped into this fetch issue with navit

first did a bitbake -c patch -b navit-icons_svn.bb
then did a bitbaek -c patch -b navit_svn.bb

That one failed with:

NOTE: Running task 2 of 2 (ID: 0,
/home/frans/oe/openembedded/recipes/navit/navit_svn.bb, do_fetch)
NOTE: package navit-1_0.1.99+svnr3535-r8.10: task do_fetch: Started
NOTE: Update svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=https
svn: Failed to add directory 'navit': an unversioned directory of the
same name already exists
ERROR: Task 0 (/home/frans/oe/openembedded/recipes/navit/navit_svn.bb,
do_fetch) failed with exit code '1'
WARNING: /home/frans/oe/bitbake/lib/bb/build.py:49:
DeprecationWarning: BaseException.message has been deprecated as of
Python 2.6
  self.message = name

NOTE: oestats: error sending task, disabling stats
NOTE: package navit-1_0.1.99+svnr3535-r8.10: task None: Failed
WARNING: /home/frans/oe/bitbake/lib/bb/build.py:59:
DeprecationWarning: BaseException.message has been deprecated as of
Python 2.6
  msg = self.message

ERROR: Unknown fetch Error: [Errno 2] No such file or directory:
'/home/frans/oe/downloads/navit_navit.svn.sourceforge.net_.svnroot.navit.trunk_3535_.tar.gz'

Guess there is an issue fetching navit after having fetched navit-icons.

Frans


