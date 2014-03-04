Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id D5F776BF88
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 14:34:38 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so4503229yha.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2014 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=h2pXzOgq/VbOWGkSPC5d8lNmN73cef1Ln5jUiHZ8ncw=;
	b=CyDjaYOUhFTimICv5YqQqQswJ6xUciizUHcHTHokrdUx8ls6kD6n6k+mHAgi0yeTNa
	Gduo8cO3qpcKDNkrrMD1BVUjtQN4HSL133+6+5lgMrusNvyNEB8dPRFcTru1Jd8bHn3B
	K64vR74W2EaaEsQq1K/XxIOCjRhGa3dJAca6SsYdhUQXhdfBirGhamfMQAfFl57WrFDO
	M1l2tQU/4qf27FFO1o5m4xya3wYqyLvoHtGi3Hbnl12HyxSlpng2C5z/p+xha8mLwReg
	xA9Aec/o9R2zlQIElrmtFcf7bZDuoQbiEZUQmSgJTM7jOkOxbN32Tyad15WyUGXXFk5F
	CSKg==
MIME-Version: 1.0
X-Received: by 10.236.147.107 with SMTP id s71mr28128592yhj.45.1393943670407; 
	Tue, 04 Mar 2014 06:34:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 4 Mar 2014 06:34:30 -0800 (PST)
In-Reply-To: <CANwerB1mFM6ipZW0mS=4OpD0PbdxBTtLgidMLo2R8Pi_XdrS+Q@mail.gmail.com>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>
	<1393734165-15082-2-git-send-email-net147@gmail.com>
	<CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>
	<CANwerB1mFM6ipZW0mS=4OpD0PbdxBTtLgidMLo2R8Pi_XdrS+Q@mail.gmail.com>
Date: Tue, 4 Mar 2014 11:34:30 -0300
X-Google-Sender-Auth: v6wo9PC5ajbCBccqrbQ6sH2o4sg
Message-ID: <CAP9ODKpaS0r9ZC7k3wN=oQ_4=j90DxR-LEwdBMCKrHDKmaWMHw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v4 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Tue, 04 Mar 2014 14:34:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 4, 2014 at 12:43 AM, Jonathan Liu <net147@gmail.com> wrote:
> On 4 March 2014 06:53, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Sun, Mar 2, 2014 at 1:22 AM, Jonathan Liu <net147@gmail.com> wrote:
>>> This adds the necessary target packages for development with all of the
>>> Qt 5 modules.
>>>
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>
>> Why are you adding qttools here? this is not need for toolchain use,
>> is it? It is need for host.
>
> The QtTools module includes components that may be used by
> applications - http://qt-project.org/doc/qt-5/qtmodules.html#qt-tools

From the doc it is not clear to me how it will be used in the target,
it seems something used in host.

Could you help me to understand your reasoning for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

