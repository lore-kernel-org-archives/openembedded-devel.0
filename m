Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OCUK3-0003r9-Sr
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 11:03:17 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 2F02A68416
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:59:09 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 12:59:13 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005131223.22252.khimov@altell.ru> <20100513084633.GC3370@jama>
In-Reply-To: <20100513084633.GC3370@jama>
MIME-Version: 1.0
Message-Id: <201005131259.13508.khimov@altell.ru>
X-Altell-MailScanner-ID: 2F02A68416.3B924
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 09:03:18 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 13 =D0=BC=D0=B0=D1=8F 2010 12:46=
:33 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Martin Jansa =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BB:
> On Thu, May 13, 2010 at 12:23:22PM +0400, Roman I Khimov wrote:
> > Well, as the problem is in the kernel really, I think everyone having
> > this problem should push distro maintainers to update kernels with the
> > tiny fix mentioned above. But as a workaround, yep, "0" setting might
> > work (beware that it might also not work as in here:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/423513
> > ).
>=20
> Another not tested workaround:
>=20
> as qemu can work with (hopefully any) non-zero mmap_min_addr, maybe add
> patch to linux-user/main.c that if it cannot read
> /proc/sys/vm/mmap_min_addr then assume 65536 (ubuntu default)?

=46edora has the same default, so this should work.


