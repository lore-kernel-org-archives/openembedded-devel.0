Return-Path: <tomasz.meresinski@comarch.pl>
Received: from odzwierny0.comarch.com (odzwierny0.comarch.com [217.74.69.8])
	by mail.openembedded.org (Postfix) with ESMTP id A68FF6011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 16:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny0.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1ejSrf-000Ktv-VN
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Feb 2018 17:46:31 +0100
To: openembedded-devel@lists.openembedded.org
References: <1518021832-6779-1-git-send-email-tomasz.meresinski@comarch.pl>
From: =?UTF-8?Q?Tomasz_Meresi=c5=84ski?= <tomasz.meresinski@comarch.pl>
Message-ID: <e077205b-d6a4-11e7-5fd0-2ee90b529250@comarch.pl>
Date: Wed, 7 Feb 2018 17:46:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518021832-6779-1-git-send-email-tomasz.meresinski@comarch.pl>
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny0.comarch.com
X-CA-Is-Spam: No
Subject: Re: [meta-python][PATCH] python3-twisted: remove python3-twisted-src
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 16:46:32 -0000
X-Groupsio-MsgNum: 70651
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms010906090305060602040800"

--------------ms010906090305060602040800
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

In my opinion this patch should be applied to rocko too.

On 07.02.2018 17:43, Tomasz Meresi=C5=84ski wrote:
> In python2 .py files are not necessary when importing a module.
> In python3 it's impossible to import without them.
> Removing python3-twisted-src makes .py files appear in packages again.
>
> Signed-off-by: Tomasz Meresi=C5=84ski<tomasz.meresinski@comarch.pl>
> ---
>   meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twisted_17.9.0=
=2Ebb b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
> index dfb9d4a..6bd8c52 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
> @@ -1,6 +1,8 @@
>   inherit pypi setuptools3
>   require python-twisted.inc
>  =20
> +PACKAGES_remove =3D "${PN}-src"
> +
>   FILES_${PN}-core_append +=3D " \
>     ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
>     ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*p=
yc \



--------------ms010906090305060602040800
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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

--------------ms010906090305060602040800--
