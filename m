Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFwCK-00060A-Q3
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:02:20 +0200
Received: (qmail invoked by alias); 17 Oct 2011 22:56:31 -0000
Received: from p5B0A17D4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.212]
	by mail.gmx.net (mp066) with SMTP; 18 Oct 2011 00:56:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+eyuBRSjaeBiAh+WCqhjcAK20OKEyvlTE0Qrq7Lv
	WYVxJnVwcPvUXF
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:01:10 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
	<1318872201-26433-2-git-send-email-koen@dominion.thruhere.net>
	<1318872201-26433-3-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1318872201-26433-3-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201110180101.10576.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-xfce 3/4] xfce4-cpufreq-plugin: initial add
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
X-List-Received-Date: Mon, 17 Oct 2011 23:02:20 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, October 17, 2011 07:23:20 PM Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../cpufreq/xfce4-cpufreq-plugin_1.0.0.bb          |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>  create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
> 
> diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
> new file mode 100644
> index 0000000..484f794
> --- /dev/null
> +++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
> @@ -0,0 +1,5 @@
> +inherit xfce-panel-plugin
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
> +
> 
I am run testing the libxfce4ui-based version. Right after I add it to panel, it
complains that my system does not support cpu-frequency. The plugin reads it's
information from /sys/devices/system/cpu/cpu0/cpufreq (or /proc/cpufreq). How can I
make my system supply this information? Is there some magic kernel config for that?

Andreas


