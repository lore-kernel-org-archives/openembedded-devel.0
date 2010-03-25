Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NutsG-00007c-8g
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 21:41:53 +0100
Received: by qyk8 with SMTP id 8so1083871qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=GqT/7vm7G3F8lcOA8lUN6mhDwp8id7VbVEoy7JsuJFQ=;
	b=v6XaEvrePYEmynJVk+O09Zb+cEvm6tVbAK7kXAZZzzIS+6EU2jeQH23/eu6i5rwO/t
	GtoDe4YEYRQpSPb3l+y86hRSqaeTxvd2S2Gwm5mWGqNb0OmYw6gL72hqMuqoucUlleK9
	eImZj1XgezVzsmhdvuItW2udY69J2coaAR7rg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tw1okUZ+IrG7v+XVCVNIxXcuKP2MZooPvl5ZMHDqAnr/1OoWQrJtH6tIPyaMs5iRfD
	Foo8O8mbzfaaLLomvfzj005ZcplPes5R3CEA17Vv0GvXbskdfsFjW5fpkLYXclUtcplY
	Ec32zSnKBDgG55Hsgxxgq7tdSTx9e90igfLVg=
Received: by 10.229.104.195 with SMTP id q3mr890878qco.56.1269549520510;
	Thu, 25 Mar 2010 13:38:40 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 23sm93381qyk.15.2010.03.25.13.38.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Mar 2010 13:38:39 -0700 (PDT)
Date: Thu, 25 Mar 2010 13:39:00 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100325203900.GB17837@gmail.com>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: Re: [PATCH 0/5] Misc updates for EZX bits in OE
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
X-List-Received-Date: Thu, 25 Mar 2010 20:41:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/03/10 18:19), Antonio Ospite wrote:
> Hi,
> 
> here are some updates for EZX bits in OE.
> 
> With these changes we have a working image to experiment with ts27010mux
> driver and ezxd, no fso support yet. Tested on Motorola A780.
> 
> Note that although ezx-gen-blob builds fine now, it seems to have issues with
> GCC 4.4: the binary size is about 300KiB instead of the expected 64KiB, if
> anyone has a clue please let me know.

I can help you here. If you can give me the two images with symbols and
your linking script it uses. Secondly are you using same binutils/ld in
both cases ?

-Khem


