Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLQwC-000814-6y
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 03:15:36 +0200
Received: by pvh1 with SMTP id 1so770538pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 18:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OEIKbqgrexXPbOiOz4+bXFqplebo/xjudwxRUKfuUVI=;
	b=s0PrGFWMG1ffdfjCapl1DezUTpd7jNmVOqwKQDLUq6Nbz8MfWXpCzf1TEJqZ31o3Z3
	Eo5F5dX+Ebms1/DniNFvAijJCrUHVF7KYoa+0s1XQlQELgzYinsEkBhYS8xOuMUm/OnJ
	Szj05TJJy1HDp8RO837ylRcwlSMs/5ijSHCjI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pA++hdcDU1xnZPao5XaLPQZGi05TdFE+RTZ8feosQ0vzY9AAWpwZQF6ay7+p/1ueGN
	53GimQgzozyYAcr/Wh36cxTBGEuIEQ4dqJArQEB01x5J3Xw8xAt8RJ1O7vz38CmUC0IB
	V0T0m2HFWzQwx1vChcA5dCQHROX7cQv/igJzg=
Received: by 10.115.99.2 with SMTP id b2mr11030793wam.131.1275873074122;
	Sun, 06 Jun 2010 18:11:14 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n29sm33841839wae.16.2010.06.06.18.11.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 18:11:13 -0700 (PDT)
Date: Sun, 6 Jun 2010 18:11:16 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607011116.GF6723@gmail.com>
References: <alpine.DEB.2.00.1006061411390.3532@lynx>
	<hugq1i$olq$1@dough.gmane.org>
	<AANLkTimwz1pr4HKVubzUurl_Kqx9MXGbzJKTVQ4WnJjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimwz1pr4HKVubzUurl_Kqx9MXGbzJKTVQ4WnJjA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] matrix-gui, udev: Remove superfluous "patch=1" parameters.
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
X-List-Received-Date: Mon, 07 Jun 2010 01:15:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (06/06/10 12:19), Chris Larson wrote:
> On Sun, Jun 6, 2010 at 11:39 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 06-06-10 20:13, Robert P. J. Day wrote:
> > >
> > > Any file reference that has a suffix of ".diff" or ".patch" has no
> > > need of a "patch=1" parameter.
> > >
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > Acked-by: Koen Kooi <k-kooi@ti.com>
> >
> 
> Acked-by: Chris Larson <clarson@kergoth.com>

applied

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


