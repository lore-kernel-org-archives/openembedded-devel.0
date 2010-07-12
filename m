Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYCW3-0002k3-U6
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 08:29:38 +0200
Received: by bwz10 with SMTP id 10so2613650bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mcg2YCfOpo1phXpwu4bNBmQKzWBtMjaOhdzSseB+GqI=;
	b=Hs1Xvz/qtvLG0JQPPDpVR0FrVF1vuDDDIGUOznCwosVj/+vpoiI9zZsZUNKcF9HC4d
	aXoSxuX8E9fkj11mVJGLiLX60OxVPtJ/nw9tYI/JAQqUPgEzCyxvEoXvZCrIgLmTDw/L
	6fR5o8UZS3dlvxxbrkC7T9Wol6/OPbe9uuo2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=V2GA3S0iKwQ08n8GHAchAIazPqfDelT61XHRsC+szBfGPkYbG41rUrnA3I062iBmZr
	sUmn76zJqW6BVDR9nqbJ4tnRN3ChcM3pG3DqKbHHdJG4UYlkj5JOCC7Cl37a5JUJ3cQ2
	QxZcbZ+Tg0NmE9NTzfSoXzofmbhuoTtPE/a/4=
MIME-Version: 1.0
Received: by 10.204.51.77 with SMTP id c13mr10357760bkg.98.1278915869640; Sun, 
	11 Jul 2010 23:24:29 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Sun, 11 Jul 2010 23:24:29 -0700 (PDT)
In-Reply-To: <1278850318.2345.1909.camel@mill.internal.reciva.com>
References: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
	<1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1278850318.2345.1909.camel@mill.internal.reciva.com>
Date: Mon, 12 Jul 2010 08:24:29 +0200
Message-ID: <AANLkTimXB5CusyFxI_DF8g51O2wQed1i-RljaGY2OCOy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Mon, 12 Jul 2010 06:29:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/11 Phil Blundell <philb@gnu.org>:
> On Sat, 2010-07-10 at 18:19 +0200, Frans Meulenbroeks wrote:
>> This patch introduces COMPATIBLE_TARGET_SYS
>> It is similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
>> is used to specify that a certain recipe is for a certain machine
>> COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
>> is for a certain architecture.
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Per our IRC discussion, I am still not totally comfortable with
> introducing this extra overhead to all users of base.bbclass. =A0In the
> vast majority of cases (i.e. essentially all packages apart from
> toolchain ones), TARGET_SYS =3D=3D HOST_SYS and hence checking both of th=
em
> is just a waste of time. =A0But I do take your point about wanting to mop
> up both cross and regular gcc.

Wrt the additional overhead. That is indeed a pity. Then again the
overhead is not that big (but ofc every penny counts).

A possible solution would be to rewrite the complete way variables are
stored and compared.
E.g. if the constraints would be hashed adding an additional variable
and constraint would simply be an extension to the hash table
(and not take up cpu cycles expect if there is hash clash).

But imho this is not something done overnight.

BTW: there are other ways to reduce parsing time, but people do not
like it if I mention them :-)
>
> I think I would prefer to see the TARGET_SYS check placed in some common
> place which can be included by all toolchain recipes (and, possibly, a
> general ongoing effort to reduce the number of non-cross recipes which
> refer explicitly to TARGET_xx when HOST_xx would do). =A0But I don't have
> a very strong view on the matter and, if there is a general consensus in
> favour of putting this in base.bbclass, I will go along with that.

Thanks.

Any other opinions? Acks ?

BTW: i did a quick peek at the cross stuff that we have: currently
there are four recipes that have a cross variant:
gcc, binutils, gdb and libtool.
For nios2 I didn't even have a look at the last two.

Have fun! Frans


