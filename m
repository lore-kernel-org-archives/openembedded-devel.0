Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSZWt-0006mH-2g
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 19:50:59 +0200
Received: by fxm7 with SMTP id 7so40710fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=r94u3S8csorbfLjEOi805uixrHCRFyceGNWtbmnbUBc=;
	b=g4BboWGhlzyxY7IwLGbmZWSfNC5jWjQHrMdhwM92FFxkLx2cXc2kuI0wssS9eVnDEy
	P/NojxU4NhEQnBNMzVsDFlhRCXtu1AXiaNxHqvx9cjx2snKcsZm+daBULKZ4YArG21so
	PAg1MyBj5zDAQNB5H8ao3b7a/hCPnUvObEZiw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=G4EwK93sKcAErpqpOrVyDTxiV4ULwe8nT+e+K2Zdi/SJris4wdrcdxJDJspDOK1dcP
	jWuFF8VkXSgciqQ/tNtzU8TLVbfoZAhG3r8xbi1CKdEUJqHxaXnFrEQstEdbrvqZGP2d
	89uB82hOijbvivd3EoKbXUj3p964uYoIMRv/w=
Received: by 10.223.56.212 with SMTP id z20mr1911368fag.1.1277574379526;
	Sat, 26 Jun 2010 10:46:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o19sm40853996fal.47.2010.06.26.10.46.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Jun 2010 10:46:19 -0700 (PDT)
Date: Sat, 26 Jun 2010 19:45:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100626174555.GN17650@jama>
References: <E1OSU21-0002Hi-E6@melo.openembedded.org>
	<20100626123700.GM17650@jama> <i056c1$k7t$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i056c1$k7t$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Koen Kooi : libdrm.inc: fix packaging regression that cause ${PN} to go from libdrm2 to libdrm
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
X-List-Received-Date: Sat, 26 Jun 2010 17:50:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 26, 2010 at 05:29:05PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 26-06-10 14:37, Martin Jansa wrote:
> 
> > Just noticed the problem too and seems like this solution wasn't enough,
> > would you add ${PN}-kms package? Or do you have an idea why it ignored
> > LEAD_SONAME?
> 
> It doens't build a libkms for me, so it looks safe to add such a
> package. No idea on the LEAD_SONAME, sorry.

LEAD_SONAME doesn't like _${PV} override, I'll add kms package and
remove _${PV} in case someone has build even more sonames than libdrm
and libkms.

regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


