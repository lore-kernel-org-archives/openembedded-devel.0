Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1POV2W-0007V7-N5
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 13:47:05 +0100
Received: by fxm17 with SMTP id 17so6709933fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Dec 2010 04:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OnsuAZWtydgwDP2TlpgjgIxTceWfs0V6D87G5w9XS40=;
	b=aAkAbajjSUug/hvrb/2tGQ57MDaovyXDw4+l5nRPVb0rM3aNil/h3W43R5EpTz4wae
	oPmKnLYy4h3Yx1Gopu3TpTRMdZ/hbtdASDVY/LjAKcjxnU9OjIYpEMQNP76immtE2GVG
	cEH1veli0yGHIc1Nyu5OCpxPSTRIshz2ysIcc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kMvydZVMwiAPzXkxCLGPCn3eTBs6ATnYixsu2txO1G4Wq16HWrTXmIXBUxO9rel8p6
	aeFR3M5OyP2pSJ8cJoZGtB5W5UKKa3QoUD1ZI2JeHiGEHX15mTsBwTweZjN0bePqnKm/
	sq9j3LpYOTvPR7ZrZX/5obM2eh25osrB/3E04=
Received: by 10.223.101.196 with SMTP id d4mr2067220fao.23.1291380340112;
	Fri, 03 Dec 2010 04:45:40 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 21sm601383fav.41.2010.12.03.04.45.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Dec 2010 04:45:34 -0800 (PST)
Date: Fri, 3 Dec 2010 13:45:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101203124534.GA3403@jama>
References: <AANLkTi=g1i2wB-9MKVh8AMctnFJVUccYFw0RYf600Tm-@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=g1i2wB-9MKVh8AMctnFJVUccYFw0RYf600Tm-@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release 2010-12: slugos does not build due to handhelds.org breakage
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
X-List-Received-Date: Fri, 03 Dec 2010 12:47:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 03, 2010 at 01:37:51PM +0100, Frans Meulenbroeks wrote:
> Still get this on a clean build (machine nslu2le, distro slugos image
> slugos-image, rm-ed downloads, sources.openembedded.org as premirror).

that's because slugos uses different SRCDATE for this package
./distro/include/slugos.inc:SRCDATE_ipkg-utils-native ?= "20060106"

I don't have that file in my downloads dir...

Regards,

> OTE: package ipkg-utils-native-1.6+cvs20050404-r25: task do_fetch: Started
> NOTE: fetch http://anoncvs@sources.openembedded.org//ipkg-utils_anoncvs.handhelds.org__20060106.tar.gz
> --2010-12-03 10:23:42--
> http://anoncvs@sources.openembedded.org//ipkg-utils_anoncvs.handhelds.org__20060106.tar.gz
> Resolving sources.openembedded.org... 140.211.169.165
> Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2010-12-03 10:23:43 ERROR 404: Not Found.
> 
> cvs [checkout aborted]: connect to
> anoncvs.handhelds.org(128.31.0.23):2401 failed: Connection refused
> 
> Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


