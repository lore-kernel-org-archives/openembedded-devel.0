Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFvfM-0005CD-9R
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 00:28:16 +0200
Received: (qmail invoked by alias); 17 Oct 2011 22:22:26 -0000
Received: from p5B0A17D4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.212]
	by mail.gmx.net (mp044) with SMTP; 18 Oct 2011 00:22:26 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18xHu1/acQxmm6yeqDeStDq6vGRPU1lK7ZyMpqJkG
	TErzFIUixwzT4z
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 00:27:04 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201110180027.05116.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-xfce 1/4] libxfcegui4: add 4.8.1
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
X-List-Received-Date: Mon, 17 Oct 2011 22:28:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, October 17, 2011 07:23:18 PM Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb  |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb
> 
> diff --git a/meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb b/meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb
> new file mode 100644
> index 0000000..1273880
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Xfce4 Widget library and X Window System interaction"
> +DEPENDS = "intltool virtual/libx11 libxfce4util xfconf libxml2 gtk+ libglade"
> +
> +LICENSE = "GPLv2 LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee \
> +                    file://COPYING.LIB;md5=b8081563814865b09774a6915b594a71 \
> +                   "
> +
> +SECTION = "x11/libs"
> +
> +inherit xfce gettext
> +
> +SRC_URI[md5sum] = "ca0cdeff99f1732307d0fc0672d382ef"
> +SRC_URI[sha256sum] = "309a81823cdfdb7301bc6a5199e14f0df29b58dae89a9302c7839b9b94812443"
> +
> +LEAD_SONAME = "libxfcegui4.so.4"
> +
> +FILES_${PN} += "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so ${datadir}/xfce4/mime ${datadir}/icons/hicolor"
> +RDEPENDS_${PN} = "xfconf startup-notification "
> +
> 
I intentionally left out libxfcegui4 because it is deprecated [1] since xfce 4.8 and replaced by libxfce4ui.

Since meta-oe / oe-core is some fresh & new - I wanted to keep it out. Anyway - the panel recipes following in this series 
need a bit more love:

* DESCRIPTION missing
* LICENSE = "MIT" ??
* SRC_URI[*sum] missing

I checked the sources of the two panel plugins and would like to spend few nights to see how far I get migrating 
them to libxfce4ui ( take [2] as a starter - xfce4-cpufreq-plugin is already building - have run test tomorrow...). 

Andreas

[1] http://git.xfce.org/xfce/libxfcegui4/
[2] http://git.xfce.org/panel-plugins/xfce4-clipman-plugin/commit/?id=4b08db62bd85e6c9abc3c00570eaae365d992ad5


