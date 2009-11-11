Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N8HFc-0001nx-8u
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 18:45:03 +0100
Received: by bwz9 with SMTP id 9so1210498bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=uRTO7jkUyIFyND5UgxMKHZXybSe/2QR3mpmaPLVV3wI=;
	b=rCZE6fzOblwBIib1O3RNsvnT2BjacCw6Y0iXrlWxLWmSl3C7uJnB6h320mDVCzro6m
	ajTbusmRFFsifTELjG/zakNuDlgqZ5toXpgnsGyZyCA3k06ZhnACTO3n83YMzgcajLmW
	Yxrk0x0EqUaOwlwwa1pieYsVMfwPVNMMNNDag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PmFie3MWKvyq10y7SRkQDV7ULpavPp0DHkm8hzTteJcNzvDHFD2E6fIgiKkYWMJt/e
	wRJkOIisVeTy0Vn6pfURw1tk3ha3/cc2W/Wlgez6oQJvqsjzv17CJy7ED65gsPo1NizR
	RB2VkF42NPV6oOnYY60E6bGmeviw2fUaXElDk=
Received: by 10.204.24.71 with SMTP id u7mr1861882bkb.35.1257961421949;
	Wed, 11 Nov 2009 09:43:41 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm639331fxm.13.2009.11.11.09.43.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Nov 2009 09:43:41 -0800 (PST)
Date: Wed, 11 Nov 2009 18:43:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091111174317.GB11484@jama>
References: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>
	<20091111154511.GA2761@denix.org>
MIME-Version: 1.0
In-Reply-To: <20091111154511.GA2761@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] bitbake.conf: SRCPV always upgradeable paths for git recipes
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
X-List-Received-Date: Wed, 11 Nov 2009 17:45:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2009 at 10:45:11AM -0500, Denys Dmytriyenko wrote:
> On Wed, Nov 11, 2009 at 04:27:08PM +0100, Martin Jansa wrote:
> > * Holger Hans Peter Freyther <zecke@openmoko.org> did for the OM git
> >   tree that was never merged back into OE.
> > * Taken from xora/angstrom-srcpv branch where it rot for long enough
> 
> We also discussed it during the OEDEM...

RP said you did on #oe
16:25:45 < RP> JaMa|Wrk: I can't sanction that, needs to be proposed on
list but I'd ack it
16:26:18 < XorA> JaMa|Wrk: got my Ack
16:26:46 < RP> It was mentioned informally at OEDEM and nobody I talked
to objected...

Mickey acked too on #openmoko-cdevel
16:47:28 < JaMa|Wrk> mickey|office: ack for SRCPV?
16:50:47 < mickey|office> ya

So that's at least 3 ACKs, if there is no objection today I'll push it.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


