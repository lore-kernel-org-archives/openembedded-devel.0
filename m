Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nl6GU-0007h1-T9
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 20:54:27 +0100
Received: by fxm20 with SMTP id 20so449287fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 11:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=pCLKGucVZt9K0EdzDZ2+FXf+LijMXomA21BxVkMyZFw=;
	b=do7q595ejPvOc4QDhAi7790Cs2nxTu//sHylBFmhpSmwZqXgtB/CzEgBsEsNa/21rR
	2TH89iKeRYWaHQ8Ds25JjB3ZXSJp0Dtzp4wGIwYTrMT49+iFxJ2t6HpCZK0OH+J5yD/4
	eXeuYbdeRTZGUL+OgzmYXczTlJvxtlthjxJhw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KntD2SVZehop1xMw/dVuBIQOsw4woT9N3YR12y1ZXqfJ0frAVO19LnYkeFSNGb/d/6
	FS+LVmNN5ltZix0DeO1dhRFvhsqdTVTGJskvLjsra80hW1y+UNuIiO7MCJL+vwA22OCv
	rVweFSTI3a61Wj7xyAnCv5XVpEa+H3QiKriJQ=
Received: by 10.223.15.133 with SMTP id k5mr1099113faa.39.1267213892877;
	Fri, 26 Feb 2010 11:51:32 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm388687fxm.12.2010.02.26.11.51.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 11:51:31 -0800 (PST)
Date: Fri, 26 Feb 2010 11:50:02 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226195002.GC25079@gmail.com>
References: <1266176499.12424.6.camel@ed-hp-laptop>
MIME-Version: 1.0
In-Reply-To: <1266176499.12424.6.camel@ed-hp-laptop>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: shared-mime-info-native-0.51 do_compile failure
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
X-List-Received-Date: Fri, 26 Feb 2010 19:54:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/02/10 11:41), ed wrote:
> Trying to build image for mini2440 and get the following error.
 ==============================
> Says it has undefined gzopen64
> But gzopen64 is apparently there.
> ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: strings
> libxml2.so |grep gzopen64
> gzopen64
> ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: objdump -T
> libxml2.so |grep gzopen64
> 00000000      DF *UND*	00000000              gzopen64
> 
> 
> Any ideas?  

It must be using libxml from host and libz from your native staging. 
So either use both from host or both from staging. Mixing can cause this
problem.

Do you have any of zlib-native or libxml2-native in your local.conf as
ASSUME_PROVIDED ?

> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


