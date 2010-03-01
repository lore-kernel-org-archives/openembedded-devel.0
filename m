Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nm9bM-0007FU-0m
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 18:40:20 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nm9Ya-0002of-Tm from Tom_Rini@mentor.com ;
	Mon, 01 Mar 2010 09:37:24 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Mar 2010 09:37:24 -0800
Received: from 172.30.80.137 ([172.30.80.137]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  1 Mar 2010 17:36:32 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Mar 2010 10:36:31 -0700
From: Tom Rini <tom_rini@mentor.com>
To: Antonio Ospite <ospite@studenti.unina.it>
In-Reply-To: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
References: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Mar 2010 10:36:31 -0700
Message-ID: <1267464991.9295.397.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Mar 2010 17:37:24.0389 (UTC)
	FILETIME=[DA9ABD50:01CAB965]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-toolchain: Show the host system in toolchain archive name
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
X-List-Received-Date: Mon, 01 Mar 2010 17:40:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-02-19 at 00:34 +0000, Antonio Ospite wrote:
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
>=20
> ---
> In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find more logical=
 to
> put it just before the target system info.

Pushed, thanks.

>=20
> Regards,
>    Antonio
>=20
>  recipes/meta/meta-toolchain.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain=
.bb
> index 3169425..574ecac 100644
> --- a/recipes/meta/meta-toolchain.bb
> +++ b/recipes/meta/meta-toolchain.bb
> @@ -17,7 +17,7 @@ TOOLCHAIN_TARGET_TASK ?=3D "task-sdk-bare"
>  TOOLCHAIN_TARGET_EXCLUDE ?=3D ""
>  FEED_ARCH ?=3D "${TARGET_ARCH}"
>  SDK_SUFFIX =3D "toolchain"
> -TOOLCHAIN_OUTPUTNAME ?=3D "${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TA=
RGET_OS}-${SDK_SUFFIX}"
> +TOOLCHAIN_OUTPUTNAME ?=3D "${DISTRO}-${DISTRO_VERSION}-${SDK_SYS}-${FEED=
_ARCH}-${TARGET_OS}-${SDK_SUFFIX}"
> =20
>  RDEPENDS =3D "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
> =20


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


