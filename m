Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thoughtmonster@gmail.com>) id 1NA1Nz-0000c2-EG
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 14:12:54 +0100
Received: by bwz9 with SMTP id 9so5311084bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=DYpXkKa5SjMx2g/Uw9z1R87WfWCP/TUNb9cZcicXhwg=;
	b=FMFSU47Y1RB47r+H0NnVIlXhuGY7a5bXG5RsKFBp50r40msNpTRNHscK81bFnPtnTA
	mtOT0swoEE2Q75/WcrO1NaOcvyy0HEhMI6c0ftU99UKSOsaJDZwk8mpXTgjCvB0h49Q0
	v553oUL8HHN1v8tQktXT0UJ5wQRkXEFfjYy5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wW0wOKcpUQTutxyH/8DHI26OOtDViumoVmWZVvvc/VI2IK/54FXa4gcw0AxOTSNkiy
	lFx+LZO8dQUOQNBmtnBrhD6EVoGaSE8RildJAeFwAiW2+0IUE1gobOvTDdVXOdPLIemc
	rGSyM7A8SHwJRRRlcJRNezab+BoYZl/QZP18E=
MIME-Version: 1.0
Received: by 10.239.145.165 with SMTP id s37mr793676hba.43.1258377089085; Mon, 
	16 Nov 2009 05:11:29 -0800 (PST)
In-Reply-To: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
Date: Mon, 16 Nov 2009 15:11:29 +0200
Message-ID: <992df8520911160511s4e641b28ya68dd6bd14f1101@mail.gmail.com>
From: Alex Ferguson <thoughtmonster@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: thoughtmonster@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Mon, 16 Nov 2009 13:12:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Greetings,

Actually, the need for integrated firmware was misunderstood on my part.
It's technically possible for the firmware to be loaded externally under
Android or Angstrom. As for mentioning Android, I would've liked to be
compatible with both projects (Andromnia and Angstrom), but I have since
revised that plan since it is technically unfeasible.

However, I am having some problems with the Marvell firmware. The driver
expects firmware images with names like "gspi8686.bin" and
"gspi8686_hlp.bin". The marvell-gspi-fw package contains firmware files with
non-compatible names. Even with compatible names, the driver fails to find
the firmware under /lib/firmware, though this probably hasn't anything to do
with OE.

There exists a git repository on git.kernel.org with the required firmware
files, though I believe it's better I fix the marvell-gspi-fw package for
future use, as I found no packages depending on it and thus risking
breakage.

Also, I fixed some issues that were previously present with the kernel
recipe I uploaded. Once I fix these firmware issues I'll post a git patch of
the revised kernel and machine configurations.

Thanks a lot,

Alex Ferguson.

