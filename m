Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JpAde-00057d-U7
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 01:14:03 +0200
Received: by wa-out-1112.google.com with SMTP id l24so5467185waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2008 16:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=HnLqVot9rw8FT4qP42p6TfZaY77Dy5DYbQNx29BoIgU=;
	b=A99WmiHONfsIH8UUxXh54BzV8o0TPVTplCw76Lc1sG9K1Av/SgqF2PuBMYGFgVasql/gc93I27r2NjcqpXIckMd65iuXE5++dZma+GTRz6nmk3bov+kAIXGEfcdIZMebiXQS2oY+n4wxQoB7WjJgDNafPExnGQjTYcmnp3w+76c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=PhqmlZBt78UMM5Dt9tdl9rSF2C2OqRB6lzCWPQNyABK5jzk/bEDDVn/OuLuH1NBiJKefEW6GeAPWlhatxRqCXbpMVlp5qfUyV0oJUEB7g/ZytHsobu4Gex3VoVdk2lAZ90HX8PyfIRBm6nPOPxmLnXm2JevITi1Va+XS9QooWG4=
Received: by 10.114.204.7 with SMTP id b7mr2511765wag.129.1209078830719;
	Thu, 24 Apr 2008 16:13:50 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Thu, 24 Apr 2008 16:13:50 -0700 (PDT)
Message-ID: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
Date: Thu, 24 Apr 2008 19:13:50 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: xfonts, mapfile dir, and pkg-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 24 Apr 2008 23:14:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Currently, many of the xfont builds fail something like this:

| /build/bhthermal/bht_build/oe/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/bdftopcf
-t UTRG__24.bdf | gzip > UTRG__24.pcf.gz
| /build/bhthermal/bht_build/oe/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/ucs2any
UTB___10.bdf /usr/lib/X11/fonts/util/map-ISO8859-1 ISO8859-1
| /build/bhthermal/bht_build/oe/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/ucs2any:
Can't read mapping file '/usr/lib/X11/fonts/util/map-ISO8859-1': No
such file or directory!
| make[1]: *** [UTB___10-ISO8859-1.bdf] Error 1
| make[1]: Leaving directory
`/build/bhthermal/bht_build/oe/build/angstrom-2008.1/tmp/work/geode-angstrom-linux/font-adobe-utopia-100dpi-1_1.0.1-r0/font-adobe-utopia-100dpi-1.0.1'
| FATAL: oe_runmake failed

This issue is that "pkg-config --variable=mapdir fontutil" returns:

/usr/lib/X11/fonts/util

which is correct if mapdir is used on the target system, but in this
case mapdir is used on the host system during the build, so it really
needs the path to staging.

We can't modify font-util to put the staging path in fontutil.pc or
insane.class complains about tmdir's in a *.pc file.

What is the correct solution in this case?

1) hardcode EXTRA_OECONF with the MAPFILES_PATH (would require
patching font packages -- bad)

2) convince insane.class that this tmpdir is really OK in fontutil.pc

Any suggestions on how to best solve this?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


