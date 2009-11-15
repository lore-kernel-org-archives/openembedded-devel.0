Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N9mNF-0005H5-R4
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 22:11:08 +0100
Received: by fxm1 with SMTP id 1so4784001fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2009 13:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Zc1lnuWGhvEGw4xSrlx/GfQeQskxPhzvw25bSFU22EA=;
	b=vmWJ+0JK97BK3gyKKKPtxMkKelkfcCXUs7kJQzplmgDU2B2YDq5dn2SO4HL404GIfo
	CXC2iRSxC04piMGeh003lfw6Ode8qJs0eauj2+mLACBWXPJ43wbj54DSL2A7RaOgfr5o
	3yEHT7/z9dIzX2SxoNcgoitAC5MJbZ92sGdhs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QVYfjy4Zd9oCHp7ODH51x9GbbYkVPjBV+aJ8ioLLms7/4QngF9uIP6aYD/UcVv4w5b
	410bQTMWEF2sqlhnjJ0WdPKwEuh0RVgD7cCwj0gfKlE1dxDvlKD9FEBY7usnbj4NYMKH
	7g/Lk01IEcJc59yIdVuifR2n6UHjc7CB5o9+I=
Received: by 10.204.7.153 with SMTP id d25mr3785633bkd.70.1258319384173;
	Sun, 15 Nov 2009 13:09:44 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1849795fxm.11.2009.11.15.13.09.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 15 Nov 2009 13:09:43 -0800 (PST)
Date: Sun, 15 Nov 2009 22:09:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091115210956.GB3317@jama>
References: <4B00654D.3010507@balister.org>
MIME-Version: 1.0
In-Reply-To: <4B00654D.3010507@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New parse error in dev
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
X-List-Received-Date: Sun, 15 Nov 2009 21:11:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 15, 2009 at 03:32:13PM -0500, Philip Balister wrote:
> Commit:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=f18414059f60ec5924a702a227069aac09f19a0b
> 
> I don't see a quick fix, can someone knowledgeable about shr please
> fix this ASAP.
> 
> Philip

Sorry for that.. fixed with 29d6bcd8585aff0833eb88c06c3cc2474675c25c

Just removed that inherit, libmodulo was only user of girepository class
so we'll add it to libmodulo recipe directly if still needed (need to
ask mickey before..)

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


