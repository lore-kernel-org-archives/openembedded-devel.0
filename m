Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 182ED601D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 20:39:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id E1AE02612B7
To: openembedded-devel@lists.openembedded.org
References: <1449001449-20421-1-git-send-email-joshua.lock@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <565E056A.6010707@collabora.co.uk>
Date: Tue, 1 Dec 2015 20:39:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449001449-20421-1-git-send-email-joshua.lock@collabora.co.uk>
Subject: Re: [meta-oe][PATCH] poppler-data: install CMap resources for CJK glyph support
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
X-List-Received-Date: Tue, 01 Dec 2015 20:39:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/15 20:24, Joshua Lock wrote:
> CID-keyed fonts, as commonly used to support pictographic East
> Asian character sets require Character Maps which unidirectionally
> map character codes (i.e. Unicode encoding) to CID (the glyphs in
> the font face).
>
> Without a CMap poppler isn't able to correctly PDF files in
> Chinese, Japanese or Korean without embedded fonts.
>
> This change installs a copy of the Identity files from Adobe's
> CMap Resources[1] based on a similar change in Fedora's
> poppler-data[2][3].
>
> 1. https://github.com/adobe-type-tools/cmap-resources
> 2. http://pkgs.fedoraproject.org/cgit/poppler-data.git/tree/poppler-data.spec#n18
> 3. https://bugzilla.redhat.com/show_bug.cgi?id=842351
>
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>   meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
> index 4f55e9f..5a3f086 100644
> --- a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
> +++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
> @@ -1,5 +1,6 @@
>   SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
> -LICENSE = "Adobe"
> +DESCRIPTION = ""
> +LICENSE = "BSD && GPLv2 && GPLv3+"

The LICENSE field is incorrect and I didn't fill out description, I'll 
fix those and send a v2.

Apologies,

Joshua

>   LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
>                       file://COPYING.adobe;md5=63c6a8a9df204c00461fa5f163d8a663 \
>                       file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
> @@ -7,15 +8,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
>
>   inherit allarch
>
> -SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz"
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
> +           https://github.com/adobe-type-tools/cmap-resources/raw/master/cmapresources_identity-0.zip;name=cmap"
>   SRC_URI[md5sum] = "636a8f2b9f6df9e7ced8ec0946961eaf"
>   SRC_URI[sha256sum] = "e752b0d88a7aba54574152143e7bf76436a7ef51977c55d6bd9a48dccde3a7de"
> +SRC_URI[cmap.md5sum] = "32aab2e25655e475dd58a50479270f91"
> +SRC_URI[cmap.sha256sum] = "3a3b591b7153588a77d1304bcefc1781750a36811cebae03680c85882765f515"
>
>   do_compile() {
>   }
>
>   do_install() {
>       oe_runmake install DESTDIR=${D}
> +    install -d ${D}${datadir}/poppler/cMap
> +    install -m644 ${WORKDIR}/cmapresources_identity-0/CMap/Identity-* ${D}${datadir}/poppler/cMap/
>   }
>
>   FILES_${PN} += "${datadir}"
>


