Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NOiq1-0005NX-PA
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Dec 2009 03:26:36 +0100
Received: by ywh8 with SMTP id 8so9396699ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Dec 2009 18:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OHzMHqb2WazDV9ytZEPkg/r19MAL5lCcULqe222trv8=;
	b=QdfcMRDTm/5WJsYXL01KAdOum8MQvKrLuJ9qupDM4xjXKqHwZmERxE+43+v4DoQL4F
	jRcwrl+dKUeFaqcUyUs+TEYqvrJf+F6CSh394Cxjo1PtQApg8epZCOygBlwIHZDg2ERQ
	zl0Zx5H1YZoBcO5Uq+AVnq4gH4svxYTSlU+uo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CxIYV+zb3yFGvkqL29zhgyfpvj96pbBXMOW4vVkrWhgOGTSbhwSbwXohTERjQ8FpWY
	3KoPTYmkKdwiizRY5gIzP1y+IGR8KTPCIVRCMBWOWAHxKOaUKa+BH8BiJnbyaPnqJk6q
	PJTsI0O9vTHt0uEcXPICZTdlAJ4TGBDPTywg0=
Received: by 10.150.18.18 with SMTP id 18mr2241774ybr.295.1261880677495;
	Sat, 26 Dec 2009 18:24:37 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 6sm4326154yxg.48.2009.12.26.18.24.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Dec 2009 18:24:36 -0800 (PST)
Date: Sat, 26 Dec 2009 18:24:11 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091227022411.GA10352@gmail.com>
References: <4B0C2825.2070001@gmail.com> <4B0C3B50.8010901@gmail.com>
	<6ec4247d0911241319j364e424asfe231aeb6c5738a0@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <6ec4247d0911241319j364e424asfe231aeb6c5738a0@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg-sdk_svn build failure
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
X-List-Received-Date: Sun, 27 Dec 2009 02:26:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/11/09 07:49), Graham Gower wrote:
> sizeof returns long unsigned int on x86_64. This is fixed in r365.

sizeof return size_t which is a type in itself so if you want
portability between 32-bit and 64-bit systems you should probably
use 'z' length modifier in printf formats. '%zd' would work correctly
irrespective of word lenght of the processor. You need C99 compliant
compiler though.

Thanks

-Khem

> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


