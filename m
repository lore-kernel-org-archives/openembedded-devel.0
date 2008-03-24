Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JdrIs-0004Mp-8b
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 19:21:50 +0100
X-ASG-Debug-ID: 1206382908-69c0000e0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id 1DD9C28EE2; Mon, 24 Mar 2008 13:21:49 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id ELqKrnRGHRHGjhEE; Mon, 24 Mar 2008 13:21:49 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: Robert =?iso-8859-1?q?W=F6rle?= <robert@linuxdevelopment.de>
X-ASG-Orig-Subj: Re: [oe] AVR32 - stops at gcc-cross-4.2.1 configure
	GCC_NO_EXECUTABLES
Date: Mon, 24 Mar 2008 13:21:48 -0500
User-Agent: KMail/1.9.7
References: <47E7757A.6080807@linuxdevelopment.de>
	<200803241028.40698.geoffrey@pager.net>
	<47E7E283.8050903@linuxdevelopment.de>
In-Reply-To: <47E7E283.8050903@linuxdevelopment.de>
MIME-Version: 1.0
Message-Id: <200803241321.48929.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1206382909
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: AVR32 - stops at gcc-cross-4.2.1 configure GCC_NO_EXECUTABLES
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
X-List-Received-Date: Mon, 24 Mar 2008 18:21:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 24 March 2008 12:18:59 pm Robert W=F6rle wrote:
> > Not sure why you need to use the external-toolchain anymore.
>
> why is it then pulled into the image .. ?? hmm maybe i am still at a
> home mode host problem .

I don't know enough about OE to answer that.  Maybe if you move your work=20
directory (tmp) out of the way and start over.  I've had a couple of issues=
=20
that were fixed by that.  The magic of a good "make clean" :)

> Maybe you could ( if you dare ) rebuild your gcc-cross-4.2.1 and send me
> the configure output log. then i could compare and see what it did
> detect and those certain points ?
> Would you be so kind ?

I'm actually trying to rebuild it now with a patch for the ICE I was gettin=
g=20
while building OpenSSH.  I'm getting some kind of error while building=20
gcc-cross-initial.  Doesn't look like the same error you were getting,=20
though.  Looking into it...

=2D--
Geoffrey






