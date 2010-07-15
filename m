Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OZWf8-0003Ym-KD
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 00:12:19 +0200
Received: by gya6 with SMTP id 6so1012808gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=rUcsHfm68X29BkR+fQ1veXYFIdYX36SIEp1uo1O4zgY=;
	b=c7VW0zbXewNCrB0uJWorsLyyx3MuA4ruCvTPg5GpL4Bu9daDe22pudJPIgnV0VicEL
	x9VGx4GG4DTYQUb0nRqUa7TKqOcWS/vuiJ7rQKbVp2YOb5vzOX3lH6wC/H0pWzX8Ftnb
	0OGQSnmFLBV0+Z5GFQTwKQfX6/vPehFKlSj28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PDP0H5VnSiKiJMdprkPZCVoupmI2AFERmL2qc4eYsaS0wK6TfeA0eIO+MNpHT3PbVz
	QZ8aUbR6TxDZt8cBxrvtwGW5oB7k5LkdteMwCtghoUguIIrmW7W2UlrfDJZP1DgNaj6t
	r7z0BiDWY+OT0KNItlj+a5Ie78amWSecuRFnc=
MIME-Version: 1.0
Received: by 10.100.163.5 with SMTP id l5mr343655ane.144.1279231926846; Thu, 
	15 Jul 2010 15:12:06 -0700 (PDT)
Received: by 10.100.127.11 with HTTP; Thu, 15 Jul 2010 15:12:06 -0700 (PDT)
Date: Thu, 15 Jul 2010 15:12:06 -0700
Message-ID: <AANLkTilIK0a0CNBJ20rOV-k7iawQ5GtF3epMb77SjMrJ@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: hping2 recipe failed to build fixed for gumstix overo
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
X-List-Received-Date: Thu, 15 Jul 2010 22:12:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure if this is the correct way but I was able to sort out a
recipe that was failing to build for my gumstix overo. It was hping2
the fixed recipe is as follows. It seems to build now though have not
tested it works properly yet. Though this is not the most current
version of the program. Would be nice if someone knowledgable could
fix the recipe to pull and from the svn source so it would build the
most current version when the recipe runs.  thanks


DESCRIPTION = "hping is a command-line oriented TCP/IP packet \
assembler/analyzer. The interface is inspired to the ping(8) \
unix command, but hping isn't only able to send ICMP echo requests. \
It supports TCP, UDP, ICMP and RAW-IP protocols, has a traceroute \
mode, the ability to send files between a covered channel, and many \
other features."
HOMEPAGE = "http://www.hping.org/"
SECTION = "console/network"
LICENSE = "GPL"
PR = "r1"

SRC_URI = "http://www.hping.org/hping2.0.0-rc3.tar.gz \
           file://hping2_debian.patch \
           file://hping2_configure.patch"
S = "${WORKDIR}/hping2-rc3"

inherit siteinfo


TARGET_CC_ARCH += "${LDFLAGS}"

#
# We've patched configure to accept byte order and ostype as env
# variables Pass those values in to stop it trying to figure it out
# by itself.
# NOTE: The configure script is not an autoconf script.
#
do_configure() {
        # Additional flag based on target endiness (see siteinfo.bbclass)
        BYTEORDER="${@base_conditional('SITEINFO_ENDIANESS', 'le',
'__LITTLE_ENDIAN_BITFIELD', '__BIG_ENDIAN_BITFIELD', d)}"
        oenote Determined byteorder as: $BYTEORDER
        BYTEORDER="${BYTEORDER}" CONFIGOSTYPE="LINUX" ./configure
}

#
# Instead of patching the install we do things manually here
#
do_install() {
        install -m 0755 -d ${D}${sbindir} ${D}/${mandir} ${D}${docdir}/hping2
        install -m 0755 hping2 ${D}/${sbindir}
        install -m 0644 docs/hping2.8 ${D}/${mandir}
        install -m 0644 docs/HPING2-HOWTO.txt docs/HPING2-IS-OPEN \
                docs/MORE-FUN-WITH-IPID docs/SPOOFED_SCAN.txt \
                docs/AS-BACKDOOR docs/APD.txt ${D}${docdir}/hping2
}

SRC_URI[md5sum] = "029bf240f2e0545b664b2f8b9118d9e8"
SRC_URI[sha256sum] =
"f59292de39b9a4010414bd120a494226399767148efa37278bd53d9613167964"


