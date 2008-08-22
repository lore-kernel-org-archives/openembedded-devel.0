Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KWaBD-0002FK-2K
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Aug 2008 19:12:07 +0200
Received: by rv-out-0708.google.com with SMTP id f25so610259rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2008 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=ypS4m9z/KmPIV8PEoSFjHaVIuTCE+2yE+hI0xzYGspA=;
	b=UfTAarXRKqqNQ8gbloZEUTCSejecRu1ks2UJE9WM1tzKBjqMbCKjzywqVksrmy2grP
	0l9WyM8VHaQKl/K5zcMBbLqKnNJIOYO9UyHlPxwkp/uW8CVHBt5pj701wvbb9Sh5xqfa
	rRGopdeAwi+ZY2v5fV/q7E0vz9OsB3ffJhUDM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=EjydbEgbUm/Bs+50Yk0AcBuiFtkzFhpct2fk2twvVv45DfpMn/Mpn3nkPvJW+EW6dY
	QOUO3iBXSsFTCdkEqk3i+r/IofHHIV5TusMUEb30aMWN4/PfDeB8MdCfvI2PHcs0xGfG
	RfGq1x/TtK+4PTBmNWCBCU2KIZZoRL0tn/1HA=
Received: by 10.140.126.14 with SMTP id y14mr652793rvc.96.1219425051607;
	Fri, 22 Aug 2008 10:10:51 -0700 (PDT)
Received: by 10.141.156.18 with HTTP; Fri, 22 Aug 2008 10:10:51 -0700 (PDT)
Message-ID: <d1b08f940808221010r13f9b026la3d3792306b09c0f@mail.gmail.com>
Date: Fri, 22 Aug 2008 19:10:51 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] kexecboot: passing extra cmdline arguments
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
X-List-Received-Date: Fri, 22 Aug 2008 17:12:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The new linux-kexecboot package provides a brand new 'second stage bootloader'
thus allowing to boot from different media (SD, nand,...).

The problem I see whit it, is that the kexec'ed kernel looks for cmdline in
/boot/kernel-cmdline, but that cmdline is statically compiled at build time and
ignores the 'mtdparts=' bootarg.

The patch attached to oebug 4520 provides a way to selectively filter
the cmdline of the
first  kernel (coming from bootloader) and pass it to the new kernel.

Comments and corrections are welcome!

Andrea


Ref:
http://bugs.openembedded.net/show_bug.cgi?id=4520


