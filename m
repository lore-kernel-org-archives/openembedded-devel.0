Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFtij-0001va-Ag
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 22:23:37 +0200
Received: (qmail invoked by alias); 17 Oct 2011 20:17:46 -0000
Received: from p5B0A17D4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.212]
	by mail.gmx.net (mp058) with SMTP; 17 Oct 2011 22:17:46 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19P3KBb0ftPQBejyoWt5a4dyte2125eIMSXbw73mL
	LOIirJHmGaRqhQ
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 22:22:22 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <cover.1318872954.git.otavio@ossystems.com.br>
	<93df3fc261e0e07164a093b42abf63f1ba0cee48.1318872954.git.otavio@ossystems.com.br>
In-Reply-To: <93df3fc261e0e07164a093b42abf63f1ba0cee48.1318872954.git.otavio@ossystems.com.br>
MIME-Version: 1.0
Message-Id: <201110172222.22517.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe][PATCH 2/2] openssl: disable parallel install
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
X-List-Received-Date: Mon, 17 Oct 2011 20:23:37 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, October 17, 2011 07:36:30 PM Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-connectivity/openssl/openssl.inc |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/openssl/openssl.inc b/meta-oe/recipes-connectivity/openssl/openssl.inc
> index 86b29f0..7d5c0ec 100644
> --- a/meta-oe/recipes-connectivity/openssl/openssl.inc
> +++ b/meta-oe/recipes-connectivity/openssl/openssl.inc
> @@ -11,7 +11,7 @@ S = "${WORKDIR}/openssl-${PV}"
>  
>  inherit siteinfo
>  
> -INC_PR = "r13"
> +INC_PR = "r14"
>  
>  AR_append = " r"
>  CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
> @@ -21,6 +21,9 @@ CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_END
>  CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"
>  CFLAG_mtx-2 := "${@'${CFLAG}'.replace('-O2', '')}"
>  
> +# parallel install fail sometimes
> +PARALLEL_MAKEINST = ""
> +
>  export DIRS = "crypto ssl apps"
>  BBCLASSEXTEND = "native nativesdk"
>  
> 
Could you please post the error message in the commit message?

Andreas


