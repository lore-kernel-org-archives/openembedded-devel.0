Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N5oEU-0007CA-1B
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 23:21:41 +0100
Received: by iwn28 with SMTP id 28so5515098iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 14:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DAhQtUrSN1Ae+fje0cZ6i7J9G8E6kQ2kU3yCvgWwhN0=;
	b=aOilZSftZXA0qD18GKVGZR9FisOXOlartl4AhQtTDxXuTvQOO1iIYXj2QqCpUnaPKS
	lJyJP1c0niNqa+46Hz9rdINZxiZBkY00bVMLz2gS775Tjz20TQvJb95Tty5+dY/sYbnc
	oWkFs1LDbDBrb6miCG4eKMYiW6/fsBe59bbW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=K3aRE1S1c/OM4KnvvWhvtqH8TqRueSW9UJa7LhTQlrWxiD1LgKuzV+rR2YiuCnBWXp
	af61m3W7SN2kC/8mQMz10ReKUyJstLVIDWR//wp24E8a4y48vZ9Qpy4VWgBspkvtlZrY
	veXnUw+n8B1DDmYPYUjYIoZZXJ0W4BTkm/TQM=
MIME-Version: 1.0
Received: by 10.231.121.93 with SMTP id g29mr401287ibr.13.1257373224736; Wed, 
	04 Nov 2009 14:20:24 -0800 (PST)
In-Reply-To: <1257372143.4897.242.camel@lenovo.internal.reciva.com>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>
	<hcsola$kqd$1@ger.gmane.org>
	<B44D4D5BF344094DABB900C4E0F6E3533945A88B80@srv02.nortechonline.net>
	<1257372143.4897.242.camel@lenovo.internal.reciva.com>
Date: Wed, 4 Nov 2009 14:20:24 -0800
Message-ID: <19c1b8a90911041420w4eb01a58l587c3f9cd860cfe1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mono
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
X-List-Received-Date: Wed, 04 Nov 2009 22:21:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2009 at 2:02 PM, Phil Blundell <philb@gnu.org> wrote:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mono-cross-compilation=
-for-amd64.patch;patch=3D1 \
>> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mono-cross-compilatio=
n-for-amd64.patch;patch=3D1 \
>
> That patch (mono-cross-compilation-for-amd64) does look pretty bogus.
> The file header says:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"This is a workaround for bug 515050
> =C2=A0 =C2=A0 =C2=A0 =C2=A0https://bugzilla.novell.com/show_bug.cgi?id=3D=
515050#c2
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Real fix is something else which did not make =
into 2.4.2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://lists.ximian.com/pipermail/mono-patches=
/2009-June/151386.html
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://lists.ximian.com/pipermail/mono-patches=
/2009-June/151387.html
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0but we are ok with workaround its safe."

that was the remarks from the threads which discussed the above bug. I
forgot to include the complete reference.
I was merely going by the comments in the thread.
cbrake had a locally disable this patch and tested but did not yet commit i=
t.

>
> ... but it's hard to see how forcing MONO_ARCH_SUPPORT_SIMD_INTRINSICS
> unconditionally really counts as "safe": this seems almost certain to
> break on any target that doesn't actually have that support. =C2=A0If thi=
s
> patch were moved to SRC_URI_append_amd64 then it'd probably be ok, but
> the patches from those other two URLs look like a better solution.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


