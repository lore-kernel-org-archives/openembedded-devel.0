Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PIOng-0002lP-U2
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 17:54:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 1509B314AC64
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 17:53:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GQYPcSj+TgDn
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 17:53:24 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 31879314AB9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 17:53:24 +0100 (CET)
Message-ID: <4CE2B704.9040007@opendreambox.org>
Date: Tue, 16 Nov 2010 17:53:24 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288011024-22560-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1288011024-22560-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libungif-4.1.3: update recipe, fix packaging
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
X-List-Received-Date: Tue, 16 Nov 2010 16:54:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping (now that the required changes to lib_package.bbclass have been pushed)

Patchwork URL:
http://patchwork.openembedded.org/patch/3416/

On 10/25/2010 02:50 PM, Andreas Oberritter wrote:
> * Use lib_package to move static libraries to -static
>   and *.la and *.so symlinks to -dev.
> * Converted to new style staging.
> * Ran oe-stylize.py.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes/libungif/libungif_4.1.3.bb |   24 ++++++++----------------
>  1 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/recipes/libungif/libungif_4.1.3.bb b/recipes/libungif/libungif_4.1.3.bb
> index f53008b..f5bc6fb 100644
> --- a/recipes/libungif/libungif_4.1.3.bb
> +++ b/recipes/libungif/libungif_4.1.3.bb
> @@ -1,22 +1,14 @@
> -SECTION = "libs"
>  DESCRIPTION = "shared library for GIF images"
> -SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
> +SECTION = "libs"
>  LICENSE = "MIT"
> -PR = "r2"
> -
> -PACKAGES += "${PN}-utils"
> -
> -FILES_${PN} = "${libdir}"
> -FILES_${PN}-utils = "${bindir}"
> -
> -inherit autotools
> +PR = "r3"
>  
> -do_stage() {
> -	oe_libinstall -so -C lib/.libs libungif ${STAGING_LIBDIR}
> +SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
> +SRC_URI[sha256sum] = "59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36"
>  
> -	install -m 0644 lib/gif_lib.h ${STAGING_INCDIR}/
> +inherit autotools lib_package
>  
> -}
> +PACKAGES =+ "${PN}-utils"
>  
> -SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
> -SRC_URI[sha256sum] = "59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36"
> +FILES_${PN}-utils = "${bindir}/*"



