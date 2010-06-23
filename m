Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORTwE-0001Qv-4q
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:40:39 +0200
Received: by pvg3 with SMTP id 3so641430pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 10:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MpozabWJF2u03WgY3QrFWQBsAL91Dr+7bb45C6nRve0=;
	b=gkXpsMVHg3ZRyk7P0pUtcv4OY4a1Lsz1YK7CCLSyaXX6Pd70Zay8NxNfs+nqMi8Qzp
	QaqVA2JsPqjkrM2r+lJKaEvkPv0WquQEv8k99f6AQWj0hnnuMZVsHo4ZpnAcMPuv+bRS
	U5l0xki7g3puflzLiutBgrDqAgxm6pgTOA9yE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qJQ3Vjo+YBrONFGPIBvIIdB8Dv0AXaJpqtSK9PLg8E+s+em5zJ9w/WaGgyg8V8GgNn
	+uiT3OgArSI1TikgluYq76XhYTNBWZNbakIKbx7T4cwElTKDRq/gwxaKTUEkiveE8Z+Z
	SKnPbfcF/Wj5zMc8Hq1+34vyG7qJI/s4kBjsE=
Received: by 10.142.249.2 with SMTP id w2mr7489172wfh.25.1277314169997;
	Wed, 23 Jun 2010 10:29:29 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x34sm1894278wfi.16.2010.06.23.10.29.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 10:29:28 -0700 (PDT)
Date: Wed, 23 Jun 2010 10:30:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623173036.GG5535@gmail.com>
References: <98ADC3BE-97D0-4CFA-8DDE-06BCD5323360@keylevel.com>
MIME-Version: 1.0
In-Reply-To: <98ADC3BE-97D0-4CFA-8DDE-06BCD5323360@keylevel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cross compile badness when building libsdl-directfb
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
X-List-Received-Date: Wed, 23 Jun 2010 17:40:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/06/10 10:25), Chris Tapp wrote:
> I'm trying to use libsdl for x86 using Angstrom.
> 
> However, when libsdl-directfb is compiled I get a an error that
> includes:
> 
> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/
> directfb
> 
> It seems as if this is a known issue with libsdl-directfb_1.2.11.bb
> and a _1.2.14.bb may have been produced, but this does not appear
> when I do a git pull.
> 
> The x11 versions are at 1.2.14.
> 
> Does the 1.2.14 directfb version exist and, if so, where can I get it?

I think no. care to create a recipe ?

> 
> Thanks !
> 
> Chris
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


