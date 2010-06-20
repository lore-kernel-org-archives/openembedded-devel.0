Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQRk9-0002F7-LP
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 23:07:54 +0200
Received: by bwz14 with SMTP id 14so849902bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=v02XeO3+2fRdFjUxoTdtk81uAlQoHGtIJ8p9WwOPy/I=;
	b=bs8qES40CFOiIv76s3Rqt5QEGWCci5tX0EkMElXZpBSzmUByPy0Tmy/bJD3NbnanRP
	RmL+Gmebn4RX+11zPy+e9zjNPpEaraOzuPeR1T8Imp850cWvNdUbsUX5AJkQjHpz5o7N
	Ylnr7kq0TSAHcZRH+o2uJrzE7fll0N2DvSiqo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=J03lOVnWgkH1Pv4QfVAMNS0ElQr6KcMdn2NDKM72EVin8zG7CEGkPWx83qC4sGccCf
	AtESRmm3Mn2CULhRUxAsUb97LuEyToWWsiJblp4s+6y5Fs0WmBll1MBZfn9xb/rHW68L
	KhorsaoGwoOSoqNqBFoFFsBP/nh4Wf7Krx3Oc=
MIME-Version: 1.0
Received: by 10.204.83.18 with SMTP id d18mr697339bkl.131.1277067801964; Sun, 
	20 Jun 2010 14:03:21 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Sun, 20 Jun 2010 14:03:21 -0700 (PDT)
Date: Sun, 20 Jun 2010 23:03:21 +0200
Message-ID: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: linux-libc-headers & kernel-arch.bbclass
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
X-List-Received-Date: Sun, 20 Jun 2010 21:07:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I noticed linux-libc-headers has a function set-arch to set ARCH.
linux recipes get this from kernel-arch.bbclass.
Wouldn't it be possible to let the linux-libc-headers recipes also get
ARCH from kernel-arch.bbclass ?

Frans.


