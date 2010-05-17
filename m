Received: from mail-pz0-f191.google.com ([209.85.222.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ODtMP-0007Vz-2R
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 07:59:29 +0200
Received: by pzk29 with SMTP id 29so2344803pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 22:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=npqDzL6d+2kaLfAXWurFiPk/HSgEcA2X7kPUe4t78Bs=;
	b=k5tvRp/KmKyxt0G7hgevgp5OrCt/cIUfeYJMiAOyKR+4SXrsrytaQrNnolRtSrN61K
	PeyUrdPbv2HmE5RoqVs5kEqB3hd4qorl5+/M3upry61FpG5GViPyMe9EC10o9Jv0EMjI
	SghWcwPTHpVKQZF7cRcp4rxPgKFC2hT4mJVTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VboAS34rY0+DzLKfBioFjn8i965/xFfN3N4gU7/v4H2lA6VhaOQ+rr55atTX97PCyG
	kDJ7cqPA4RV2cBFPurizxsvEFvY0wvFVETPlaXGlKcaV5zGJY641YhSS2/LBZo4SPLTD
	hd+p1+qgd/SfEn71RbYfiSu71raXZrnfotJNg=
Received: by 10.115.134.32 with SMTP id l32mr3953552wan.44.1274075729313;
	Sun, 16 May 2010 22:55:29 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 23sm3735125pzk.10.2010.05.16.22.55.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 16 May 2010 22:55:28 -0700 (PDT)
Date: Sun, 16 May 2010 22:55:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517055550.GA6686@gmail.com>
References: <hsql3t$o5c$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hsql3t$o5c$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.191
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question: is 'gcc' supposed to replace the libstdc++.la installed by 'gcc-cross'?
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
X-List-Received-Date: Mon, 17 May 2010 05:59:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/05/10 07:44), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> I just noticed that after doing 'bitbake gcc' the old libstdc++ gets
> replaced and the new one has:
> 
> dependency_libs='
> /OE/angstrom-dev/sysroots/armv6-angstrom-linux-gnueabi/usr/lib/libstdc++.la'
> 
> instead of the expected '-lm'. It now refers to itself :(

hmmm target gcc should not have staged libstdc++ if it was already staged
by gcc-cross but the problem is casued by
gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch it passed the native libdir which
is build_libdir even for target library builds using -rpath. I am currently
looking into the reason. If possible we can get rid of that patch.

The patch you committed to cross.bbclass will not be necessary

Thanks
-Khem


