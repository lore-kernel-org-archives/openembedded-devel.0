Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fahad_Usman@mentor.com>) id 1U85TL-0004ov-Hr
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 09:56:16 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1U852z-0006Vt-Qj from Fahad_Usman@mentor.com ;
	Wed, 20 Feb 2013 00:29:01 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 20 Feb 2013 00:29:01 -0800
Received: from [137.202.156.99] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Wed, 20 Feb 2013 08:28:59 +0000
Message-ID: <51248946.8090005@mentor.com>
Date: Wed, 20 Feb 2013 13:28:54 +0500
From: "Usman, Fahad" <Fahad_Usman@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Fahad Usman <fahad_usman@mentor.com>
References: <1358786627-20844-1-git-send-email-fahad_usman@mentor.com>
In-Reply-To: <1358786627-20844-1-git-send-email-fahad_usman@mentor.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 20 Feb 2013 08:29:01.0827 (UTC)
	FILETIME=[562C7530:01CE0F44]
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org, Eric Benard <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] nss: fix access to https websites
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
X-List-Received-Date: Wed, 20 Feb 2013 08:56:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2013 09:43 PM, Fahad Usman wrote:
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>   recipes-support/nss/nss_3.13.3.bb |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
> index bb602b1..a841397 100644
> --- a/recipes-support/nss/nss_3.13.3.bb
> +++ b/recipes-support/nss/nss_3.13.3.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Mozilla's SSL and TLS implementation"
>   HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
>   
> -PR = "r1"
> +PR = "r2"
>   
>   LICENSE = "MPL1.1 GPL LGPL"
>   LIC_FILES_CHKSUM = "file://security/nss/manifest.mn;md5=d71978748f23eae3156c38ac2a691924"
> @@ -66,6 +66,8 @@ do_install() {
>   		NS_USE_GCC=1 \
>   		NSS_USE_SYSTEM_SQLITE=1 \
>   		NSS_ENABLE_ECC=1 \
> +		FREEBL_CHILD_BUILD=1 \
> +		CC="${CC}" \
>   		SOURCE_LIB_DIR="${TD}/${libdir}" \
>   		SOURCE_BIN_DIR="${TD}/${bindir}"
>   
Hi,
Can someone review this patch.

Regards,
Fahad.



