Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLekv-0000P9-Cc
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 17:33:10 +0100
Received: by fxm17 with SMTP id 17so47961fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 08:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=NRzCAbVJWsaCNEaoGZgtpl8TJCRPjBpVIPJN68Vrys0=;
	b=tqFhIyBysS7UpPKMHOrmvdcwtESFP7r6igzaZabTPnYqXShFwiAiOIOPtpj7gkt56H
	k5aLSYpm51h9MPzK/5h7c/fK7GxsvdVUDqYLdra7huSQGvhHMNY4Wvkkkp/PzWEgq/UW
	NBmkHA69MHU+fsgPCDHewocVBZa0M7OsSp4es=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=fHkJCACnp7Fk4F5FrZYZwhhOTbPnbySfwsEP0xUiaq1OSMEdRCFkCOsM1M8YbJ0VLL
	pTRCOFJKEacTiCKIRmrpRCNPVyPVaQN6ZWoHiRG7vzDmY/1rn3BinYbp4PQjbWPwLYNb
	3sEBm1GifHYw5V/eiyUfiFhfDeQAtvGky4Jg0=
Received: by 10.223.100.9 with SMTP id w9mr982656fan.12.1290702713331;
	Thu, 25 Nov 2010 08:31:53 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z25sm242964fam.18.2010.11.25.08.31.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 08:31:52 -0800 (PST)
Date: Thu, 25 Nov 2010 17:31:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125163139.GQ3274@jama>
References: <4CEE24A8.2090007@atmel.com> <4CEE2ADA.7050004@eukrea.com>
	<4CEE6A7B.4010603@atmel.com>
MIME-Version: 1.0
In-Reply-To: <4CEE6A7B.4010603@atmel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: libXext-native fail to compile (x86_64)
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
X-List-Received-Date: Thu, 25 Nov 2010 16:33:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 25, 2010 at 02:54:03PM +0100, Nicolas Ferre wrote:
> Le 25/11/2010 10:22, Eric Bénard :
> > Hi Nicolas,
> > 
> > On 25/11/2010 09:56, Nicolas Ferre wrote:
> >> While trying to build from scratch the latest .dev branch with:
> >> - angstrom-2010.x distribution
> >>
> >> Build Configuration:
> >> BB_VERSION        = "1.10.0"
> >> METADATA_BRANCH   = "dev_for2010.12"
> >> METADATA_REVISION = "a1bba89"
> >> TARGET_ARCH       = "arm"
> >> TARGET_OS         = "linux-gnueabi"
> >> MACHINE           = "at91sam9m10g45ek"
> >> DISTRO            = "angstrom"
> >> DISTRO_VERSION    = "next"
> >> TARGET_FPU        = "soft"
> >>
> >>
> >> I have the following error with libxext:
> >> NOTE: package libxext-native-1_1.2.0-r9.0: task do_compile: Failed
> >>
> > it seems to build fine for others also on x86_64 host :
> > http://tinderbox.openembedded.net/packages/1077651/
> > http://tinderbox.openembedded.net/packages/1087310/
> 
> Indeed, strange...
> I tried to clean the recipe and then rebuild without success.
> Someone has a hint where it can come from?

I've tried to reproduce on my 2 x86_64 hosts and both build it still
fine (both with gcc-4.5, SHR and micro)

But same problem was maybe reason here:
http://bugs.openembedded.org/show_bug.cgi?id=5490
but for him do_install failed.. weird

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


