Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5E073CC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:24:31 +0000 (UTC)
Received: by iofz202 with SMTP id z202so43293501iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=ZVtUoJ2cL6L0K/w3J+ell1Vd57stT88PozKPP0GG1wg=;
	b=BKmj2drmBrWJmd+eNBg+l8U5UDQQjfPvRTdaOljjKe8GHyMkA6FU7MJ4Kj790CiQbc
	mHCoSDY1ua/Y9TD7K5a2prnrskTLqcU+wdfZEqozZ76asUmiGAV5Boe6v1btzXqSWo/O
	ByW7dnqUNM6FTahGYjrd2dntQUFbSAFDR0yb0XTPZyD0ggNitfVJSA/TyNNHTqKLXoN2
	uPO4DyTjjbC3vsDzIm4D7wCiZoWRhKlVHk0JyexJAuN+By+R1ievRMsiKGJtBl8OAK1o
	uIkuN86oMQumov2vFtTkErfv6QYrNK3WclwbxCjph1Bn2ZsTjdRYP331vdu0k25xfdoQ
	VmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=ZVtUoJ2cL6L0K/w3J+ell1Vd57stT88PozKPP0GG1wg=;
	b=jfcW83LQ8OnU/PPD1KGjd3G359tMhblyovXdBmeAC3cbSfpdrotWpmMO7T2ph291Sd
	oHpMjxDNsgtYp9SycYhe8nIT9apLcjg/CcEWYAxZ2iHyeKB0fV7Y7Dz5Pv2cDg31e5RJ
	zkvuM64PN2CH0VBjMS+4aESLMlhFmtt5lLpzosjozqQzxWISneNwuK7Z3prtS0McCC76
	QpbG+8nv85XdqkIQgDiSEe7b4jLnNmvScRnBVOCwJi7suGWhDmd6YI5rcTa7wRV8X5ZI
	fmeZlIY6GNebErccRAqg6m98VaZvDyD3SvJuz9GTrgKbRtIdq5aX3hvxtx03xwMTCSnr
	dyPQ==
X-Gm-Message-State: ALoCoQlUincFa/+416Vz/Xvi2V6dTzcGTalPGNA2/YrvyPwbMUATRxdn6aShl42gkTgmPcjIYXHb
X-Received: by 10.107.7.86 with SMTP id 83mr3431999ioh.48.1446121472075;
	Thu, 29 Oct 2015 05:24:32 -0700 (PDT)
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com.
	[209.85.213.174]) by smtp.gmail.com with ESMTPSA id
	ij6sm13491396igb.1.2015.10.29.05.24.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 05:24:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbhv6 with SMTP id hv6so29168556igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 05:24:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr3371906igt.5.1446121469921; Thu,
	29 Oct 2015 05:24:29 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 29 Oct 2015 05:24:29 -0700 (PDT)
In-Reply-To: <563208F3.1040900@skidata.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
	<9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
	<563208F3.1040900@skidata.com>
Date: Thu, 29 Oct 2015 10:24:29 -0200
Message-ID: <CAP9ODKoUv+-WXzXNEKdFWwFDbJnQGXZtiZzqXtBzS7MmwOXkYA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 12:24:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 9:54 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 10/29/2015 12:24 PM, Jens Rehsack wrote:
>>
>>> Am 29.10.2015 um 11:46 schrieb Otavio Salvador <otavio.salvador@ossystems.com.br>:
>>>
>>> On Thu, Oct 29, 2015 at 7:22 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>>> Am 29.10.2015 um 08:41 schrieb Richard Leitner <richard.leitner@skidata.com>:
>>>>> To cite Otavio:
>>>>> We could rename the patches directory for openjdk-7 and avoid the
>>>>> version number on it. This would make easier for upgrades and to see
>>>>> the diff between the patches.
>>>>
>>>> So git diff -M doesn't work for you? I don't understand the reasoning.
>>>
>>> It does but reusing the directory easy the upgrade and as the
>>> openjdk-8 is in maintenance it is expected that it does not change
>>> much in the patches.
>>
>> Partial. As I told you, I updated OpenJDK from 8u40 to 8u72 when I first
>> encountered massive crashes on the target device with zeroshark until
>> llvm guys told me, that legacy JIT for ARM was utterly broken and they
>> force people to MCJIT.
>>
>> Having both directories during the upgrade helped me massively to
>> avoid breaking patches by fixing against new upstream adoptions.
>>
>> Surely, this could be handled developer-side by keeping an foo.old
>> directory - but it smells the same smell ;)
>>
>> I don't fight against renaming the directory, I just argue, both
>> way have their own kind of smell.
>>
>
> I really understand both sides... But for me, due to the fact we want to
> support only one version of each OpenJDK release, the patch directory
> without version has "a better smell" ;-)
>
> I would also go one step further and omit the version from
> openjdk-7-release-*.inc. Then the version number is only included in the
> name of the openjdk-7_*.bb file.
>
> But I'm open to any discussion! So what do you think about it?

I agree; and if we possible fix the indenting and reduce the
indirection (reducing the number .inc files, for example) I would
support :-D


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

