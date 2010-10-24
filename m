Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PA7IM-00019n-Us
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 22:36:00 +0200
Received: by wya21 with SMTP id 21so2651887wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=yXDRteSvkiHnNIhjk4H2idl8gY6p5jPvef8y2F+oFew=;
	b=sM/UkS6tqPX+EF7OijbFhKnl/2DYndQSNXGa2GWoANowaVxB4Fh6UUI7h5Zm30VGlh
	cYyRBt+pMl648jZw+KFxp0ECcZOdSiLPL7tP9ZCzvc4+h1Oe6uoV51JnY//dWJEMJuts
	DuAyKTUslxMI72hGf8+zed67oIz1xsPKe1jxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=cu8ZSjHY8Zc+0Un4YlT266UDHLWxRVqTA0i87I6h2LhGN6rhBjZqQLrjFdWUFcJFB+
	trPwlAj9JvpmhaxsFjkUTnxY9uBQJkIsS7cTfBpX0hH4Cao008TRCqbRGVUZ1qfpOMCg
	iRErVBUQY2/rWFX4U3srFjB6EY54q2fwfEQfE=
Received: by 10.216.17.211 with SMTP id j61mr5374976wej.14.1287952518038; Sun,
	24 Oct 2010 13:35:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Sun, 24 Oct 2010 13:34:57 -0700 (PDT)
In-Reply-To: <4CC48F7C.2000403@freyther.de>
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
	<AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>
	<AANLkTi=8ZBZmU68NYZO3HkkLVJ09y+jhr0pWrd=bt=32@mail.gmail.com>
	<AANLkTimjYwr6vn5Makva7yciDA2_4KoiM=K7EtQQkYCf@mail.gmail.com>
	<4CC48F7C.2000403@freyther.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 24 Oct 2010 13:34:57 -0700
X-Google-Sender-Auth: H1LBlpNFSo2t1MFXRSHFnj4dkLk
Message-ID: <AANLkTikOFHV-gktGKA6iB=DenaM8KBHJKh=qJ00D8R7g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] [PATCH] fetchers: Use tar --exclude pattern to remove SCM files
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
X-List-Received-Date: Sun, 24 Oct 2010 20:36:00 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 24, 2010 at 12:56 PM, Holger Freyther
<holger+oe@freyther.de<holger%2Boe@freyther.de>
> wrote:

> On 10/24/2010 08:35 PM, Khem Raj wrote:
>
> >>
> >> this is used in all efl recipes and I've noticed it in elementary only
> >> because python-elementary depends on such new version.
> >
> > Do you have a list of recipes which use this ? I am sure with git it
> > will be hard to use such a thing
> > as the git revs are random and simlarily many other SCMs
>
>
> Speaking as upstream co-author of OpenBSC. We are using something like this
> to
> get the revision from the last tag of the repository. If someone is doing a
> make dist(check) we will copy a special version file into the tar.gz and
> use
> that instead.
>
> From an upstream point of view I think it is acceptable to say that the
> ones
> that build stuff from a SCM (in contrast to a tarball) should have the
> files
> of the SCM around...
>
> PS: I liked the --exclude patch a lot too...


I don't think its necessarily the fact that we're building from an SCM
that's the differentiating factor here, it's the build from a branch as
opposed to a tag.  The tagged sources in an scm may be (though aren't
always) exactly the same as the tarball contents, in which case the scm
files shouldn't be necessary.  Ideally, the buildsystems would work with or
without them, but I agree, I guess we may have to revert the patch :(
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

