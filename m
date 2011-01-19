Received: from mail-yi0-f41.google.com ([209.85.218.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfPh6-0004q4-Vk
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 05:30:54 +0100
Received: by yia25 with SMTP id 25so135150yia.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 20:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=8brW7K3Y5y4WFy+vArydpUFheZdrMlmC442QgqcOduw=;
	b=xeUvcOS3EW040eCHAXbyzTq9jAmPe1GQiSi3EfWq484Zs9W75kFZMWa7Sm1S62nhU3
	GHFwWUUXTSGyjkI4tK7eMGAhEO4pNr0zh/Gx8hOk0QIIW0q40aJAAgu68vWSXRp6zgGr
	/2O6787LITY8ruD19ZwAVzpUqItWs3oSJlNfo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=GKAgHImvcwsfWhxqfzTXTpRf1C/CKv2MJAlVS4uPi72CJ5foDCeZnjDLdsGt0cNgx8
	ebRwMg+VKtvQX3lmAyBec9OLQSMw5mojeXXm7E1R9jzZC3laCk/js5HJLcTVZjleQOdB
	PVsxs+bb7jJb15EzGCy5Zzq9/gWSYq+orNr0M=
Received: by 10.100.94.14 with SMTP id r14mr128637anb.261.1295411397466;
	Tue, 18 Jan 2011 20:29:57 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c30sm7877362anc.0.2011.01.18.20.29.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Jan 2011 20:29:56 -0800 (PST)
Date: Tue, 18 Jan 2011 20:29:54 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110119042954.GA30752@gmail.com>
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
	<4D34952B.607@mentor.com> <201101180730.29536.roman@khimov.ru>
	<4D3661AC.8030708@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D3661AC.8030708@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Wed, 19 Jan 2011 04:30:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (18/01/11 20:59), Tom Rini wrote:
> On 01/17/2011 09:30 PM, Roman I Khimov wrote:
> >В сообщении от Понедельник 17 января 2011 22:14:51 автор Tom Rini написал:
> >>On 01/17/2011 10:50 AM, Khem Raj wrote:
> >>I see different problems with perl 5.10.1 + uclibc + p2020ds, so I guess
> >>this is fine with me.
> >
> >What kind of problems?
> 
> Khem fixed it tonight.  At heart, there's been a need to make much
> better use of the libc-uclibc override rather than testing TARGET_OS
> as there's at least 'linux-uclibc', 'linux-uclibceabi' and
> 'linux-uclibcspe' as valid TARGET_OS combinations.

I thought about it and indeed it would be better to have a LIBC override
but its defined in .inc files which may not be included by all
distributions, if this makes into bitbake.conf somehow then that would
be better or we can decide to have a global data var called LIBC or some
sort.

  perl has been
> doing a test for the first two and Khem added a test for the 3rd.
> This got me to go and audit the recipes for using the _linux-uclibc
> append and switching them en masse to libc-uclibc.  There were a
> very small number of places that had been catching all 3, but for
> the most part it was 80% catching the first two and 20% catching
> just linux-uclibc.  I believe but didn't check that Khem caught the
> rest of the places that were testing for TARGET_OS in shell code and
> updated them for linux-uclibcspe.
> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


