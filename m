Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJY0H-00008I-3H
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 21:56:18 +0100
Received: by pwi8 with SMTP id 8so1159912pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 12:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Ir6vnERjimUlyZMicVmnYagklHlpV8lGCKtQ2A1gBT8=;
	b=xmAbzcBErsSrlBOD6GpJ8/anJEle4pllj0utwCWsIHHagczny5PJgdwwLKQ25AITgi
	avhSVQOKxc9F+try1QA+VFT17JskT0udj02A6muGccUHy6/B2mA7e41Kw4IYqFpBTKLE
	zcIyM18dF3FFwspRDj3GdPofZYz+r8dHJN+PQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ThLAbf/kfy9B/StNHaHwnsa15jBc283hoXZG7/No6xoh2vJT6NeMCsXEb0fBSirfAB
	v71xgUWIaBVPTcha4G8PT1Oz1U+UlOz9U2C/bMi+uidzLe6SK+m2wSpBvF1erycYt0g2
	6qHRVUmVJvrltSEkDBoQlcX4LoxXtSjwm9Udk=
Received: by 10.142.224.11 with SMTP id w11mr2209081wfg.126.1290200102948;
	Fri, 19 Nov 2010 12:55:02 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm2322364wff.16.2010.11.19.12.55.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 12:55:01 -0800 (PST)
Date: Fri, 19 Nov 2010 12:54:27 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119205427.GB8017@gmail.com>
References: <1290166423-9801-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1290166423-9801-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [release-2010.12] shr: bump SRCREVs to versions compatible with latest EFL
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
X-List-Received-Date: Fri, 19 Nov 2010 20:56:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/11/10 12:33), Martin Jansa wrote:
> * can I also remove shr-autorev from shr.conf (just for release
>   branch?), because it's likely that after some time shr-autorev will
>   pick revisions no longer backward compatible with tagged revision
>   of OE (ie EFL)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

hmmm ok. will you commit it to master and then cherry pick into release
branch

> ---
>  recipes/shr/e-wm-config-illume2-shr_git.bb |    2 +-
>  recipes/shr/libphone-ui-shr_git.bb         |    2 +-
>  recipes/shr/libphone-ui_git.bb             |    2 +-
>  recipes/shr/shr-settings_git.bb            |    2 +-
>  recipes/shr/shr-wizard_git.bb              |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/shr/e-wm-config-illume2-shr_git.bb b/recipes/shr/e-wm-config-illume2-shr_git.bb
> index 171050f..fae58f5 100644
> --- a/recipes/shr/e-wm-config-illume2-shr_git.bb
> +++ b/recipes/shr/e-wm-config-illume2-shr_git.bb
> @@ -3,7 +3,7 @@ SECTION = "e/utils"
>  DEPENDS = "eet"
>  LICENSE = "MIT BSD"
>  RDEPENDS_${PN} = "shr-e-gadgets"
> -SRCREV = "bed3a9ac381b88717b153012fa4b9da0c860c6b0"
> +SRCREV = "ac32cc259883be1602e51f8496c96bc381513b38"
>  PV = "1.2+gitr${SRCPV}"
>  PR = "r6"
>  
> diff --git a/recipes/shr/libphone-ui-shr_git.bb b/recipes/shr/libphone-ui-shr_git.bb
> index 6162bb5..75debca 100644
> --- a/recipes/shr/libphone-ui-shr_git.bb
> +++ b/recipes/shr/libphone-ui-shr_git.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "SHR default module for the Phone UI daemon"
>  SECTION = "e/apps"
>  DEPENDS += " dbus-glib libframeworkd-glib libfsoframework libphone-ui evas ecore edje edje-native elementary"
> -SRCREV = "cced1441a94b08af7576c58f3c7ee29a679ecfeb"
> +SRCREV = "98bdc18ae2e09e6a6d357ecdc204fd007a9b562b"
>  PV = "0.0.1+gitr${SRCPV}"
>  PR = "r1"
>  
> diff --git a/recipes/shr/libphone-ui_git.bb b/recipes/shr/libphone-ui_git.bb
> index f874aac..e1731fe 100644
> --- a/recipes/shr/libphone-ui_git.bb
> +++ b/recipes/shr/libphone-ui_git.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "A generic framework for phone ui"
>  HOMEPAGE = "http://shr-project.org/"
>  LICENSE = "GPL"
>  SECTION = "libs"
> -SRCREV = "e031bdc36168da3c821c36fe470eb920c41ea92b"
> +SRCREV = "7f98b9eabf8b6710b2b08ac66f02a633dc3a9d71"
>  PV = "0.0.1+gitr${SRCPV}"
>  PR = "r0"
>  
> diff --git a/recipes/shr/shr-settings_git.bb b/recipes/shr/shr-settings_git.bb
> index d65f81d..b7e3d34 100644
> --- a/recipes/shr/shr-settings_git.bb
> +++ b/recipes/shr/shr-settings_git.bb
> @@ -4,7 +4,7 @@ SHR_RELEASE ?= "shr"
>  LICENSE ?= "GPL"
>  RDEPENDS_${PN} = "python-elementary python-dbus python-codecs python-shell python-pyrtc python python-core python-edbus dbus-x11 frameworkd python-phoneutils python-pexpect"
>  SECTION = "x11/application"
> -SRCREV = "cc7917afdc958443e9110004b3adb38af65ad16e"
> +SRCREV = "e94cb974d08a242c8def89aca43da00124080368"
>  PE = "1"
>  PV = "0.1.1+gitr${SRCPV}"
>  PR = "r12"
> diff --git a/recipes/shr/shr-wizard_git.bb b/recipes/shr/shr-wizard_git.bb
> index 1d2353c..89a1669 100644
> --- a/recipes/shr/shr-wizard_git.bb
> +++ b/recipes/shr/shr-wizard_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPL"
>  DEPENDS = "e-wm"
>  RDEPENDS_${PN} = "python-elementary shr-settings python-phoneutils e-wm python-dbus python-edbus"
>  SECTION = "x11/application"
> -SRCREV = "0342a0b36ab3df7e980fe7a045c905cee8f2a7e8"
> +SRCREV = "18690ac56e303f3e0fe48e684da2e57d3ed68201"
>  PV = "0.0.0+gitr${SRCPV}"
>  PR = "r8"
>  
> -- 
> 1.7.3.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


