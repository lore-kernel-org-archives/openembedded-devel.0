Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OANMB-00078m-KM
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 15:12:47 +0200
Received: by fxm11 with SMTP id 11so782447fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vWuRYUJzDLsweJGKUq+og5x0Ml4Z25DAcCvtKlZqlZs=;
	b=VNe8zK6AIXg2wE/x6LK2t0KzU07oembZQoxIfSG1qi7Tf1BuXcuUagdelqrUgMR8hB
	AglDc/gFw6mUhY9qdCLoqFKVuagXE7Uv2Nn99Te9bLkkGeZ90pkHGMgFblckhA+I1n72
	UtELTYEgkFh/NIahqA4rMGLqREXh355GFNHGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QY40tC1Pngmf9o8ih1FdltcJG2JDAsGZ/+ZFnxq5tdaSdpVTI9lOMWPSBpCRTfCiLK
	nhYN4nNXVnLj5td0J/A4lYME0YIOX1mro86PmjFO1IavDlWAWsqLU8Fo9zg+wlz4cbl/
	biIsDSxZ3YfyOeN4apV7II3q9HLSxLxu1CCks=
Received: by 10.223.161.211 with SMTP id s19mr6538100fax.47.1273237734186;
	Fri, 07 May 2010 06:08:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j23sm6613296faa.14.2010.05.07.06.08.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 May 2010 06:08:53 -0700 (PDT)
Date: Fri, 7 May 2010 15:08:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507130851.GG3204@jama>
References: <4BE25BFD.2090204@dresearch.de> <hrtmn1$bp1$3@dough.gmane.org>
	<4BE3C542.4070603@dresearch.de> <4BE3F2AE.8060305@dresearch.de>
	<20100507110900.GF3204@jama> <4BE40F58.2000905@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BE40F58.2000905@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: All the syslogs
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
X-List-Received-Date: Fri, 07 May 2010 13:12:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2010 at 03:02:16PM +0200, Steffen Sledz wrote:
> Am 07.05.2010 13:09, schrieb Martin Jansa:
> >> When opkg installs the packages it wants to run update-rc.d *before*
> >> update-alternatives. This results in an "file does not exist" error. :(
> >>
> >>   Installing rsyslog (5.5.4-r1.0.5) to root...
> >>   Installing busybox-syslog (1.13.2-r24.1.5) to root...
> >>   Configuring rsyslog
> >>   update-rc.d: /etc/init.d/syslog: file does not exist
> >>   update-alternatives: Linking //etc/init.d/syslog to syslog.rsyslog
> >> Any suggestions?
> > 
> > If there is only one u-a file in recipe you can try
> > inherit update-alternatives to see if it will generate postinst commands
> > in right order.
> 
> Sorry, sometimes more than one.

Yeah sort of expected that :/.

> > Or in worse case, move update-rc.d logic to your postinst scripts after
> > setting u-a links.
> 
> Would be a
> 
>     touch {sysconfdir}/init.d/syslog

:) also option, but u-a should at least show warning that link file is
not and link and in worse scenario refuse to replace non-link file with
link to alternative (IIRC the case for u-a-cworth and his variant
included in opkg).

What I had in mind was adding:
update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
after u-a call in postinst and similar
update-rc.d $OPT ${INITSCRIPT_NAME} remove
in postrm, etc.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


