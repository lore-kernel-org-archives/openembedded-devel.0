Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O4xlj-0003tn-TZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 16:52:44 +0200
Received: by wyb29 with SMTP id 29so1666197wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=bLxIjvvf9mayqMlMgJVTxa/vMjpz/6e/jaO9teWuAR4=;
	b=sxgBJrlTBnUSGMME7+QABONgNcilBe70+sdp3ZVQ6yPHR8F0Cqh8W3WgB4xABz9zgp
	lFb2J4P+OWgkuNOam2v1bN1VgXzttoHFmavQF/13TVOJJkuANzQvWkfEgoL5mUD8EdJv
	Vn8GdqjwyTm4JQ927JGCOtcZzs25ypJFIQWE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bnwXPFgGbg3cG7fMjaShcysySmhrZ07aCSpluL09759gxNKeUyDRuqSFpQaqPBu0BL
	IyQAHKONrsbNegC6mBnS+bIjdUyER7GuI6fmn7nj2PeZbu0HY2O90/U5gXHn3RtbYIqo
	U8SgXKi1a8Irwi2BAGaZSJHZHCh5UJGxfreCU=
MIME-Version: 1.0
Received: by 10.216.182.70 with HTTP; Thu, 22 Apr 2010 07:49:06 -0700 (PDT)
In-Reply-To: <201004221805.21986.khimov@altell.ru>
References: <201004221805.21986.khimov@altell.ru>
Date: Thu, 22 Apr 2010 18:49:06 +0400
Received: by 10.216.156.203 with SMTP id m53mr1762786wek.209.1271947747021; 
	Thu, 22 Apr 2010 07:49:07 -0700 (PDT)
Message-ID: <t2x48239d391004220749zf73cb0ct2537bf988b646aed@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Sergey Lapin : busybox: prevent postinst script from failing
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
X-List-Received-Date: Thu, 22 Apr 2010 14:52:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 22, 2010 at 6:05 PM, Roman I Khimov <khimov@altell.ru> wrote:
>> recent addition in rootfs_ipk.bbclass which runs postinst scripts with
>> -e option, while very useful, prevents busybox from configuring at image
>> build time. It will be configured at first image boot if your file
>> system is writable, but in case of e.g. squashfs, that will be fatal
>> error. This commit prevents postinst to fail, so busybox will create
>> all needed links at image build time.
>
> I don't think this is the way to solve it, because alternatives setup should
> work on build machine when everything is correct in packages. Most probably it
> fails because there is some other package installed which provides some
> program that is present in busybox, but that package doesn't use alternatives
> for (some of) its binaries.
>
> Essentially, this is a bug in a package providing "full" version of the
> binary. You can easily debug those if you add "-x" switch to sh invocation in
> rootfs_ipk.bbclass, you'll see then where it fails in image do_rootfs log.
>
> I've catched some of those in util-linux-ng and will push some patches later
> today.
That is probably not the best fix for the problem, but it doesn't make
it any worse.
It will allow proper images to be built until better fix is provided.

While you're at this, please look into recipe for 'bc'  tool, that is one
which causes problems. While speaking about busybox - it RRECOMMENDS
busybox-syslog which prevents normal syslog from being installed at
image build time.
I'm a bit afraid to touch this part to not break images for others,
probably some
"virtual/syslog" package is needed?

Thanks a lot,
S.


