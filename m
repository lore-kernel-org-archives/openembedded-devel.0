Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LtqSq-0005nP-KF
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 23:46:46 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI400GEE1N7AW6L@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 16:42:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4CDE86B83A8; Tue,
	14 Apr 2009 17:42:43 -0400 (EDT)
Date: Tue, 14 Apr 2009 17:42:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414214243.GF28306@denix.org>
References: <1239694534-23578-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1239694534-23578-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=AWL,BAYES_20,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] gdbm: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Tue, 14 Apr 2009 21:46:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 14, 2009 at 09:35:34AM +0200, Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>

Is it a proper use of TARGET_CC_ARCH? As name suggests, it wasn't meant to 
deliver LDFLAGS to CC, only to specify the architecture. But as I can see, 
many recipes reuse this variable to stick additional flags for CC... So, I 
guess it's a common practice.

Acked-by: Denys Dmytriyenko <denis@denix.org>


> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/gdbm/gdbm_1.8.3.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gdbm/gdbm_1.8.3.bb b/recipes/gdbm/gdbm_1.8.3.bb
> index f3beb47..883022e 100644
> --- a/recipes/gdbm/gdbm_1.8.3.bb
> +++ b/recipes/gdbm/gdbm_1.8.3.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>  PRIORITY = "optional"
>  LICENSE = "GPL"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
>  	   file://makefile.patch;patch=1 \
> @@ -12,6 +12,8 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
>  
>  inherit autotools
>  
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>  do_stage () {
>  	oe_libinstall -so -a libgdbm ${STAGING_LIBDIR}
>  	install -m 0644 ${S}/gdbm.h ${STAGING_INCDIR}/
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


