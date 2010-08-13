Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Ok1eS-00020k-AI
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 23:18:57 +0200
Received: by fxm6 with SMTP id 6so2122432fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 14:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=Rqba7ZiZQ2FxImdzBk+iMx3pO2TmM6A/Kzq5r+w6tnw=;
	b=quCl47OXYIxIWgLUdZtpI/nb/1tCgptJTsNPidSyjOB2Vd+UHB6+WaZGAtG6jVHhm8
	iTK4YByfp8swyxxr8ecRpxrWkUoZaI/pcbSklKA2PbKkGr4+Oz5cMRB4kn7UH8ZJ2l0D
	fvNvpW4O3v4vrvW+5KATpG32pAgxRF1kA8Wo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=PXmCD6MZcYzB2fILAdYEjXopNhDQcAx2gjziCNJ+eZ8aAjdBJmyVI2NY10dbUTJwfO
	MwxTzjJJx2YcAmP6orQ6KLuWxmFyIrFgAeAFJvLaCflW2LT9jOT53aKGMRL3s+3HWLSd
	CvmskxtS7ul5Bp+MrSdVay4GAzZmujkKcECCE=
Received: by 10.223.110.83 with SMTP id m19mr2641996fap.26.1281734321107; Fri,
	13 Aug 2010 14:18:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Fri, 13 Aug 2010 14:18:21 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Fri, 13 Aug 2010 15:18:21 -0600
Message-ID: <AANLkTi=haC49V6XnCQpBCY8ickT24PL1F0sKYoh8h6=J@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: iputils fails to build due to missing sgmlspl
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
X-List-Received-Date: Fri, 13 Aug 2010 21:18:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

This is with a fresh install of oe and bitbake (as per the gumstix docs)

|
/mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
warning: libc.so, needed by
/mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
not found (try using -rpath or -rpath-link)
| make -C doc man
| make[1]: Entering directory
`/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
| /bin/sh: sgmlspl: command not found
| make[1]: *** [arping.8] Error 127
| make[1]: Leaving directory
`/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
| make: *** [man] Error 2
| FATAL: oe_runmake failed


The problem is not solved by
bitbake -c clean iputils; bitbake sgmlspl; bitbake iputils

AJ ONeal

