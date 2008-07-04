Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1KElsU-00063i-LY
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jul 2008 16:03:10 +0200
Received: by an-out-0708.google.com with SMTP id b38so222557ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2008 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=NisuB2mGDrPmBB8JbkKGLha+GPdU/mxREFcvtHCyiJA=;
	b=eaqjkL3cokFSQrh4isQbxYV+8cNAnEfHGrPCcV+qMAPO2SgnJKx+6fFQzdLHrJvTwT
	krIicowcVJw5dfgIAYsQpg3ccl4UshDoXDYztl+kU/l0BqOz0yzwQ4wy/Ifm96XfMnpc
	pm6FBZiqP+1J98MPhoy8Xt0P6n+Sgj+wWGAXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=fUm7f1zKUp07l43mpcfJLAcPnQeOllr1bezdVKVuUujgAtb93/XuZ9cR5dSw5u//Q8
	OeF4F92RPtsrPWeQH2Ez3P5sR/lc7ORfLc4ws7TrNCsZUx+pYQBpqYImsk3GMBBxfdVX
	g/2lAFfLr65cdaTW5Zjjg97+z2vMs5IEhfjmQ=
Received: by 10.100.11.7 with SMTP id 7mr786723ank.149.1215179976368;
	Fri, 04 Jul 2008 06:59:36 -0700 (PDT)
Received: by 10.100.167.9 with HTTP; Fri, 4 Jul 2008 06:59:35 -0700 (PDT)
Message-ID: <bdb0025f0807040659rb9c4492l20eb023c40ff34fc@mail.gmail.com>
Date: Fri, 4 Jul 2008 10:59:35 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <486D0A40.9050608@balister.org>
MIME-Version: 1.0
References: <4861533F.7020906@balister.org>
	<440abda90806291608g2b4bdfbp71ed039b167e9aa9@mail.gmail.com>
	<486A73F5.2010906@balister.org>
	<f9a7555e0807020036g11261addn37530155264123b8@mail.gmail.com>
	<1CADFA951940554D86FBD8B24BBFF3A0018FA35F@LONMLVEM08.e2k.ad.ge.com>
	<486D0A40.9050608@balister.org>
Subject: Re: Building a rootfs, without building a kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 04 Jul 2008 14:03:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm using
ASSUME_PROVIDED += "linux virtual/kernel"

It is enough when you don't want to build a package like iptables that has
RRECOMMENDS = "kernel-module-ip-tables kernel-module-iptable-filter"

But I believe that in this case you could add this recommends to
assume_provided.

On Thu, Jul 3, 2008 at 2:20 PM, Philip Balister <philip@balister.org> wrote:
> Welch, Martyn (GE EntSol, Intelligent Platforms) wrote:
>>
>> Ben Lau wrote:
>>>>
>>>> Possibly, we should create a dummy kernel bb file since this may be
>>>> the best solution for the general case of people building images
>>>> without a working kernel bb file.
>>>> Philip
>>>>
>>> I am not quite understand why OpenEmbedded force to generate kernel
>>> and the dependence would force it to be installed in the user land. As
>>> the kernel is usually installed on another partition. It should not be
>>> a part of the file system image.
>>>
>>
>> But any drivers, etc. built as modules would need to be included in the
>> system's image and that at least would be a dependence.
>
> Agreed. The image recipes have most modules included as RECOMMENDS so the
> image builds even if the module is not present. The technique I am using is
> for cases when you need a rootfs, before you have a working kernel recipe.
> You can copy the modules onto the rootfs if needed.
>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


