Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmWu8-00047o-9Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 19:33:16 +0100
Received: by fxm20 with SMTP id 20so570886fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 10:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=jT62UwU/gp5tCyOVfHf4nMlk50ia4POKxywWPtXhnmg=;
	b=pgEtbjAGqjh6ZFW3ihLQoFKFWwrOnNQZJ/TM/0jmR0Xb1k3Q0x0NbJOgOmbtEud9wL
	z56kjAlkJXq8/V1R4PQ4drI0sNB/jbeNda4QIx/Pz0XndBlNNNt3mVg90LQOuC8WrHLI
	Oaty1kHi/LxP5IYpkPYrfMz1NsLyMtQehwR4w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=XOotuj5ZrUCvk3Wl0D8Pb6Ma16Kq1XnDsmVL90xJU4rvsllA+ypaoBnPx/0XHaM/fk
	pqvEWb48t2e/xlaU1MRqJikF4O5PpfED7w6f9Jmj997Y24ne0G+kM1/Fch8vnNwL7DRL
	D9zFqMoHkZkJDcNLylaL7kk+DaxO+oNAdPjy0=
Received: by 10.223.29.199 with SMTP id r7mr7010340fac.73.1267554621047;
	Tue, 02 Mar 2010 10:30:21 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm3067855fxm.4.2010.03.02.10.30.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Mar 2010 10:30:20 -0800 (PST)
Date: Tue, 2 Mar 2010 10:28:29 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100302182829.GA31371@gmail.com>
References: <1267478308.4739.245.camel@trini-m4400>
	<201003021236.04862.khimov@altell.ru>
	<201003021042.51552.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201003021042.51552.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Cleanup / update QEMU related checks
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
X-List-Received-Date: Tue, 02 Mar 2010 18:33:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (02/03/10 10:42), Marcin Juszkiewicz wrote:
> Dnia wtorek, 2 marca 2010 o 10:36:04 Roman Khimov napisał(a):
> > В сообщении от Вторник 02 марта 2010 00:18:28 автор Tom Rini написал:
> > > (aside: When can qemu-0.9.x die?).
> > 
> > IMHO, it just about time to kill it, almost a year past since 0.10.x
> > introduction and with all those changes 0.9.x is not working properly for
> > locale generation anyway.
> 
> I think that we need to upgrade to qemu 0.12.x and kill all previous versions. 

Does .12 still need gcc 3.4.x ? or can it use gcc 4.x

> 
> Regards, 
> -- 
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


