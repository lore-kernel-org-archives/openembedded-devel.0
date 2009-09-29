Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MsbAF-0005Bl-H2
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 13:46:42 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1834241qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2009 04:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=QTwBsJLQ1xz/G3HfcxQJSHcqbHGVlHYBDHnjImiRuGI=;
	b=Scp+8eeiTC5JiOvDZ7A54wt4+6nMRGk+C4sDKwSLFc8BU0cVi3oZNdAYsq0GgEvJ+7
	lqzvljPPDmNuNM51oxIBf4UqSe6fhjfmdZbmYDFUhzyEXwLB2zWQ0N3NxhpBSjqVdJJu
	Pgb4spVaT2Nvuq96qCWrAup2nJaB64SQfSD4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=fF8iu3f2x2lZVT0VIsBq+M8dRecxAuDiRMa4KCNnaLO3OCuhNOqHqNkRs9KnchoCaq
	N3WddGvklQJGjMEQsmjGxH7r8PekHNDtu7BDdCkwbKCC4dhFjHJq4RhBsz/SdvKkVW+e
	BO0kj5R6AI8zyToctXMoQwQDVV1yP3hiD4Z58=
MIME-Version: 1.0
Received: by 10.229.49.137 with SMTP id v9mr1663252qcf.21.1254224758200; Tue, 
	29 Sep 2009 04:45:58 -0700 (PDT)
Date: Tue, 29 Sep 2009 13:45:58 +0200
Message-ID: <5f2b60909290445h117f28f0s807430bcec2176e1@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: dm6446-evm kernel broken
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
X-List-Received-Date: Tue, 29 Sep 2009 11:46:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

It seems like commit "linux-davinci: add DA850/OMAPL138, update other
DaVinci machines",
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Da96730454f6=
f8d86519317ad0798b2f96dfcdd45,
broke the kernel for the dm6446-evm.

After this commit, my kernel will not boot. This is what I get:

[console printout begin]
## Booting image at 80700000 ...
   Image Name:   Angstrom/2.6.30-r10+gitr5212151f
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1788540 Bytes =3D  1.7 MB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
OK

Starting kernel ...

Uncompressing Linux........................................................=
............................................................
done, booting the kernel.
[console printout end]

Regards,
Bj=C3=B8rn Forsman


