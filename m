Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PARO5-0005nl-QK
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 20:03:15 +0200
Received: by pxi2 with SMTP id 2so742097pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XRkVTUyIJBp+/FgEwMndvzlrD/FA8Y5tVPtTTY/D4UM=;
	b=Re256mMhv8/BEi1sk0uvTACGd9oMG5wXwDednIUCvxasybcpWO4b+fvOavC41kY7TQ
	jOMUrUeyeDOojHwuZStMJFepPMp5D6vBQQzdYOTs5oCTbo+RDBKQmgY4xUcG9MEgxY9x
	Ch9FXbwxlU86fv3P3gyig8KrIRm1lADSRmu+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ZYBnNmdn5nOsebtZlxFo9fbqzMzV7V09UdgUjBevO2+2Z4UwOGJaLyQ4PL6J4WPoND
	J1ioKnwm5yKPCq4ICt6uFv9FflUT2s4OqT08CE8DfEhmgdQzv3hlAAjz8KLdw+mGRH94
	wY0YGQ4J38EWN+R66He9I5bwNmSwYzRtjollw=
MIME-Version: 1.0
Received: by 10.42.103.14 with SMTP id k14mr676144ico.267.1288029750514; Mon,
	25 Oct 2010 11:02:30 -0700 (PDT)
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 11:02:30 -0700 (PDT)
In-Reply-To: <4CC5731F.2030009@dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A505AF5C@exchange.intern.dresearch.de>
	<1288000524-18800-1-git-send-email-sledz@dresearch.de>
	<1288006635.3793.38.camel@mattotaupa>
	<4CC5731F.2030009@dresearch.de>
Date: Mon, 25 Oct 2010 11:02:30 -0700
Message-ID: <AANLkTi=W-RYEx8fg1ALigkSAPa9V9i-5=Zg+PCPEX0QC@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2] epiphany-2.30.2: unbreak do_configure by setting ca-file path
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
X-List-Received-Date: Mon, 25 Oct 2010 18:03:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/25/10, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 25.10.2010 13:37, schrieb Paul Menzel:
>> Am Montag, den 25.10.2010, 11:55 +0200 schrieb Steffen Sledz:
>>> * Disable existence check for ca-bundle file in configure.ac because
>>>   it does not work in OE cross compile environment (location at build
>>>   host may differ from location at target).
>>> * Explicitely set ca-bundle file path according to the one used by
>>>   ca-certificates package.
>>> ...
>>> ++# disable this check because it does not work in all environments
>>> ++# (location at build host may differ from target)
>>> ++#    if ! test -f "$with_ca_file"; then
>>> ++#        AC_MSG_ERROR([No such file '$with_ca_file'. Use
>>> --with-ca-file=3Dpath to set, or --without-ca-file to disable])
>>> ++#    fi
>>
>> Would adding the following check also work?
>>
>>         if test "$cross_compiling" !=3D "yes"; then
>>          =E2=80=A6
>>         fi
>
> I don't think this is a good idea. It is not a problem of cross compiling=
.
> Cross compiling is just one case where it occurs.
>
> Also if i build for the same architecture it is not a good idea to check =
for
> the existence of a file *at buildtime* and compile this path into the
> binary.
>
> The existence of such a file should be checked and handled at runtime onl=
y.

For native build runtime and buildtimes are same even if you
are building in a chroot so its an ok assumption
adding a cross compile check is a good thing.

It works on debian derivatives because the paths match coincidently
so for target package it uses the ca files installed on build system
but for SuSE location is different so it fails.

You have my ack for the patch

Acked-by: Khem Raj <raj.khem@gmail.com>

>
>> I think this would be more portable. Could you report that issue
>> upstream too please.
>
> I'll try.
>
> Steffen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


--=20
-Khem


