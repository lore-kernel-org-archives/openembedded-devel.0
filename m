Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 82F566F6F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 11:39:26 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so8667924pad.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5Bm8WYNYF4cMREDnqZP3ok3fXQLn9QkHLObyQSKIul8=;
	b=feIuA5fhL9oeZRcTLIsvhgvenIlgJo124eBoklyclvuqeNR/cIHq0bUG0z6h4SGsiY
	5z9kgzbglDrlFey6qcrJWF21chvr/ttll4b9Na0s+9zXUXofwwdyDjtbHZc02ghQe/xE
	TUzGGWpiUbCJXuwfgXbMB6LkWS2Y9CagghOUPoUhiu1o8sMaZvvIFwqXgrePtSI9oudb
	4atiAUP8p9FHGysPq+jl7LQbnFspENxnT+qu4h9hPuyeAgMIcvBBQRDyb+omkDXKGEpn
	vHzIyuqyWGPEQzSsBFDmL1Udb0PGTbUtTJvG2UUV56AvW7+G3VhfdBwSrQ6EW65BPqH2
	2unA==
X-Received: by 10.68.138.165 with SMTP id qr5mr47352243pbb.123.1394537967021; 
	Tue, 11 Mar 2014 04:39:27 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	vb7sm73581388pbc.13.2014.03.11.04.39.25 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Mar 2014 04:39:26 -0700 (PDT)
Message-ID: <531EF5E3.2060509@gmail.com>
Date: Tue, 11 Mar 2014 22:39:15 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>	<1393734165-15082-2-git-send-email-net147@gmail.com>	<CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>	<CANwerB1mFM6ipZW0mS=4OpD0PbdxBTtLgidMLo2R8Pi_XdrS+Q@mail.gmail.com>
	<CAP9ODKpaS0r9ZC7k3wN=oQ_4=j90DxR-LEwdBMCKrHDKmaWMHw@mail.gmail.com>
In-Reply-To: <CAP9ODKpaS0r9ZC7k3wN=oQ_4=j90DxR-LEwdBMCKrHDKmaWMHw@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 11 Mar 2014 11:39:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/03/2014 1:34 AM, Otavio Salvador wrote:
> On Tue, Mar 4, 2014 at 12:43 AM, Jonathan Liu <net147@gmail.com> wrote:
>> On 4 March 2014 06:53, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> On Sun, Mar 2, 2014 at 1:22 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>> This adds the necessary target packages for development with all of the
>>>> Qt 5 modules.
>>>>
>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> Why are you adding qttools here? this is not need for toolchain use,
>>> is it? It is need for host.
>> The QtTools module includes components that may be used by
>> applications - http://qt-project.org/doc/qt-5/qtmodules.html#qt-tools
>  From the doc it is not clear to me how it will be used in the target,
> it seems something used in host.
>
> Could you help me to understand your reasoning for it?
>
It includes Qt Help which is used to implement context-sensitive help to 
the user in Qt applications.

Regards,
Jonathan

