Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S8E3l-0000NZ-6L
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 18:01:53 +0100
Received: by vcbfl13 with SMTP id fl13so3767707vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=apR9KAPn0w6hOcywSiKiYn6AeujYccHh3fxA2pRqp9o=;
	b=qnl7fKw2GVl3pq9C/McRoIpqf53M8VlacyvfnE+FRd77qUQ91MNQPPg1TtpNm0ujHZ
	d7PfTPwAUdLhIQu1efE8xEj/4+6y26awQDsJwjaAeJDWPGQ9pbzG17qoCX3TkqHK71v1
	ijyI+gSfE/BqYHEuVgiHpHWOYNM4pZLzIM3eW366W3TFT0jJbpuKKRAa/TVGrkWLHinL
	9KSpQPu6jQCLI/Oj29Q+mLBUVVFvXW4GImbaiHcaM6i3lPUoV5XRofd7snFagRgeBxMv
	n6bPVMBEbbR5d+xsAxwUEysFzZbMaZdwsiFglymVFv80p9f56Nj1Gp9Bxv53QoNdPQNR
	S0HQ==
MIME-Version: 1.0
Received: by 10.52.35.69 with SMTP id f5mr5100180vdj.29.1331830386129; Thu, 15
	Mar 2012 09:53:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 15 Mar 2012 09:53:06 -0700 (PDT)
In-Reply-To: <4F6219FC.7010506@dynamicdevices.co.uk>
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
	<4F6219FC.7010506@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 13:53:06 -0300
X-Google-Sender-Auth: rreV-YKuTE3prZQQWFF7MsKo9sk
Message-ID: <CAP9ODKrpf0tSGb5e8whj05JUtzjZTkbJMcD2C4TH3YUgJ1pQDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 17:01:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 13:34, Alex J Lennon
<ajlennon@dynamicdevices.co.uk> wrote:
>>I am working on that; my current work in progress can be seen at
>> https://github.com/OSSystems/meta-fsl-arm
>
> Thanks for that. I had a quick go ad building and as you say I saw bitbak=
e
> fails as it's trying to build up a patched linux-imx kernel.
>
> "include/linux/pagemap.h: In function 'fault_in_pages_readable':"

I fixed the branch right now and you ought to be able to build using it.

> Maybe the best way for me to proceed would be to put in a pull request on
> your wip-imx28 branch and see if I can add my oe-classic imx28 specifics
> into the copy?

I'll do the pull request but only after I get it properly done.
There're some missing things on it and some work to be done. However,
you should be able to base your work on that and keep doing rebases
against this branch (be prepared to fix some conflicts on the way).

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


