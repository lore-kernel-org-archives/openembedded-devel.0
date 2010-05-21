Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OFG3L-0003Yl-Bf
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 02:25:30 +0200
Received: by pzk31 with SMTP id 31so227574pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 17:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=fIoKNAvg9dF7UXYKrvvDE2NW2HH2kOzK8mD4VWDG/xE=;
	b=G5Dz4c/WeWvZWg57Arv99b3ElceZXdNkKjcpVryS0D4RtOfAssub0Wc8uM+OOEm9r2
	cSHtLdr2i/eSPN5gu0t/7lksuiN/LmcChHEpZEWEAtaAKE7yLHhxum+ExjoanHZo1Fkt
	fXRIaaCyBt0qmHEmtqerxkt8z8DHsOq4EJ6ZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=p+o91pE1T5rVKg8KfsnahqA2+OP5tJHcLxhGkOOKcJuDRVa7odsgoUT7+K1Ac+9CFb
	CnQNRotJSFiNRp9i3xsvrgH33kgsvdzz0nm659fBOgdoLeayMKJlRCB9QDxTdfm2HypJ
	zLoVixS4vQAqMf/RgixW5uUVFt5dvYgskxlcw=
Received: by 10.141.125.19 with SMTP id c19mr615695rvn.55.1274401283896;
	Thu, 20 May 2010 17:21:23 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q10sm381038rvp.8.2010.05.20.17.21.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 May 2010 17:21:23 -0700 (PDT)
Date: Thu, 20 May 2010 17:21:21 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100521002121.GB29183@gmail.com>
References: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem with building glibc
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
X-List-Received-Date: Fri, 21 May 2010 00:25:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/05/10 23:51), Grzegorz Toporek wrote:
> Hi all,
> 
> many thanks for the earlier help. I have change my /conf/distro/colibri.conf
> file and building of busybox package went futher.
> 
> However, I have stopped on building glibc. I read lots of treads concerning
> this problem but nothing helped at all.
> 
> I found this but I don't know how to apply it to my problem. I use Ubuntu
> 9.1, gcc 4.41.
> 
> http://sourceware.org/bugzilla/show_bug.cgi?id=5203
> 
> Could you please help me with this? I am very new to bitbake...

As Koen said start with a known distro. If you are really passing down -Os to compile glibc then
you better you use eglibc because thats known to compile at -Os what are
optimization flags set to ?


-Khem


