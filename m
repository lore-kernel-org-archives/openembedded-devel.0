Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LnyLB-0007it-3U
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Mar 2009 18:58:34 +0200
Received: from andromeda.vanille.de (e180130176.adsl.alicedsl.de
	[85.180.130.176])
	by drlauer-research.com (Postfix) with ESMTP id 2DD23584162
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 19:23:21 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Mar 2009 17:56:30 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-11-generic; KDE/4.2.0; x86_64; ; )
References: <20090329151859.F156EE806C@amethyst.openembedded.net>
In-Reply-To: <20090329151859.F156EE806C@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200903291856.30655.mickey@vanille-media.de>
Subject: RFILES (was: ltp: Fix two QA issues; .debug leak and GNU_HASH.)
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
X-List-Received-Date: Sun, 29 Mar 2009 16:58:36 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 29 March 2009 17:18:59 GIT User account wrote:
> -FILES_${PN}-dbg =  "${libexecdir}/ltp/*/*/*/*/*/.debug"
> +FILES_${PN}-dbg  = "${libexecdir}/ltp/*/*/*/*/*/*/*/*/*/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/ltp/*/*/*/*/*/*/*/*/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/ltp/*/*/*/*/*/*/*/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/ltp/*/*/*/*/*/*/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/ltp/*/*/*/*/*/.debug"
>  FILES_${PN}-dbg += "${libexecdir}/ltp/*/*/*/*/.debug"
>  FILES_${PN}-dbg += "${libexecdir}/ltp/*/*/*/.debug"
>  FILES_${PN}-dbg += "${libexecdir}/ltp/*/*/.debug"
>  FILES_${PN}-dbg += "${libexecdir}/ltp/*/.debug"

That's truely insane. I know there's currently no other way to do it like 
that, but I'm willing to offer a bounty of like100 USD for someone who 
implements the RFILES idea -- specifying FILES through regular expressions.

:M:


