Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chris.sarra@gmail.com>) id 1RdSKi-0001CY-FJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 21:00:12 +0100
Received: by wgbds11 with SMTP id ds11so12649933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 11:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=bSH/ZvMoJVTNaSFOb90+sxqjN3xwNt9eq56lzIk+pYk=;
	b=Sq0j8ODvNqV2pXrvkS3BqciQhJinHHgsgU7fVmdmEBC18EemF4rhOPpUmYWd96yA+w
	2lm22iIp1p78rvzu8LHRq39hviVrv2mRqnUY2P4O/qFHvIFOBiUsGiBJJjKhmwWy55Ha
	Rw+SlsuR/DpKqCCWJ835mBnHBAgwA413d1fF0=
Received: by 10.216.138.143 with SMTP id a15mr9934884wej.11.1324497184177;
	Wed, 21 Dec 2011 11:53:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.121.133 with HTTP; Wed, 21 Dec 2011 11:52:32 -0800 (PST)
In-Reply-To: <CA+M6bX=sR9QVCM7AmqQY-xY74Tp-y9iebQsg3L_E1rGDsJR6ZQ@mail.gmail.com>
References: <CAAJ_Y3kksFvP84YPNV0=oQE7x8XxH0-CoDq02eO-MsODi_2B0g@mail.gmail.com>
	<CA+M6bX=sR9QVCM7AmqQY-xY74Tp-y9iebQsg3L_E1rGDsJR6ZQ@mail.gmail.com>
From: Christopher Sarra <chris.sarra@gmail.com>
Date: Wed, 21 Dec 2011 14:52:32 -0500
Message-ID: <CAAJ_Y3kpmycekZ+JokVjChnOdg_-aR3=TcFgvFP0gXf-r1LR6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Wed, 21 Dec 2011 20:00:12 -0000
Content-Type: text/plain; charset=UTF-8

I tried `git pull` but apparently everything is "Already up-to-date." Am I
missing something else?

Thanks,
Chris



On Wed, Dec 21, 2011 at 11:04, Tom Rini <tom.rini@gmail.com> wrote:

> On Tue, Dec 20, 2011 at 7:16 AM, Christopher Sarra
> <chris.sarra@gmail.com> wrote:
> > Hi All,
> >
> > I'm writing to ask about a recent thread I saw about problems with OE
> > fetching fakeroot 1.15.1. I'm new to OE and BitBake, and I'm having a
> > problem similar to what I saw in that previous post:
> >
> > <<
> > NOTE: package fakeroot-native-1.15.1-r0.0: task do_fetch: Started
> > ERROR: The checksums for
> > "/localhome/cwsarra/oe/sources/downloads/fakeroot_1.15.1.orig.tar.bz2"
> did
> > not match.
> >  MD5: expected "248c408b1e06e776c5739871b49bd968", got
> > "c33f8b2be5bfafc0258efb8139cc5972"
> >  SHA256: expected
> > "45fbb9ad611f33224cc09954963dde563cc80fe58c76feb25b6e98550b81729a", got
> > "92ed10b39922bb2890ef7cc7512fdfe57bd2d1f54a894364518b292f79455138"
> >
> > NOTE: package fakeroot-native-1.15.1-r0.0: task Fetch failed:
> >
> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.15.1.orig.tar.bz2checksum
> > mismatch.: Failed
> > ERROR: Function 'Fetch failed:
> >
> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.15.1.orig.tar.bz2checksum
> > mismatch.' failed
> >>>
> >
> > I read through the proposed patches, but I'm still not clear on which
> files
> > I need to edit to work around this issue. There was a fix proposed for
> the
> > fakeroot_1.15.1 recipe file, but that didn't seem to work for me. Can
> > someone tell me which [additional] files I need to update?
>
> If you just do a git pull it should all be working again.
>
> --
> Tom
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

