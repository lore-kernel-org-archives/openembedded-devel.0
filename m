Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQTLD-00008G-J1
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 00:50:17 +0200
Received: by iwn5 with SMTP id 5so2880277iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 15:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=pQvbtP8Z6R0iaRvw5+OGPginrBPXDe63ij8g0eBKHVI=;
	b=CLVlLFBsBxxLaD3gO+LtnxGgQCcSv186OSjsxNG4xyIlDZt0F3s3Hw3QQAn2itzSv2
	om7pAoIlh4EO+yZxydiOaspNos08otZE8j1OwnIrby9f46EbpgPt+yvY+C9vWOWFHvca
	/sahDx9t5j3f2dOmc5v5AzqTu2alK9aD6r2HI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=jwrUJ+OdDwCdYCdmEzYotay3QvtChn11KA0SnQWQV3Q7j/jVPpqzgmCPzpG8YuOlFt
	xn4zxicJyUDfXbeN56jQmuhnqFHrPAV0N1AzoU/GE/rFYsR4FZmK9EZDXRVxzgfbES1D
	3z/K5VURqln7sFiXMpS7LByAmY3tS+z1cX2PY=
Received: by 10.231.141.27 with SMTP id k27mr4729310ibu.152.1277073943088; 
	Sun, 20 Jun 2010 15:45:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Sun, 20 Jun 2010 15:45:23 -0700 (PDT)
In-Reply-To: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jun 2010 15:45:23 -0700
Message-ID: <AANLkTimOqdguwX_c_wTR3mhBBVfjhSjf245UlWWTHOIA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-libc-headers-native, gcc-cross issue
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
X-List-Received-Date: Sun, 20 Jun 2010 22:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jun 20, 2010 at 1:51 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Dear all,
>
> After the introduction of linux-libc-headers-native I've bumped into
> the following issue.
> linux-libc-headers-native installs unistd.h in sysroots
> This causes other recipes to pick up the x86 files instead of the target ones.
> I've seen this happen for both unistd.h and sigcontext.h
>
> One of the recipes suffering from this is gcc-cross (for some architectures).
> Reason is that files are compiled with
> -I/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/include whereas
> the target specific includes are added with -isystem.
> This causes the -I to win.

right. gcc-cross is a special case where its not building purely cross
binaries but
also making libraries and objects that will run on the target. This
problem probaly
is seen when building startup objects  (crt*.o). This path is added by
gcc build
machinery as a path where it finds gmp headers. I suspect that gcc build should
not be passing this in the incudes when building target stuff.

I think with sysroot using -isystem<target_headers> should not be needed.


>
> In the past sysroots/i686-linux/usr/include was empty, but with
> linux-libc-headers-native it gets populated causing the files in there
> to be used instead of the ones in the target ones.
> By setting linux-libc-headers-native to ASSUME-PROVIDED and cleaning
> and rebuilding TMPDIR I was able to avoid the problem.

yeah this masked the problem as it has been masked till now.

>
> However, I think this needs a more structural solution.
> Suggestions are appreciated.

We should explore if passing this isystem in CFLAGS is needed at all.
if not then we should remove it.

>
> Frans.
>
> PS: it might also be that other files suffer from this, but until now
> I only had problems with gcc-cross

could be but I doubt.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


