Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mb1kv-0008VX-8D
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 02:31:53 +0200
Received: by qyk35 with SMTP id 35so3653511qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 17:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BPU1vWryk6R+d1jrUKuMzvEnE4O86urejzQ6V9dJDTU=;
	b=cM+Pfp75PDQwsLqX3acxL2M3rv6XfLJrPClE9a6VAU9E+gKVa2ToNeKUteY3Nf5rS5
	44rtCHTLVh+N9Lqe6MfxdqLVzjAAys0bV77qeXQavmzICB6g8BD7Aq9oNG0TMQQu8C6L
	BS9icDDDpyiSifl6q/bIisQNhftIwgCyR8ojg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=N71Q6/cvhuVi76hjR2TlPafZRalwTbFehOt7SWH51t9SeFhrx95QRjelJ+fBLYgYhD
	Iu17Fk/p4i1W8wH4GUWC8ibXM8D9lsXH2icksvBtqblUFsT+D/WXhRCOfikqAhQZbitp
	nfqwEZINiyJh/cR3n4vNXBQFYtGutWvvrB53A=
MIME-Version: 1.0
Received: by 10.229.83.213 with SMTP id g21mr1978765qcl.86.1250036129907; Tue, 
	11 Aug 2009 17:15:29 -0700 (PDT)
In-Reply-To: <1249984289.1608.29.camel@mill.internal.reciva.com>
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
	<200908110501.11808.holger+oe@freyther.de>
	<1249984289.1608.29.camel@mill.internal.reciva.com>
Date: Tue, 11 Aug 2009 17:15:29 -0700
Message-ID: <19c1b8a90908111715h51cc0060lfd228d1a6db3c52f@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] uClibc: use __always_inline instead of __inline__
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
X-List-Received-Date: Wed, 12 Aug 2009 00:31:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2009 at 2:51 AM, Phil Blundell<philb@gnu.org> wrote:
> On Tue, 2009-08-11 at 05:01 +0200, Holger Hans Peter Freyther wrote:
>> On Monday 20 July 2009 00:33:57 Otavio Salvador wrote:
>> > From: Mario Domenech Goulart <mario@ossystems.com.br>
>> >
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Why? what does it fix?
>
> There are some functions in the dynamic linker bootstrap code that must
> (for a variety of reasons) be inlined to operate correctly. =C2=A0Under s=
ome
> circumstances, particularly on MIPS for some reason, gcc decided to
> disregard the normal "inline" qualifier and put these functions out of
> line which led to disaster.

Which particular gcc version is in question here ?

Looking at the code I think if it is gcc 3.2 then it would use the
'must align' semantics
but I would be surprised for other gcc versions because for other versoins
__always_inline is simply defined as __inline which is equivalent to __inli=
ne__

Thx

-Khem


