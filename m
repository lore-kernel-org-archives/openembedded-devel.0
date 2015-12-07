Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB82F60124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:31:10 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so84729053igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2015 10:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=KLcl9RwTWBfhdK4Vspew1SBIdS5bwHsOqk5NigdTVW8=;
	b=fTHQfhvTK2xAiW5yR7M8gCurW8U4Ux/40mZl1ji0G1UfYuaRkhKNIcSJ0CaTfNe0Fo
	K7JuH4aTx7/KJZElVU2egGMJyjj4xSTNarHSNYulnwphOY/SXLwDqMZ8CEZe/voZ/d7o
	8vK+OdsYArtSWqzMjSrerKA/0lfyM0f//aN2sUCU/GTOwP1ncDCRQn3XJH60GgrMHW4K
	vvl2KCulMPZqzGJT4xlElLoH7W9ODpdf1Qsl7Nx3daTcsi9EhPMIZiZrpmym3UWMiEQo
	TF+UF2P0WTcDRNJT/txbEmo/15ciCMApjbg43rugDTHpwEcnAAAGLiI4haF34mYLLHa3
	2RYA==
X-Received: by 10.50.20.138 with SMTP id n10mr18422800ige.11.1449513071298;
	Mon, 07 Dec 2015 10:31:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Mon, 7 Dec 2015 10:30:41 -0800 (PST)
In-Reply-To: <565DDF01.6020008@videolan.org>
References: <1448974975-31352-1-git-send-email-funman@videolan.org>
	<CAMKF1soAm3fR=SMc1c+YHjQPRqGLv5L4wRn71yTUcMKhhfLGoQ@mail.gmail.com>
	<565DDF01.6020008@videolan.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Dec 2015 10:30:41 -0800
Message-ID: <CAMKF1sqhNJCSrnVcb7YjfC-XPgP5QnVmyiB5aOh1Kk7A3TbdzA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] net-snmp: apply patch for cross-compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Dec 2015 18:31:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 1, 2015 at 9:55 AM, Rafa=C3=ABl Carr=C3=A9 <funman@videolan.org=
> wrote:
> On 01/12/2015 17:48, Khem Raj wrote:
>> On Tue, Dec 1, 2015 at 5:02 AM, Rafa=C3=ABl Carr=C3=A9 <funman@videolan.=
org> wrote:
>>>          file://0001-config_os_headers-Error-Fix.patch \
>>> +        file://0002-config_os_headers-Error-Fix.patch \
>>
>> these two names look pretty similar. Can you check if these both
>> patches are needed
>
> Why yes they're both needed, both make configure look at host header path=
.

OK then either squash them into one or use some differentiating patch names=
.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

