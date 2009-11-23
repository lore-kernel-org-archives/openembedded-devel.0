Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCacS-0000O0-Be
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:14:28 +0100
Received: by bwz19 with SMTP id 19so5128706bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 07:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=GYpmp1EQWlPjZZANSEEZnKVa/I6Q+kCwT4BaBYn1CVo=;
	b=snZ9PsPOO0jPNMdjR8bDVDmTzfwHceOO9ltIUHs3x0HPKssli6Nj0/HDXnSVBhWidc
	0MPi243MP7RFycz3XobmdsSJAtMj7zCbmjIgG5lvc9upoMVAn6HoWmDOSIZHiQ0TQY+/
	Z2MVkUW6nlEvt+AQMInRH5Tk+0D3kAawA2grY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ca956QUgUsDM7z+Lj1H7J5CRguFx7o5oDD/s+nQgDodJ0xmunDF+WpceE26uA6eM/N
	ZId/XqGmzmS3Ytwv6J0FlKbJr7QzwcQXJ96ciSJ7hMEgNsK2TLRDOQhFmOcC31VQFzBd
	ZNGFDkAhJS5CWwr3jJVfB9HPLgr8dge+/jG/Q=
Received: by 10.204.10.136 with SMTP id p8mr4947586bkp.56.1258989176175;
	Mon, 23 Nov 2009 07:12:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1410907fxm.0.2009.11.23.07.12.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Nov 2009 07:12:55 -0800 (PST)
Date: Mon, 23 Nov 2009 16:12:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091123151256.GH3349@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<20091122190547.GC3349@jama> <hedfru$gol$1@ger.gmane.org>
	<1258978516.10321.79.camel@dax.rpnet.com>
	<hee2r8$bav$1@ger.gmane.org>
	<1258986598.10321.99.camel@dax.rpnet.com>
	<hee82a$td1$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hee82a$td1$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 15:14:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2009 at 04:00:26PM +0100, Koen Kooi wrote:
> On 23-11-09 15:29, Richard Purdie wrote:
> >On Mon, 2009-11-23 at 14:31 +0100, Koen Kooi wrote:
> >>On 23-11-09 13:15, Richard Purdie wrote:
> >>
> >>>As I understand it you'll lock locking down the local build revisions
> >>>with Angstrom anyway?
> >>
> >>Dunno about that, ideally the SRCPV merge should have no impact at all
> >>on existing distros, but it looks like everyone will be forced to lock
> >>revisions/counts down.
> >
> >How is locking the counts down using LOCALCOUNT any different to the
> >current situation?
> 
> In the current situation you lock down SRCREV and change PV,PR
> accordingly. In the new world you lock down SRCREV, increase
> localcount (per recipe or globally) and change PV,PR accordingly.

Why do you need to change PV,PR if you bump LOCALCOUNT?

> I just went from a 2 step error prone situation to a 3 step error
> prone situation. And I need to track an *extra* variable as well
> now.

I see only 1 step in one place (SRCREV+LOCALCOUNT in sane-srcrevs or
recipe). And as long as its in the same file, it can be a bit less
error-prone then change of SRCREV in sane-srcrevs and PV/PR bump in
recipe.

> regards,

regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


