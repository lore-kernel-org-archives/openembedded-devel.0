Received: from [209.172.120.180] (helo=skymoon.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ckamas@finesse.com>) id 1M5l0m-0007Rf-Ln
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 20:23:04 +0200
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Sun, 17 May 2009 11:13:27 -0700
Message-ID: <C62896630644CE43BF64B0FF0AC27F0E01C6E5@mail.ad.skymv.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Kernel modules
Thread-Index: AcnWBWzpwdhL5A5URKiZLJ0xkmHp1wBFb/83
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<gulv2v$l9r$1@ger.gmane.org>
From: "Chuck Kamas" <ckamas@finesse.com>
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-devel@openembedded.org>
Subject: Re: Kernel modules
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
X-List-Received-Date: Sun, 17 May 2009 18:23:11 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks,  I add a rrecommends for each kernel module I have in my =
.config.
=20
BTW, is there a way to have OE scan the kernel .config and automatically =
pull in all the kernel modules?
=20
Chuck
=20

________________________________

From: openembedded-devel-bounces@lists.openembedded.org on behalf of =
Koen Kooi
Sent: Sat 5/16/2009 1:55 AM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] Kernel modules



On 16-05-09 01:22, Chuck Kamas wrote:
> Hi all,
>
> I am trying to compile a very small kernel.  To do this I have a few
> kernel modules I would like in the root file system.  But when I load =
OE
> I see that there are no kernel modules in the fs.  I found a way to
> include them by adding a RDEPENDS line with kernel-module-i2c-core.

And it can't be said enough:

NEVER use rdepends to drag in kernelmodules, use rrecommends instead


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




