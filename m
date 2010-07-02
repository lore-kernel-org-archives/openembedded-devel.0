Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OUZjA-0007LX-TQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 08:27:57 +0200
Received: by fxm12 with SMTP id 12so2092995fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 23:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=PScVLbdsiNJLXdSdo5UnCSnzg3aJJU3x/LOecAJvhvo=;
	b=B6PkXBvI29aa3DIYEh3egGdM/v62CmghXrRP71+TIfuJZ+lN+mqdBVbUF6cNbETzDh
	aYj0i/DzHHcS543PTS/oL3n1GMxkZ9+479HXQW28gCn0ImZfqLs+SM9ZchjBTDVQwX9D
	+oNrd7OSeqnNEX/Evbvg86ARx0Lw2q9YpMjM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BA3fD4tAetEZXdFXyX1uvPK1Rypxs0xJAEtcDLsAF2HfTuwcP1/aA3h+S5un9f1xfC
	cEU2DEWpPqhUwhuqbegk6p4Jj1PGv1ZkypAUmHfO8MplgrNEuQO0FIB7ICnNkE7efTNI
	gxE3ylgztEwo27WMv0jEvMg3K1y5fD/Sq2+b4=
Received: by 10.223.120.197 with SMTP id e5mr172993far.103.1278051791383;
	Thu, 01 Jul 2010 23:23:11 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id i1sm700222faa.5.2010.07.01.23.23.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Jul 2010 23:23:10 -0700 (PDT)
Date: Fri, 2 Jul 2010 08:22:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100702062204.GA9760@jama>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<4C2D153E.1040608@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4C2D153E.1040608@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Fri, 02 Jul 2010 06:27:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 01, 2010 at 03:22:54PM -0700, Tom Rini wrote:
> I wonder, and I have to admit to having no real gentoo background
> here, how do they solve this problem?  Did they invent their own
> package format and add another field that consists of use flags?
> That'd make some stuff a lot easier, but making deb/rpm get that
> mapping somehow seems hard at first.

They store all information about built packages in
/var/db/pkg/category/name/*

So they know which USE flags were ON and OFF when you built it, there is
also environment.bz2 where you can find which gcc version was used to
build it.

So it's easy to rebuild all installed packages if current systems
settings gives different USE flag sets then before (--newuse param) or
with small script I used to rebuild all remaining packages which weren't
rebuild after system gcc upgrade.

Lately (imho with new EAPI) they can also narrow dependencies not only
with requested version, but also with some USE flag ON or OFF.

And they have it much easier as they resolve it on target device, to
provide --newuse functionality in OE we would probably do PR bump of
all "changed" recipes.

So in the end it will be far from ideal if we try just to encode "our" USE
flags to ${PN}. 

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


