Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M5bNK-0008MC-NN
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 10:05:38 +0200
Received: by fk-out-0910.google.com with SMTP id z22so1190090fkz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2009 00:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YT8ml0kVPhWBDgm1QcH469FV2+X1lyz23uocTKfOLvo=;
	b=N1BqY7+djAgmIBvZ/S+PCs52NvLQe5YeyU18q0+RbL3E6WkQ/c0o/7JmoCnkjcff02
	i9MZT9aEmJ7DpwCM9fVVEgIQC0/QM9K6xArLilde/5hDyinMr/G+FDhhTpZ+VJkFEYrE
	LLzB42xI0xA8YZHq3J4psKyNqklTuRnT43/PY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WV6M7LNKGXbv+1V0gYPzHHy9qVazQalUBWsDzFKpm/RY0g595Xe+oeBK4E6orqOQEm
	iWnPspub+TnItne10P5tSOhi9gvOZ64R3/Us2EAwfGQZzakBb1RF4CvjugrtZXyUCiWn
	9Rv56l1vNSXwSdCoKoizzi3QlfI+7BQjlq1EA=
MIME-Version: 1.0
Received: by 10.103.52.13 with SMTP id e13mr3362906muk.52.1242547110782; Sun, 
	17 May 2009 00:58:30 -0700 (PDT)
In-Reply-To: <guoe44$ff1$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<200905160931.25224.marcin@juszkiewicz.com.pl>
	<200905161121.55689.g.eismann@gmx.net>
	<f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>
	<guoe44$ff1$1@ger.gmane.org>
Date: Sun, 17 May 2009 10:58:30 +0300
Message-ID: <fce2a370905170058r407d6b02qa9116bad2d64d292@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel modules
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
X-List-Received-Date: Sun, 17 May 2009 08:05:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2009 at 10:24 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> On 16-05-09 23:38, Cliff Brake wrote:
>>
>> On Sat, May 16, 2009 at 5:21 AM, G. Eismann<g.eismann@gmx.net> =C2=A0wro=
te:
>>
>>> BTW, is there any way to install the modules but not the kernel image?
>>> I have the kernel in a separate partition, so I don't need it into the
>>> rootfs.
>>
>> One way is to put the following in the kernel recipe:
>>
>> FILES_kernel-image_<machine_name> =C2=A0=3D ""
>
> Please don't do that, it breaks all sorts of things, one of which is fiel=
d
> upgrades.

Your suggestion?

>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


