Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OObgZ-00011i-SI
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 21:20:40 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OObcD-0002Mj-Ph from Tom_Rini@mentor.com ;
	Tue, 15 Jun 2010 12:16:05 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 15 Jun 2010 12:16:05 -0700
Received: from [172.30.80.129] ([172.30.80.129]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Jun 2010 13:16:04 -0600
Message-ID: <4C17D171.6080903@mentor.com>
Date: Tue, 15 Jun 2010 12:16:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
	<1276625727-22991-4-git-send-email-stefan@datenfreihafen.org>
In-Reply-To: <1276625727-22991-4-git-send-email-stefan@datenfreihafen.org>
X-OriginalArrivalTime: 15 Jun 2010 19:16:04.0612 (UTC)
	FILETIME=[331E9440:01CB0CBF]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH][STABLE 3/4] netcat_0.7.1: Gettext is needed
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
X-List-Received-Date: Tue, 15 Jun 2010 19:20:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stefan Schmidt wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
> 
> 
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  recipes/netcat/netcat_0.7.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/netcat/netcat_0.7.1.bb b/recipes/netcat/netcat_0.7.1.bb
> index 7c4dfc5..918460b 100644
> --- a/recipes/netcat/netcat_0.7.1.bb
> +++ b/recipes/netcat/netcat_0.7.1.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "GNU Netcat"
>  HOMEPAGE = "http://netcat.sourceforge.net"
>  SECTION = "console/network"
>  LICENSE = "GPLv2"
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
>  
> -inherit autotools update-alternatives
> +inherit autotools update-alternatives gettext
>  
>  do_install_append() {
>  	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}


-- 
Tom Rini
Mentor Graphics Corporation


