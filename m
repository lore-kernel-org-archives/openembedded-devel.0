Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PC8Bi-0003BS-HB
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 11:57:27 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LB300EVVKXQO385@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	30 Oct 2010 04:56:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3AEDE14AF6A; Sat,
	30 Oct 2010 05:56:14 -0400 (EDT)
Date: Sat, 30 Oct 2010 05:56:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101030095614.GA21651@denix.org>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
	<1288387543-1277-4-git-send-email-eric@eukrea.com>
	<1288387543-1277-5-git-send-email-eric@eukrea.com>
	<1288387543-1277-6-git-send-email-eric@eukrea.com>
MIME-version: 1.0
In-reply-to: <1288387543-1277-6-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 6/7] qt-4.7: rename qtdemo to qtdemoE for	qt4-embedded
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
X-List-Received-Date: Sat, 30 Oct 2010 09:57:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 29, 2010 at 11:25:42PM +0200, Eric B??nard wrote:
> in order to stay consistant with 4.6.x releases.
> 
> Signed-off-by: Eric B??nard <eric@eukrea.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/qt4/qt-4.7.0.inc          |    5 +++++
>  recipes/qt4/qt4-embedded_4.7.0.bb |    2 +-
>  2 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/qt4/qt-4.7.0.inc b/recipes/qt4/qt-4.7.0.inc
> index cf4b0d8..ba2b25a 100644
> --- a/recipes/qt4/qt-4.7.0.inc
> +++ b/recipes/qt4/qt-4.7.0.inc
> @@ -60,6 +60,11 @@ do_install_append() {
>  	for i in rcc uic moc ; do
>  		install -m 0755 ${S}/bin/$i ${D}${bindir}/
>  	done
> +
> +        #Append an E to the qtdemo file
> +        if [ -n "${QT_LIBINFIX}" ] ; then
> +                mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
> +        fi
>  }
>  
>  SRC_URI[md5sum] = "3a2f25b9b115037277f4fb759194a7a5"
> diff --git a/recipes/qt4/qt4-embedded_4.7.0.bb b/recipes/qt4/qt4-embedded_4.7.0.bb
> index 1cd43a6..7e3d4b8 100644
> --- a/recipes/qt4/qt4-embedded_4.7.0.bb
> +++ b/recipes/qt4/qt4-embedded_4.7.0.bb
> @@ -2,7 +2,7 @@ DEFAULT_PREFERENCE = "-1"
>  
>  require qt4-embedded.inc
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
>  
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


