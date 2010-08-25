Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OoF9w-0000dQ-UF
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 14:32:56 +0200
Received: by fxm6 with SMTP id 6so241980fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=b6NWdm71bylLdV2hjqWsdZ8HntEXNIFga2ZKRdQCX/4=;
	b=T2LJpqlWZJgrAdYNHZMY9sGZf27lFh98C2zBmQCwkMARi+IoymYY5kZC+/7bBhCIZf
	IAsnMWRXXE7TQG2NNYWJCKz6dmRDH/glNQjiXbmeK1p9T8SEQ8U1GIr4XlToWFb0Jxcy
	8q8ggg+PVOnJD8SI4T/YMZLn88fWLSK32hhIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DDn7PBsD8L1GWOCPGifrrmAYl+98/44VRBvhak6G9ORJ/n4nIe2e3F14nF2MUn8pCd
	auJOhNaTsKNTBAqDcaxxKwf5gHyiTCfdoC69YM/QghadsL0rZWPhM9EHdu8Kzg96bThe
	AbPr9HTDdrQ3HW1tz41aMhTbatGGtTErFy1UA=
Received: by 10.223.113.135 with SMTP id a7mr7454738faq.40.1282739536863;
	Wed, 25 Aug 2010 05:32:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f28sm619887faa.24.2010.08.25.05.32.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 25 Aug 2010 05:32:16 -0700 (PDT)
Date: Wed, 25 Aug 2010 14:32:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100825123235.GB17268@jama>
References: <AANLkTin7=Kq6GAzXmOSZErzd=FvXNtNL8zGuVQ-mE7wX@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin7=Kq6GAzXmOSZErzd=FvXNtNL8zGuVQ-mE7wX@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PR on native recipe
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
X-List-Received-Date: Wed, 25 Aug 2010 12:32:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 25, 2010 at 02:15:40PM +0200, Frans Meulenbroeks wrote:
> Dear all,
> 
> Fahad Usman asked a while ago on how to deal with PR in native recipes
> if the native recipe does an include of the non-native recipe (which
> is quite common).
> Currently I see two solutions being used.
> 
> One is to give a native recipe its own PR. Issue is that if the target
> recipe changes, the native recipe should also have a PR bump (and I
> fear that that is often forgotten).
> The other is to have no PR in the native recipe and bump the target
> recipe PR even if the native recipe only changes.
> 
> Both occur now. What is the preferred solution?
> 
> (btw there are other solutions possible too. Not sure if something like
> PR += ".0"
> in the native recipe is possible. That could be a good alternative.

This is not good, because after PR there is DISTRO_PR, so for:
non-native PR = "r1"
DISTRO_PR="4"

now you add native PR += ".0" and from 
PKGR    ?= "${PR}${DISTRO_PR}"

PKGR r1.4 you get r1.0.4 which is lower, so at least you had to increase
PR in non-native to introduce PR += in non-native.

changing PR in non-native seems like safe solution to me (unneeded
rebuild/upgrade because of native recipe changes doesn't cost that much IMHO).

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


