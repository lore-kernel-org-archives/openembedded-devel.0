Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jqocb-000359-T5
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 14:07:46 +0200
Received: by an-out-0708.google.com with SMTP id b33so1272641ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=ybtYSfuhnN5QJF6X0yDArsqlWs2Jh4Z8EreacglA/x4=;
	b=Uz4HfHnYszJFvgM4mLEFrEOtS/IZjbZQCNMHk9d8wiExFeVaAxE3FpsQfuATi+uReXyJhg3sUAtgtvmEYy/S7RoxopqllE7OAMZEIbxr1AGK2GkrHCwX0kH2t0gl/0WLLMF4qcjHvGVb/jgYFvr1kFeTtKVHHYrz9lzs7Gst/Fo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=sX7JOoHKU/qBO1SLL43rR7/WTGBnCZVjH/G0+zYe54n7TysjZvVtrK7h1P4ankz1Y4V6ZfPEsgdxttbuo4UN6yCmqvqKB5DrHritMitLs7W6pQjzvRlpbH9aISOIOeN1DWuk35UaU3rmKMaMOF8A3Vty4GkqBPr7UH/EixHIi6o=
Received: by 10.100.164.10 with SMTP id m10mr1369611ane.33.1209470837824;
	Tue, 29 Apr 2008 05:07:17 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Tue, 29 Apr 2008 05:07:17 -0700 (PDT)
Message-ID: <c384c5ea0804290507t66765c59w2fbc82366bec675d@mail.gmail.com>
Date: Tue, 29 Apr 2008 14:07:17 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90804290048g7618e76dw65ad0273504c9c74@mail.gmail.com>
MIME-Version: 1.0
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
	<c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
	<19c1b8a90804290048g7618e76dw65ad0273504c9c74@mail.gmail.com>
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 12:07:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Khem,

On Tue, Apr 29, 2008 at 9:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
> uclibc-initial recipe has this
>  require uclibc_${PV}.bb
>
I saw that, indeed.

>  That should pull the dependency. but this line
>
>  DEPENDS = "linux-libc-headers"
>
>  should be changed to
>
>  DEPENDS += "linux-libc-headers"
>
>  I think.
>
No, I think the DEPENDS was *intended* to be overridden with a small
*sub*set that is enough for -initial (to prevent cyclic dependencies).

However, I suspect it should DEPEND on ncurses-native now as well.

You know, I'll fire off a Poky Linux build on a system without
ncurses-dev on the host to verify my thesis,

Regards,

Leon.
>  -Khem
>
>  On Mon, Apr 28, 2008 at 10:03 PM, Leon Woestenberg
>
>
> <leon.woestenberg@gmail.com> wrote:
>  > Hello,
>  >
>  >  On Tue, Apr 29, 2008 at 12:19 AM, Leon Woestenberg
>  >
>  > <leon.woestenberg@gmail.com> wrote:
>  >
>  > >  On Mon, Apr 28, 2008 at 11:49 PM, Holger Freyther <zecke@selfish.org> wrote:
>  >  >  > On Monday 28 April 2008 21:51:05 Geoffrey Wossum wrote:
>  >  >
>  >
>  > >  The confusion started with commit "3afb4ffc02c1e4bde1031645cfa9f8e5465f2138".
>  >  >  Could you guys please see into that commit, and follow-up from there?
>  >  >
>  >  FWIW, by reading the intention of the patch commit, I checked with the
>  >  source (Poky), and indeed _NATIVE is used, and uclibc.inc DEPENDS on
>  >  ncurses-native.
>  >
>  >  One question remaining for me (and I think Poky might be broken in
>  >  that respect?) is that uclibc-initial_0.9.29.bb in Poky does not
>  >  DEPEND on ncurses-native (and does not re-use the .inc DEPENDS btw).
>  >
>  >  I have committed the _NATIVE, on both DEPENDS to the .dev branch.
>  >
>  >
>  >
>  >  Regards,
>  >  --
>  >  Leon
>  >
>
>
> >  _______________________________________________
>  >  Openembedded-devel mailing list
>  >  Openembedded-devel@lists.openembedded.org
>  >  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  >
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Leon


