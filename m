Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PXfKw-0007X0-75
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 20:35:58 +0100
Received: by gyh20 with SMTP id 20so4134154gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 11:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=4SCDwZeCcED+YbkMM9sAZeTj7m3I64Nj4W1m4ibpqLg=;
	b=Gs70hIPvF/J7qAYO6aUjaOCkuv6UBnvQGX5L9X/BqEDs/ZbmDmxO/OCGxwNvRVUwyQ
	pthSVC5Qouu4TVmtDLHONVuwB488kB1CEvz1rpoHWHCTIrXHgPyJCmp8Z6DAS+UMIt0F
	qCtsqo+tmTw61UP2tRL/zHWjFUYovy67lCE0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=jleeU+k2WS0RN4fc+vMXl3g4sySWqRZXfjet0vCKR97qt/aJMhA6p11xMNIiVv1ERb
	+Y0o8/MaIHZsiJNcq2Tu/aFDOYHNtEIhvQejvJcxtNtSsETxojGYYpJUetjxG8b6gVB/
	B+Oj09CjsJeuTrRGIfxR7VxDC/0huBEccgqqA=
Received: by 10.90.120.17 with SMTP id s17mr4558698agc.193.1293564942999; Tue,
	28 Dec 2010 11:35:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 28 Dec 2010 11:35:22 -0800 (PST)
In-Reply-To: <201012282200.18012.roman@khimov.ru>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201012272236.01404.roman@khimov.ru>
	<AANLkTi=P_dKFv4JiyU8_g_EoLK_Zn+HvNtVfUEccTA56@mail.gmail.com>
	<201012282200.18012.roman@khimov.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Dec 2010 11:35:22 -0800
Message-ID: <AANLkTik0xe1LErj0ywgY-Rdv3Xo6xVP22Gt_Mw1d24bK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Tue, 28 Dec 2010 19:35:58 -0000
Content-Type: text/plain; charset=UTF-8

2010/12/28 Roman I Khimov <roman@khimov.ru>:
>>
>> Note the different definition of ldflags. (no -L ) and the -mthumb
>> versus -mno-thumb.
>
> We might have different targets for thumb things (mine is qemuarm), but "-L"
> difference seems suspicious (my test build is for 'angstrom-2008.1' if that
> matters).

yes -L can make quite a bit of differences in searching for libraries.
The way we specify them for historical reasons
is quite invasive

>
>> Btw I am using libtool 2.4 with systool support (should that matter)
>
> Maybe, maybe. I should try some newer distro for my test builds.
>

yes try with angstrom-2010.x or minimal


