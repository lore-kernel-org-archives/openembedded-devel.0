Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRLmX-0000EC-CK
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 10:30:22 +0100
Received: by pzk12 with SMTP id 12so241083pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 01:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=oeEaf1CSP7zI4NikIGYGXOnhuxsdoEd1RoUc3ykwG4w=;
	b=jD8qeSg0livMMydapTmc2Gxi55QYp6+3cse8SVNeB69cidBpQw30uRG1DH5AUZMK7X
	YFAJO3KjVJZ7BxcUh3UGcHgNdU8beOiw4wVXT+PUvP4XmWq8EPKJscWUDRm7cY6tdfrR
	3gbbX6Q9GwwWOwlnKeg5JKrRB5vJkUeGICjUY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TSuDRu3IeXahM/y4kK3rLvFKMg1OBO0XYj+PjKf7sYg4MwqrjiA9HzacXDeFKzETOC
	YwQAVqW5rrHL4oinBoMvHMrXZ2XZKbNdfA4Nrx4CZedZ/V5avj7q10kxiwnvjpq3O2IY
	SItDwaSvRBULB2dw05B/LXeKAkL4Zg3+9+7tg=
Received: by 10.142.47.15 with SMTP id u15mr1261716wfu.28.1292059727065;
	Sat, 11 Dec 2010 01:28:47 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm5323066wfh.15.2010.12.11.01.28.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 01:28:46 -0800 (PST)
Date: Sat, 11 Dec 2010 01:28:46 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211092846.GF8894@gmail.com>
References: <201011272339.57718.afalls@qvxlabs.com>
MIME-Version: 1.0
In-Reply-To: <201011272339.57718.afalls@qvxlabs.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Gumstix Verdex builds hang on boot, any ideas?
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
X-List-Received-Date: Sat, 11 Dec 2010 09:30:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/11/10 23:39), Ardavon Falls wrote:
> When I try to run the image created, everything appears to boot normally, 
> until halfway through the init/sysV boot process, it hangs printing the 
> message...
> 
> sa1100-rtc sa1100-rtc: rtc core: registered sa1100-rtc as rtc0 
> 
> I am using the following settings:
> distro: minimal
> machine: gumstix-verdex
> target_os: linux
> 
> Any suggestions? has anyone else ran into this issue?

you need to enable more debug messages in kernel to  see whats going on

> 
> Thanks
> Ardy
> 
> !DSPAM:4cf2074c16461704514828!
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


