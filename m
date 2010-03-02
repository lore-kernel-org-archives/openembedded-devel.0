Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmXxm-0004Ar-CD
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 20:41:08 +0100
Received: by bwz5 with SMTP id 5so539028bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=sA1+OuM7ZgHBlKyAMrBtk/gtQk1c0TEbdAfnwlagtv4=;
	b=EjeHVy4UdW2NfZG86RzVj5P4cy/YxzkQAbsuLoXWwG+y7lJzA5OQeQqqogoWv7lplu
	0UPVu3OJ5HhY25uoxQT7ejGOHnGvqIlyu5FILyWfeENfMf16fSqwtT0hZnhkS+8CV0ti
	tnpKqsrdoA0OhvnTjm1jfsee8k711jGKZyrEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=XNGk/KMKiKJYPCqQokIHeYMftmuC0W13/ntD17Wzj9iDCNxskNfMGW+thEnZjMIr+T
	SQA56vOjSDkNq8N2N9y1vp9lHbp7UqQguVKAg/U1twtHN0gbjCXw/taiEeidnkzgYB2+
	tnapY/Y0b11XLcRD84+TzuEMuOvOpUJQA0gtw=
Received: by 10.204.25.132 with SMTP id z4mr1057556bkb.84.1267558690981;
	Tue, 02 Mar 2010 11:38:10 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm3140782bwz.0.2010.03.02.11.38.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Mar 2010 11:38:10 -0800 (PST)
Date: Tue, 2 Mar 2010 11:36:18 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100302193618.GA31433@gmail.com>
References: <1267478308.4739.245.camel@trini-m4400>
	<201003021042.51552.marcin@juszkiewicz.com.pl>
	<20100302182829.GA31371@gmail.com>
	<201003022211.54572.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201003022211.54572.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 02 Mar 2010 19:41:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (02/03/10 22:11), Roman I Khimov wrote:
> В сообщении от Вторник 02 марта 2010 21:28:29 автор Khem Raj написал:
> > On (02/03/10 10:42), Marcin Juszkiewicz wrote:
> > > Dnia wtorek, 2 marca 2010 o 10:36:04 Roman Khimov napisał(a):
> > > > В сообщении от Вторник 02 марта 2010 00:18:28 автор Tom Rini написал:
> > > > > (aside: When can qemu-0.9.x die?).
> > > >
> > > > IMHO, it just about time to kill it, almost a year past since 0.10.x
> > > > introduction and with all those changes 0.9.x is not working properly
> > > > for locale generation anyway.
> > >
> > > I think that we need to upgrade to qemu 0.12.x and kill all previous
> > > versions.
> > 
> > Does .12 still need gcc 3.4.x ? or can it use gcc 4.x
> 
> 0.10.x already builds with gcc 4.x.
thx for info. last time I build .11 with gcc 4.4 it poo poo'ed on me so I thougt it
still needs 3.4


> 
> -- 
>  http://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



