Return-Path: <k4230r6@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id E608360034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 22:02:59 +0000 (UTC)
Received: by widdi4 with SMTP id di4so41508172wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 15:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=MxJhQ8aFt08JnL29vmUdDIXAW9C6bYeUxgMt0PKBV0M=;
	b=dkIT/1Xu5isQm/kpd6lxND2+zCASjSBPCe9PytAyrCr4+gQBwtzbeVyg4YU7MMCMsn
	nNN/IxiQPIKyhb3B74rTik6UPnvkVc8P7oHAym8SVekAp7wD0mTn4t60akS/iPuJD7CI
	ZAbNlP+TUQmruAxssUwcHGeANN2MUORTYpiJ70q7nVQR8IrIZQElgtgHytEhI7HPEW4q
	JuGQoAe48YTW3e5Z+IzFu1dsQbvIIiFHCcvlIUte2+r+OA18aYVTbCvvqCqQDhgJztny
	1iTdFfueyAIHqYBHVquIqjlvFeTMPtjH5RowktTBwIcoDU7oHCipAYP0Y0JmG9i4hE8j
	27TQ==
X-Received: by 10.194.3.77 with SMTP id a13mr232758wja.104.1431122580671;
	Fri, 08 May 2015 15:03:00 -0700 (PDT)
Received: from [192.168.23.113]
	(HSI-KBW-46-223-216-155.hsi.kabel-badenwuerttemberg.de.
	[46.223.216.155])
	by mx.google.com with ESMTPSA id fa8sm740914wib.14.2015.05.08.15.02.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 May 2015 15:02:59 -0700 (PDT)
Message-ID: <554D3293.2090503@gmail.com>
Date: Sat, 09 May 2015 00:02:59 +0200
From: Christian Ege <k4230r6@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <55483F50.5020803@gmail.com>	<554A76F1.8050407@gmail.com>	<554A7893.3060701@gmail.com>	<554A8A7A.6030404@gmail.com>	<CAALGJZaMCx0-daBCjkP_NrmnheTJQYLW2hU2bSpTW1ij0pMb8w@mail.gmail.com>
	<554C0625.9000304@gmail.com>
In-Reply-To: <554C0625.9000304@gmail.com>
Subject: Re: Odroid-xu3 support
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
X-List-Received-Date: Fri, 08 May 2015 22:03:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi,
On 08.05.2015 02:41, Trevor Woerner wrote:
> On 15-05-07 02:56 AM, Christian Ege wrote:
>>  From the ODROID family I do only own a ODROID-C1. If there will be a
>> combined Layer for all odroid devices I will  port my recipes to this
>> and can help on supporting it.
>> I am mostly interested in Multimedia stuff and I do plan to setup a
>> separate layer for Kodi/XBMC on amlogic based devices.
>>
>> So how should we proceed with the layer jungle?
> 
> Ideally meta-amlogic provides things specific to the chip itself (vendor
> kernel? vendor u-boot?) and meta-odroid contains things related to the
> various boards themselves (tweaks specific to each board).
This would be in an ideal world. In the real world each vendor like
hardkernel or wetek is maintaining their own kernel tree derived from
Amlogic.

Amlogic itself maintains a buildroot based BSP for their
boards. My Idea was at least merging u-Boot and Kernel of both vendors
into one tree.

> Maybe the beaglebone provides a good example to follow? (meta-ti,
> meta-beagleboard) Although I'm not sure how clean the separation is in
> those layers.

Yes this is the way to go, the manufacturer maintains its own layer. I
can try to get in contact with Amlogic if they are interested in
creating such a layer or at least supporting it.

regards,
Christian

