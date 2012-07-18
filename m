Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrOnG-000497-IF
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 09:35:34 +0200
Received: by yenl13 with SMTP id l13so1180581yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8VUFBRc/erOeVMLNJn1HR0UxiIbH7uUYdsQjXqDNNi4=;
	b=gm6WA5U8rQDrkiDLBBXzF1w+q5je6wfX43ntBAgJQ8IFx7NGSchZp7uP/1oaHFD9k+
	1quW0U7LH3Q1Hvnga4eDRJzot2bc87QcJyWDNNZXtOaVH5DFjkg5nA1f4lWs+L9YdVIY
	D2c0+PT4jNtEeacJAicgGBgYu/LNF3wnw7YUzj1aMaXRj0WPlL8kRNvgV4AbQXopaemL
	zr3aIb5N15GB4h0QjEtck/ruTr0Lbr7qpwzveZKroHJVsF7Fy/rFNpRbJmRj1XyTBUQ6
	E1VP8KiG6JjhxwhH972CmRpD8M0YrdLx5QvYSs1MJJ7QyqzlvuhcGXBLWOQcWtrbHitN
	qmeA==
MIME-Version: 1.0
Received: by 10.50.181.137 with SMTP id dw9mr1042611igc.45.1342596253268; Wed,
	18 Jul 2012 00:24:13 -0700 (PDT)
Received: by 10.64.23.72 with HTTP; Wed, 18 Jul 2012 00:24:13 -0700 (PDT)
In-Reply-To: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
References: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
Date: Wed, 18 Jul 2012 09:24:13 +0200
Message-ID: <CA+chaQcNV=P0k3HzHPXAysv5tPMoaa=T11iYnDCnaJdHoB-rHQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded 1/4] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Wed, 18 Jul 2012 07:35:34 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 6, 2012 at 4:52 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> This commit fixes the following warnings:
> WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: file could not be found
> WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconfig.h: file could not be found
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
>  .../recipes-devtools/python/python-numpy_1.4.1.bb  |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> index a67bf8b..c1923f7 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> @@ -5,7 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
>  PR = "r3"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
> -          file://config.h \
> +           ${CONFIGFILESURI} \
> +         "
> +CONFIGFILESURI ?= ""
> +
> +CONFIGFILESURI_arm = "file://config.h \
> +          file://numpyconfig.h \
> +         "
> +CONFIGFILESURI_mipsel = "file://config.h \
>            file://numpyconfig.h \
>           "

Does python-numpy build for other archs (without config.h and numpyconfig.h)?

If no then please add COMPATIBLE_HOST restriction to arm or mipsel.

It can be in follow-up patch..

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


