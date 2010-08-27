Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oozfo-0000OB-QP
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:12:53 +0200
Received: by gwaa20 with SMTP id a20so1169620gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=mEwaZFBiXAKLZkOP0u/tiXg/+ynrMcjsuII96mBtwgg=;
	b=ufiFJrESznai32/Vh7vKh1SSyN4efqczCtpSHzNOldsm1KBxjRPHooRcuBeVTe9HXN
	EbXyh+3C3tAWPIjVOVPszPG6qITzFw6RTYUmSTY0HAKbr1Cl02pmw3NR4ss57Ql8/h13
	zCdFPjJKgh9G9ttjdamVeKxJ0hFCwNSqX5U78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=j3njNOYU8ZEOKe9sXn1IG3q+mLgJBX2x2KiBjWOYR9CvA4UoogoAXqJkvJhPhO45Xg
	/KwYXc+cx62T4NBNEXihGsNrYY0iu3T68GPlRMQZ8YHIrQKKdF2tc6Id9/Gd3U+r9Q2A
	h29roC3+IMzZKLhVC51J3k/iWiUkqUKkcfakw=
MIME-Version: 1.0
Received: by 10.90.103.13 with SMTP id a13mr1569964agc.117.1282918327275; Fri,
	27 Aug 2010 07:12:07 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 07:12:07 -0700 (PDT)
In-Reply-To: <1282915791-14096-1-git-send-email-fahad_usman@mentor.com>
References: <1282915791-14096-1-git-send-email-fahad_usman@mentor.com>
Date: Fri, 27 Aug 2010 16:12:07 +0200
Message-ID: <AANLkTikg89+1Vp6ssbj3Ovh8BtVQQ-v1c_LfB-Bk+7Cy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.50
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lemon_3.5.4: merged native and non-native recipes
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
X-List-Received-Date: Fri, 27 Aug 2010 14:12:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

reviewed and build the patch.

The nasty thing is that neither of the two recipes that use this one
(netsurf and wireshark ) build.
Netsurf comes wiht a gtk error, wireshark with an autoconf version error.
As neither of these are related to lemon or lemon-native and both
build fine, I'm pushing this.

Frans


