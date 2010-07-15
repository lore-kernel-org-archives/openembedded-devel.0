Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OZIw3-0003DY-Qj
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 09:32:48 +0200
Received: by bwz10 with SMTP id 10so443623bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vYVspHQiW4/AM1b/d4KimEtS1ol/Pka/rY7vHjCCCWo=;
	b=xizoK10bcTKUxRJim+CvG5aOt0JyD2l2i161tKCXxj79brdguejxARZg0PBd9ImJ1E
	CR34WSpykWTVYCP+oyyz3inJ7gtvXkl7Dyhp4IfX6sACG7yjK+OXGUBSwEB36DWJDB2d
	KtKwW4f6xHlY6OhU5NKorI4pmA9ULSdY7Qg9w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KRW8K1eBPdFzzvIwuMYD7iXEGjN3bxxUsVBGopMZdcK9jpMq6p9OUdfmcQee/XxA9g
	41th/0IbuaVTa7cscMKS24D3Q43lMVSXcQGkvCDAZxrV4zCZ37CwF9KijaqyzI2zg0KX
	nbmF2gqY/NRlqtG4iYmZMxkY1KXN7lUn+JHm8=
Received: by 10.204.126.196 with SMTP id d4mr2485129bks.100.1279179165279;
	Thu, 15 Jul 2010 00:32:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 24sm4681167bkr.19.2010.07.15.00.32.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 00:32:43 -0700 (PDT)
Date: Thu, 15 Jul 2010 09:32:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100715073247.GB5745@jama>
References: <4C2AC77A.70102@gmail.com>
 <4C2ACDE8.7080801@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C2ACDE8.7080801@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Thu, 15 Jul 2010 07:32:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2010 at 02:24:00PM +0930, Graham Gower wrote:
> None of the distros in OE appear to want/need gpg or curl support in opkg;
> so have opkg.inc remove them by default. This diff makes things more consistent
> across all distros/tasks/images.
> 
> The slugos recipe is kept intact and further divided from the more modern
> recipes. The opkg-native recipe is the sane-srcrev version even when building
> slugos, which should allow for changes to opkg related bbclasses without
> breaking the slugos build.
> 
> Build tested for qemumipsel/minimal-image and nslu2/slugos-image.
> minimal-image builds 10% quicker in my setup and is 1mb smaller.

Tested on SHR/om-gta02

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


