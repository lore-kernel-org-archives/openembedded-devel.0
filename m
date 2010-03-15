Received: from exprod5og106.obsmtp.com ([64.18.0.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NrAXB-0003aA-MW
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 14:40:47 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob106.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS544JLyp10sJBg9veL674ZAJwxVM4gnM@postini.com;
	Mon, 15 Mar 2010 06:37:42 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip04.e2k.ad.ge.com with ESMTP; 15 Mar 2010 09:30:37 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 15 Mar 2010 09:30:36 -0400
Message-ID: <4B9E373C.7030307@ge.com>
Date: Mon, 15 Mar 2010 13:33:48 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100315132800.22150.14095.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100315132800.22150.14095.stgit@ES-J7S4D2J.amer.consind.ge.com>
X-SA-Exim-Connect-IP: 64.18.0.182
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] commit ddf8890a51d2fe5cee15cb2f18638036c0adb43b
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
X-List-Received-Date: Mon, 15 Mar 2010 13:40:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hmm, that's not right. I'll try again.

Martyn

Martyn Welch wrote:
> Fix mktemp to use update-alternatives
>
>     As suggested in the original version, this patch makes mktemp use
>     update-alternatives.
>
> Signed-off-by: Martyn Welch <martyn.welch@ge.com>
> ---
>
>  recipes/mktemp/mktemp_1.6.bb |   15 +++++++++++----
>  1 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/mktemp/mktemp_1.6.bb b/recipes/mktemp/mktemp_1.6.bb
> index bd9c4ca..33c1cf1 100644
> --- a/recipes/mktemp/mktemp_1.6.bb
> +++ b/recipes/mktemp/mktemp_1.6.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.mktemp.org/"
>  SECTION = "console/utils"
>  LICENSE = "GPLv2 BSD"
>  
> -inherit autotools
> +inherit autotools update-alternatives
>  
>  EXTRA_OECONF = "--with-libc"
>  
> @@ -12,6 +12,13 @@ SRC_URI = "\
>    file://add_destdir.patch;patch=1 \
>    file://disable-strip.patch;patch=1 \
>  "
> -	 	 	
> -# FIXME should rather use update-alternatives
> -RCONFLICTS_${PN} = "coreutils"
> +
> +do_install_append () {
> +	mkdir ${D}${base_bindir}
> +	mv ${D}${bindir}/mktemp ${D}${base_bindir}/mktemp.${PN}
> +}
> +
> +ALTERNATIVE_NAME = "mktemp"
> +ALTERNATIVE_LINK = "${base_bindir}/mktemp"
> +ALTERNATIVE_PATH = "${base_bindir}/mktemp.${PN}"
> +ALTERNATIVE_PRIORITY = "100"
>
>
> --
> Martyn Welch (Principal Software Engineer)   |   Registered in England and
> GE Intelligent Platforms                     |   Wales (3828642) at 100
> T +44(0)127322748                            |   Barbirolli Square, Manchester,
> E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



