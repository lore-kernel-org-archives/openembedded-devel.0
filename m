Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oi8C7-00073q-JZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Aug 2010 17:53:53 +0200
Received: by iwn38 with SMTP id 38so2904141iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=bSYDF04zYkIugPukX7tO/jteAGaCaTxp7lReYFkHWI4=;
	b=l0V/w/4AjGevDhjSMzUzvUoRHVD+PAuypQJQmYJ+HB9GV+GivYIo18PFYO0V/zZgJR
	G3sMMQkWAzDUKL3g9jglGJhtLGPGKDL7n4NlaoDJfW5ks+3y7MPR29vOZqAbg88hylTy
	SG46ZXjhBBl1sBTRUfwXWrSj+cpEpLxc/LvMM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=l7KE1h6TDy41ZvZclzc4pk+N4xpmhYElQsgNfqmZEJgWKhWm3U9uPVmUBempT1iB6Y
	KCbQhym0F3EtAzzglm4KjAo1iBqBZBxVSjhfXbHJQSfr+5x99Z5oCrwkTaIw0gM61Zlk
	DitgsKfUtvYl40zJAq3L4cpPUNK4I3BcrqFD8=
MIME-Version: 1.0
Received: by 10.231.174.84 with SMTP id s20mr17744441ibz.94.1281282822400; 
	Sun, 08 Aug 2010 08:53:42 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sun, 8 Aug 2010 08:53:42 -0700 (PDT)
Date: Sun, 8 Aug 2010 17:53:42 +0200
Message-ID: <AANLkTim_ukfazSeQbS5H_f=ouSzf1QUbJL3PvLivP9+O@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: autotools issues (MKINSTALLDIRS, -s_
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
X-List-Received-Date: Sun, 08 Aug 2010 15:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm not too good in autotools. While makeing the git recipe for urjtag
I bumped into the following two issues:

First of all it seems autoreconf needs the -s flag. This tells to use
symlinks. Guess things are done out of order or so.
I've fixed this by adding EXTRA_AUTORECONF = "-s" to my recipes. That
makes configure happy, but it does not really feel as a good solution.

The second issue is that install fails.
Apparently MKINSTALLDIRS does not have the proper value (it should be
tools/mkinstalldirs, but it is an empty string).
I've tried some things, peeked at some other patches for MKINSTALLDIRS
but didn't really get to a satisfactory solution

(the only way I found now is to do a patch after configure (and maybe
compile) have been run. That'll work but is not really a nice
solution).

What makes things even stranger is that the 0.10 version of the recipe
also uses MKINSTALLDIRS without giving any issue.
I've troed to compare both trees, but without much success.

Any wizard here who can give me some guidance?
I've just checked in urjtag_0.10.bb
The git version is not yet in the archive but is given below.
Anyone an idea?

Frans

ESCRIPTION = "UrJTAG is a universal JTAG library, servers and tools"
HOMEPAGE = "http://urjtag.org/"
LICENSE = "GPLv2"
DEPENDS = "libftdi libusb gettext readline"

SRCREV = "fc8686b8dd545f54d25e77f65e43f4d774bc46"

PV = "0.10"
PR = "r0"
PR_append = "+gitr${SRCPV}"

S = "${WORKDIR}/git/urjtag"

SRC_URI = "git://urjtag.git.sourceforge.net/gitroot/urjtag/urjtag;protocol=git;branch=master
\
	"
inherit autotools

# no idea why -s would make a difference but without it configure fails.
# guess the symlink is created before the actual content is there
EXTRA_AUTORECONF = "-s"


