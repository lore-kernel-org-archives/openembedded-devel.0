Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NK867-0005ZE-3J
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 11:24:14 +0100
Received: by fxm8 with SMTP id 8so3367540fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=J16O+sWzz0L7OLStvIca6YFmGLZ+6Z6rk0S723i/z7o=;
	b=v0Gqpm4izuhdoKXT1WXxkHIJBYWCnXHy5lr1/U45eI8GbEzW0kdTBCA/RmryrqyadH
	1vo8sCTjzDA2kj/ks6U5KZTtH9H6W2nxOkMm5qPLj0WSR8G9leHBNUnFkb2LRndzx9Xt
	aH9sW6hSsTs7KK3MSPOIHNqNcRvQjCtMFj+94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nDic6uJyibdApVEkb+83yhFQIvjylev9va6hc3iiQ3s7JOiXTGkhlLe94lcOaINXDl
	p7vZU0O8R5B7+9O7PLXvGdCzIrQDXifSny4f9+aiUSGBJss+nqKLNMo5T559V39YZRRu
	EE5sHKcoXQCPVXvVklzTucnEeP7niqgnseJe8=
Received: by 10.223.58.208 with SMTP id i16mr5458955fah.22.1260786145602;
	Mon, 14 Dec 2009 02:22:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1477117fxm.7.2009.12.14.02.22.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Dec 2009 02:22:24 -0800 (PST)
Date: Mon, 14 Dec 2009 11:22:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091214102214.GM3601@jama>
References: <alpine.LFD.2.00.0912140512120.21693@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0912140512120.21693@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: test build just finished, three failed package builds
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
X-List-Received-Date: Mon, 14 Dec 2009 10:24:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 14, 2009 at 05:13:32AM -0500, Robert P. J. Day wrote:
> 
>   just this minute, my latest build attempt for beagle demo image off
> of dev branch produced:
> 
> ERROR: '/home/rpjday/oe/openembedded/recipes/mesa/mesa-dri_7.0.3.bb' failed
We probably need those patches from DJWillis
http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=e6f17d1cc03bdd90c575b7e2bd482932e53ba9c0
http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=60b64bead81643e5c97c29abc4574c66398b3ebb
http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=f8b4d26e7cfe06bfc8474df50035b886045a0324
http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=de272c2db0e37b72bfa55268a2e383c906ee0680
http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=63144b3bb0e035d3f8109fb907bb018694f2a9f0

Or I can set PREFERRED_PROVIDER_virtual/libgl to "mesa" instead of
"mesa-dri" in compatibility_providers.conf or maybe it should be set on
distro/machine level.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


