Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nr5aS-00039V-5o
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:23:44 +0100
Received: by fxm25 with SMTP id 25so184496fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YlJZyU5NIW4OQ3prgMAIh2Me1PlTLmF//FoLVM153jc=;
	b=rSWrbH9XJcUjeRpwa9EoHMTOaoRMixx/ksxsAljSak8tpFr11ABW3RCkUmGOvj1KuR
	YAVS4PmU+Cb392LacXuQgNj8F3FISKnleO6898fpgweCzrno56xCoHfozY6dzh3942d3
	s6M1/2lKacgnlm1QkCU2NQQuKpRRBeCECju0M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ae9YG6/NfhdnP4eEdNYSlmnwUQ/bJgc2IphDmGpYTyNsPm6T2bobf/Evhe9CYxi73p
	QJ++ux/Aydv+mx71KTNght7OXrfbQN8NnLUVsRNpF2cwNDIzzvtAHD5R6oojjhkwgC11
	YuBnaFIhdGJ8jCRouSkjdDTZqExb7a2oEhMgk=
Received: by 10.223.15.65 with SMTP id j1mr1739479faa.0.1268641242602;
	Mon, 15 Mar 2010 01:20:42 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm2876358fxm.14.2010.03.15.01.20.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Mar 2010 01:20:41 -0700 (PDT)
Date: Mon, 15 Mar 2010 09:20:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100315082039.GC3370@jama>
References: <201003081300.19058.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
	<ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
	<201003150846.33517.holger+oe@freyther.de>
	<ac9c93b11003150108v70781eb6re16d6212c454637e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11003150108v70781eb6re16d6212c454637e@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 08:23:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2010 at 09:08:24AM +0100, Frans Meulenbroeks wrote:
> > 3.) Remove recipes for vulnerable software when no one is updating them in
> > time... This can be combined with option 2...
> 
> These are good plans, but I'm not sure if you will get volunteers for
> 2 and people will definitely complain if you do 3.

For security issues would be nice to adopt some form of Angstrom
blacklist class and put blacklist entry for all vulnerable recipes in
some security-blacklist.conf included from bitbake.conf.

This way it would be easy to show why the recipe is not available (CVE
noted in message shown by blacklist when some image tries to pull that
recipe).

Also it would allow easy blacklist removal for people who don't care
about security and easy to return recipe if someone cares and puts
enough time to fix that issue.

But current code would probably need to extend for blacklist based on
PN-PV not only PN (which someone already proposed for blacklisting old
recipes).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


