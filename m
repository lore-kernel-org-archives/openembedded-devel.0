Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N0uRb-0001ds-TA for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 11:58:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N0uQd-0005Vg-3d
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 11:57:55 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 11:57:55 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 11:57:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 22 Oct 2009 11:57:29 +0200
Message-ID: <hbpaa9$1s2$1@ger.gmane.org>
References: <11137.8223322847$1256203543@news.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <11137.8223322847$1256203543@news.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] gdm_2.28.0: Add missing libcanberra dependency to allow building on a clean system.
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
X-List-Received-Date: Thu, 22 Oct 2009 09:58:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Your mailer linewrapped it again, please use git send-email in the future.

regards,

Koen

On 22-10-09 11:22, John Willis wrote:
> * Also bump PR.
>
> Signed-off-by: David-John Willis<John.Willis@Distant-earth.com>
> ---
>   recipes/gnome/gdm_2.28.0.bb |    8 +++-----
>   1 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/gnome/gdm_2.28.0.bb b/recipes/gnome/gdm_2.28.0.bb
> index 3f5c69e..d6cc5c0 100644
> --- a/recipes/gnome/gdm_2.28.0.bb
> +++ b/recipes/gnome/gdm_2.28.0.bb
> @@ -1,7 +1,9 @@
>   DESCRIPTION = "Graphical login manager"
>   LICENSE = "GPL"
>
> -DEPENDS = "libxklavier grep consolekit libpam gnome-doc-utils gtk+ libglade
> libgnomecanvas librsvg libxml2 libart-lgpl xrdb"
> +DEPENDS = "libxklavier grep consolekit libpam gnome-doc-utils gtk+ libglade
> libgnomecanvas librsvg libxml2 libart-lgpl libcanberra xrdb"
> +
> +PR = "r1"
>
>   inherit gnome update-rc.d
>
> @@ -67,7 +69,3 @@ pkg_postrm_${PN} () {
>       delgroup gdm || true
>   	sed -i /gdm/d ${sysconfdir}/X11/default-display-manager || true
>   }
> -
> -
> -
> -




