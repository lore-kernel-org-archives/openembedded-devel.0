Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCVSC-0002le-6C
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:15:44 +0200
Received: by fxm11 with SMTP id 11so1038989fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 03:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=M1yKwGWRSoxavGP2R9S9JvupeaqzVRDGUlKBvKbAosU=;
	b=vvtzxxaP1Zfa8I24t88daetXgvKuYNmwA+at47L3k2ar1Z0Hg0iozVqGQ1AAid4tyM
	sDlAYh3wJWjeGld88ANoQ5fKCpciVg0//w4tVqTXCL3kxLlvmWZjxRQTqoJ04pQIsupk
	6mZWqmHSpohwnIqHqzYXxdkUbUmt5O2nP3gDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hManK7ahmc6gOEAPjmC6C4sWJZOLwiqj7DfU8IWScWLHVIb7Mnrb570KdFDSc0CwtU
	GLzpsA8VenbBa1GXYyGsO0u9F64+tDmCMDY9Az/TmEtn/L+MgsHer1VTuCtDn7OkQTjN
	SJfeIOom+Pd3urEpvpflm2J6Q8Q0v+1xVIOKg=
Received: by 10.223.29.156 with SMTP id q28mr2886086fac.77.1273745509215;
	Thu, 13 May 2010 03:11:49 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y12sm5165778faj.5.2010.05.13.03.11.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 03:11:48 -0700 (PDT)
Date: Thu, 13 May 2010 12:11:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513101149.GI3370@jama>
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005131223.22252.khimov@altell.ru> <20100513084633.GC3370@jama>
	<201005131259.13508.khimov@altell.ru> <20100513092320.GE3370@jama>
	<20100513093814.GG3370@jama>
MIME-Version: 1.0
In-Reply-To: <20100513093814.GG3370@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: QEMU mmap_min_addr issue Was: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 10:15:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2010 at 11:38:14AM +0200, Martin Jansa wrote:
> > Can we compare this simple test between working and non-working systems?

You can ignore both tests.. the difference is value of mmap_min_addr
4096 work OK
65536 fails for me too

I'll patch qemu-native to assume 65536 when it cannot read
mmap_min_addr.

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


