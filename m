Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3296EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:28:29 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id t59so1321650yho.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=UICGpUgmwKbngGbugiEItsqwHxYipM2mWCymYlIYhA4=;
	b=Zd5n9UKdzBriXjD5p7IULXw9doRtNQz8QzgE6FJciGcIfx3SdBwK4S6uq5KKlWojDD
	OtqbmJs4hfdRZ1EPzfnCD8hPFGDMbTq+bjFmWkE15c8MghiphGa5zY+pRZh9fsLHJRhL
	n78KiLA5pc/n6uShRtzsqOUYb6QogAuKuQmbpabfLrz2UYD3i+tk8odrRTHSPx9kGkRM
	FwVPNL34IYNeu4klxVEJl+DT9b7biVeQAV7fy9IPKsStRWOOg3GvRetc7ue1yEsvwQ4n
	pBv+zsoDF1sF0qfbN+c9o/+JHcO/hR7G/iKobnpqDBqfEMhm33r0i1vj9jfsm4bSYI8A
	7mWA==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr16595191yhh.78.1393522110840; 
	Thu, 27 Feb 2014 09:28:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 27 Feb 2014 09:28:30 -0800 (PST)
In-Reply-To: <90CD9C88-7366-4942-82AB-B4E909189BAD@gmail.com>
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
	<1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
	<90CD9C88-7366-4942-82AB-B4E909189BAD@gmail.com>
Date: Thu, 27 Feb 2014 14:28:30 -0300
X-Google-Sender-Auth: Lg2hOg3r4m86jg8O8elaTHcOtYA
Message-ID: <CAP9ODKoCpaMUV58V3o7t6pGweB93QeugwouLOBgdgohh=JmgnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 1/2] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Thu, 27 Feb 2014 17:28:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 2:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Feb 27, 2014, at 9:11 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> +
>> +RDEPENDS_${PN} = " \
>> +    gdbserver \
>> +    openssh \
>> +    openssh-sftp-server \
>> +    qtdeclarative-plugins \
>> +"
>> --
>
> this hardcoding openssh issue still is unresolved ?

As explained in v1, Dropbear does not work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

