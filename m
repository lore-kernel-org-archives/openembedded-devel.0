Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NrYcp-0002Ib-9Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 16:24:12 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NrYZq-0007gt-8q from Tom_Rini@mentor.com ;
	Tue, 16 Mar 2010 08:21:02 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 16 Mar 2010 08:20:59 -0700
Received: from 172.30.80.63 ([172.30.80.63]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 16 Mar 2010 15:20:33 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	16 Mar 2010 08:20:32 -0700
From: Tom Rini <tom_rini@mentor.com>
To: Martyn Welch <martyn.welch@ge.com>
In-Reply-To: <20100316102847.11656.91721.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: 1268406955.15150.3.camel@trini-m4400
	<20100316102847.11656.91721.stgit@ES-J7S4D2J.amer.consind.ge.com>
Organization: Mentor Graphics Corporation
Date: Tue, 16 Mar 2010 08:16:04 -0700
Message-ID: <1268752564.23984.4.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 16 Mar 2010 15:20:59.0591 (UTC)
	FILETIME=[4847ED70:01CAC51C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] Add Freescale mpc8641_hpcn demo board
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
X-List-Received-Date: Tue, 16 Mar 2010 15:24:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-16 at 10:30 +0000, Martyn Welch wrote:
> A demo board from Freescale, based on the MPC8641D Freescale SOC.
> ---
>=20
>  Agh! Sorry - Missed the bad title again :-(
>=20
>  v2: Added tuning file for e600 as requested
>=20
>  conf/machine/include/tune-ppce600.inc             |    4=20
>  conf/machine/mpc8641-hpcn.conf                    |   26=20
>  recipes/linux/linux-2.6.33/mpc8641-hpcn/defconfig | 1752 +++++++++++++++=
++++++
>  recipes/linux/linux.inc                           |    1=20
>  recipes/linux/linux_2.6.33.bb                     |    1=20
>  recipes/u-boot/u-boot_git.bb                      |    1=20
>  6 files changed, 1785 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/machine/include/tune-ppce600.inc b/conf/machine/include=
/tune-ppce600.inc
> new file mode 100644
> index 0000000..59d9e05
> --- /dev/null
> +++ b/conf/machine/include/tune-ppce600.inc
> @@ -0,0 +1,4 @@
> +TARGET_CC_ARCH =3D "-mcpu=3D604 -mhard-float"

-mcpu=3D7450 is probably a better fit (Of course if you've got a doc that
says it's 604 + bits instead, point me at it please, iirc it's got
altivec and stuff).

Just about there tho :)

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


