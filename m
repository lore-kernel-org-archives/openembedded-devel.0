Received: from [209.85.210.194] (helo=mail-yx0-f194.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MIzLr-0007xE-QX
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 08:19:27 +0200
Received: by yxe32 with SMTP id 32so828262yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 23:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=jIAkpqavslqFHH+ydvPRSBUtlbs74DV/uvkMdok8FFU=;
	b=xb73KAqxDBKbBe1sOWidSvr3UaYAZvBdkP4pN6/vK96rE99R8ZIaQ6Q3lzMYMkwmXU
	lUZ6/P8Rw4RTp61J1G3oWaVXpDuPNOkTpFMi7+WsSnhoW5zlqcUsJLwIXpr+auIOHS8d
	DLEYpW7CI9Tnlf037TEZYEsYXN4N0zxvi12HM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=i3rM3H3egImHIUKbqXlkH5TnSJjgsXc+mLBhcTixd4lQ4BMZ15hcwemGrdwe1l85Ee
	KupGXUV1GWz+5wOdaKjVMvCmQivR3d4enPWVWvtDsA8B8OQS4BWKGv6nGWRg2bET+1P0
	L7JhIpTk1Z1Gai7PVux1Kj0SVE+OsnOqouN/U=
MIME-Version: 1.0
Received: by 10.231.10.134 with SMTP id p6mr2195576ibp.36.1245737301723; Mon, 
	22 Jun 2009 23:08:21 -0700 (PDT)
In-Reply-To: <20090623035538.GC23935@smtp.west.cox.net>
References: <20090505164137.GJ7973@smtp.west.cox.net>
	<200906121255.32105.raj.khem@gmail.com>
	<20090623035538.GC23935@smtp.west.cox.net>
Date: Mon, 22 Jun 2009 23:08:21 -0700
Message-ID: <19c1b8a90906222308wb603b69s6d828097a0235948@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Tom Rini <trini@embeddedalley.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Fix staging of binutils static libraries
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
X-List-Received-Date: Tue, 23 Jun 2009 06:19:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2009 at 8:55 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Fri, Jun 12, 2009 at 12:55:27PM -0700, Khem Raj wrote:
>> On Tuesday 05 May 2009 09:41:38 am Tom Rini wrote:
>> > binutils-cross: Stage libbfd/opcodes/iberty correctly, bump PR
>> >
>> > Changes the staging path for libbfd and libopcodes to ${CROSS_DIR}/lib=
.
>> > Disables staging native libiberty.a to ${STAGING_DIR_TARGET} as this d=
oesn't
>> > make sense to do. =C2=A0Cleans up empty directories.
>> >
>> > Signed-off-by: Nikita Shulga <nshulga@embeddedalley.com>
>> > Signed-off-by: Tom Rini <trini@embeddedalley.com>
> [snip]
>> seems ok. I hope you have tested it on 64 bit hosts as well.
>
> OK, found a problem. =C2=A0gcc-configure-cross.inc's do_stage will go and
> delete the libiberty.a we put here, after overwriting it with
> libiberty.a from gcc. =C2=A0There's a comment about wanting libiberty.a f=
rom
> binutils. =C2=A0Anyone recall why?

IIRC both libraries were not same and some programs (e.g. ksymoops) used
binutils provided library. That may not be the case anymore now you
have to check
I think avoiding to package static library would be an option to consider.

>
> --
> Tom Rini
>


