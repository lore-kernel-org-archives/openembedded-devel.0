Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Oq7gg-00019j-UK
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:59:00 +0200
Received: from compute3.internal (compute3.internal [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 6FABF482
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 12:57:56 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Mon, 30 Aug 2010 12:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=sesm+++LylX+6amosLK6Awk56vg=;
	b=Xa59g9XoWuF7v5ufTeCKo+h/kfcr28MK2aE8hn3qz//45pgtXxxHpoe/GBhiTeYKld5VsmofEqjLuvJLhxq7XdmcsTIYxX0LVUf57oRWEagyuvslvCFnMFmtX3V1mkXLYtxUXG/ppSE4zETSgUS98n3V6kvlR4ueu1to8r7Xs5A=
X-Sasl-enc: FaoqQQgyBhkoXoeF0Kkld5WNr2GPppohfoO7KR5wWIDW 1283187476
Received: from [192.168.1.34] (hnvr-4d078ce1.pool.mediaWays.net [77.7.140.225])
	by mail.messagingengine.com (Postfix) with ESMTPSA id D7889402C04
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 12:57:55 -0400 (EDT)
Date: Mon, 30 Aug 2010 18:59:33 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1008301851400.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Mon, 30 Aug 2010 16:59:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hello Frans,

On Sat, 28 Aug 2010, Frans Meulenbroeks wrote:

> Currently if a package in the DEPENDS list is modified, a package that
> depends on it does not get updated even if explicitly build
> E.g. when I just updated libexif and after that did a bitbake
> mythplugins (which has a DEPENDS on libexif) libexif got build but
> mythplugins did not get rebuild.

First: bitbake isn't make.  So doing it half-automatic is OK.

> This is not really proper. E.g. if the lib changed a .h file the build
> of the using package could fail, but it could easily get unnoticed as
> one will only become aware of this when forcefully rebuilding that
> using package.

In my opinion a change of a header is a change of interface, and a change 
of the package the lib is packed into.  This always requires a bump of PR 
of that package.

> I think we can do better by better exploiting the timestamp.
> E.g. what about doing it this way:

So you don't need to exploit the timestamps, you "just" have to keep the 
dependency chain at the moment a package was built.  On the next run you 
compare the dependency chain and rebuild if a package got a new PV-PR.

This information could be kept in the bitbake cache.  When someone changes
  distro / machine / local conf he has to do the rebuild himself.  after 
all, bitbake isn't make.

Best regards,
    Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


