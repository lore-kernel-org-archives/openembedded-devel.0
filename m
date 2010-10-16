Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P71kD-0006Ft-9Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 10:03:58 +0200
Received: by iwn2 with SMTP id 2so1787633iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=wXDlRItbbHTniaHihh1ryFzPP9Lj/zt983dvO4ykzRo=;
	b=NapmbJdc3QF6wMPa6ChcOktK6mwbQDSUPFJ1su5yDEwd9Yk9RuRzpWknwICskKW3VD
	bScyk4vgPImGgSouGDlHQh+RDYp86V/lbFIET3Fj2eXF6VpdLjuQISsToQBzlhRtCDen
	iNjzwKkMGuyRhO95tZnOKwyJy7nhpW6YNKQT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=pGNnNJzoMFgsYpiW/V0FRATyOSvW0pcFWCog2smvVsmDmPUb0ttm+DqqkezWtaefhL
	52VUr0N83ELGyG7VspimzVBWWSd2N2zxgdpsA4aoGodqTfFBs2GgJVabxKXI7UxZuZWO
	SnvJsxEalC1ozN1fsIkEU+T7bV+vQXHhA7aVY=
MIME-Version: 1.0
Received: by 10.42.211.131 with SMTP id go3mr1160300icb.393.1287215733234;
	Sat, 16 Oct 2010 00:55:33 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 16 Oct 2010 00:55:33 -0700 (PDT)
Date: Sat, 16 Oct 2010 09:55:33 +0200
Message-ID: <AANLkTin7HZsmGcRS95BCBCGrZYB8Ut1qB9TuSC6K0uk_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: added task nr to NOTE and error messages
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
X-List-Received-Date: Sat, 16 Oct 2010 08:04:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

When doing a build with some parallellism in it, it is not always
directly obvious what task generated a certain message.

An example from a recent log:

NOTE: Running task 742 of 995 (ID: 170,
/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/gcc/gcc-cross_4.4.4.bb,
do_compile)
NOTE: package gcc-cross-4.4.4-r6.0: task do_compile: Started
NOTE: the following files were installed but not shipped in any package:
NOTE:   /etc/localtime
NOTE:   /etc/ld.so.conf
NOTE: Multiple libraries (libnss_hesiod.so.2, libnss_nisplus.so.2,
libnss_nis.so.2) found, but LEAD_SONAME 'libc.so' doesn't match any of
them
NOTE: Couldn't find shared library provider for libgcc_s.so.1


Obivously the notes are not from the gcc-cross do_compile just above it.

Suggestion is to add the task number to the NOTE.

e.g.
NOTE (task 730):

or, if more compactness is desired:
NOTE (730)
or even
NOTE_730

Guess the same would apply to error messages etc.

I guess this is not too difficult, but my knowledge of the system and
python is not good enough to come up with a patch.

Frans

PS: it might also be nice to have a mechanism to throttle the notes
(or supporess some or all of them).
When doing a build of the testing branch I am not really interested in
task started/succeeded messages, not creating empty archive, packaged
contents of ... etc etc)
It would be nice if there was a way to (selectively?) suppress these.
(btw:  i know some of these are from oe, and others are from bb)


