Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SHv1A-0004jz-DC
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 12:43:16 +0200
Received: by iaag37 with SMTP id g37so1138706iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xRXsvK392PSyr1+3GpM5skXCVktPXhPuxerrVX/HHDc=;
	b=BoJVaTb+7llOjGc1gPTqG9CoGqWrp2D+11SBDmqI3QH7tsXoGNouSxTXT5M5T3fn6B
	F3E8j/Fh8mdmIocDiZ/pK0NeqcIP3Ftwo6QKkqRfN5wwDEi8/DS4nP/RBzISl0n1VbIN
	jXYozOOwD7Hqxp6bcdTf7uQVMxe2Hk+OMil8qjsLWsNMDyyFfvNm9k3aSxcsP6PUtYCF
	lA4qXqNDC/bjF2MOJ6jV+xc9eDBXq7xx3n3TcSeo6Nxarf6/WGlAlWUZiAlRxLk44q5O
	1FSism1OHavBgEN6dxY49R9Nx1ZJws2fAQAfZQgTbHrjVs5pN2dk11ZpJ5TkuslpGa/l
	/1KQ==
MIME-Version: 1.0
Received: by 10.50.212.97 with SMTP id nj1mr1425173igc.65.1334140436785; Wed,
	11 Apr 2012 03:33:56 -0700 (PDT)
Received: by 10.231.170.15 with HTTP; Wed, 11 Apr 2012 03:33:56 -0700 (PDT)
In-Reply-To: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
Date: Wed, 11 Apr 2012 12:33:56 +0200
Message-ID: <CAOHjBZsuo=mrkE+gbkMT3-p04ZS-=U11M=Fg-3z7wfFUyRPDAA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] THISDIR usage
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
X-List-Received-Date: Wed, 11 Apr 2012 10:43:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry, I used FILESEXTRAPATHS but the result is the same. I'm using
openembedded-core-2011-1 sources.

Il giorno mercoled=EC 11 aprile 2012, Giuseppe Condorelli ha scritto:

> Hi, I moved to OE-Core (working on stable version dowloaded as tar file
> from cgit.openembedded.org).
> I'm in trouble trying to include a source through .bbappend file, located
> under my meta-<personal> subtree.
>
> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
> SRC_URI +=3D "file://myfile.tar.gz"
>
> results in a no such file or directory. Please can you tell me if I'm
> missing anything?
>
> Thanks,
> Giuseppe
>

