Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 62C1A60CEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:42:26 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id f73so5059819yha.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=eUBFR1TZi8FS6OEe/5G6U9lxoKLPJSwD4byuRsFBpKg=;
	b=WPcRAphrL4oK8qq9HXsJZ0lXggdes27YZFj2sQzobjXb7rujrNQulVe+MDMieJiqb+
	0JWErWGi9mso5+P5LF2P5tb/aGwuCrl5xykFTAQwMoJpeSDZdD34GmIgXxBzPUwzsgrD
	PDLrDL5EaiC2v9/Pa3GWnB5NcHf/mv/ft8WPS4jvwNw8oCn0pkwCshNGP1XK5wYXLqSO
	5c8V3iGbTJIDrNpT1tzdXjQ3taP2CLhb8nbWYMyaYymkwm+LqIOkAqUwZaWYiemqEwOg
	q0JjAYAwbdvstTEkw/NsbUxpuN85NAhfNK2ctGt0f6ALZQFGDbTAfsqBtenF6OEPrseS
	Mt2w==
MIME-Version: 1.0
X-Received: by 10.236.16.83 with SMTP id g59mr64116656yhg.14.1394649747558;
	Wed, 12 Mar 2014 11:42:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 12 Mar 2014 11:42:27 -0700 (PDT)
In-Reply-To: <531EF5E3.2060509@gmail.com>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>
	<1393734165-15082-2-git-send-email-net147@gmail.com>
	<CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>
	<CANwerB1mFM6ipZW0mS=4OpD0PbdxBTtLgidMLo2R8Pi_XdrS+Q@mail.gmail.com>
	<CAP9ODKpaS0r9ZC7k3wN=oQ_4=j90DxR-LEwdBMCKrHDKmaWMHw@mail.gmail.com>
	<531EF5E3.2060509@gmail.com>
Date: Wed, 12 Mar 2014 15:42:27 -0300
X-Google-Sender-Auth: tmZzoJR0ImSzsKkdAzr43tB7IYw
Message-ID: <CAP9ODKr+CNvx-+NG1Lp-tzbr11TUf8zEGLKBgExYrnHdCMAyRw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 12 Mar 2014 18:42:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 11, 2014 at 8:39 AM, Jonathan Liu <net147@gmail.com> wrote:
> On 5/03/2014 1:34 AM, Otavio Salvador wrote:
>>
>> On Tue, Mar 4, 2014 at 12:43 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>
>>> On 4 March 2014 06:53, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>>
>>>> On Sun, Mar 2, 2014 at 1:22 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>>>
>>>>> This adds the necessary target packages for development with all of the
>>>>> Qt 5 modules.
>>>>>
>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>
>>>> Why are you adding qttools here? this is not need for toolchain use,
>>>> is it? It is need for host.
>>>
>>> The QtTools module includes components that may be used by
>>> applications - http://qt-project.org/doc/qt-5/qtmodules.html#qt-tools
>>
>>  From the doc it is not clear to me how it will be used in the target,
>> it seems something used in host.
>>
>> Could you help me to understand your reasoning for it?
>>
> It includes Qt Help which is used to implement context-sensitive help to the
> user in Qt applications.

I am fine with it than; do you have any other change pending? please
let me know or I pick v2 of this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

