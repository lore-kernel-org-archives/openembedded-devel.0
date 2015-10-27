Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6544B770C5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:24:54 +0000 (UTC)
Received: by iofz202 with SMTP id z202so234203620iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=IT6x0BsIiSoRhbP7jUMA6LNNFyrcImMSq4BzOKPXOHc=;
	b=lZngkK4U0aXSGGgiBgPL5yrEY/CpLdI+/4Y5iC4LGjHZBksh2MBEyElI48cI9jdl0G
	1Z3UCNxQ323657jCN/tbHAycbpPo9Q2izX06csaoS6LPyGhQLezf3LGEYET+FZF2EX/5
	c+8jkgAj1Nor+dfgqZHYPFvG4tuEXU5q2fPATxBdMxO8H4myCnUkK3Thq5cOUtJZPZVJ
	dokiU3Vkq/VWHO9x80IGGjhdKrEKGB47L2J+AosDsdnPnjCK1W6vIKUWiLcBphFsOYIr
	QGnSOtY+6BCG64apA59OqJldQFG9/7VFfNpCG4cv0Vayk9m6gQjmyBscJyBTuyWZCHAA
	lGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=IT6x0BsIiSoRhbP7jUMA6LNNFyrcImMSq4BzOKPXOHc=;
	b=lOfD1r+zG7HBrBlxnCryQnc7XC3sjYxa6/6oiSNIxcf2Nkr/zCb66ehEVmTZUXTiqy
	Gt+8tMgam4uVR9eZxGNrPi71MyW5yT2NOexB3rxsfhd3x1jaALTupZ3rNzj46fzJXecd
	evtNgSyB1p9n0q1f2yK6OTB2XXr1bOcW58PbFEsqCWxV0CBE9AJnwwZAAVKftGLJpHqr
	IDrDxRBf5s6+CGnlV1UkSoScy10isw7HWZuWetAODdq2JkIXZdrORG9WKe9r64zbNeJ3
	2HzAXdDz+FpU7JI8mX20dYRrHrjBUBeQI0LhXzYIKihMtY7xAvT0GkfHHuO4JaVPs1s3
	cvbg==
X-Gm-Message-State: ALoCoQmQ6Z//djpWr9Mapb4+F7alj92QpT848dkDfRD/HQMV8TqrgBx7wvD4pqIl17+8g7H2oreY
X-Received: by 10.107.135.204 with SMTP id r73mr42020434ioi.164.1445977494238; 
	Tue, 27 Oct 2015 13:24:54 -0700 (PDT)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180])
	by smtp.gmail.com with ESMTPSA id ha7sm3448712igb.5.2015.10.27.13.24.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 13:24:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so71653471iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:24:52 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.198 with SMTP id j189mr28735288ioe.37.1445977492216; 
	Tue, 27 Oct 2015 13:24:52 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 27 Oct 2015 13:24:52 -0700 (PDT)
In-Reply-To: <39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
References: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
	<CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
	<39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
Date: Tue, 27 Oct 2015 18:24:52 -0200
Message-ID: <CAP9ODKp5yhi1GqwciLueq1mwzhBekg6DtTxXrPFfP=9gNSEu6w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Tue, 27 Oct 2015 20:24:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 6:21 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 27.10.2015 um 21:15 schrieb Otavio Salvador <otavio.salvador@ossystems.com.br>:
>>
>> On Tue, Oct 27, 2015 at 6:04 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM in 3.5
>>> (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-backend).
>>>
>>> Ensure JIT is built with llvm
>>>
>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>
>> There is a patch to add LLVM 3.7[1]; I think this one can be dropped.
>>
>> 1. http://patchwork.openembedded.org/patch/106281/
>
> I'v seen this and I guarantee that OpenJDK-8 will fail heavily with llvm3.7 - the guys
> put an end to an antiquated API's with each release, and OpenJDK's zeroshark uses lot's
> of them.

So we will need to figure how to deal with this. I see following options:

 - add needed llvm recipe in meta-java (I dislike this)
 - fix openjdk
 - update openjdk so it work with 3.7 (preferred)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

