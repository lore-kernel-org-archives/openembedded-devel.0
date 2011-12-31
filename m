Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1Rgzz1-0007Ww-JB
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 15:32:27 +0100
Received: by wgbds11 with SMTP id ds11so21435483wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HjZq2N16ORmfhl34JBNRA14vfiIUUnZaiK9aRKkqlHQ=;
	b=L6BZvt4PmkeUqM5y5cnIvBJFrVURroAmLttA2i2nnT2YgXJ7boW7MoTpdJ5OddRsXV
	2ToHsT2g1PEMQUJtra86hK9Q0pd/0ovwFeXvNFeBIX3s0oCAqvux6Re1G7a/S73TJYRj
	WwLbuR1GV5F+K0HVJs3GDjAVYdemH8jnxWLCw=
MIME-Version: 1.0
Received: by 10.227.206.10 with SMTP id fs10mr42601520wbb.13.1325341507261;
	Sat, 31 Dec 2011 06:25:07 -0800 (PST)
Received: by 10.223.89.139 with HTTP; Sat, 31 Dec 2011 06:25:07 -0800 (PST)
In-Reply-To: <CACW_hTa+hpihvndWS-a7NZQme=+stZvUKxgtsxov3tdaqMj-xg@mail.gmail.com>
References: <1325331840-23575-1-git-send-email-adriano.pallavicino@gmail.com>
	<CACW_hTa+hpihvndWS-a7NZQme=+stZvUKxgtsxov3tdaqMj-xg@mail.gmail.com>
Date: Sat, 31 Dec 2011 15:25:07 +0100
Message-ID: <CAHucTJvY8BJsrpSDunZz_Rh703n=rpCps6idW7fYaH8diZr7nw@mail.gmail.com>
From: Adriano Pallavicino <adrianopallavicino@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCHv2][2011.03-maintenance] binutils_2.20.1 fixed md5 and sha256 sum
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
X-List-Received-Date: Sat, 31 Dec 2011 14:32:27 -0000
Content-Type: text/plain; charset=UTF-8

I can correctly download it from here
ftp://ftp.gnu.org/gnu/binutils/binutils-2.20.1.tar.bz2 (as indicated inside
bb file). The problem is only in sha256 and md5 sum. I'm using
2011.03-maintenance. I can desume that this branch is only for maintaining
2011.03 release. If someone decided to use binutils 2.20.1 why should I
introduce the new 2.20.1a from master? All the things are tested with
2.20.1 and imho the branch 2011.03-maintenance must continue to utilize
them.
Of course, if maintainers consider this patch useless, I'll remove it from
here.

2011/12/31 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> 2011/12/31 Adriano Pallavicino <adrianopallavicino@gmail.com>
>
> > Signed-off-by: Adriano Pallavicino <adriano.pallavicino@gmail.com>
> >
> > Fixed md5sum and sha256sum
> > ---
> >  recipes/binutils/binutils_2.20.1.bb |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/
> > binutils_2.20.1.bb
> > index 5154e2d..f40b676 100644
> > --- a/recipes/binutils/binutils_2.20.1.bb
> > +++ b/recipes/binutils/binutils_2.20.1.bb
> > @@ -24,8 +24,8 @@ SRC_URI_append_nios2 =" \
> >        file://binutils-nios2.patch \
> >        "
> >
> > -SRC_URI[tarball.sha256sum] =
> > "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
> > -SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
> > +SRC_URI[tarball.sha256sum] =
> > "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
> > +SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> >
> >  # powerpc patches
> >  SRC_URI += "\
> > --
> > 1.7.4.1
> >
>
> As told on IRC, I'd suggest to compare against the version in master.
> THere the issue was fixed using this patch:
>
> http://cgit.openembedded.org/openembedded/commit/recipes/binutils/binutils_2.20.1.bb?id=262f9eb0f046cd77d041a9dcb055700c5ab6601b
>
> Note that this also patches SRC_URI.
> Guess the patch above should also go into master.
>
> Did you by any chance download your binutils tarball manually?
>
> Best regards, Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Adriano Pallavicino

