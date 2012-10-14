Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1TNQ9n-00032F-TG
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Oct 2012 17:31:11 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BEBEB2232546;
	Sun, 14 Oct 2012 17:11:03 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D160D223202E;
	Sun, 14 Oct 2012 17:11:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (f052067125.adsl.alicedsl.de
	[78.52.67.125]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sun, 14 Oct 2012 17:11:02 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A58C53C66B; Sun, 14 Oct 2012 17:10:54 +0200 (CEST)
Date: Sun, 14 Oct 2012 17:10:54 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121014151053.GA6803@rhein.zuhause.netz>
References: <1350047094-19611-1-git-send-email-jlu@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1350047094-19611-1-git-send-email-jlu@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: Re: [meta-java][PATCH] classpath: avoid picking up gmp.h from the host
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
X-List-Received-Date: Sun, 14 Oct 2012 15:31:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 12, 2012 at 03:04:54PM +0200, Jan Luebbe wrote:
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  recipes-core/classpath/classpath.inc |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
> index 4c3174b..1a8093e 100644
> --- a/recipes-core/classpath/classpath.inc
> +++ b/recipes-core/classpath/classpath.inc
> @@ -21,7 +21,7 @@ RPROVIDES_${PN} = "${PBN}"
>  RPROVIDES_${PN}-common = "${PBN}-common"
>  RPROVIDES_${PN}-gtk = "${PBN}-awt"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
>  
> @@ -37,6 +37,7 @@ EXTRA_OECONF = "\
>    --with-vm=java \
>    --disable-Werror \
>    --with-antlr-jar=${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar \
> +  --with-gmp=${STAGING_LIBDIR}/.. \
>    --disable-alsa \
>    --disable-dssi \
>    --disable-qt4-peer \
> -- 
> 1.7.10.4

Thanks,

for the patch. It is applied to meta-java master branch.

Bye Henning


