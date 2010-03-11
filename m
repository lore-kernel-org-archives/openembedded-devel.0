Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NpahG-00030F-Pk
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 06:12:42 +0100
Received: by fg-out-1718.google.com with SMTP id 19so236494fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 21:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=rs6tGlJaih8OeAtUpOx+H/S2AtcTEFPcLYxF7/FCjz8=;
	b=Dr+3vkdfJSO/XFLHaGOZEE01WcQJyDN9oVKmpQBqw5oPbvTM+ijvLVtraqv+9Mg8SL
	hnzd/NsFwBqp4bPhK9QPoY/+TlMMJgbLbOVFSXH6sZBvMAdbwlq+jOh6DkLzZHRXJ9Zo
	3k8b8zdFWdYJAgEqag1xX7sS06xQWY0T9a7CM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=TAoKwVuHmFZ+C0JnfSKhEq1qd839pDd7O/dvYkMpe+DIpixsDeCVT66MQei4SpWZzc
	GW4ytgdSAFjWA9kTC24XYPkheLkZR5hOFWW343VJU4PV9rkJ8j0sSDMLUOR0ATobKTa9
	slDLTiCEqgcPkbD7vNJJX0KsKUxtNkni1B4ug=
Received: by 10.87.45.20 with SMTP id x20mr4398575fgj.63.1268284178862;
	Wed, 10 Mar 2010 21:09:38 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1667783fxm.2.2010.03.10.21.09.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Mar 2010 21:09:37 -0800 (PST)
Date: Thu, 11 Mar 2010 06:10:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100311051047.GP31945@jama>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
	<20100228221056.GG30145@xora-desktop.xora.org.uk>
	<ac9c93b11002282328l61356cc1y188b47d0f974369e@mail.gmail.com>
	<ac9c93b11003100744g5eee3250me7f0b668e8727060@mail.gmail.com>
	<20100310160116.GO31945@jama>
	<ac9c93b11003101229s6a23a40ayb0ba2f220369086a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11003101229s6a23a40ayb0ba2f220369086a@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Thu, 11 Mar 2010 05:12:42 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 10, 2010 at 09:29:27PM +0100, Frans Meulenbroeks wrote:
> 2010/3/10 Martin Jansa <martin.jansa@gmail.com>:
> > On Wed, Mar 10, 2010 at 04:44:48PM +0100, Frans Meulenbroeks wrote:
> >> Time for a summary I guess:
> >>
> >> original proposal from me:
> >> Probably the best scenario is to remove all versions which
> >> - are not the latest version
> >> - are not  pinned with  PREFERRED_VERSION  in conf/distro/*
> >> - do not have the largest DEFAULT_PREFERENCE
> >
> > I think this rules are quite strict, in first iteration would be enough
> > to keep only latest from each "major" version
> >
> > where major version is defined by common-sense (ie first 2 version
> > number for xorg, but somewhere first number is enough)
> >
> > ie for xserver-xorg:
> > ../dev/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
> > ../dev/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
> > ../dev/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
> > mv ../dev/recipes/xorg-xserver/xserver-xorg_1.4.bb
> > mv ../dev/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
> > ../dev/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
> > mv ../dev/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
> > ../dev/recipes/xorg-xserver/xserver-xorg_1.7.4.bb
> >
> > and update preferred-xorg-versions (1.7.1->1.7.4) and other if needed
> >
> >> opinions:
> >
> > JaMa: move older minor versions to obsolete, keep latest for each "major"
> 
> Noted!
> 
> (but for my understanding:why do you see it useful to retain old
> versions that are not pinned. For xorg, being a complicated and big
> thing I can partly understand it, but is there really a point in

Yes that's where I expect it could be difficult for some machine
maintainer to jump from ie xserver-xorg-1.4.bb directly to 1.7.4, but
moving to 1.4.2 should be quite painless.

But I expect that that even removing some minor version of not so important 
xorg-app can create a bit work, as new one will need ie newer
util-macros and newer util-macros maybe won't work with so old xserver
etc.

> keeping old versions of e.g. transmission? (noting that if needed they
> can always be recovered from git).

There is only one major version of transmission for me 1.x, so there
would be only one latest.

In most places it would be best to ask package maintainer / person who
added most versions to do a cleanup or send him cleaning patch for ack.

There is at least of latest versions with D_P -1 (and enabled for some 
distro) where is maybe D_P not needed anymore and can be removed.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


