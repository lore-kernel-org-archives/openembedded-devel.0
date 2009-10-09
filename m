Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mw6Cl-000101-VJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 05:31:49 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 902C11B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2009 03:38:55 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 9 Oct 2009 05:30:44 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.32-rc2; KDE/4.3.1; i686; ; )
References: <4ACEAB19.1000408@gmail.com>
In-Reply-To: <4ACEAB19.1000408@gmail.com>
MIME-Version: 1.0
Message-Id: <200910090530.44754.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] matchbox-panel-0.9.3: fix uninitialised variable causing SIGBUS
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
X-List-Received-Date: Fri, 09 Oct 2009 03:31:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 09 October 2009 05:16:41 Graham Gower wrote:
> As reported here:
> http://lists.o-hand.com/matchbox/0289.html
> 
> I've not experienced the bug for over a month since applying this change.
> 
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>


> ---
>  .../matchbox-panel-uninitialised-crash.patch       |   10 ++++++++++
>  recipes/matchbox-panel/matchbox-panel_0.9.3.bb     |    5 +++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
>  create mode 100644
>  recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised-c
> rash.patch
> 
> diff --git
>  a/recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised
> -crash.patch
>  b/recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised
> -crash.patch new file mode 100644
> index 0000000..6177501
> --- /dev/null
> +++
>  b/recipes/matchbox-panel/matchbox-panel-0.9.3/matchbox-panel-uninitialised
> -crash.patch @@ -0,0 +1,10 @@
> +--- matchbox-panel-0.9.3/src/panel_app.c.orig
> ++++ matchbox-panel-0.9.3/src/panel_app.c
> +@@ -249,6 +249,7 @@
> +
> +   papp = NEW(MBPanelApp);
> +
> ++  papp->name   = NULL;
> +   papp->next   = NULL;
> +   papp->win    = win;
> +   papp->panel  = panel;
> diff --git a/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
>  b/recipes/matchbox-panel/matchbox-panel_0.9.3.bb index 5559122..3d50f5f
>  100644
> --- a/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
> +++ b/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
> @@ -1,5 +1,6 @@
>  require matchbox-panel.inc
> -PR ="r4"
> +PR ="r5"
>  SRC_URI =
>  "http://projects.o-hand.com/matchbox/sources/${PN}/0.9/${PN}-${PV}.tar.gz
>  \ file://mb-applet-battery-repaint-093.patch;patch=1 \
> -	   file://mb-applet-system-monitor-crash.patch;patch=1"
> +	   file://mb-applet-system-monitor-crash.patch;patch=1 \
> +	   file://matchbox-panel-uninitialised-crash.patch;patch=1"
> 


