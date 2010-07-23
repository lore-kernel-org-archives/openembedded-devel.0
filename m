Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OcDRc-0007XL-R1
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:17:29 +0200
Received: by fxm12 with SMTP id 12so4927889fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 01:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JXwjFbwZroHmhGo/4evzQr7kMymk9BKWs8JZXPzPkdo=;
	b=nzVIaPginTmh4eGntCO8+ZYS2j+zEZ8RgJJHpg+UYg6FO3jBHCXFt5xqDCYbdLDY0R
	UQZctoUSnXew9Dm+CUZt6dHWSnZyoYT2rAwkMe/B/cuPPVlZmCH7V9MExUY9jqj67n8a
	o8l7rassWvh8C0EkJaq95RuoNaEP8St0XfTsU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=B1HNdwX7jyvEjd9cAxaerJBX5dPKg6XS/V2lKxbafqNB9F5GVcdpu4l4yZsfh3JkTo
	a9t6SFhvxJH7TiVped2+OSZn04QqRE/Io5HQMnHj5GUEAvNPFoUIDAsuSwNewlnOlyNh
	0W56+67EDMRTmaub9vb1GW/Z2KAesHzlpgfR0=
Received: by 10.86.72.15 with SMTP id u15mr2448712fga.15.1279873027295;
	Fri, 23 Jul 2010 01:17:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id m3sm3644524fai.41.2010.07.23.01.17.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 23 Jul 2010 01:17:06 -0700 (PDT)
Date: Fri, 23 Jul 2010 10:18:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100723081806.GQ2189@jama>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i2bg5t$mvp$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 08:17:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2010 at 09:25:49AM +0200, Koen Kooi wrote:
> There is a BIG problem with these patches, they break multimachine builds.

Yes, I see it now too after launching another machine with different arm
version (armv4/armv7) in my SHR builddir (om-gta0[12] were fine because
both using armv4).

ie binutils-cross versions are overwritten in
sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin/
and last build wins.

> I see 2 courses of action to fix this quickly:
> 
> 1) add ${TARGET_SYS} back, bump ABI
> 2) revert these patches, bump ABI

Someone know how it's solved in poky? I'm reading git log there and
don't see TARGET_SYS used for every cross lib/bin, so maybe they don't
allow multimachine (multiarch) builds?

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


