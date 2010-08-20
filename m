Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OmMdr-0004ow-3n
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 10:08:00 +0200
Received: by fxm6 with SMTP id 6so1713024fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=TxtJg8laoRa/LLNN2tzjnB/VwAXKuG7iRxPquKIy15w=;
	b=maPCgBaO/kbcFXKFwwk2/7iCyYJK9p+p+RyCFpwTtwZJ/FtUoiszea6FikzlzgBwJ3
	bhssETfYXCOYO6qXc+szHRdXJ5cvM+vMVWhg8UN4iRCKDgZTIysRCU8dFX8GHlnMmDCI
	eVWJTcdrCZInqVMYW2bgSWobgyHE0KyBdWqww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VHXJWbM6C9bmRdhCoOb/HGL2D1z+IL0ZF4yZNeNFnYIqtAkyYHHjZ99MYFehTUNmud
	5LEcfPIdc4Hk/lj9WjRPOJmCogh8kch+Kpu8mTZGUb9o/Ebch64JSbW9HIE3G+tQYDIg
	47vROaaU78dGs6flq5uCUqcECTUVBymMHsW4U=
Received: by 10.223.125.196 with SMTP id z4mr728821far.80.1282291655131;
	Fri, 20 Aug 2010 01:07:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u8sm1083335fah.12.2010.08.20.01.07.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Aug 2010 01:07:34 -0700 (PDT)
Date: Fri, 20 Aug 2010 10:07:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100820080759.GP11569@jama>
References: <4C624772.8000607@nedap.com>
	<20100811072548.GB7282@mi.fu-berlin.de>
	<20100819105518.GL11569@jama>
	<20100819121301.GA21426@mi.fu-berlin.de>
	<20100819122903.GM11569@jama> <4C6E29B3.8050801@nedap.com>
	<20100820074410.GO11569@jama> <4C6E354A.9040906@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4C6E354A.9040906@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Fri, 20 Aug 2010 08:08:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 20, 2010 at 09:56:58AM +0200, Jaap de Jong wrote:
> Thanks Martin,
> 
> it is translating right now...
> do_configure for openjdk-6-jre-6b18-1.8-r10.6 passed, so this problem is 
> solved!
> 
> The same (minor changes) applies to the stable/2009 branch?

You're welcome!

I'm not using/watching stable/2009 branch at all, so no idea, but
openjdk built fine about month ago.

check if this patch and other java related changes are already in stable/2009
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=fb352eddb0c1356a03cb304ae40d3d67077de521

Or wait for OE java gurus to test/fix it.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


