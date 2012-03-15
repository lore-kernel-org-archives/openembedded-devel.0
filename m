Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S8EVN-0000wX-0l
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 18:30:25 +0100
Received: by vcbfl13 with SMTP id fl13so3800229vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 10:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Wr8RzCDMWY7shfirP6R0UY98JYdd0vCkEaAdupEKFsQ=;
	b=BOAUJvdE0jvst6RniZF0tuOuqpdAGx/d5pjMnuUd4ZFKPJqysiD+n4jQUPAqdC3hvH
	pNXjOyotFwRpbj+oIGExIP0YrWcg5rYtzZrvEyvCOChMoRlc23JHD2/cWgzDlToVBH/N
	9HQUPz1ZWvW6QAufczTk0TtoPT9o8eu1F7HKK+ZLt0HMSNoGEbub9ongwqoD7uYTXxq9
	5izIAUehCqdoUdfSR8729I+2YXnkKKjfXQwyFO+CjBc9Ztb8+CXABIcZTwrPm2bDtabc
	zihLeC0dNAKlwSWrUiYCuI5LLHWx+QstOSOSA81UrkM4Elt1/RpWVIPvp/3wKp5vjgfF
	5yYg==
MIME-Version: 1.0
Received: by 10.52.240.177 with SMTP id wb17mr5200730vdc.63.1331832098028;
	Thu, 15 Mar 2012 10:21:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 15 Mar 2012 10:21:37 -0700 (PDT)
In-Reply-To: <4F6223D4.3020100@dynamicdevices.co.uk>
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
	<4F6219FC.7010506@dynamicdevices.co.uk>
	<CAP9ODKrpf0tSGb5e8whj05JUtzjZTkbJMcD2C4TH3YUgJ1pQDg@mail.gmail.com>
	<4F622053.50202@dynamicdevices.co.uk>
	<20120315181021.56883348@eb-e6520>
	<4F6223D4.3020100@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 14:21:37 -0300
X-Google-Sender-Auth: 03frd9i9FnkdFlwHX3DpiUuAKa0
Message-ID: <CAP9ODKqUQAkn9B_rTiG2usVvD+4=U9arufuK3fNfy5ieB2y82Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Mar 2012 17:30:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 14:16, Alex J Lennon
<ajlennon@dynamicdevices.co.uk> wrote:
>>I think the first solution is better and that custom boards should be add=
ed
>> to custom layers
>
> Hmmm ok, thanks That being the case it may be better for me to migrate my
> recipes from
> the oe-classic codebase into a new layer created from scratch. It'll be
> quicker and easier for
> me that way but perhaps less generic.

I think many things can be merged back but it is better to have custom
boards in specific layers that inherit meta-fsl-arm. That said, I do
believe you ought to check if your changes cannot be made generic
(ofthenly it can be done) and this could allow it to be merged here.

> (Although my understanding was that Freescale have no intention of provid=
ing
> Linux support related
> =A0to OpenEmbedded at this time? Or at least that's what they are telling=
 me
> :)

Please complain at them ... this is the only way to revert it. Some
individuals are working with OpenEmbedded/Yocto and it might end
changing the Freescale's position if we can enough community support
and complains at them :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


