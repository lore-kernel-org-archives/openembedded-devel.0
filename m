Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1ObIA2-00021h-B1
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:07:38 +0200
Received: by gxk3 with SMTP id 3so2866201gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 12:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:cc:content-type;
	bh=mqQJagKbW+VTVUF4BHy5zjksb3/tD/XV43d8jwpZUyU=;
	b=RXVS0ZZOcPAZhjjroRhHN7HuMu5UQw9pZLc3E2ewVgEf2eifSXGn2zjj9IICT4FP5S
	odx193Dz1W8D6v26Vnr2VfDnM4BReu/HngGag66VRm+8IIsau/Sx+arOqTgXqEYbnLSC
	s2dZ4U7bk8MN2QqaUbjT0BIsuRheqACIeNQhI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=JFLP7hkjrIwnRT7fshqEr+rn4NGie48rkJ8F9rVRtIuIjYt1w4WjMmXdKbbv3gP5R9
	b9Q4xqWtpJ2pcw476RX595kiJHLb6pXUPkBUxi2zNo6gxPtUSYr7GUFr0Vr6c6MIuv6P
	1RJ7DAAlOzOFK27jjKe0Wvdr+ONEh7T/qxh8s=
MIME-Version: 1.0
Received: by 10.101.164.16 with SMTP id r16mr6907027ano.199.1279652835514; 
	Tue, 20 Jul 2010 12:07:15 -0700 (PDT)
Received: by 10.100.42.4 with HTTP; Tue, 20 Jul 2010 12:07:15 -0700 (PDT)
Date: Tue, 20 Jul 2010 12:07:15 -0700
Message-ID: <AANLkTikGUfcnu1X5N104c3LTBZKsZiwPhk-DYw9N8Hn3@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Looking for some help on making a recipe -- newbie needing help
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
X-List-Received-Date: Tue, 20 Jul 2010 19:07:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

First sorry for the basic questions here,
I am in the process of trying to figure out how to make my own recipe
for a new version of a program than what exists. I am trying to write
a recipe for aircrack-ng 1.1, Where I am now is its failing unable to
find some files. I think this is because i am missing something in my
recipe. I tried looking at the previous versions and patch files but I
do not understand how to put whats in the patch file into my new
recipe so it would build in a similar manner. Is there a way I can
take what they patched to the original recipe and incorporate it into
my recipe? Or is there an easy way to read whats in the patch file and
incorporate it into a new recipe? I have posted both the recipe I
wrote and the patch from the original recipe. I am not looking to get
spoon fed but I am at a total loss here and would really like to get a
grasp on this as there a bunch of existing recipes that I would like
to update to more current versions, and I am sure once I get through
one or two of making my own I will get it better. I have read the OE
manual and also the examples from gumstix. I am running my OE on the
overo branch if that makes any difference. Thanks for your time and
any help you can share with me. Hope to be more useful to the cause
soon. Lastly if any of this didn't make sense let me know so I can try
and clarify it better for everyone.

my aircrack-ng recipe:
DESCRIPTION = "Aircrack-ng is a set of tools for wep key statistical cracking"
HOMEPAGE = "http://www.aircrack-ng.org/"
SECTION = "console/network"
LICENSE = "GPLv2"
DEPENDS = "openssl zlib sqlite3"
PR = "r0"
PN = "aircrack-ngtest"

SRC_URI = "http://download.aircrack-ng.org/aircrack-ng-1.1.tar.gz"

S = "${WORKDIR}"
OETMP = ${OVEROTOP}/tmp

SBINFILES = "airodump-ng aireplay-ng airmon-ng airtun-ng"
BINFILES = "aircrack-ng airdecap-ng packetforge-ng ivstools kstats makeivs"

do_install() {
	install -d ${D}/${sbindir}
	for i in ${SBINFILES}; do
		install -m 0755 $i ${D}/${sbindir}
	done

	install -d ${D}/${bindir}
	for i in ${BINFILES}; do
		install -m 0755 $i ${D}/${bindir}
	done
}


SRC_URI[md5sum] = "f7a24ed8fad122c4187d06bfd6f998b4"
SRC_URI[sha256sum] =
"b136b549b7d2a2751c21793100075ea43b28de9af4c1969508bb95bcc92224ad"



Here is the patch from the original .9.3  aircrack-ng recipe:
diff -urN aircrack-ng-0.9.3.orig/Makefile aircrack-ng-0.9.3/Makefile
--- aircrack-ng-0.9.3.orig/Makefile	2008-02-24 20:22:35.000000000 +0100
+++ aircrack-ng-0.9.3/Makefile	2009-04-09 07:53:12.000000000 +0200
@@ -3,7 +3,7 @@

 CC              = gcc
 CFLAGS          ?= -g -W -Wall -O3
-OPTFLAGS        = -D_FILE_OFFSET_BITS=64
+OPTFLAGS        = -D_FILE_OFFSET_BITS=64 $(LDFLAGS)

 iCC             = /opt/intel/cc/9.0/bin/icc
 iCFLAGS         = -w -mcpu=pentiumpro -march=pentiumpro


