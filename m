Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SsWOK-0004nx-9I
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 11:54:28 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWDK-0002It-A2>; Sat, 21 Jul 2012 11:43:06 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWDK-0001QP-72>; Sat, 21 Jul 2012 11:43:06 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SsWDJ-0000yh-3E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 11:43:05 +0200
Date: Sat, 21 Jul 2012 11:43:05 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120721094305.GD31778@mi.fu-berlin.de>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
	<1342761538-19890-4-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342761538-19890-4-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH 4/5] jaxp1.3_1.4.01.bb: Fix SRC_URI checksums
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
X-List-Received-Date: Sat, 21 Jul 2012 09:54:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 19, 2012 at 10:18:57PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-core/xml-commons/jaxp1.3_1.4.01.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
> index ffd704c..481a1ec 100644
> --- a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
> +++ b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
> @@ -27,7 +27,7 @@ do_compile() {
>    fastjar -c -m manifest.commons -f ${JARFILENAME} -C build .
>  }
>  
> -SRC_URI[md5sum] = "5536f87a816c766f4999ed60593a8701"
> -SRC_URI[sha256sum] = "8e8a412aeb95644eaf14ec1a5cfd04833e38cac4a01b83d73d7de2368a35a597"
> +SRC_URI[md5sum] = "2fea8e97a5d4d1a24bd05f5f62f3e04e"
> +SRC_URI[sha256sum] = "d34bd88dc89c5c1ed2545ec5c61e4606fc28beb200a6fecf8c3ed17694181866"
>  
>  BBCLASSEXTEND = "native"
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Thanks,

patch is applied to master. I only made qs on the openjdk-7 branch so that slipped through.

Bye Henning


