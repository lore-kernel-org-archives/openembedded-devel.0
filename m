Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P8A1c-0006sU-V5
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 13:06:37 +0200
Received: by wwd20 with SMTP id 20so869146wwd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 04:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=W39XVr8un8U7j1lB+b3BvYh3w+YMRjbopUShqQy4Sr8=;
	b=DKP57p6v3voktx8ItrdT9k65KUDSfnnTqnd3MPbxedcOJ3mzYR1KczwnK4v72f9b+3
	hRG8MW2wUFmwYUK0rYyOdqslPeucoMx4i4l1HgC78bpC7IBUEti8j1HxjqE0lSfKLXRB
	mtBH/pPypD4OJX0yoyZ+SXG0GmRLES+/q3S3o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J8VwViYgGm8Yc+Tv2w5yos0A4A6AEjA5zP9uWPus7Fd2/7SV8IGXU3H5E29ppn/JYb
	WVWn2yIQAshV6KZxbJcpc10G/w/9Rc3kMljxSTI0lrV4A3J0/SH8Ql5DKwvwsNkiaa8d
	0s+I+tKAwOwfJmIB9i7E+kluMQTSpzElTm+Ak=
MIME-Version: 1.0
Received: by 10.216.191.215 with SMTP id g65mr6551844wen.16.1287486362376;
	Tue, 19 Oct 2010 04:06:02 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Tue, 19 Oct 2010 04:06:02 -0700 (PDT)
In-Reply-To: <AANLkTikt5OzA0VogWq36Ss2ARpZvxjryjmioOivna-fU@mail.gmail.com>
References: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
	<20101016072423.GM28423@ibawizard.net>
	<AANLkTikt5OzA0VogWq36Ss2ARpZvxjryjmioOivna-fU@mail.gmail.com>
Date: Tue, 19 Oct 2010 07:06:02 -0400
Message-ID: <AANLkTinzw6z_34+w4xiWw8Wd-1dA16aX7KT2-yexiLY=@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-14
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
X-List-Received-Date: Tue, 19 Oct 2010 11:06:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 19, 2010 at 2:21 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> For me things in this branch work out quite well. 5 out of 6 targets
> build; still peeking at #6.

I got a build failure with beagleboard/beagleboard-linuxtag2010-demo-image:

http://tinderbox.openembedded.net/builds/96943/

Koen, if you happen to read this, do you know if the following change
fixes this?

commit c9ac99f13f603d15e9a852916cc4daa4a4d210bc
Author: Koen Kooi <koen@openembedded.org>
Date:   Fri Oct 15 10:46:24 2010 +0200


                                                   python-pygobject:
forcefully disable  introspection

It will pick up the .pc from the native sysroot and then fail to build
since we don't have target introspection libs to link against

> But actually reason for mailing was to drop the suggestion from Crofton on irc.
> He suggested testing_2010-xx-yy was confusing to some and that we
> perhaps better could use tested_2010-xx-yy
> I think he has a good point.

Yes, I agree that makes sense.  We could even rename the "testing"
branch to "tested", which is the semi-stable branch that comes out of
this effort.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


