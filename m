Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OpNg4-0002qi-Hr
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 17:50:45 +0200
Received: by wyg36 with SMTP id 36so4417113wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=lFi6S+lLtgLoYv7t0gSbE7ks3HS40Ny4V2C56ESiDGc=;
	b=LV0ezbpyG1AX1lngYPfVo16ztE4cEQ+nGY97/59i+x6a7gPIIgMourPpy6s6w9m83n
	iqnJa89pTOqYh68UYfBw7y8u3+ITtQfeph/ymfm5txsjs2WzndusVz36I83VJ9X+6d8N
	hVX/r5s53vMDxg+k7rvmkmbrnfYBPH8K3KhLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=RjoWHMnNrNARAFS5H6H++Q1X/q7a9z7006L+Xzed4y3fclGWIMKiYj/0+FJ17N2f8Z
	GprGM83o27AU1RgA8Qy8Cr3JgBPip2pgX/GS8/mTgJ9FcNTA7upvYLF9pjXPeywzt8ST
	PmhztuQMPLGZUPIChI/URQAS4XSSF0Hf7nBKU=
Received: by 10.216.48.146 with SMTP id v18mr2488938web.56.1283010614198; Sat,
	28 Aug 2010 08:50:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Sat, 28 Aug 2010 08:49:54 -0700 (PDT)
In-Reply-To: <i5b82o$kgn$1@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<4C790CCD.9060403@balister.org>
	<AANLkTinMWegmS0vGvqXnkrPPqHXnDh+YkB-sxJ95KcTp@mail.gmail.com>
	<i5b82o$kgn$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 28 Aug 2010 08:49:54 -0700
X-Google-Sender-Auth: ENYwCETs-U-POtV5oPL3y2m97Ho
Message-ID: <AANLkTinUOXAUg66Pgs=JM_19Lw_66HWRztCbD-ww1=9Z@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sat, 28 Aug 2010 15:50:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 28, 2010 at 7:56 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-08-10 16:39, Chris Larson wrote:
>
> > *Every* patch that gets proposed is a patch that "works for you, but may
> not
> > for others".  You simply can't test every combination for every change
> you
> > make, it's not possible.  As long as these sorts of patches go the list
> for
> > review, as they now seem to be, I don't see the problem.
>
> You mean like the patch that removed the default openssl version for
> *every* distro and introduced an SOVERSION change to libs that can't be
> parallel installed, that got pushed without review? That one?
>

No.  That patch was not posted for review, and I just stated that the
patches need to go to the list for review, and I stated "patch that gets
proposed", not "patch that gets pushed", but I guess you're too frustrated
to bother reading the mail you reply to.


> So a patch was was tested nor reviewed that broke a lot got pushed and
> the person who pushed it refuses to help with the cleanup, just awesome.


I realize its more fun to ignore what people are saying and continue to
bring up something that was obviously not well done due to the lack of
review on the mailing list, but you're not accomplishing anything by doing
so.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

