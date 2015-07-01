Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4313560017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 09:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6B6AF3157261
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 11:44:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DnEiLcSSeCrS
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 11:44:41 +0200 (CEST)
Received: from [172.22.22.61] (55d41359.access.ecotel.net [85.212.19.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 331303157244
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 11:44:41 +0200 (CEST)
Message-ID: <5593B688.4070304@opendreambox.org>
Date: Wed, 01 Jul 2015 11:44:40 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1435741531-30306-1-git-send-email-net147@gmail.com>
In-Reply-To: <1435741531-30306-1-git-send-email-net147@gmail.com>
Subject: Re: [meta-qt5][PATCH] libconnman-qt5: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2015 09:44:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Jonathan,

On 01.07.2015 11:05, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> 
> diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> new file mode 100644
> index 0000000..0ca57e2
> --- /dev/null
> +++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> @@ -0,0 +1,17 @@
> +require recipes-qt/qt5/qt5.inc
> +
> +SUMMARY = "Qt Library for ConnMan"
> +HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
> +DEPENDS += "qtbase qtdeclarative"
> +PV = "1.0.89+git${SRCPV}"
> +
> +SRCREV = "79a8d10479ba55951ffa375a66797eedff230dd3"
> +SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +RDEPENDS_${PN} += "connman"

I have a slightly different version in my meta-qt5 repo (fido):

https://github.com/opendreambox/meta-qt5/commit/9e616b42e266f1c804daae1eb5dcf693c0f07b42

Can you please compare both versions and make sure that the things you
omitted aren't needed anymore? Note that libconnman-qt.inc is equal to
the version in meta-openembedded.

Regards,
Andreas

