Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Np4RA-0006qd-UR
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 19:45:53 +0100
Received: by iwn4 with SMTP id 4so6743893iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 10:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=fRhr/NjyN3eijk5Qtvv7Yax7txSWh2nCuBReKR6MC4o=;
	b=sRsTgwASbqGWSMavm9MMDrV5w7H0SxjLBoEjrUaKgXfqnLiVbzMgTRrDw13qNzTxwh
	uw7B6l6UBtu1NAzxmc1Vg58lchiLgNBiIKRIPzBcvjZr2bNdpBqKeZ0OlI9jooNYj7U8
	EyE+YZvkJATuKpI8sLYLtHcvxA4JUgKSVPwFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d0xtkm4krlYkdsp5szDWBLR7K6n/T2FexgjnW1z8DhXzmjOHecRL9BpyrYeFdeA/7v
	1YjMVia2uuwVaX8yF0udDIvcZJUkCyOUEWMX/4H37E5lS2fe7eyQ04WWz3h5yvpWE89M
	fkm7LIX3qVl7IkgrN2T66KgxMEs6LzrJIK00g=
MIME-Version: 1.0
Received: by 10.231.153.141 with SMTP id k13mr62579ibw.95.1268160171588; Tue, 
	09 Mar 2010 10:42:51 -0800 (PST)
In-Reply-To: <1268134848.32439.12.camel@hydra>
References: <1268134848.32439.12.camel@hydra>
Date: Tue, 9 Mar 2010 10:42:51 -0800
Message-ID: <19c1b8a91003091042s542dbfdl32d3d0f009753df2@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issue with (gcc-cross-|glibc-)initial and packaged staging
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
X-List-Received-Date: Tue, 09 Mar 2010 18:45:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 9, 2010 at 3:40 AM, Thomas Horsten
<thomas.horsten@citrix.com> wrote:
> I've spotted a rather annoying interim build failure but I'm not sure
> how to best tackle the situation.
>
> For example, gcc-cross-initial and gcc-cross install some of the same
> files in staging. Normally this doesn't matter, since gcc-cross
> overwrites the earlier ones installed by -initial, but when using
> packaged staging and many threads (BBTHREADS=10 for example), it
> sometimes happens that the pstaging packages for gcc-cross-initial and
> gcc-cross get installed into staging in the wrong order (or at the same
> time in two different threads), resulting in all builds after that
> failing due to undefined references in the lib files from -initial.

toolchain build happens in a sequence due to catch 22 it has to get
itself bootstrapped.
In a better world when staging is always packaged then gcc-initial
would create packages
which would be obsoleted by gcc-cross.

>
> Whether this happens or not is a timing dependent issue, so it's
> sometimes hard to reproduce.
>
> Any ideas how to solve this issue? I'm thinking that after gcc-cross
> (and glibc-cross) have been built there is no need to depend on the
> -initial packages any more.

yes but for that you need to have the notion of toolchain is not being
build from scratch and in
other case when you have already bootstrapped it. This state
information needs to be saved somehow
obsoleting package feature in dpkg or bitbake would help in this
regard when it sees that gcc-cross is
already installed it would replace all gcc-cross-initial and
gcc-cross-intermediate references with gcc-cross


 Another option would be to install them with
> different paths.

I think if there

>
> Thomas
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


