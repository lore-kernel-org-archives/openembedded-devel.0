Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHyzj-0005gR-Ih
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 13:16:46 +0100
Received: by bwz9 with SMTP id 9so4249410bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 04:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=jYDMWKEfnXY6RwiAdmw+NGL70ArsgrH6pw0X4ALTWsk=;
	b=UR3vjO6RrNLElXDMD85kmxluzUXIgrgWdGUlvFa13ESmhZddpv95598oqZ3DYoK8T0
	NHG7URU+U7cQnyUod32t/HbTOta35cympEGlmN4pn0xRWfq56l3EMe2ehUzmdNZ/xuT4
	ge0hUNlwgZD7nvGK41PGHoZjyWtsNokwCRvC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tIB0Isb5hnx4RSm4XJP1LBziwmEPDQ4WL3UY0MfZk3JY04wbgF83PGS2JhRxJwE4OK
	QWX9Q1Otgpa1om4dsZNaSh4kd3Is86VSOPnJHg/opro3Ef6t7BuvgWPiyCM2Hx0ElgH+
	AczexxEkQowYfFJ3+EPnuEojHsYa8u0QLAjXw=
Received: by 10.204.7.87 with SMTP id c23mr3656593bkc.97.1260274502563;
	Tue, 08 Dec 2009 04:15:02 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2328246fxm.0.2009.12.08.04.15.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Dec 2009 04:15:01 -0800 (PST)
Date: Tue, 8 Dec 2009 13:15:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091208121510.GE3803@jama>
References: <1260221130-4958-1-git-send-email-sgh@sgh.dk>
	<hfl1ck$sog$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hfl1ck$sog$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Unset DEFAULT_PREFERENCE for mesa-dri-7.2 and mesa-dri-7.4
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
X-List-Received-Date: Tue, 08 Dec 2009 12:16:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 08, 2009 at 09:05:40AM +0100, Koen Kooi wrote:
> What's the rationale behind this change? And why do you comment it
> when we have an scm that can track changes?
> 
> regards,
> 
> Koen

I had similar problem in xorg-7.5 branch.

Few packages depending on "mesa" directly, I replaced all with
virtual/libgl which is probably provided by all mesa variants (normal, 
-full, -dri, -xlib). 

Then we can use normal preference in all mesa recipes and select right
variant with PREFERRED_PROVIDER in machine config, right?

Can I merge those patches for depends on virtual/libgl?

Whole mesa directory seems quite messy to me.. 4 generations of mesa
recipes with own include files, 4 variants with not so bigg diff. But my
mesa knowledge wrt all oe devices isn't strong enough to encourage me to
cleanup it a bit (I'm glad that mesa-dri-7.6 works good with spitz and
for om-gta02 we use mesa-dri_git with special glamo DRI patches from
Thomas White's branch).

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


