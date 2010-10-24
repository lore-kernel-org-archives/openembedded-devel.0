Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9uGm-0005GP-H8
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 08:41:32 +0200
Received: by fxm3 with SMTP id 3so2005884fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 23:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=M1j2saqX39DvuxezgvFdD9ya+hYEyb4k7ABQZpV0/zg=;
	b=Fz744+2PQGGMRrJS1cbMleQ7VrIdoVa9YE7V4f/5Xgehn1pkJOtT8ioDHhO1tgvMOP
	5pbDchNlRLpDK5Yk3/tmfw2l+UGjpfj9FJcQn18wvj2Y7xFgVNbr/AJPIv5m12w8hP6Y
	HUUvgr1svX063yVUWx+uwrwzrmelcoXO4O61g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=kkdQOytDJ8rUaFmRuq/LEWxT43sY+qdDlYTUALyE/lOqV73dCxcqvqoOiFcfppqvww
	iEJCxt4GybA32NU/nFn4VpBmMO4jpr2zBMwYxAt0lr+7r5RqTMU96Pf9biNe8s6fd0Ks
	MikN+xYUnSlEwVzMA5xC9TnEtrGYdwF5hbM14=
Received: by 10.103.52.20 with SMTP id e20mr6254775muk.65.1287902446417;
	Sat, 23 Oct 2010 23:40:46 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a10sm2245595fak.27.2010.10.23.23.40.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Oct 2010 23:40:45 -0700 (PDT)
Date: Sun, 24 Oct 2010 08:40:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101024064052.GF3494@jama>
References: <AANLkTi=fqKeS6eu1H5mS-C7rQeJPndf8Xchpghaxjh_d@mail.gmail.com>
	<AANLkTikLYDaYCXeg+T0Vn8inWv9v72BTN6hHNKcPZ77V@mail.gmail.com>
	<20101024062941.GE3494@jama>
	<AANLkTi=rT5aLA47ZTpXKOiJyMOW5NGV=uYckTK2523nJ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=rT5aLA47ZTpXKOiJyMOW5NGV=uYckTK2523nJ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Explaining the patches that will be send ...
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
X-List-Received-Date: Sun, 24 Oct 2010 06:41:35 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Oct 24, 2010 at 04:32:53AM -0200, Fabiano Fidêncio wrote:
> On Sun, Oct 24, 2010 at 4:29 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Oct 22, 2010 at 10:13:40PM -0200, Fabiano Fidêncio wrote:
> >> Howdy!
> >>
> >> Guys, I'll send a lot of patches made by Eduardo Lima (Etrunko) and I
> >> via git send-mail.
> >>
> >> This patches are creating/fixing svn build from some
> >> {EFL,LMS,WebKit-EFL} packages and are keeping in three differents
> >> branchs of my git tree. All of this are rebased with the latest HEAD.
> >>
> >> Please, apply if correct :-)
> >
> > Today I'll apply those where was no reply from me or koen, for the rest
> > please send updated patches with v2 prefix.
> 
> Many thanks :-)
> 
> >
> > for next time please prepare commit message wrt Commit Policy
> > http://wiki.openembedded.net/index.php/Commit_Policy
> 
> So sorry about that.
> 
> I'll fix the patches and resend ASAP :-)

not needed for those which I plan to apply (already fixed messages here)

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


