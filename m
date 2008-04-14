Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JlV34-0004xm-Le
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 22:13:06 +0200
X-ASG-Debug-ID: 1208203984-05fd003b0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id 76D4A409BD; Mon, 14 Apr 2008 15:13:04 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id bj3QRPfPEBZHjjjW; Mon, 14 Apr 2008 15:13:04 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] binutils 2.17.atmel.1.2.6 and gcc 4.2.2.atmel.1.0.8
	for AVR32
Date: Mon, 14 Apr 2008 15:13:15 -0500
User-Agent: KMail/1.9.7
References: <200804141300.16904.geoffrey@pager.net>
	<200804142155.03848.openembedded@haerwu.biz>
In-Reply-To: <200804142155.03848.openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200804141513.15303.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1208203984
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: binutils 2.17.atmel.1.2.6 and gcc 4.2.2.atmel.1.0.8 for AVR32
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
X-List-Received-Date: Mon, 14 Apr 2008 20:13:06 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 14 April 2008 02:55:01 pm Marcin Juszkiewicz wrote:
> Dnia Monday 14 of April 2008, Geoffrey Wossum napisa=B3:
> > There's also a fix in the binutils patch for having a texinfo version
> >
> > >=3D 4.10. =A0 See https://bugzilla.redhat.com/show_bug.cgi?id=3D345621=
 for
> >
> > more info.
>
> Iirc most (if not all) versions of binutils in OE were already patched for
> this problem.

binutils 2.18 does indeed seem to be patched for this=20
(binutils-2.18/binutils-configure-texinfo-version.patch).  I didn't notice=
=20
this patch.

The AVR32 still has to use the older 2.17, which did not have a patch for t=
his=20
in OE.  I stole a sed expression from an in-house script for building an AV=
R=20
(not AVR32) toolchain.  It looks for the bad texinfo check (actually any=20
texinfo check) and replaces it with a good one.

=2D--
Geoffrey



