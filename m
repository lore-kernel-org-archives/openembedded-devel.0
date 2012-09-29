Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1THn6I-0006Nw-CL
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Sep 2012 04:48:19 +0200
Received: (qmail 17847 invoked by uid 1003); 29 Sep 2012 02:35:23 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.160.215)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	29 Sep 2012 02:35:23 -0000
Message-ID: <50665E6A.8080604@balister.org>
Date: Fri, 28 Sep 2012 22:35:22 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1348863831-31989-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1348863831-31989-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/2] uhd: Fix recipe syntax error
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
X-List-Received-Date: Sat, 29 Sep 2012 02:48:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 09/28/2012 04:23 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta-oe/recipes-connectivity/uhd/uhd.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
> index 5e2e329..27584da 100644
> --- a/meta-oe/recipes-connectivity/uhd/uhd.inc
> +++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
> @@ -7,7 +7,7 @@ DEPENDS = "git-native boost libusb1 uhd-firmware orc-native"
>   RDEPENDS_${PN} += "uhd-firmware"
>
>   PE = "1"
> -INC_PR = "r1"
> +INC_PR = "r2"
>
>   inherit cmake
>
> @@ -20,7 +20,7 @@ FILES_${PN} += "${libdir}/libuhd.so \
>   FILES_${PN}-tests += "${datadir}/uhd/tests/*"
>   FILES_${PN}-e1xx += "${datadir}/uhd/usrp_e_utils/*"
>   FILES_${PN}-dbg += "${datadir}/uhd/examples/.debug/* \
> -"                   ${datadir}/uhd/utils/.debug/* \
> +                    ${datadir}/uhd/utils/.debug/* \
>                       ${datadir}/uhd/tests/.debug/* \
>                       ${datadir}/uhd/usrp_e_utils/.debug/*"
>   FILES_${PN}-examples = "${datadir}/uhd/examples/*"
>


