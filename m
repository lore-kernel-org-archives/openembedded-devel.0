Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nk01F-0007kY-VN
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 20:02:09 +0100
Received: by pvf33 with SMTP id 33so442966pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=tIf0UGS8BbhbxgRzIEq4Q7h1+izonlka7EkGAKLFdcA=;
	b=mtAEeRUges38ilBLwinzTmQ1QDqdRTsUwF/i8W5Im4jBwUd3V6xiKk21jVUl78xasr
	gzmTTBNYaEyhjaGuF3Z/FnMTCU8v/BCP+L3wCARxQD7kI42YkxFR17Oo7zGevrmmOsZY
	OOZqOr4gS7JmFeJsOxpGbmx8YO8WgtcYvW9GA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=F4AIGwHZzrtHXnLY34jeRLZ7koQx1dEHnAPShGUANPnVUkjBws2T/G+y6XIMPhxtcB
	1ho9eoPhHFFun1K3UZuKJ3kre6Gbkh9wIUGMoJhrXsjsX1B5vFt9SyNbOgun3bchZ4iM
	+wUJX2p452KBSwj6e3Hh+nsdFbdGeQ868WcsA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.55.11 with SMTP id d11mr5132928wfa.1.1266951560201; Tue, 
	23 Feb 2010 10:59:20 -0800 (PST)
In-Reply-To: <19c1b8a91002231039s1f790d4aqb4d6c1b61deb7837@mail.gmail.com>
References: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>
	<4B83DC88.7070705@tycoelectronics.com>
	<19c1b8a91002231015l1847354cle068bda32347bd29@mail.gmail.com> 
	<b6ebd0a51002231019h1d5f8b04q3af0b5300444ddc2@mail.gmail.com> 
	<19c1b8a91002231039s1f790d4aqb4d6c1b61deb7837@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Feb 2010 11:59:00 -0700
X-Google-Sender-Auth: c0056660198ba6fc
Message-ID: <b6ebd0a51002231059n7ff9408cn363689076479baaa@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 98
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
X-List-Received-Date: Tue, 23 Feb 2010 19:02:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 23, 2010 at 11:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 23, 2010 at 10:19 AM, Chris Larson <clarson@kergoth.com> wrote:
>> It's worth noting here that TARGET_CC_ARCH += "${LDFLAGS}" is a hack,
>> not an ideal solution.
>
> right.
>
> The preferred way of solving this is
>> reviewing the buildsystem in question to determine how best to make it
>> obey all of our bitbake variables, rather than injecting one into
>> another that it happens to already obey.
>
> We (OE) are the one's who will suffer this most because other
> distributions force gcc to implicitly
> emit this option while invoking linker so they bypass the problem in
> bulk of packages.

Ah, I didn't realize that, thanks for the info :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


