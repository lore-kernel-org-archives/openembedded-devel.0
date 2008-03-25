Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1Je9cy-0004a3-S7
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2008 14:55:49 +0100
X-ASG-Debug-ID: 1206453345-688200260000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id 1FE2F29E83; Tue, 25 Mar 2008 08:55:46 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id GmffEQQXlIQsh19K; Tue, 25 Mar 2008 08:55:46 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: Robert =?iso-8859-1?q?W=F6rle?= <robert@linuxdevelopment.de>
X-ASG-Orig-Subj: Re: [oe] AVR32 - stops at gcc-cross-4.2.1 configure
	GCC_NO_EXECUTABLES
Date: Tue, 25 Mar 2008 08:55:45 -0500
User-Agent: KMail/1.9.7
References: <47E7757A.6080807@linuxdevelopment.de>
	<200803241439.20503.geoffrey@pager.net>
	<47E8D99B.8060701@linuxdevelopment.de>
In-Reply-To: <47E8D99B.8060701@linuxdevelopment.de>
MIME-Version: 1.0
Message-Id: <200803250855.45366.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1206453346
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
X-List-Received-Date: Tue, 25 Mar 2008 13:55:49 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 25 March 2008 05:53:15 am Robert W=F6rle wrote:
> Okay, figured that one out. Don't use TARGET_FPU_avr32 =3D "soft". The AV=
R32
>
> > target in gcc doesn't like that.  I added that because I thought I need=
ed
> > it to get libmad to compile, but that wasn't the issue with libmad
> > anyway.  I needed some sort of optimizations turned on.=20
> > angstrom-uclibc.inc was turning off all optimizations for the AVR32,
> > which was unnecessary.
> >
> > Waiting for a full rebuild right now.
>
> I had a succes now on my intel core 2 duo laptop ..  that build the
> current oe chain nice ( beside some bzero() problems which can be easly
> replaced by memset() )

I think I submitted a patch to OE for the bzero() problem.  I know I submit=
ted=20
it to the uClibc mailing list, and it was picked up by the Atmel guy workin=
g=20
on the port.  I'll put at the bottom of this email so you can check if you=
=20
have it.


I can now build base-image for the AVR32.  Haven't tried out all the apps y=
et,=20
but it seems to all be working.  I'm going to work on getting the patch set=
=20
together and submitted this morning.

=2D--
Geoffrey


file: uClibc-0.9.29-avr32-bzero.patch
=2D-- uClibc-0.9.29-orig/libc/string/avr32/bzero.S        2008-03-10=20
15:02:14.000000000 -0500
+++ uClibc-0.9.29/libc/string/avr32/bzero.S     2008-03-10=20
15:05:39.000000000 -0500
@@ -6,6 +6,8 @@
  * archive for more details.
  */

+#include <features.h>
+
 #ifdef __UCLIBC_SUSV3_LEGACY__

        .text





