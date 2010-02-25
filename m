Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NkiV1-0000x6-Ov
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 19:31:48 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NkiSK-0001l8-0W from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 10:29:00 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 25 Feb 2010 10:28:59 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 25 Feb 2010 18:28:58 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Feb 2010 11:28:56 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250738680-20274-1-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
Organization: Mentor Graphics Corporation
Date: Thu, 25 Feb 2010 11:28:56 -0700
Message-ID: <1267122536.18176.535.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Feb 2010 18:28:59.0858 (UTC)
	FILETIME=[65FED320:01CAB648]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cross.bbclass: keep TARGET_SYS & TARGET_PREFIX independent.
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
X-List-Received-Date: Thu, 25 Feb 2010 18:31:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-08-19 at 17:24 +0000, Christopher Larson wrote:
> Signed-off-by: Chris Larson <clarson@mvista.com>
> Acked-by: Michael Smith <msmith@cbnco.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

>=20
> ---
> classes/cross.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> index 7debde6..72a0fb7 100644
> --- a/classes/cross.bbclass
> +++ b/classes/cross.bbclass
> @@ -2,6 +2,11 @@
>  # no need for them to be a direct target of 'world'
>  EXCLUDE_FROM_WORLD =3D "1"
> =20
> +# In order to keep TARGET_PREFIX decoupled from TARGET_SYS, let's force =
the
> +# binary names to match the former, rather than relying on autoconf's im=
plicit
> +# prefixing based on the latter.
> +EXTRA_OECONF_append =3D " --program-prefix=3D${TARGET_PREFIX}"
> +
>  # Save PACKAGE_ARCH before changing HOST_ARCH
>  OLD_PACKAGE_ARCH :=3D "${PACKAGE_ARCH}"
>  PACKAGE_ARCH =3D "${OLD_PACKAGE_ARCH}"


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


