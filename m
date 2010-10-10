Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4rz5-0004HC-G5
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 11:14:24 +0200
Received: by gxk25 with SMTP id 25so763445gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NNvQyAnKvccMiwXOnHd5oudGcRVB4CJFvQwwI4tCeDs=;
	b=hFZsqbJ27YrgUzHyhquNLK9lefd44Hm0Fm5r2p3Xb+oG5XWPLlXT3zWRlvDeI4osGF
	onUDXJjElDkHWuwcjZmbOqTQWD9G/VE4/bM5+jukpfnXVzUGJwiGso/AU5DZzKEtuvzc
	wc4bFNtGkNYi6rfjGl+4vlPDALHevas9V4qPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Atfjg035+Cufm5BIlqjLy4TUpui7f3xW9FFPJhw5D+Xgiqm10MADzWxgNEG13H0iID
	aSDY9XTlIL63Oonft+si6JsmgVDSCxUKY62b8H2Dcqy/4G5HHk2qq5NzqEVpX6it6+GS
	JYRIJfrLiLJOT2qrf8biPCwYKiOdq1nvvSvdM=
Received: by 10.90.116.12 with SMTP id o12mr2632108agc.195.1286702038333; Sun,
	10 Oct 2010 02:13:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sun, 10 Oct 2010 02:13:37 -0700 (PDT)
In-Reply-To: <1286698831.3808.2.camel@mattotaupa>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
	<1286664909.15886.13.camel@saphir> <1286698831.3808.2.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Oct 2010 02:13:37 -0700
Message-ID: <AANLkTimXU=NzmwqCpnho5ukCVoXnF5qR_4D6XWN4RaWr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Sun, 10 Oct 2010 09:14:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2010 at 1:20 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 10.10.2010, 00:55 +0200 schrieb Michael 'Mickey' Lauer:
>> Am Samstag, den 09.10.2010, 22:58 +0200 schrieb Frans Meulenbroeks:
>> > libgee-native configure is failing:
>> > http://tinderbox.openembedded.net/public/logs/task/8568667.txt
>>
>> Does it contain 72c2ac940065948cb688fde821e51efac6b71b4b, which was
>> supposed to fix that?
>
> That is the exact same issues I reported 12 hours earlier [1].
>
>

I fixed it by not reautoconfing for now I think it should be
good enough.

> Thanks,
>
> Paul
>
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/=
025222.html
> =C2=A0 =C2=A0"DEPENDS not honored: `do_configure` runs before `do_populat=
e_sysroot` of dependencies"
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


