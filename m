Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTGRD-0000aN-Rd
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 18:16:47 +0100
Received: by ggnh4 with SMTP id h4so1675725ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=CY3bBUyARj4VDQAnzusVLeVb2X7SjogQn9NnFA2FrC8=;
	b=xT/6qAERNpMUnKRMIw8pBPw2hF+S6LNrmVb2Mez34hcNqoIxGWqEGQcx7HsW8ONiyr
	gCH2P9NN0Wi+y2PGmjKrT4amWV4ZULQ1WVFd1bsxmD2/vBqCDEzrllvZWK96aTY028lc
	qxOAA/YfCO3xKSpQRcpK01o0D1N/YJZ/2Rlw4=
Received: by 10.152.134.77 with SMTP id pi13mr15446686lab.21.1322068214297;
	Wed, 23 Nov 2011 09:10:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 09:09:42 -0800 (PST)
In-Reply-To: <4ECA9626.900@itPenguin.de>
References: <4ECA9626.900@itPenguin.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 09:09:42 -0800
Message-ID: <CAMKF1spuG=gmPReqtVQL8DAUgQYm8LXLuMZTVp8soc+LNU3hWg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Problem bitbaking angstrom-x-image
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
X-List-Received-Date: Wed, 23 Nov 2011 17:16:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 21, 2011 at 10:19 AM, info <info@itpenguin.de> wrote:
> Hello,
>
> I managed to create several images for my beagle board, so my configuration
> seems to work.
>
> When bitbaking angstrom-x-image I get these error messages:
>
> | config.status: creating cups/pstoraster
> | + mkdir obj
> | mkdir: cannot create directory `obj': File exists
> NOTE: package gs-9.01-r0: task do_configure: Failed
> ERROR: Function 'do_configure' failed (see
> /project/heizung/develop/openembedded/build/tmp/work/armv7a-angstrom-linux-gnueabi/gs-9.01-r0/temp/log.do_configure.15504
> for further information)
> ERROR: Task 2462
> (/project/heizung/develop/openembedded/openembedded/recipes/gs/gs_9.01.bb,
> do_configure) failed with exit code '1'
> ERROR:
> '/project/heizung/develop/openembedded/openembedded/recipes/gs/gs_9.01.bb'
> failed
>
> Is this a problem of the ghostscript package when creating the directory
> obj?
> Is there something I can do, to fix it?

It could be that directory has been created before this mkdir so using
mkdir -p in this
case instead can get you further. But please find out who is creating
this dir before
and if thats correct.

>
> Some contents of my local.conf:
> MACHINE = "beagleboard"
> DISTRO = "angstrom-2010.x"
>
> Any help is welcome,
> Roland
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


