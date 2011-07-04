Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Qdeh8-0002Cr-Ul
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 10:39:56 +0200
Received: by bwf20 with SMTP id 20so4485503bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2011 01:36:07 -0700 (PDT)
Received: by 10.205.35.1 with SMTP id su1mr5336812bkb.129.1309768566995;
	Mon, 04 Jul 2011 01:36:06 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id t9sm5341298bkn.20.2011.07.04.01.36.05
	(version=SSLv3 cipher=OTHER); Mon, 04 Jul 2011 01:36:05 -0700 (PDT)
Message-ID: <4E117B74.9080904@dresearch-fe.de>
Date: Mon, 04 Jul 2011 10:36:04 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309419211-20670-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1309419211-20670-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH] udev: avoid udev stopping persistent pppd connections
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
X-List-Received-Date: Mon, 04 Jul 2011 08:39:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.06.2011 09:33, Steffen Sledz wrote:
> From: Mario Schuknecht <schuknecht@dresearch-fe.de>
> 
> When a pppd session is disconnected it triggers the udev to ifdown the
> ppp link which kills pppd and inhibits a reconnection.
> 
> Now avoid udev stopping ppp connections.
> 
> See also:
>  https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/396804
>  https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/78043
>  http://ubuntuforums.org/showthread.php?t=1177021
>  http://rants.atmurray.net/2007/01/pppd-persist-not-so-persist-with-udev.html
> 
> Signed-off-by: Mario Schuknecht <schuknecht@dresearch-fe.de>
> Acked-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/udev/udev/network.sh |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/udev/udev/network.sh b/recipes/udev/udev/network.sh
> index 182c26d..d287855 100644
> --- a/recipes/udev/udev/network.sh
> +++ b/recipes/udev/udev/network.sh
> @@ -9,6 +9,8 @@ test -x /sbin/cardctl && exit 0
>  # We get two "add" events for hostap cards due to wifi0
>  echo "$INTERFACE" | grep -q wifi && exit 0
>  
> +# Avoid udev stopping persistent ppp connections
> +echo "$INTERFACE" | grep -q ppp && exit 0
>  
>  # Check if /etc/init.d/network has been run yet to see if we are 
>  # called by starting /etc/rcS.d/S03udev and not by hotplugging a device

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


