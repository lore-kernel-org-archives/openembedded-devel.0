Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrLxk-0008Sy-E6
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 02:48:36 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHR007F1BFFX3SW@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 19:45:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9E3166B83A8; Tue,
	07 Apr 2009 20:45:14 -0400 (EDT)
Date: Tue, 07 Apr 2009 20:45:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090408004514.GI11203@denix.org>
References: <1239036500-32115-1-git-send-email-jeremy.laine@bolloretelecom.eu>
MIME-version: 1.0
In-reply-to: <1239036500-32115-1-git-send-email-jeremy.laine@bolloretelecom.eu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeremy Lain?? <jeremy.laine@m4x.org>
Subject: Re: [STABLE][PATCH] gsoap: actually stage headers and	libraries..
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
X-List-Received-Date: Wed, 08 Apr 2009 00:48:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 06, 2009 at 06:48:20PM +0200, Jeremy Lain?? wrote:
> From: Jeremy Lain?? <jeremy.laine@m4x.org>
> 
> 
> Signed-off-by: Jeremy Lain?? <jeremy.laine@m4x.org>
> ---
>  recipes/gsoap/gsoap_2.7.7.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gsoap/gsoap_2.7.7.bb b/recipes/gsoap/gsoap_2.7.7.bb
> index 21a0ace..83c7cbb 100644
> --- a/recipes/gsoap/gsoap_2.7.7.bb
> +++ b/recipes/gsoap/gsoap_2.7.7.bb
> @@ -3,7 +3,7 @@ for the development of SOAP Web Services and clients."
>  SECTION = "devel"
>  LICENSE = "GPL"
>  DEPENDS = "gsoap-native"
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
>             file://rename_bogus_ldflags.patch;patch=1"
> @@ -23,5 +23,9 @@ do_install_append() {
>  	done
>  }
>  
> +do_stage() {
> +	autotools_stage_all
> +}
> +

inherit autotools_stage?

>  PACKAGES = "${PN}-dbg ${PN}-dev ${PN} ${PN}-doc ${PN}-locale"
>  FILES_gsoap-dev = "${bindir}/wsdl2h ${bindir}/soapcpp2 ${libdir}"
> -- 
> 1.6.2.1


