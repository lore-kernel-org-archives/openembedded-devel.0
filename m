Received: from bsmtp4.bon.at ([195.3.86.186] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1QLuYw-00021N-Jf for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 11:58:06 +0200
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id E61EA130087;
	Mon, 16 May 2011 11:55:06 +0200 (CEST)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: Eric =?iso-8859-1?q?B=E9nard?= <eric@eukrea.com>
Date: Mon, 16 May 2011 11:55:05 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201104291145.05479.pgsellmann@portner-elektronik.at>
	<4DCEB690.1070400@eukrea.com>
In-Reply-To: <4DCEB690.1070400@eukrea.com>
MIME-Version: 1.0
Message-Id: <201105161155.05490.pgsellmann@portner-elektronik.at>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux_2.6.38: update support for PcontrolG20 HW rev 2
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
X-List-Received-Date: Mon, 16 May 2011 09:58:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Eric!

Am Samstag 14 Mai 2011, 19:06:24 schrieb Eric B=E9nard:
> Hi Peter,
>=20
> On 29/04/2011 11:45, Peter Gsellmann wrote:
> > All prototypes hardware rev 1 are drawn back
> > so default should be rev 2
> >
> > Signed-off-by: Peter Gsellmann<pgsellmann@portner-elektronik.at>
> > ---
> >   recipes/linux/linux-2.6.38/pcontrolg20/defconfig   | 1761 +++++++++++=
+++++++++
> >   .../pcontrolg20/pcontrolg20_2.6.38.patch           |  235 +++
> >   recipes/linux/linux_2.6.38.bb                      |    2 +
> >   3 files changed, 1998 insertions(+), 0 deletions(-)
> >   create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/defconfig
> >   create mode 100644 recipes/linux/linux-2.6.38/pcontrolg20/pcontrolg20=
_2.6.38.patch
> >
> I applied this patch and tried to build the kernel but it seems there is =
no=20
> machine definition for pcontrolg20 : can you please resend a patch serie =
to=20
> add the kernel support and the machine conf file.
the machine configuration for pcontrolg20 is still not in a stable state:
At least the kernel patch is stable, but for the at91bootstrap i have made =
changes for lowlevel initialization and memory detection which i have to br=
ing in sync with mainline; right now my at91bootstrap patch looks ugly and =
would be rejected deservedly.
Same is for U-boot. I patched a specific git-revision with a number of addi=
tional commands i need for factory testing.
Even worse, the perpetual discussions about kernel relocation/decompression=
 convinced me to evaluate alternatives like barebox.

So my ToDo-list is:
(*) commit kernel.patch
* commit at91bootstrap.patch
* commit U-boot or Barebox patches
* commit conf/machine/pcontrolg20.conf
* commit recipes/pcontrolg20-image.bb

If its ok for you this would be the first commit.

I could commit the pcontrolg20.conf also, but the entries for at91boosttrap=
 and u-boot would be commented out.

Preferred way?

Peter


