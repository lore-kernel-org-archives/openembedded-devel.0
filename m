Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PLMlY-0004l8-P0
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 22:20:37 +0100
Received: by wyb40 with SMTP id 40so169668wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 13:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=cRE5TkEbjm6uynDtwhFu0bRl4bgfjsXx/pcxCOZgYL4=;
	b=AqnFc9UN96EVgNIc6AIGCORJnKolfEgITIm0hXdPi4qbZUO8Fgv9PC9iJgm1QVn+9j
	bogWYg56in3Sx2AeagmYNF57wsQQ3ZgX88SfFK9q3V2RYYybeXbvPq8fn1THUWSxedRR
	MxRH+755l34SkN8MBB9OIlSOvCxhlsCCuXmnE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=rfNzZXcIGaqVUTRd2fmjGrKS+lNyykCsszFEIeROpQFF62NWRy/nDGqZmFJn1Bef2U
	ASC87ahCcI5+pFnqTXN3oIiSc0+U2hh/liJ4Mei7c35T3idxE/tlivRlUQtAc3eopP2O
	vb0tmow7iihl0LdidtOAH+nAZGRp/WQl9CjOM=
MIME-Version: 1.0
Received: by 10.216.141.209 with SMTP id g59mr8881607wej.10.1290633557741;
	Wed, 24 Nov 2010 13:19:17 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.217.3.211 with HTTP; Wed, 24 Nov 2010 13:19:17 -0800 (PST)
In-Reply-To: <AANLkTims2A-RP8CRn5PPsQ+wyT6L7vzEqmutoF0ug=yj@mail.gmail.com>
References: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>
	<AANLkTims2A-RP8CRn5PPsQ+wyT6L7vzEqmutoF0ug=yj@mail.gmail.com>
Date: Wed, 24 Nov 2010 16:19:17 -0500
X-Google-Sender-Auth: EX4fSUupk3AXvjMyUS-8xXq63FE
Message-ID: <AANLkTi=Jv34yAH_hPjj0Jdnbkqh5Luor6xokMHXk=6z7@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails sanity check
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
X-List-Received-Date: Wed, 24 Nov 2010 21:20:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

That does it, thanks.

-Zach

On Wed, Nov 24, 2010 at 1:42 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Nov 24, 2010 at 9:32 AM, Zach Frey <zach@znfrey.com> wrote:
> > Hi,
> >
> > I'm seeing a new error using git HEAD and trying to build for the
> omapzoom2:
> >
> >
> > Build Configuration:
> > BB_VERSION        = "1.10.0"
> > METADATA_BRANCH   = "master"
> > METADATA_REVISION = "20117ec"
> > TARGET_ARCH       = "arm"
> > TARGET_OS         = "linux-gnueabi"
> > MACHINE           = "omapzoom2"
> > DISTRO            = "angstrom"
> > DISTRO_VERSION    = "next"
> > TARGET_FPU        = "hard"
> >
> > | checking how to run the C preprocessor...
> arm-angstrom-linux-gnueabi-gcc
> > -E
> > | configure: error: in
> >
> `/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r16.7+svnr11982/build-arm-angstrom-linux-gnueabi':
> > | configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E"
> fails
> > sanity check
> > | See `config.log' for more details.
> > | ERROR: Function do_configure failed
> >
> > Suggestions?  More info I can provide?
> >
>
> sometimes rebuilding gcc can be a bit tricky and I think thats what
> might have happened in your case. So please rebuild the toolchain
>
> bitbake -c clean eglibc eglibc-initial gcc-cross-initial
> gcc-cross-intermediate gcc-cross gcc
> bitbake <your image>
>
> that should help if the cross compiler was broken by  unstaging.
>
> >
> > Thanks,
> > Zach Frey
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

