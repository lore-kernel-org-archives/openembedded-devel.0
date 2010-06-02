Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJs2y-0000T4-O7
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 19:48:09 +0200
Received: by fxm9 with SMTP id 9so1223845fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 10:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=eWsun4swuz2nW5xCtF94gmyhYDzrR6BuAh4yRBAE7js=;
	b=wI9WSRooA+5Bn0GPMvZQL0CiS7945gnoZUak+DnfisulIFee6QT8U+JEzXB5nYC2It
	mhHGbu65/+DVXzhDD09e8bEZ7spXw4TW+xhl9jZ52fmuZYhVl5SdiCDUVsqA609XBjbf
	CrRdXYGRJoUl5PaeFbNDPRY9fyr7nf2rzyW/U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NbDSTpAbP6gRiVd55HPjXm1v5dJjxKbl7hyRqxn+MZfD+v+aheWaY/K/kLsCuIODJi
	Y6Fdth36qQ+kWGSawa1WLGAi6PNbrv2XWIhpKXhYz7j2wiirA4quqn6LINvrSLWP5cci
	h9NxOEk8Uhr3dp8y6TRKfLJS4vM0dwBzE0+T4=
Received: by 10.223.46.135 with SMTP id j7mr8959941faf.105.1275500633789;
	Wed, 02 Jun 2010 10:43:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r25sm53239367fai.23.2010.06.02.10.43.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 10:43:53 -0700 (PDT)
Date: Wed, 2 Jun 2010 19:43:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100602174345.GG16035@jama>
References: <1275485971-23536-1-git-send-email-Martin.Jansa@gmail.com>
	<20100602172058.GA26560@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100602172058.GA26560@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RDEPENDS/RREDEPENDS
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
X-List-Received-Date: Wed, 02 Jun 2010 17:48:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 02, 2010 at 01:20:58PM -0400, Denys Dmytriyenko wrote:
> Martin,
> 
> > [PATCH] recipes: conform to OE packaging guidelines with RDEPENDS/RREDEPENDS
> 
> Did you mean RRECOMMENDS instead of RREDEPENDS? :)

Yeah sure.. sorry for typo, thanks for spotting it, fixed before
pushing.

> Can you also please link to the mentioned OE packaging guidelines? Thanks.

Trying to find it, but even OE manual seems a bit inconsistent :/. Maybe
Koen has it as I just reused his commit message from
bf5e17fdbcefaa8ed34dceb25dc0becd6426fb6b

The point is that usually you want that RRECOMMENDS/RDEPENDS only for
${PN} and not ie for ${PN}-dev. 

It's also checked in recipe-sanity.bbclass.
__recipe_sanity_badruntimevars = "RDEPENDS RPROVIDES RRECOMMENDS RCONFLICTS"

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


