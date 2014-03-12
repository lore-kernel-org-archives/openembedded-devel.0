Return-Path: <net147@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 42CFE60D0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 21:03:14 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id uo5so77176pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 14:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=amYEVEaMAOvLD5nWb4j1OLWvuIn4WZ7MRKT9k7mAi3k=;
	b=QGYySe0R/KhAEHbRyW3A+eXCAuk4X91TPgPCkLBYhzyWsTCFgpJ7jAKhRghF772xe2
	l3RPBrPvDyUXSj7MwUgOv9mKwZNVdllOq+aw9w7uGKag1KRoe3KKunhsSTgaFUImy2aQ
	CGylciIKdIXwYeNildKzcW7z8aqMUtyhsUXlSyxATHbzmQEcDFu5s/VfAl+guLm1LSno
	EVmTEg6cMkd7a7vLXxtE3omwSroo6Q3Np+mEbpjkbkL+JeV+rgiUfDueB7APY/oM5tR8
	gI9GbQtbAY18AAq1aDcS8lZ2PUNQTD63j/MJQLUQDa/uPguax2E4HZEXuyWpQYMPl/C6
	ZGXw==
X-Received: by 10.68.136.133 with SMTP id qa5mr7715139pbb.63.1394658195778;
	Wed, 12 Mar 2014 14:03:15 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id sh5sm127049pbc.21.2014.03.12.14.03.13
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Mar 2014 14:03:14 -0700 (PDT)
Message-ID: <5320CB87.9010208@gmail.com>
Date: Thu, 13 Mar 2014 08:03:03 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>	<1393734165-15082-2-git-send-email-net147@gmail.com>	<CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>	<CANwerB1mFM6ipZW0mS=4OpD0PbdxBTtLgidMLo2R8Pi_XdrS+Q@mail.gmail.com>	<CAP9ODKpaS0r9ZC7k3wN=oQ_4=j90DxR-LEwdBMCKrHDKmaWMHw@mail.gmail.com>	<531EF5E3.2060509@gmail.com>
	<CAP9ODKr+CNvx-+NG1Lp-tzbr11TUf8zEGLKBgExYrnHdCMAyRw@mail.gmail.com>
In-Reply-To: <CAP9ODKr+CNvx-+NG1Lp-tzbr11TUf8zEGLKBgExYrnHdCMAyRw@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Mar 2014 21:03:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2014 5:42 AM, Otavio Salvador wrote:
> On Tue, Mar 11, 2014 at 8:39 AM, Jonathan Liu <net147@gmail.com> wrote:
>> On 5/03/2014 1:34 AM, Otavio Salvador wrote:
>>> On Tue, Mar 4, 2014 at 12:43 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>> On 4 March 2014 06:53, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>>> On Sun, Mar 2, 2014 at 1:22 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>>>> This adds the necessary target packages for development with all of the
>>>>>> Qt 5 modules.
>>>>>>
>>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>> Why are you adding qttools here? this is not need for toolchain use,
>>>>> is it? It is need for host.
>>>> The QtTools module includes components that may be used by
>>>> applications - http://qt-project.org/doc/qt-5/qtmodules.html#qt-tools
>>>   From the doc it is not clear to me how it will be used in the target,
>>> it seems something used in host.
>>>
>>> Could you help me to understand your reasoning for it?
>>>
>> It includes Qt Help which is used to implement context-sensitive help to the
>> user in Qt applications.
> I am fine with it than; do you have any other change pending? please
> let me know or I pick v2 of this.
>
I don't have any update pending. Please use the latest patch series (v4).

Regards,
Jonathan

