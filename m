Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oosm5-0007Xn-0u
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 08:51:23 +0200
Received: by iwn2 with SMTP id 2so2247716iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4osoleBIRph0tmw7jFJY/hUNLiQsrA7Q0PGaZSevUBM=;
	b=aQQM4RPakgqmvhhldwwz0saeg6914+Lzx949f2r6Up5XtPuLG3cfGaNJOC96GKBcAw
	nDp9TsQX1Go+j+h3L9ECLeKrYD3Lo9PQU+H0nBfF5lQbjGhR1uztrTYxn8GuaMPCZbbk
	it75o8U34aCGcxUWC9MkbB0g8nm7BKgtAIFPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NTkcvHmwHK9ZY1RHL6HbP6dAsJprosRUp14T4r3K+FCeSYpgmgzo5TphtQBtGAfe2m
	qeUNGvmLLBpLR4SYwbCDhTW5x6PhXTtaaK+ZTPJsokX1zZirnDuxjcFhpEsmzt4SN8GQ
	ijdEDaQtUxOHcmIMJZk5vQTU8G3u04zEEIzuU=
MIME-Version: 1.0
Received: by 10.231.15.195 with SMTP id l3mr557318iba.188.1282891826127; Thu,
	26 Aug 2010 23:50:26 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 26 Aug 2010 23:50:26 -0700 (PDT)
In-Reply-To: <AANLkTi=HYU2iy923icHth=5zo1cvJOUTQxk+EK2kPVWQ@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<4C76C597.9050302@mlbassoc.com>
	<AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
	<4C76CD2C.2090102@mlbassoc.com>
	<AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
	<AANLkTi=cBDtFg9=GvPu0t01hVOhO=4uS5kwSAqLT+cax@mail.gmail.com>
	<AANLkTi=HYU2iy923icHth=5zo1cvJOUTQxk+EK2kPVWQ@mail.gmail.com>
Date: Fri, 27 Aug 2010 08:50:26 +0200
Message-ID: <AANLkTi=VbHxv0hejLkjjXzJFtX+Kuyf=xU+4ty4TLKxr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Fri, 27 Aug 2010 06:51:25 -0000
X-List-Received-Date: Fri, 27 Aug 2010 06:51:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'll add myself in a week or so. Need to see how I can get this organized.

Wrt the wiki page
I'd day remove the last succesful build column (or add a new one).
The new column should mention the last build. In yet another column we
can then add the reason.

E.g. currently khem has a ppc qemu thing where it says " 	fails to
build sed ". Next tuesday it will be unclear if this is from last
monday's tree or this monday's tree.

Also i would suggest that everyone who participates builds with
tinderbox enabled, and (at least in case of failure) adds a link to
the tinderbox log.

And one more question:
The wiki pages says: "All volunteers start clean builds for the
combinations they test,"
I have some platforms that are quite identical (eg sheevaplug and
openrd; both marvell/kirkwood based). I have no problems testing for
both, but as they are both armv5 and use the same soc, compiler etc, I
kinda feel this as a waste of time. I think I would prefer it to do
e.g. a bake for sheeva, followed by one for openrd (without a clean
inbetween) to verify that the openrd specifics (probably only u-boot
and kernel) work.
I can imagine for the various omap3530 variants (beagle, overo, ...)
this is also the case.

(thinking of it, if cpu cycles/time an issue we could decide to pull
some packages (e.g. some of the native ones) from pstage)

Frans


