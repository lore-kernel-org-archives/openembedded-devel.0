Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NI9IQ-0005EE-Jj for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 00:16:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NI9Gp-0005pr-55
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 00:15:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 00:15:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 00:15:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 09 Dec 2009 00:13:53 +0100
Message-ID: <hfmmjh$qkr$2@ger.gmane.org>
References: <cover.1260305960.git.mike@compulab.co.il>
	<afbcd57e6833572755e535c8052474b8bc250cc7.1260305960.git.mike@compulab.co.il>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <afbcd57e6833572755e535c8052474b8bc250cc7.1260305960.git.mike@compulab.co.il>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/5] linux-omap 2.6.32: add cm-t35 support
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
X-List-Received-Date: Tue, 08 Dec 2009 23:16:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-12-09 22:11, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport<mike@compulab.co.il>

> +SRC_URI_append_cm-t35 = " \
> +file://cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch;patch=1 \
> +file://cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch;patch=1 \
> +file://cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch;patch=1 \
> +file://cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch;patch=1 \
> +file://cm-t35/0006-omap3-cm-t35-update-defconfig.patch;patch=1 \
> +file://cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch;patch=1 \
> +"
> +

Could you make those patches non-machine specific? If you put them in 
the main SRC_URI they stand a better change of being kept up to date. 
I'm going to add a lot of patches to that recipe soon and I don't want 
to break anything in the process.

regards,

Koen



