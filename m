Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nh5En-0001Ug-5N
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:00:04 +0100
Received: by yxe1 with SMTP id 1so4377146yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cq0pe683GmUI35HVjnbnjVVR27YkWlVyQnrTI/SIMw0=;
	b=I5fmtQ/krMNX+maIWE8/mLPThQP+Vt0RCufUFX2R22aYOZyFTl/d9vkHi4BNdQZMmx
	vVO3JLVePl4JLsPLU0OryDajCkR0n+iaFW5MUSHEGqrOiPRhf2PszjL+kJZI/01LAX6a
	9lUKtF9DcNXeKAql1NET/OFKe0CF6bb9YxnMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=w4DoA3eHwezW2RTuSb/DrpqF9MnEcKRqn+v39p62JXKTls3FqSF1Xz++mP5BpohosT
	lp2Cu0WXTxjiHIGXtCFE4ktlPQiuXCSwHVY1i/f4b+4VZD5bhU7ZxFVdTp3na8Vu5Iy5
	CTErl2xHanqAXtEMm5yOs0/MemgB7HWFmNic4=
MIME-Version: 1.0
Received: by 10.150.75.8 with SMTP id x8mr8076904yba.126.1266256642342; Mon, 
	15 Feb 2010 09:57:22 -0800 (PST)
In-Reply-To: <20100215171952.GA3233@jama>
References: <20100214135613.GF5364@jama> <4B79673B.50108@balister.org>
	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
	<20100215171952.GA3233@jama>
Date: Mon, 15 Feb 2010 18:57:22 +0100
Message-ID: <ac9c93b11002150957r4e9bc0e6tbeb56e62c94e89b0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 18:00:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/15 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Feb 15, 2010 at 05:59:39PM +0100, Frans Meulenbroeks wrote:
>> >> I'm just thinking about using bitbake only in minimalistic chroot.
>
> Already rebuilding in new chroot :).
>
>> >>
>> >> What are advantages/disadvantages?
>> >>
>> >> How I see it:
>> >>
>> >> Advantages:
>> >> 1) more secure (I started to use separate user for bitbake, when I
>> >> =A0 =A0started to play with bitbake master instead release - because =
that
>> >> =A0 =A0warning it said), but chroot is even better.
>> >> 2) less problems when autotools pick some header or lib from buildhos=
t
>> >> =A0 =A0instead of staging
>> >> 3) easier to check, that -native package is missing for some importan=
t
>> >> =A0 =A0lib
>> >>
>> >> Disadvantages:
>> >> 1) Few more MB for building environment (extra libc, gcc, binutils, g=
it,
>> >> =A0 =A0svn, sh, etc. installed in chroot
>>
>> If they are on the same filesystem you could use hard links and save tho=
se MBs.
>
> Not so big problem for me, so I used mount --bind for dirs I want to
> share (ie /usr/portage as I'm using gentoo) and it took only about
> 100MB.. so not a big deal
>
>> >> 2) More administrative to keep chroot system updated
>> >> 3) harder to check, that autotools won't pick something from buildhos=
t
>> >> =A0 =A0in normal environment before pushing new version/recipe (ie I =
won't
>> >> =A0 =A0have SDL libs installed in chroot, but everybody else will and=
 maybe
>> >> =A0 =A0build will fail for them after I push some recipe.
>> >
>> > I see this as a good thing :)
>
> The last point? Well it's good for me (less issues) but if I push some
> recipe failing for 99% other builders just because they have pretty
> standard libs on their systems, then I should be blamed for pushing
> crappy recipe :).
>
>> Seems a good plan to me, please keep us posted.
>> (actually I've been considering building in a minimalistic VM)
>
> Well VM would be much slower..

Someone else told me the same today.
What exactly causes this? I would expect I/O to be the differentiating
factor as memory access and executing instructions should take the
same time, shouldn't it?
>
> If someone is interested in that chroot I can push tar.bz2 somewhere..
> but I guess that it's not needed (as it's only slightly stripped stage3
> gentoo tarball).
>
> Additional apps built (qemu-kvm just because I have ASSUME_PROVIDED for
> that as there is mmap issue fixed in that newer version)
>
> qemu-kvm diffstat texi2html cvs screen subversion git bitbake
>
> /etc/make.conf and chrootOE.sh I'm using in attachement

Thanks, will have a look at it!

Frans
>
> Regards,
>
> --
> uin:136542059 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0jid:Martin.Jansa@gmail.com
> Jansa Martin =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sip:jamasip@voip.wengo.fr
> JaMa
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


