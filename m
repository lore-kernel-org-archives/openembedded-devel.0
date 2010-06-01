Received: from mail-yw0-f180.google.com ([209.85.211.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OJaV6-0006QF-PM
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 01:04:04 +0200
Received: by ywh10 with SMTP id 10so4024998ywh.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9ilySsy0gDSibjfYV6VcHFGVKIWPxlSwx44cq1U8/7w=;
	b=HNn91uchWg85B+4vrhwSMPAd1CNlV+A5OTW0Q6oiiHbabWSMKoK96NcQXaW4YHTMrv
	bay5olh0/8/vKsKxAWVygSNGyAbaoOsv94hs17dmUCqmn5tgzyojP2H7MRQjc0LIKLi0
	KhXE2VMB5lvVKPCq2IWFmnms+qcIh4raXy2ZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HDWK5ENVSi+fav/eV5AOS6HGAdi/yewyQfDpuG6Gmtz0vTxtpQ9fJRHq2QkKTSz0Gy
	UcM673QS5//1+jJPCQRltq3FroKKS9aehRDdiYEVuyii52w6QC7da+FV8kK4mOO61J1y
	gSFTXsi6aiXoe2GNjhMkclsFHS8PR69rtQr8k=
MIME-Version: 1.0
Received: by 10.101.3.38 with SMTP id f38mr7448041ani.90.1275433185784; Tue, 
	01 Jun 2010 15:59:45 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Tue, 1 Jun 2010 15:59:45 -0700 (PDT)
In-Reply-To: <1275428876-1406-2-git-send-email-Martin.Jansa@gmail.com>
References: <20100601195258.GF5446@jama>
	<1275428876-1406-2-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 2 Jun 2010 00:59:45 +0200
Message-ID: <AANLkTikc5u5SS7Nxlwc0RuaXrVlYl6-JMyC9Jto0S7gm@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.180
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] klibc: fix packaging without moving PACKAGES and FILES_ back to recipes
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
X-List-Received-Date: Tue, 01 Jun 2010 23:04:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Martin,

building klibc_1.5 we have the same
NOTE: Not creating empty archive for (dmesg,sync,ls)

and building 1.5.18
NOTE: Not creating empty archive for klibc-utils-insmod-1.5.18-r14.1.5

If you prefer to warn the user that it's version lacks those packages, ok.
At first  I saw them as packaging quirks in this case.
Again, no strong opinion :)

Any other advice?

Regards

Andrea


