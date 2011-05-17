Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMNe6-0000sq-Bz
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 19:01:22 +0200
Received: by ewy5 with SMTP id 5so208749ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=UjJUocoJOID4xGWRt6/4vAhtR1Ucc4wLlUtoAS8cf7E=;
	b=dZYqxeUZxagAUl24hiL/wysDP82BTp0pMqtEdK7/fWlYsHwZLlqZFI3SkhWq50Jjui
	1E9NpToUatvcXhSBzex2AhNC7LEhiVoXh3+7vj5ad9hYq09gbYw4tcbK/MzfFdxshXjQ
	SKonCqbI9q19bGk4SYBt/wv7Vzg72jaXnqhts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XCAOSfHUcQyP5ceJvMcKdguQ3mzIwNUp80+SBV2GA5OUjR5YqMlnbsGPk+I7a9au7d
	s8R+wHv6Evz8MTwCukWIiXbJidVtL5fLqHvKgNMsYauj6+Oq/R3r6DRAhvxs0jz85iLI
	V/EtaH/v2/heltlZ983fdl30CCCymv1s/JaCg=
Received: by 10.14.10.18 with SMTP id 18mr298345eeu.172.1305651508243; Tue, 17
	May 2011 09:58:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 09:57:58 -0700 (PDT)
In-Reply-To: <1305619418.4065.4.camel@mattotaupa>
References: <1305570476-7207-1-git-send-email-raj.khem@gmail.com>
	<1305619418.4065.4.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 09:57:58 -0700
Message-ID: <BANLkTinNKg=DD2LuhdnAm=k2+T1nZGu=Pg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] uclibc_git.bb: Backport epoll implementation
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
X-List-Received-Date: Tue, 17 May 2011 17:01:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 1:03 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Khem,
>
>
> Am Montag, den 16.05.2011, 11:27 -0700 schrieb raj.khem@gmail.com:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Many applications e.g. firefox need it
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../uclibc/uclibc-git/uclibc-epoll.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0378 ++++++++++++++++++++
>> =C2=A0meta-oe/recipes-core/uclibc/uclibc_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A03 +-
>> =C2=A02 files changed, 380 insertions(+), 1 deletions(-)
>> =C2=A0create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uclibc-e=
poll.patch
>
> [=E2=80=A6]
>
> is that patch different from what was merged upstream [1]?
>
> If no, could the revision just be updated?

yes eventually. So far I have tested the revision we are at and it
takes time to validate the newer revision which includes many other
patches along with this one.

>
>
> Thanks,
>
> Paul
>
>
> [1] http://git.uclibc.org/uClibc/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


