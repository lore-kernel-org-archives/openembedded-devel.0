Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8675A6F7DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 22:37:00 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f10so214502yha.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ELPWa/EjSnqSwqQ3ZJb5/NN8BvLvhSmQDKmSadEtufc=;
	b=Z4mEGkWG+5p5venjKsP7phNrcnPkAMCXu3KEtphyjI6tKTo6aMbsU86UGaOd163BgZ
	2pyuKPbkUWFhR4mTff4Wr8ZTVT8MnpEmKtjHcqO/1z9bG9qNDDGWfVzvRsJhYaJ7FH1r
	omBO9DPxq/VH8BD0z0HZD/bfd5XNHRIGhK2j5NDypdhAhbqewK299+RV1dSe04Tjl90B
	AwaiKnjlqqpSQrWPLI/YEiJecq+3afmW7Ru/ORVXKe8YIc2sq9Pl9AUO6dvZKKkdd8tn
	0zp8it/BpkvePOhNbxGp2WcPP8dH8LroOloIma0l0aGP3HjnaNzzc/Icq4AyxcDYp96y
	xwbQ==
MIME-Version: 1.0
X-Received: by 10.236.16.83 with SMTP id g59mr187202yhg.14.1394663820910; Wed,
	12 Mar 2014 15:37:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 12 Mar 2014 15:37:00 -0700 (PDT)
In-Reply-To: <5320CB87.9010208@gmail.com>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>
	<1393734165-15082-2-git-send-email-net147@gmail.com>
	<CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>
	<CANwerB1mFM6ipZW0mS=4OpD0PbdxBTtLgidMLo2R8Pi_XdrS+Q@mail.gmail.com>
	<CAP9ODKpaS0r9ZC7k3wN=oQ_4=j90DxR-LEwdBMCKrHDKmaWMHw@mail.gmail.com>
	<531EF5E3.2060509@gmail.com>
	<CAP9ODKr+CNvx-+NG1Lp-tzbr11TUf8zEGLKBgExYrnHdCMAyRw@mail.gmail.com>
	<5320CB87.9010208@gmail.com>
Date: Wed, 12 Mar 2014 19:37:00 -0300
X-Google-Sender-Auth: ZClAujnIrN2QddmY8IwCTBwlaWQ
Message-ID: <CAP9ODKozQOO5RCcen71wyjmVQMG0adOsdy8FzPwq9CyA2TBVdg@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Mar 2014 22:37:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Mar 12, 2014 at 6:03 PM, Jonathan Liu <net147@gmail.com> wrote:
> On 13/03/2014 5:42 AM, Otavio Salvador wrote:
>>
>> On Tue, Mar 11, 2014 at 8:39 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>
>>> On 5/03/2014 1:34 AM, Otavio Salvador wrote:
>>>>
>>>> On Tue, Mar 4, 2014 at 12:43 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>>>
>>>>> On 4 March 2014 06:53, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>>>>
>>>>>> On Sun, Mar 2, 2014 at 1:22 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>>>>>
>>>>>>> This adds the necessary target packages for development with all of
>>>>>>> the
>>>>>>> Qt 5 modules.
>>>>>>>
>>>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>>>
>>>>>> Why are you adding qttools here? this is not need for toolchain use,
>>>>>> is it? It is need for host.
>>>>>
>>>>> The QtTools module includes components that may be used by
>>>>> applications - http://qt-project.org/doc/qt-5/qtmodules.html#qt-tools
>>>>
>>>>   From the doc it is not clear to me how it will be used in the target,
>>>> it seems something used in host.
>>>>
>>>> Could you help me to understand your reasoning for it?
>>>>
>>> It includes Qt Help which is used to implement context-sensitive help to
>>> the
>>> user in Qt applications.
>>
>> I am fine with it than; do you have any other change pending? please
>> let me know or I pick v2 of this.
>>
> I don't have any update pending. Please use the latest patch series (v4).

NOTE: Runtime target 'qtquick1-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qtquick1-dev',
'qtwebkit', 'ruby-native']
NOTE: Runtime target 'packagegroup-qt5-toolchain-target' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-qt5-toolchain-target', 'qtquick1-dev', 'qtwebkit',
'ruby-native']

This failed to build with Ruby disabled :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

