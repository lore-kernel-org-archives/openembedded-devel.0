Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O9OsY-0001iN-8j
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 22:38:11 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O9Ook-0001zQ-3T from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 13:34:10 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 4 May 2010 13:34:09 -0700
Received: from 172.30.80.24 ([172.30.80.24]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  4 May 2010 20:34:09 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	04 May 2010 13:34:08 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1273004809-24230-1-git-send-email-eric@eukrea.com>
References: <1273004809-24230-1-git-send-email-eric@eukrea.com>
Organization: Mentor Graphics Corporation
Date: Tue, 04 May 2010 13:34:08 -0700
Message-ID: <1273005248.2533.33.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 04 May 2010 20:34:09.0710 (UTC)
	FILETIME=[264E4CE0:01CAEBC9]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] python-m2crypto-native: Add recipe
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
X-List-Received-Date: Tue, 04 May 2010 20:38:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-05-04 at 22:26 +0200, Eric Benard wrote:
> - this package is needed to compile crda
>=20
> Signed-off-by: Eric Benard <eric@eukrea.com>

Any reason we can't use BBCLASSEXTENDS?

> ---
>  recipes/python/python-m2crypto-native_0.18.2.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/python/python-m2crypto-native_0.18.2.bb
>=20
> diff --git a/recipes/python/python-m2crypto-native_0.18.2.bb b/recipes/py=
thon/python-m2crypto-native_0.18.2.bb
> new file mode 100644
> index 0000000..4a28464
> --- /dev/null
> +++ b/recipes/python/python-m2crypto-native_0.18.2.bb
> @@ -0,0 +1,12 @@
> +require python-m2crypto_${PV}.bb
> +inherit native
> +
> +FILESPATH =3D "${FILE_DIRNAME}/python-m2crypto"
> +DEPENDS =3D "python-native"
> +
> +do_stage() {
> +	distutils_stage_all
> +}
> +
> +SRC_URI[md5sum] =3D "445dce53fcfc7ec8f6fd31f54da8a067"
> +SRC_URI[sha256sum] =3D "62ed44c8b2d392bdc757981ac37f05d808a0d917e4f9d95d=
e2fbf3c2bdad41a7"


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


