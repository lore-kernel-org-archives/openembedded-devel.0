Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thoughtmonster@gmail.com>) id 1N9fNB-00057T-4Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 14:42:36 +0100
Received: by fxm1 with SMTP id 1so4549466fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=bbpJ+sB7R/KIcznXyVrZOeB4BXcaOyls7IFlNsL/cZ0=;
	b=DKiNIWB6aTiPLHctZhRb9cfdf0dqFB1YEw8H8P4Ya/3nMA9ZLtd6x5JFKzvHJAEeqC
	X9EzkqC23Wo2S4drqLL50cjX+Jmn9pinCPOjgVX6ozpqcSqZXqrq5JGP4ckjwNEwkID8
	lkNmwWVvVb+yiG2vBwbMhjaBs5BThJYaXDsaA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=UDIi7zZbjH5d/eKzvPCSrqTuZsm96fVzlA8Ayhkp7zUJiiOyOY61Dm2b8wFzPeOk8I
	R0MgilT3om0tuglz2hOz9ZUuwkW481C2nu8Zadoqm/npeDuXRSylozOycXsRnHI8gGbS
	dxXIrCx5Is7tTx1l7mveOkEug5ZP15xWbaUxM=
MIME-Version: 1.0
Received: by 10.239.141.136 with SMTP id c8mr642743hba.148.1258292078915; Sun, 
	15 Nov 2009 05:34:38 -0800 (PST)
Date: Sun, 15 Nov 2009 15:34:38 +0200
Message-ID: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
From: Alex Ferguson <thoughtmonster@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: thoughtmonster@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Sun, 15 Nov 2009 13:42:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've been working on some initial support for the Samsung Omnia (SGH-i900)
in the form of a machine configuration file and kernel. I also posted this
as a bug here:

http://bugs.openembedded.org/show_bug.cgi?id=5335

Stefan Schmidt pointed out some issues with the kernel recipe, and I'd like
some help with one of them.

Currently, the kernel comes from the Andromnia project, and uses their git
repository to fetch the sources. They are the only ones who are actively
working on a kernel, and working together should help speed up the process
of porting the Linux kernel on the SGH-i900, no matter the userspace
implementation.

The kernel requires the gspi8686 firmware images from Marvell for the WiFi
adapter to work. Currently, the firmware files are copied into the kernel
source tree under the directory "firmware" for static inclusion. That's
because of certain constraints with Android.

Question: I'd like to keep the same behavior, but I'm not certain of the
exact way. I could DEPEND on the marvell-gspi-fw package and then have the
kernel recipe copy the firmware files from STAGING_LIBDIR. But that seems
like an error prone behavior. Is there any other way, short of providing my
own files in SRC_URI or not including the firmware in the kernel at all?

