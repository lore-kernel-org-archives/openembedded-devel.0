Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bmentink@gmail.com>) id 1NwKhD-0001jD-CA
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 21:32:23 +0200
Received: by gyb11 with SMTP id 11so2695130gyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=3K91m/ILSX+NK5UktOzOoFcf3zFIrHBZ/hLahK/CWkw=;
	b=ZDFLlVIVauYlaDKLE4vw1h8VPn4bCfNQRgFCDRbrjkH2yeyErKPeb19sVCzZ5sMbFn
	X46kZd406IKAR8tnlw8oMpcXLaiD1DLB2FHXrL3Km/gjHOB+5Lj/O/nptvhXpgO684Jz
	CW9CG/rAzQjog7IfzcUNf1OamgSb3DLdOnAR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=N5gp7Vr+rFLCOl8zC8wZFOTM7Y7v6kuG7zVEQvonsYsdrufKBgkhoJ95MClmbHByZM
	Lf9vgLgle6+Ot0sPUkPc1VUx7Bz13S8BCNyk855qlQe++2+jlLyk7NdgTL7kfFNg25CM
	ejccqkvq+AcX7pqWGPDq5hsA9JqavfDtKTdKo=
MIME-Version: 1.0
Received: by 10.142.157.6 with HTTP; Mon, 29 Mar 2010 12:29:02 -0700 (PDT)
Date: Tue, 30 Mar 2010 08:29:02 +1300
Received: by 10.142.201.11 with SMTP id y11mr2203218wff.118.1269890942962; 
	Mon, 29 Mar 2010 12:29:02 -0700 (PDT)
Message-ID: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: bmentink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Porting OE to new hardware
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
X-List-Received-Date: Mon, 29 Mar 2010 19:32:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am jumping across to this email list as the user one has very little
traffic.

I have just found OE and would like to use it to get Linux up and running on
some custom hardware. The hardware is currently running the logicloader
bootloader from LogicPD and a YAFFS2 filesystem.

I have found very little info on the steps necessary to port to new
hardware. As far as OE is concerned, I have built an image after altering
the MACHINE and DISTRO to something close to what I need.
I now have a zimage (kernel) and a rootFS.

However I have a number of questions:

1. To boot with zimage with  logicloader, I have to load the image into
memory at an address, and then execute it at the start code which I presume
is an offset the start of the image. Can anyone tell me how I can find
the relevant map file to work out
what offset I need to apply? I did a search for *.map files in the build/tmp
direcory and found nada ..

2. How do I do a kernel config? Is there an option to pass to bitbake to do
that, or do I have to find the kernel source and do it manually, then
rebuild with bitbake?

3. What src files in the kernel do I need to to maybe alter to get the
serial port and memory map right for my target hardware ..

4. Once I get the kernel booting, I need it to load the rootfs, initially I
can boot that from NFS, but I would like to eventually load it from my YAFFS
NAND partition, how do I do that?


Hope someone can give me some pointers in the right direction ... I would
love to kick off WinCE from this hardware ;-)

Cheers,
Bernie

-- 
You always have believers and scepticts.. A True inventor is always a
believer..

