Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0F687612D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2013 16:46:03 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wc20so397547obb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2013 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=axGyEeEOcIsGYKybfUDaJFJUsEB1XNiAdjRhZc7XmHo=;
	b=Jz1ULMPGSBt+suUIaGvnzWFCRvxy/OE3CqEdp9AjXHyYb8K4gG9CjUlod3Ya3/Vytl
	PRwWJJaHLUPgyXw9ox0Nd4ljlUFmyE5h2J8SsAz5zEor7lm+1atsKC4cnSbBlZQxjnqF
	Y+FxygPR/RXhDF1foUqnM/zbs3Ji7BpI3MPCgI3M9XECziP8qo4L1f77PSCqiaSXFT+Y
	pCaLF+HFp9XImRLqLG1kOqRZMPiNszR1MdA+7VKaPTmXmfZo6SLHaeez0ivTtnWYVITJ
	vi+939MYE3VmVQOnw7jTZUgQHAtDyerikyNLkLZWHNUznGAtYk3ahkmQCbaXP8FIEH7z
	HUrQ==
MIME-Version: 1.0
X-Received: by 10.60.79.3 with SMTP id f3mr1579225oex.50.1372869964722; Wed,
	03 Jul 2013 09:46:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Wed, 3 Jul 2013 09:46:04 -0700 (PDT)
In-Reply-To: <CAJTo0LbQA+r7B0RVDy_0CJivi8H+3yktHUZqCFzz1=AcTkXDiw@mail.gmail.com>
References: <1372864933-17240-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbQA+r7B0RVDy_0CJivi8H+3yktHUZqCFzz1=AcTkXDiw@mail.gmail.com>
Date: Wed, 3 Jul 2013 13:46:04 -0300
X-Google-Sender-Auth: p_Uip7U4LDZbN41fhVEUDRvMZHU
Message-ID: <CAP9ODKoyQfZRmikLwxVcxCXdtikVGNKk8DwRsfNaRURqp4+HPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] lmbench: Add /run onto package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2013 16:46:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 3, 2013 at 12:45 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 July 2013 16:22, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> +FILES_${PN} += "${datadir}/lmbench ${libdir}/lmbench /run"
>
> This is part of base-files in oe-core master, so you shouldn't need
> this to create the /run directory.  Obviously any attempt at packaging
> files inside /run is doomed.

It has a subdir on it.

...
lrwxrwxrwx root/root         0 2013-07-03 13:43 ./var/run -> /run
drwxr-xr-x root/root         0 2013-07-03 13:43 ./run/
drwxr-xr-x root/root         0 2013-07-03 13:43 ./run/lmbench/


--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

