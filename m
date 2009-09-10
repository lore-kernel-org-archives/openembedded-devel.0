Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MlZAE-00016w-4U
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 04:13:37 +0200
Received: from tamarin.localnet (123-192-182-244.dynamic.kbronet.com.tw
	[123.192.182.244])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 8FAD91B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 02:18:44 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2009 04:12:56 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <4AA3ABA8.304@eukrea.com> <4AA74FEE.8060809@eukrea.com>
	<4AA825DF.70003@4d-electronics.co.nz>
In-Reply-To: <4AA825DF.70003@4d-electronics.co.nz>
MIME-Version: 1.0
Message-Id: <200909100412.56615.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qt4-embedded & tslib
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
X-List-Received-Date: Thu, 10 Sep 2009 02:13:37 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 10 September 2009 00:02:07 Matthew Dombroski wrote:
> On 09/09/09 18:49, Eric B=E9nard wrote:
> > Hi Matthew,
> >
> > Matthew Dombroski a =E9crit :
> >> Actually, the problem is that tslib is linked incorrectly.
> >> The pthres, linear, etc. modules are not linked to libts so theyre
> >> missing symbols when an attempt is made to load them.
> >
> > ts_calibrate & ts_test are working fine : doesn't is mean the modules
> > are properly linked ?
>
> ldd says not:
>
> $ ldd dejitter.so
> libc.so.6 =3D> /lib/libc.so.6 (0x4000a000)
> /lib/ld-linux.so.3 (0x2a000000)
>
> With my patch:
>
> $ ldd dejitter.so
> libts-1.0.so.0 =3D> /usr/lib/libts-1.0.so.0 (0x4000a000)
> libdl.so.2 =3D> /lib/libdl.so.2 (0x40014000)
> libc.so.6 =3D> /lib/libc.so.6 (0x4001f000)
> /lib/ld-linux.so.3
>
> I'm not sure why Qt is the only place it fails (unlinked).
> My opinion is that linking properly is technically better.


Can you provide us with the output of the failure?


