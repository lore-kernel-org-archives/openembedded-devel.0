Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ObsBa-0007ht-Uc
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 11:35:30 +0200
Received: by fxm12 with SMTP id 12so4180565fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=G5ylBpJA86UDf4954ulEEaMgnUDzwRreHuAnlo87TtI=;
	b=q9AuxhcxMFoXEn+r/WLX7MbKwuQIfdoMoREgY9T3nRZUDKQVDHWap6d112PC+i9jSh
	tiWXA1SyLsxbsQx+LyOUjIxqIeLwwmLbVmTZ3lZ3HW0IAi2HNc5cmyUSUseKjpTv9/q3
	0TGn1InvW3TTdozqJttiCuSFJl0bQg6bAiayw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IllMjaXS4wAjA84lFxFgOA4DUr/YQLA2dGyEjOBg+3X5iFQL40hrupMVHbczaybs5G
	6TeDOmRilS6u9NbWu7Vlypu0ToQWQCbRcmYQDy/Xs5PNPd8e91Ds9087JAZaLlv6K8e+
	swh315ooP6Go1d6uNcju99z5aoHLu7LzwRPdA=
Received: by 10.223.121.193 with SMTP id i1mr1515960far.77.1279791313671;
	Thu, 22 Jul 2010 02:35:13 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id h4sm3248845faj.39.2010.07.22.02.35.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 22 Jul 2010 02:35:12 -0700 (PDT)
Date: Thu, 22 Jul 2010 11:36:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100722093606.GK2189@jama>
References: <4C4704CB.2010204@gmail.com> <i275t3$65g$1@dough.gmane.org>
	<4C475AC4.6010302@gmail.com>
	<AANLkTimMZU5mXUn1ZSFJ0_8aDu8ykWYDXMD55iZW8s7A@mail.gmail.com>
	<4C47E285.708@nedap.com>
	<AANLkTinUM0JSiWeRkhCDo67KqyanvDiaIRiuCiT0tpOr@mail.gmail.com>
	<AANLkTil57uQl9XRZmHY7gDTviye2YboZ0G5QyGsEZCj2@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTil57uQl9XRZmHY7gDTviye2YboZ0G5QyGsEZCj2@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg : angstrom fails console-image build
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
X-List-Received-Date: Thu, 22 Jul 2010 09:35:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2010 at 04:56:07PM +0930, Graham Gower wrote:
> On 22 July 2010 16:41, Graham Gower <graham.gower@gmail.com> wrote:
> > On 22 July 2010 15:47, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> >> I've made a completely clean build last night and it breaks at the same
> >> problem.
> >>
> >
> > Koen bumped the opkg SRCREV a couple of days ago. One of the recent
> > opkg changes was to return an error in some erroneous cases which were
> > incorrectly ignored previously (check_data_file_clashes errors are one
> > of these cases).
> >
> > Its possible that this problem was there beforehand and its only now
> > being caught because of less dumb error checking. Sorry, I don't know
> > what is causing the issue - you probably need to look at the
> > dependency graph to see why both opkg and opkg-nogpg-nocurl packages
> > are being built and installed.
> >
> > -Graham
> >
> 
> PS: pushing my opkg cleanup patch would probably fix this with no
> further need to investigate...

I have your patch in my local branch and it's not enough (one has to
remove already staged opkg-nogpg(-nocurl) first).

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


