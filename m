Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NJ2me-0001wG-Sj
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 11:31:40 +0100
Received: by yxe5 with SMTP id 5so663491yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 02:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YFQvS7gAHF04MwQ8VJY7FDJwb3pa20LnVL8ZlB7AFsI=;
	b=Z0Td1+oyWd7N9XL/bgdHU8feMNeZkEpE803NfWT7rpyd3kXzKPqylhDEhL0+J24BN/
	+bAdCSkR+uOTm0B/2huXUw2vMkVUqrzCREXcHMlhudDA5blNZ4pnJY1qlMicyGb6lPp9
	e/HduGp2wy9qRB3NSrRZQ1RbRbCmdKwaHu9wE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kbpzAEL8+0ib6nFv0LcVcCK0vh1FSz81iGuGZPdMF5LGosYtS7dA3v6HMo0WaOHyNO
	cZpbhz3N6OLIzVQiMCTBXXLFCsItYg9vwn2njL1n7Lo5zUwDgc948Z5fx4FugMjqcmRe
	x2fyMlCW3OgfohYaZ7Frq1+xpTys2juySxqgM=
MIME-Version: 1.0
Received: by 10.101.13.18 with SMTP id q18mr1946835ani.20.1260527393757; Fri, 
	11 Dec 2009 02:29:53 -0800 (PST)
In-Reply-To: <1260523507.6896.130.camel@lenovo.internal.reciva.com>
References: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
	<1260523507.6896.130.camel@lenovo.internal.reciva.com>
Date: Fri, 11 Dec 2009 11:29:53 +0100
Message-ID: <ac9c93b10912110229g30bb3a31gf501fbdd7b16d52f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: multiple DISTRO's in tmp
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
X-List-Received-Date: Fri, 11 Dec 2009 10:31:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/12/11 Phil Blundell <philb@gnu.org>:
> On Fri, 2009-12-11 at 09:39 +0100, Frans Meulenbroeks wrote:
>> However, I was wondering: wouldn't it be nice to allow multiple
>> distro's in one tmp dir (so that e.g. if they share the same version
>> of a recipe (like m4-native or os), this does not need to be
>> recompiled?
>
> Even if the (PN, PV) tuple is the same for two DISTROs it doesn't
> necessarily follow that the resulting packages will be the same. =A0They
> might have selected different compilers, configuration options, or
> versions of depended-on packages. =A0Or they might have a different
> filesystem layout, or any number of other things.
>
> So, practically speaking, no: it isn't going to be feasible to make
> multiple DISTROs coexist in a single TMPDIR. =A0This is a case where you
> do need to create a separate TMPDIR.

I understand that. Then again it *is* possible for multiple machines
in the same distro to co-exist, even though the machine config file
could change some flags.

Rethinking it, I would expect that if things can be shared it would be
in the native area (and perhaps some things in cross).

Actually just bumped into this because my tmp dir for angstrom was
about 18 GB and ofc I didn't have sufficient free space for another
tree (and also not really enough patience to wait out a build of the
cross tools).

Since my main goal was a small filesystem for initramfs, maybe it
would be better to make a recipe for a small package (e.g.
minimal_console_image.bb)

Frans


