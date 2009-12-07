Received: from mail-iw0-f198.google.com ([209.85.223.198])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NHhil-0001Qf-1R
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 18:50:06 +0100
Received: by iwn36 with SMTP id 36so3160288iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 09:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=deh48yycP4nubd/4wmGS7RdLiSgArDxasxU6fpiOYAs=;
	b=rqdOpUqPCB9XxCZmT3HyYvXHMDiX9vet9i8cjxtw14zHClj7mGGBE5/xL05OsVxuo0
	YGJiroTR0ngTY2ABp6S8ONNFtpebMQqjnqS3cz9tXTq4tKyY76RNqQ1xzlY4tTLeHkUX
	0cgSrWbeBskuc3522DC/SlUfAEiS51ynhRoIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TFcq9jqf7Z55s5QwS74TP1Deu1leBmp7h5MtRiDtq0a+mMQKyeanaugawO9b+JXicB
	3wzieGPWGnnGEev0z7bkimCsKBynVaFwQW5KErxS4nnYAW2B2rR5gat94zrg2r8vG3uW
	2ol5sYEs5o83TO1NKf5l5qEnL3PXbCwLK6CFo=
MIME-Version: 1.0
Received: by 10.231.125.19 with SMTP id w19mr585783ibr.8.1260208102939; Mon, 
	07 Dec 2009 09:48:22 -0800 (PST)
In-Reply-To: <c384c5ea0912061447v22a53b90jc71a893e0ac067ec@mail.gmail.com>
References: <c384c5ea0912061249g6201f0adwc6ff58ff20d68331@mail.gmail.com>
	<1260133938.6896.2.camel@lenovo.internal.reciva.com>
	<c384c5ea0912061447v22a53b90jc71a893e0ac067ec@mail.gmail.com>
Date: Mon, 7 Dec 2009 09:48:22 -0800
Message-ID: <19c1b8a90912070948w470f32fej9eb6bb8620994e32@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.198
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] toolchain team question about libiberty.a
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
X-List-Received-Date: Mon, 07 Dec 2009 17:50:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 6, 2009 at 2:47 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> On Sun, Dec 6, 2009 at 10:12 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Sun, 2009-12-06 at 21:49 +0100, Leon Woestenberg wrote:
>>> can we safely remove this from gcc/gcc-configure-cross.inc?
>>>
>>> do_stage_append () {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We use libiberty from binutils
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${CROSS_DIR}/lib/libiberty.a
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...
>>
>> Yes, I think those two lines are bogus and can/should be deleted.
>>
> After further discussion on #irc, the commit is here:
> b3312705e639262b3b83017897cd3056b22e8912
>
> (Just in case our analysis was way off and if this needs quick revertion.=
)

binutils maintains its own version and gcc its own for libiberty even
though the sources are same.
During build time they do not use the one you install but they use the
one they build for themselves. So unless some other package is
requiring this library we can stop installing it altogether in
binutils as well as in gcc. But if we need to have one copy in the
installation then
we should choose whichever is newer of two.

Thx
-Khem

>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


