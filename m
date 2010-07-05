Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OVmjL-0004Jv-Pj
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 16:33:09 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 2C9E646E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jul 2010 18:28:15 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 5 Jul 2010 18:28:09 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1278264840-24635-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1278264840-24635-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <201007051828.09715.khimov@altell.ru>
X-Altell-MailScanner-ID: 2C9E646E7.B3626
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] base.bbclass: Fix oe_unpack_file to unpack files to match new bitbake bb.decodeurl()
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
X-List-Received-Date: Mon, 05 Jul 2010 14:33:09 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 04 =D0=
=B8=D1=8E=D0=BB=D1=8F 2010 21:34:00 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj=
 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> * This patch now uses the path which essentially is the path and
>   filename relative to recipe dir. It will create the directories
>   as expected. Suppose if the is says file://pam.d/login in the
>   SRC_URI then it will be copied to $WORKDIR/pam.d/login as it
>   was happening before the fix to decodeurl in bitbake.
>=20
> * Do not copy the .patch and .diff files into $WORKDIR
>   they are already symlinked in patches/ dir which will
>   be used by quilt.
>=20
>=20
> I have done native-sdk-image build from scratch for arm/x86 using bitbake
>  master and this patch on OE without any problem.
>=20
> OK for .dev ?
>=20
> Thanks
>=20
> -Khem
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/base.bbclass |   20 +++++++++-----------
>  1 files changed, 9 insertions(+), 11 deletions(-)
>=20

Acked-by: Roman I Khimov <khimov@altell.ru>


