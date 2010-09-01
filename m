Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqueG-0008QA-JZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:15:13 +0200
Received: by iwn2 with SMTP id 2so6965841iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Yn7hRfdJG6LUFpfk9vQGtZSxLJJygOEkreXgxgKtT/Y=;
	b=l8v2DCSswjU2hnxGsf2mK1Tb9vd/LS7tHapKQjzjE21TiZKT59gvXucSz+YMYfypEG
	fqsA51/Xdua9VRrOAprwTkz+sV9t4ZFzkfKyMxVrGunoTrjxd9GY/8VRBpMxs1itfF6X
	3bxJNFQIfbGEMyqvLuzvgyDbDGn7fI1UDMObo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=RRjzcFlTiiRBUp8bdwqhc4d2qxM1O9Bbn8yzMOkuDNJfZ/YKT4wtutY8Y8iXLCnlE2
	Ko8GHGhCfS7hbrrtG7e2xuJZukG1PQ/i0gThpQLO5/pnbaJL523DqkUvOGmrqvhwf0YH
	ZaHpVtkSabBJTPH+2KR06YkT81yT5oyimvpiE=
MIME-Version: 1.0
Received: by 10.231.157.143 with SMTP id b15mr9362676ibx.113.1283375679428;
	Wed, 01 Sep 2010 14:14:39 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 14:14:39 -0700 (PDT)
Date: Wed, 1 Sep 2010 23:14:39 +0200
Message-ID: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
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
Subject: SOC_FAMILY broken
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
X-List-Received-Date: Wed, 01 Sep 2010 21:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Patch http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=07076390358f211bd96779bec2d6eb5eaa0ad699
creates errors like:
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
entity 'virtual/arm-oe-linux-gnueabi-gcc-2.95' but it wasn't found in
any PACKAGE or RPROVIDES variables

Root cause: if SOC_FAMILY is not set (awhich is the case for most
MACHINEs  and all distro's except angstrom) the test in base.bbclass
to skip recipes for different machines never raises the SkipPackage
exception.

This is the current code (about line 387 in base.bbclass):
        need_machine = bb.data.getVar('COMPATIBLE_MACHINE', d, 1)
        if need_machine:
            import re
            this_machine = bb.data.getVar('MACHINE', d, 1)
            if this_machine and not re.match(need_machine, this_machine):
                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
                if this_soc_family and not re.match(need_machine,
this_soc_family):
                    raise bb.parse.SkipPackage("incompatible with
machine %s" % this_machine)

I see two possible fixes.
1. Make sure SOC_FAMILY is always defined. E.g. in bitbake.conf say
SOC_FAMILY ?= "Unknown"
2. improve the test to deal with an undefined soc_famile
E.g rewrite the one but last line to:
                    if (this_soc_family and not re.match(need_machine,
this_soc_family)) or not this_soc_family:

I tested the 2nd patch with distro minimal, target sheevaplug, which
gave the error before. After rewriting the line as suggested skipping
works and the problem is gone.
I have this also as a formal patch, but there might be more desirable
ways to do this.

Please advise.

Frans.


