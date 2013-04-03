Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UNVjR-0007f3-8w
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 00:00:37 +0200
Received: by mail-ob0-f182.google.com with SMTP id ef5so1881490obb.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZwVf3SRHG6kmFfjVtnmlaao3hJsTWc5Vk5ghxbhN+Z0=;
	b=fOK2z+lSXvUT61omzXoVDHnpVyDM2SqE3EYwFOcopolR2O6ducivke3NPeXCKkYTNb
	ojGtpvKdafz8OX0GBo1J7a9hy3FBJJBkjhzRwcQfP5PWDv+7AphFPUQA480Amdra+mnV
	lSYrlH3yxpvJLv561TS7a7ob0tK93DqJUuU6cfFLcopexLZoE0HCIGMwPSUBbi8ljb82
	Qn9wxRUcvv1EXEcZXxDS3CtEbz9hKDhJoJTKHyON5i7ktoAnl6Gv1M612ql7GJRYAniG
	lQ/ALaohCCyDFEq7tj6Dul/28+dAAjGvn32bUvD32S9Bmq95iDt+selKiFRle615bZpb
	RFkw==
MIME-Version: 1.0
X-Received: by 10.60.63.73 with SMTP id e9mr2255287oes.87.1365025404864; Wed,
	03 Apr 2013 14:43:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 3 Apr 2013 14:43:24 -0700 (PDT)
In-Reply-To: <515C8459.3080005@balister.org>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
Date: Wed, 3 Apr 2013 18:43:24 -0300
X-Google-Sender-Auth: 5B5UmLBQvUEvuSaGOvfXssGmVDs
Message-ID: <CAP9ODKpRFNN6EP74C+YN2=uN_hRa1BTwz4CHUcUazCQQWKV9dg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 22:00:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 3, 2013 at 4:34 PM, Philip Balister <philip@balister.org> wrote:
> On 04/03/2013 02:38 PM, Koen Kooi wrote:
>> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
>>
>> Just like https://github.com/naguirre/meta-cubox you're mixing
>> DISTRO policy in the machine files by setting the tuning to
>> hardfloat. Don't do that. If you want hardfloat, set that in your
>> distro config, not in your machine config.
>>
>
> This keeps coming up, but I do not see an answer that works for people
> creating BSP's that work with just oe-core and a BSP layer.
>
> How are we supposed to set TUNE parameters for this case? And yes,
> this case *must* produce useful output.

I don't think TUNE is a distro thing. It is indeed a board setting and
I expect every board to have a good know TUNE setting.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


