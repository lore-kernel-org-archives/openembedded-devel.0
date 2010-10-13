Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1P5z5d-0003og-Sj
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 13:01:48 +0200
Received: by ewy1 with SMTP id 1so1531770ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=B3GpuftebIzb5zLAfghndZHovYifbrAu1rlDBUNcZeQ=;
	b=dIztuIGcj/EnTDwmDc5UG0AB/KH28rTkI7ivLtdJztfHoNs17AIgkeTmM1p4S+GfjN
	XuFSzKxmcRVagbPCIE+BVHtOCm6l5D4eai+skAM79+IuYwj3k+Afe15FfcHoCEtJhiSS
	QM6ETMaZbGdpYqKxxk/8wTlBSVsLrTpmnAZZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=aZvhGjRYZb3DF73tNOZwCDBLQcSFO/IL3WIO5CzuESxXBjrzwHUW50dcqUloiJ8JzD
	bQQL/K0m0NIF5kZK1PSyLUgaxi8A92JJLL6tJhcw1PXS4AkpRXsFXF5ExyKUqr7mJTiw
	/cENaPUvzl3CKRHdMWpI0FaK9xvlu78OgjwnA=
Received: by 10.14.22.3 with SMTP id s3mr4695721ees.28.1286967679900;
	Wed, 13 Oct 2010 04:01:19 -0700 (PDT)
Received: from [192.168.0.40] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id z55sm14722477eeh.3.2010.10.13.04.01.18
	(version=SSLv3 cipher=RC4-MD5); Wed, 13 Oct 2010 04:01:19 -0700 (PDT)
Message-ID: <4CB591B3.6080805@gmail.com>
Date: Wed, 13 Oct 2010 13:02:11 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libusb-1.0-0, Required build target 'myrootfs' has no buildable providers.
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
X-List-Received-Date: Wed, 13 Oct 2010 11:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm compiling myrootfs for the beagleboard, and have IMAGE_INSTALL += 
"libusb1" in my recipe. This has worked fine until a recent update, but 
now it fails with the following:

NOTE: Handling BitBake files: | (7156/7156) [100 %]
Parsing of 7156 .bb files complete (6694 cached, 462 parsed). 7374 
targets, 305 skipped, 0 masked, 0 errors.
ERROR: 
'['/home/tassloe/src/openembedded/pd-recipes/images/myrootfs.bb']' 
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 
'libusb-1.0-0' but it wasn't found in any PACKAGE or RPROVIDES variables
ERROR: Required build target 'myrootfs' has no buildable providers.
Missing or unbuildable dependency chain was: ['myrootfs', 'libusb-1.0-0']
NOTE: Resolving any missing task queue dependencies
ERROR: '['/home/tassle/src/openembedded/pd-recipes/images/myrootfs.bb']' 
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 
'libusb-1.0-0' but it wasn't found in any PACKAGE or RPROVIDES variables
Unknown Event: <bb.event.NoProvider instance at 0xfaae5ec>
NOTE: Runtime target 'libusb-1.0-0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libusb-1.0-0']
ERROR: Required build target 'myrootfs' has no buildable providers.
Missing or unbuildable dependency chain was: ['myrootfs', 'libusb-1.0-0']

I deleted my TMPDIR and then it compiled ok, but when I tried to compile 
again, I got the same message. Neither myrootfs.bb nor recipes/libusb 
have been changed since the last time this worked for me, so I suspect 
something else is causing this.

Any ideas?

- Tasslehoff


