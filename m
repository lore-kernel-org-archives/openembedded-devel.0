Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nw9ZP-0007vB-Fl
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 09:39:36 +0200
Received: by fxm20 with SMTP id 20so9094397fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kiT/t6jsXCcUL0iCZii3zrl8PmWymEHFfEdZ/oUzh0o=;
	b=b8Mf7vnXsr410nLgyC813+++ZFWwEJubBdK7JkHN2qXlP6FqoxJpzh2vaVwRBNhZ04
	spSsCjVoTf0WFRSWduNeUxiY7QTQqPu9uNKSMyPz9auM0zv/9yeBJ/44TpDl5SQHE/Ip
	Vd1cKf4hlTd6s9OBImcGUttGTvBcoqLIzSUq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mD9iep0wx25u3prISit+YmVz5OBS/wPvSZoeV6Pa27rTOvqsOrqqrQgLF0UW8512WQ
	fniGsP1B5/p/XADAnUjG/nBqOObI9OO5ywO/CMHNAmJsYOEu/zxghNamu2U0r7FDfrFi
	mX/3gc3Td4QNw24dgVGgfQU+m+mcU3+eXtmkE=
Received: by 10.223.29.218 with SMTP id r26mr996144fac.5.1269848181794;
	Mon, 29 Mar 2010 00:36:21 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm2774843fxm.7.2010.03.29.00.36.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Mar 2010 00:36:20 -0700 (PDT)
Date: Mon, 29 Mar 2010 09:36:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100329073628.GA25489@jama>
References: <FA726C33-C7BC-48C6-8507-475E87359AF5@dominion.thruhere.net>
	<20100327144204.GJ3458@jama> <holgr8$8l9$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <holgr8$8l9$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: QT4 and cmake patches
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
X-List-Received-Date: Mon, 29 Mar 2010 07:39:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 27, 2010 at 06:55:51PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 27-03-10 15:42, Martin Jansa wrote:
> > On Sat, Mar 27, 2010 at 12:32:15PM +0100, Koen Kooi wrote:
> >> I'm currently fixing outstanding bugs with our qt4 recipes so I can use them in and hostside as well as target side sdk and cmake support  would be helpfull :)
> > 
> > Have you seen this error? 
> > 
> > I get this with bitbake master and 1.8 too. 
> 
> Could you try changing
> 
> # QT abuses $includedir to point to its headers, which breaks pkgconfig
> sysroot, so manually fix it up here:
> 
> to
> 
> # QT abuses includedir to point to its headers, which breaks pkgconfig
> sysroot, so manually fix it up here:
> 
> regards,
> 
> Koen

Sorry for long delay, this didn't help, but your 2nd fix, fixed it for
me too, thanks!.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


