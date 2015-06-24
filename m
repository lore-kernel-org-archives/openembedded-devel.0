Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9708E757CE;
	Wed, 24 Jun 2015 00:26:22 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so31630905wib.1;
	Tue, 23 Jun 2015 17:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UoRAnGaAsa30P8mlijburg252bmSpQDr7TexLCARL+4=;
	b=UTAul+zBaP6a6akOTRPIq1m5R/MhQtpYM17D5MiDwAH4x+ElpXypj7Rn6FL2y97Smg
	U59ZbDCj/pP6ZP3gCkojIssEsI3qyLfoW5lPOu0DcKtyE/X6GULTsFtQq2ghXlCTCEZL
	N8jbH7ci30xu3yhHrXjsuHAK3liY4pa8GEJXEQU2ifJ0A85TH2TJuE177MQA2O5q/9uV
	Peq3t2Xqu4OOdPJAnvumLWbosykrtZsc4yvM4N0y3/4N/spaghcA2zuG+/ib2i/ovHsa
	M0Ji1AJ1dh4+E+T7nWmp2cvCorv9DLPkg5l3Ixd3fIKwpyu5vxju+C5uaLy8GgnPBplb
	NyXw==
MIME-Version: 1.0
X-Received: by 10.194.187.51 with SMTP id fp19mr51080371wjc.67.1435105583235; 
	Tue, 23 Jun 2015 17:26:23 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Tue, 23 Jun 2015 17:26:23 -0700 (PDT)
In-Reply-To: <5589E809.8060000@gmail.com>
References: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
	<5589E809.8060000@gmail.com>
Date: Wed, 24 Jun 2015 02:26:23 +0200
Message-ID: <CA+chaQecQh-oXVvFgqNOrUFEwoJBxuL1wCv7Jw7OKALm9VW4TQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Future of Qt4 recipes
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
X-List-Received-Date: Wed, 24 Jun 2015 00:26:24 -0000
Content-Type: text/plain; charset=UTF-8

I agree with #2.

Argument that it's still used by many projects shouldn't be used against
layers :).

On Wed, Jun 24, 2015 at 1:13 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 06/22/2015 03:43 AM, Burton, Ross wrote:
>
>> Hi,
>>
>> So, Qt 4.8.7 was released last month[1].  Support for Qt4 stops at the
>> end of 2015, and 4.8.7 is planned to be the last ever release of Qt4.
>> It's still mandated by the long-awaited LSB 5 but I think it's fair to
>> say that the majority of developers have moved to Qt5. So, what should
>> we do with Qt4 moving forward?[2]  I see several options:
>>
>> 1) There's still lots of people using Qt4 in production, please keep it
>> in oe-core!  (and revisit in six months time)
>> 2) Move Qt4 recipes and classes to a meta-qt4 layer now so that oe-core
>> 1.9 ships without Qt4, and anyone wanting full LSB compliance or Qt4
>> will need to add that layer to their distro.
>>
>> Personally, I vote for (2).  Any other comments?
>>
>
> #2 sounds fine.
>
> would recipes-lsb move out to its own layer too?
>
> - Armin
>
>>
>> Ross
>>
>> [1] https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/
>> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7812
>>
>>
>>  --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

