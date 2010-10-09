Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4TgU-0001ts-Mj
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 09:17:36 +0200
Received: by iwn7 with SMTP id 7so522900iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 00:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=22W5CKCDrJsE3E6tdj5I/YJKWSpO0GiX9JfJL18vXvk=;
	b=wCo7SduEj8N+wPX9Xjw5tyMjApRGkCvpAWMemP+tw3iTqpWJE93RDgGP5yWBBDSOqt
	pRfN7OeEsQ1yrVAnh8M1pedq5ezosx2ySwncLKvn8+W4/e9lEGgngZRXcYBTvYhNg8+Z
	ipn/i9nH4gKOrj+450huNjESjhoQUj0hwQ8IQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ia9s/9vRsufvufs4Y6pCF6zkdI5MsmbRSpmUuaH9zz9ZKcl68aSGJ7uMsSf8/lZO2Q
	FHosbA4Dlrv35p8XnBxxY34pheSOjCXLQJ+xlkwjX2X+oGFchwOYnDYJtbZ5pXVc1iX8
	DPsK1qOzGtAyGFiZDa0PqbXPw7LdORd6a6KVc=
MIME-Version: 1.0
Received: by 10.231.148.85 with SMTP id o21mr3041474ibv.26.1286608630369; Sat,
	09 Oct 2010 00:17:10 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 00:17:10 -0700 (PDT)
In-Reply-To: <1286579922.4113.6.camel@mattotaupa>
References: <1286500978.3659.60.camel@mattotaupa>
	<AANLkTim9By3dRuBbtOveONnCHOso+SvtE2mTt+5yg1SZ@mail.gmail.com>
	<1286579922.4113.6.camel@mattotaupa>
Date: Sat, 9 Oct 2010 09:17:10 +0200
Message-ID: <AANLkTin-9mzuHD=HJUgWyRiUW3Vfqmxo+oc4+NiBNEtV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OT: `git am --scissors` (was: [PATCH] gtk+_2.20.1: add `pango-native` to `DEPENDS`)
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
X-List-Received-Date: Sat, 09 Oct 2010 07:17:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/10/9 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Freitag, den 08.10.2010, 08:24 +0200 schrieb Frans Meulenbroeks:
>> 2010/10/8 Paul Menzel <paulepanter@users.sourceforge.net>:
>> > Dear OE folks,
>
> [=85]
>
>> > 8<--------------------------------------------------------------------=
>8
>> > Date: Thu, 7 Oct 2010 13:43:58 +0200
>> >
>> > Since two or three days I am not able to build `gtk+_2.20.1.bb` anymor=
e. I tried to revert to `gtk+.inc` 9730a2 [1] with
>
> [=85]
>
>> And please also don't type things before the --- like "Dear OE folks.
>> Please do explanations below that line, so if your patch is accepted
>> people can just do a git am without the need to modify the commit
>> message.
>
> I actually formatted my message this way because it should still be
> possible to use `git am`. Please take a look at the option `--scissors`
> in `git help am` or git help mailinfo`.
>

I must say I was unaware of the scissors option.
Then again for applying the patches I use contrib/patchwork/pw-am.sh
as it picks them up from patchwork with ACKs etc.
Ths script does not use the --scissors option.
If we should make this common practice, I suggest we change the script
(not difficult) and document that way of working in the wiki.

Frans


