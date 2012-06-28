Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SkIPU-0001tx-8J
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 19:21:40 +0200
Received: by dalh21 with SMTP id h21so3045695dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=tKiqSjk45OBEYPO+Mk66Q8FSn04J/RLeN/hwFInpvIM=;
	b=W+SASeSCcDkpFsWI2MyTkY53WRxgVgrTLMaDl0Xq6S27Khx9++9RLqiWDoMmbxbeJ4
	JbWhNeHHqKPS4Fj/ULoiFx8NEJyHbloo8fP8qTA6ijqfQswB9rwVZNXsHf06x1kVAG/0
	XVnVS0YfgGkDjfqeRdx6dWFUUIZXJAG6DtIEqYic+bEltl5k1mTqoIhU5+NxDMVKavK5
	39yI6nrofDIl3ztt/mkCJfokm65SVgEOFrbPBvNk2ZMg5CgFhntBrwjdH1YyFmmzV+/j
	/K2xnAFwGQecowVCqZeZRtmOH6kNRHZUZAbsot2gmUKLmFeCQc8ZOkzATDD0UfAnCW7b
	zaqA==
Received: by 10.68.221.41 with SMTP id qb9mr9614385pbc.147.1340903444714;
	Thu, 28 Jun 2012 10:10:44 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id rs4sm2652833pbc.0.2012.06.28.10.10.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 10:10:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <1340375307-20787-1-git-send-email-elvis.dowson@gmail.com>
Date: Thu, 28 Jun 2012 21:10:42 +0400
Message-Id: <6376E490-98B1-46C6-9862-F2224C49E2DE@gmail.com>
References: <1340375307-20787-1-git-send-email-elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Thu, 28 Jun 2012 17:21:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Request to apply this patch to the meta-openembedded layer...

Elvis

On Jun 22, 2012, at 6:28 PM, Elvis Dowson wrote:

> This commit fixes the following warnings:
> WARNING: Unable to get checksum for python-numpy SRC_URI entry =
config.h: file could not be found
> WARNING: Unable to get checksum for python-numpy SRC_URI entry =
numpyconfig.h: file could not be found
>=20
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> .../recipes-devtools/python/python-numpy_1.4.1.bb  |   11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb =
b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> index a67bf8b..0ae2ca2 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> @@ -5,7 +5,16 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3D3c42211d73c3faa1026e671dd39883fa"
> PR =3D "r3"
>=20
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
> -	   file://config.h \
> +           ${CONFIGFILESURI} \
> +	  "
> +
> +CONFIGFILESURI ?=3D ""
> +
> +CONFIGFILESURI_arm =3D "file://config.h \
> +	   file://numpyconfig.h \
> +	  "
> +
> +CONFIGFILESURI_mipsel =3D "file://config.h \
> 	   file://numpyconfig.h \
> 	  "
>=20
> --=20
> 1.7.9.5
>=20



