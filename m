Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1ND2oh-0000Z6-HZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 22:20:58 +0100
Received: by pxi13 with SMTP id 13so4878617pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 13:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=H+on5kU+rY8vscfHl4gdUS/3fAP18ru7nxZsyOlZAII=;
	b=WOT99mFk7bj+tNJIIqF4R+dGiofEmgoa34s34LcxOeoMH+HyHyjHPFsWalVZlp5I86
	G1a1Itvlsz6jJIp0SiU+kBY+I9D3kQJ9vkiuVqLOv3blKZobn6z8I/qZlQ0zzccgSp6+
	huvkIBOQudT8emENYqY8Xqc1PTfQ6yU8f6VV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=iT12MPP0K92zDdjj4JUtvdzHOgcrMPMSit9nXbIrREbjewlvMEtzmBIt//8voQ/1I4
	pZWpixIxCHGGd8NRdalCZC95Juiiq4z80PgGOaVhuQlko5WQYutZcNDMo9jEm4wIH/cd
	mGXs89Qd1X1dCv/6W+CHUAnIu1IX35Tac+Rkg=
MIME-Version: 1.0
Received: by 10.142.5.40 with SMTP id 40mr756758wfe.76.1259097562192; Tue, 24 
	Nov 2009 13:19:22 -0800 (PST)
In-Reply-To: <4B0C3B50.8010901@gmail.com>
References: <4B0C2825.2070001@gmail.com> <4B0C3B50.8010901@gmail.com>
Date: Wed, 25 Nov 2009 07:49:22 +1030
Message-ID: <6ec4247d0911241319j364e424asfe231aeb6c5738a0@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: graham.gower@gmail.com
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
X-List-Received-Date: Tue, 24 Nov 2009 21:20:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

sizeof returns long unsigned int on x86_64. This is fixed in r365.


