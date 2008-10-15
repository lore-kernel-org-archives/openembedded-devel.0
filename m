Received: from [209.85.217.24] (helo=mail-gx0-f24.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Kq3wB-0008UT-1F
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 12:49:07 +0200
Received: by gxk5 with SMTP id 5so678600gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2008 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=RmCK/SygPbTo46mnG1JfUNEeOoI11quvBoePGTiumIk=;
	b=W+4N/zLQ8PdOITF6Mg3vQNjKLKfql2QeagLNAY4Rh6Yow/YPDzm1TW0OqMH9xrFSvW
	+M7TU36ly0Rd6iirQTwQ3BWcXS08uHGE/XFk2GuhxOi0RAkEhbKh3/Xf3XoYkOZwAVUu
	JlM75z55Km3M2shE5Q+HfycXz2oOm6tXveiss=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=nZSn/yV2LWP4y/JDwyg/2uke5yqP7Hn1LrPGiF5+1OXxVANEG+Aw6gTgxgAN65E+xX
	CoidCdW3ulw+gq72C/DzkViTkBQTMuetHYv+3Qfhx1nS/pgEz8PTQrqHm7NseRv1F259
	ve28moIV76iJG2YO5PJSoaKvkO6L7BrW6Z8Kg=
Received: by 10.214.181.21 with SMTP id d21mr607038qaf.63.1224067436724;
	Wed, 15 Oct 2008 03:43:56 -0700 (PDT)
Received: by 10.214.12.10 with HTTP; Wed, 15 Oct 2008 03:43:56 -0700 (PDT)
Message-ID: <c384c5ea0810150343i1ad5429aubf37b9bdef2165a6@mail.gmail.com>
Date: Wed, 15 Oct 2008 12:43:56 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810151022.38477.zecke@selfish.org>
MIME-Version: 1.0
References: <200810151022.38477.zecke@selfish.org>
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 10:49:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wed, Oct 15, 2008 at 10:22 AM, Holger Freyther <zecke@selfish.org> wrote:
> Hey guys,
>
> I would start linking everything with -Wl,--hash-style=both as this is said to
> speed up the loading of shared libraries by about 50% (google is your
>
If we care about dynamic link speed we should maybe revisit the rpath issue.

I remember seeing strace's where on each .so, 10 attempts were made
before the right location was attempted.

Actually, it is still on my to do:

http://bugs.openembedded.net/show_bug.cgi?id=2140

Regards,
-- 
Leon


