Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NDalH-0007EM-Hq
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 10:35:42 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id A627D1C15EA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 10:34:09 +0100 (CET)
Received: from mrdenker.palutemo (unknown [188.174.20.204])
	by mail.mnet-online.de (Postfix) with SMTP id 64B0E9086F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 10:34:08 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Thu, 26 Nov 2009 10:34:09 +0100
Date: Thu, 26 Nov 2009 10:34:09 +0100
From: Klaus 'mrmoku' Kurzmann <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091126093409.GA19254@mrdenker.palutemo>
References: <heldod$obj$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <heldod$obj$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: e-wm-menu problem
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
X-List-Received-Date: Thu, 26 Nov 2009 09:35:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 26 Nov 2009, Koen Kooi wrote:

> Hi,

> Lately I've notice a problem when building and installing e-wm: it
> drags in e-menu-shr. It's due to (improper) usage of RPROVIDES +
> RCONFLICTS.

> My proposal is that images should choose which applications.menu
> they are using (the one from gnome-desktop, e-wm, e-menu-shr-etc)
> and have e-wm stop RRECOMMENDING it.

> The basic patch looks like this:

> --- a/recipes/e17/e-wm_svn.bb
> +++ b/recipes/e17/e-wm_svn.bb
> @@ -3,7 +3,7 @@ DEPENDS = "eet evas ecore edje efreet edbus"
> -PR = "r7"
> +PR = "r8"

> @@ -90,7 +90,6 @@ RRECOMMENDS_${PN} = "\
> -  ${PN}-menu \

> --- a/recipes/shr/e-wm-menu-shr_git.bb
> +++ b/recipes/shr/e-wm-menu-shr_git.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "illume SHR applications.menu config"

> +PR = "r1"

> -RPROVIDES_${PN} = "e-wm-menu"

> And then a + <menu of choice> in your tasks and/or images.

> What do you think about it?
Fine for us - will just add it to the SHR image... And sorry for
breaking it :|

> regards,

> Koen

Thanks

-- 
Klaus 'mrmoku' Kurzmann


