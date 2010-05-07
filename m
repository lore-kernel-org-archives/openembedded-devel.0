Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OAOyH-0008Qt-UG
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 16:56:11 +0200
Received: by fxm11 with SMTP id 11so867976fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=w8aW9+cNP1hsP/tpDW2wiy+R4aQOao+Sg2Wo4Nv5FMA=;
	b=LCiz/fx8ZHma+wsV6oQguWOG1jqnLDsI4T415XhLpLZd5QZmX0QliPioVsHoHe4mmR
	H+Wrcz6VSiMzAcIjRvgrx5ejtqgUurOIQVmw/wRVDyCQ+0cg8qi9dov0RGAuG2S824Xg
	yRe35T/in3SWYT6xjSP2ht4kEOFHPBRu40Zfw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tVjD1ixi53KMSJbRn8EkPsaJH5vua+t6/OfdQcogjBWUgZFSEKavg5qP3gv9y11Ar6
	Wkn/mGNcw0PzHnxXOEDKjHOyYycosFFBS7SicZ7o/DnHAsd2lnRjC5ouyTJykgwW3KQH
	lPi2MFBH8RLPUxyFTaaxPKMOXAPkRuFIne7PY=
Received: by 10.223.15.216 with SMTP id l24mr104362faa.92.1273243940548;
	Fri, 07 May 2010 07:52:20 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm6984439fad.19.2010.05.07.07.52.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 May 2010 07:52:19 -0700 (PDT)
Date: Fri, 7 May 2010 16:52:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507145217.GI3204@jama>
References: <4BE25BFD.2090204@dresearch.de> <hrtmn1$bp1$3@dough.gmane.org>
	<4BE3C542.4070603@dresearch.de> <4BE3F2AE.8060305@dresearch.de>
	<20100507110900.GF3204@jama> <4BE40F58.2000905@dresearch.de>
	<20100507130851.GG3204@jama> <4BE41DF5.7040805@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BE41DF5.7040805@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: All the syslogs
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
X-List-Received-Date: Fri, 07 May 2010 14:56:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2010 at 04:04:37PM +0200, Steffen Sledz wrote:
> >> Would be a
> >>
> >>     touch {sysconfdir}/init.d/syslog
> > 
> > :) also option, but u-a should at least show warning that link file is
> > not and link and in worse scenario refuse to replace non-link file with
> > link to alternative (IIRC the case for u-a-cworth and his variant
> > included in opkg).
> > 
> > What I had in mind was adding:
> > update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
> > after u-a call in postinst and similar
> > update-rc.d $OPT ${INITSCRIPT_NAME} remove
> > in postrm, etc.
> 
> I would prefer my method because the update-rc.d class does
> a bit more than just calling update-rc.d (e.g. stop running
> services). And i thing it's not a good idea to duplicate the
> whole code.

I don't like duplicate code too, but maybe you don't need to restart
syslog? And your version doesn't work for u-a from opkg and u-a-cworth
as described in reply to that patch.

> Regards,

Regards,

> Steffen

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


