Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCdrg-0003tK-B8
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 21:14:39 +0200
Received: by fxm11 with SMTP id 11so1604546fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=XQLxkHuTVZMxi0c8tNqkrn55ZIfzQ7PueMM/6DTQaEk=;
	b=NlgQ6yxRvk+ixirqg7Z/gDF0c7TSnPBmMhXobqYy17Ia1qFSESOds6GKXfcHBcDMip
	mli+1SO4kTglOiD2wc8tWi7knz3FGN/x0rz82FiF1vaWc/D1Dph23t3meDzUbuGLNIXv
	dmGhouQaoN/17mfgvy6vz/G71pvoL0uBwe2pA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rb5O6cB2Z8MgTv++Ce9eKjaQ7Kf0jijpAxR7R6MunsP4LOY5OX5DDsc6/6YWGsAhei
	fhdMlONppkr34xd5p2fZeqnr9b151VUX8PBsvu07mzGDJiAx7xCZ34PvK2shlYIF6D0R
	NJ32/RQ1HoiMESR7+klRjVkXT313mszsyBEvY=
Received: by 10.223.64.205 with SMTP id f13mr308309fai.98.1273777840784;
	Thu, 13 May 2010 12:10:40 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j23sm7122547faa.2.2010.05.13.12.10.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 12:10:39 -0700 (PDT)
Date: Thu, 13 May 2010 21:10:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513191042.GN3370@jama>
References: <1273771027.8785.26.camel@gnutoo-desktop>
MIME-Version: 1.0
In-Reply-To: <1273771027.8785.26.camel@gnutoo-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Handling different touchscreen calibration systems
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
X-List-Received-Date: Thu, 13 May 2010 19:14:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2010 at 07:17:07PM +0200, GNUtoo wrote:
> *om-gta02 has an evdev driver which requires to feed /sys nodes with
> some calibration data,the script used is an Xsession.d script that uses
> xinput-calibrator

To be a bit more exact:
om-gta02 in SHR is using calibration of kernel driver through /sys, just
because it was first working solution, then we added possibility to use
xinput-calibrator (but that's used from Xsession.d script only after user 
manually starts it once - on some units it's more precise after own
calibration than with precalibrated kernel driver - no idea why)

> I had the idea of making recipes for handling int scripts or Xsession.d
> scripts,and including them in XSERVER in the machine configuration but
> I'm not shure it's a good idea.

SHR moved from xserver-kdrive-common to xserver-common, but default
stayed kdriver in task-x11. Would be great if other distros using
xserver-kdrive-common decide to join xserver-common camp and make your
changes only in one.

BTW: biggest change for switch from kdrive was to check/fix Xsession
script to never kill shell which is using them. They were launched in
new shell in kdrive and exit call was ok, but with xserver-common they
are sourced to Xsession script and calling exit stops Xorg loading.

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


