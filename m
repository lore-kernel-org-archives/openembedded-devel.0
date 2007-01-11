Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.james.barr@gmail.com>) id 1H52mz-0002ek-BI
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jan 2007 17:28:29 +0100
Received: by py-out-1112.google.com with SMTP id n39so236703pyh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2007 08:26:28 -0800 (PST)
Received: by 10.35.93.19 with SMTP id v19mr2810286pyl.1168532788639;
	Thu, 11 Jan 2007 08:26:28 -0800 (PST)
Received: from conroe.oakcourt.dyndns.org ( [65.24.47.209])
	by mx.google.com with ESMTP id 24sm944713nzn.2007.01.11.08.26.26;
	Thu, 11 Jan 2007 08:26:28 -0800 (PST)
Received: by conroe.oakcourt.dyndns.org (sSMTP sendmail emulation);
	Thu, 11 Jan 2007 11:26:25 -0500
From: "Andrew J. Barr" <andrew.james.barr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jan 2007 11:26:24 -0500
Message-Id: <1168532784.21840.4.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2.1 
Subject: Nokia 770, GPE, Angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2007 16:28:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I have flashed my Nokia 770 with a self-built rootfs using
"angstrom-2007.1" as the DISTRO and "nokia770" as the MACHINE. Target
was 'gpe-image', branch was org.openembedded.dev. I flashed it using
Nokia's version 3 flasher:

./flasher-3.0 -f -k zImage -r rootfs.bin

I applied the patch to sysvinit mentioned here[0].

It goes successfully. The device starts up to the Nokia logo (NOLO
bootloader I assume) but the screen fades to white. According to the
document linked below, the initial startup takes a while. Am I just
being impatient or am I doing something wrong? I notice there's no
initfs built by OE, not sure if this is needed.

Regards,
Andrew Barr

[0] http://downloads.kernelconcepts.de/maemo-oe.txt


