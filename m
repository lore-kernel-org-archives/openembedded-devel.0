Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1OBJlW-0007Bv-9u
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 05:34:46 +0200
Received: by qyk33 with SMTP id 33so5530506qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 May 2010 20:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=xhKfx+/S78NzGO4m7gQ9YHg7Pm0Kgn9TweZflAJKhuk=;
	b=BcbPpq8wfPRctmqFQWdu5hka9SnlwVE3eWwe6QdFAjjcbc8cMzTOCaIE47+sWeyYXK
	CxCDch+mBMK2/ifh4CDhj+2StMjG/pRyZzKFusazV9R/NgWLZyhEkyzuzUw0mOeD3Ink
	5Y1FJ4SIya9i+GDfLv9WfoKYwHM8AOc+8exVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RuEQ0b79TjqZGhHTXiuUE7LyooW49jKB9Lk9W+Qs78gj+EAE8xjKVp+Gf/xaCAgYUL
	vIEqzMHu5DXxHeS51bR/GQsEx9jTjCN5fA3+O8m2zVW4bIYN/XnVhVNB040DvFKn9CnA
	iLZ9VMzbu98ixcwY/OmlBgTuV3ZS/6xw486Hw=
MIME-Version: 1.0
Received: by 10.229.186.210 with SMTP id ct18mr1393930qcb.2.1273462253598; 
	Sun, 09 May 2010 20:30:53 -0700 (PDT)
Received: by 10.229.232.134 with HTTP; Sun, 9 May 2010 20:30:53 -0700 (PDT)
In-Reply-To: <4BE76B85.8070500@mwester.net>
References: <1273368260-12668-1-git-send-email-hvontres@gmail.com>
	<4BE76B85.8070500@mwester.net>
Date: Sun, 9 May 2010 20:30:53 -0700
Message-ID: <q2ha7f8874a1005092030s412cd401oaed92cf4d4930906@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] slugos-image: fix opkg-cl hanging on installing device tables
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
X-List-Received-Date: Mon, 10 May 2010 03:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 9, 2010 at 7:12 PM, Mike Westerhof <mike@mwester.net> wrote:

> Henry von Tresckow wrote:
> > opkg-cl was hanging during slugos image builds due to opkg-cl waiting for
> an answer for overwriting the device tables.
> > adding " -force-defaults" to IPKG_ARGS allows the image to build
>
> This is fixing a symptom, not the real problem.  I've just committed a
> SlugOS-specific fix that dodges this problem, so I don't recommend we
> apply this.  Specifically, we *do* want to know if we're overwriting a
> config file while building the rootfs so that we can use a
> PREFERRED_PROVIDER or similar mechanism to select the correct one.
>
> The root cause is the original commit a week or two ago that incorrectly
> changed the handling of the device_table file.
>
> The "fix" I committed "backs out" one line of that bad commit in a
> SlugOS-specific recipe -- which isn't a fix, but at least it gets SlugOS
> building again, is no worse than things were originally, and it affects
> no other distros.
>
> -Mike (mwester)
>
>
Thanks for fixing this.
-- 
Henry von Tresckow (hvontres)

