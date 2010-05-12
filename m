Received: from smtp-out20.alice.it ([85.33.2.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OCFuU-0002wf-61
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 19:40:13 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out20.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 12 May 2010 19:34:55 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 12 May 2010 19:34:54 +0200
Received: from [192.168.1.116] ([79.54.144.103]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 12 May 2010 19:34:54 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1497291088.961273677544100.JavaMail.root@aphid.buglabs.net>
References: <1497291088.961273677544100.JavaMail.root@aphid.buglabs.net>
Date: Wed, 12 May 2010 19:34:49 +0200
Message-ID: <1273685689.2355.11.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 12 May 2010 17:34:54.0866 (UTC)
	FILETIME=[6F395720:01CAF1F9]
X-SA-Exim-Connect-IP: 85.33.2.20
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] conf/machine/bug20.conf, add xf86-input-tslib for BUG2.0 touchscreen
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
X-List-Received-Date: Wed, 12 May 2010 17:40:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-05-12 at 10:19 -0500, John Connolly wrote:
> *BUG20 is using tslib for xorg touchscreen.
> *would like this to get into stable
> *tested on BUG2.0
> ---
>  conf/machine/bug20.conf |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
> index dbc1faf..42c2c12 100644
> --- a/conf/machine/bug20.conf
> +++ b/conf/machine/bug20.conf
> @@ -9,6 +9,7 @@ XSERVER = "xserver-xorg \
>             xserver-xorg-extension-glx \
>             xf86-input-evdev \
>             xf86-input-mouse \
> +           xf86-input-tslib \
>             xf86-video-omapfb \
>             xf86-input-keyboard"
I don't know what happens if the PR of the tasks using XSERVER are not
bumped,and that bug20.conf is changed.
And there are quite a few:
/recipes/tasks $ grep XSERVER *
angstrom-task-gnome.bb:XSERVER ?= "xserver-xorg \
angstrom-task-gnome.bb:  ${XSERVER} \
angstrom-task-lxde.bb:XSERVER ?= "xserver-xorg \
angstrom-task-lxde.bb:  ${XSERVER} \
task-gmae.bb:            ${XSERVER} \
task-openmoko-ui.bb:XSERVER ?= "xserver-kdrive-fbdev"
task-openmoko-ui.bb:  ${XSERVER} \
task-x11.bb:XSERVER ?= "xserver-kdrive-fbdev"
task-x11.bb:XSERVER_COMMON ?= "xserver-kdrive-common"
task-x11.bb:XSERVER_COMMON_shr = "xserver-common"
task-x11.bb:  ${XSERVER} \
task-x11.bb:  ${XSERVER_COMMON} \

But in another hand bug20 is a not yet released machine,so nobody would
have built for bug20 apart buglabs people.

So I think it's ok.

Denis.



