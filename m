Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id BB39060168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 20:09:23 +0000 (UTC)
Received: by pabts4 with SMTP id ts4so38059631pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 13:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=S3SxwDYhghcbQzzQTLb6AORtF8TN1SpN/BVo/1JQm1o=;
	b=AH0kyzvbjt+JuzpM/Ge+ryi70ULJlDIpxtMGQLpmF5hQ32oJUdcjTM2YM0NfAX/F4/
	ePWFkMTPoXpaPLmPbOuNGUTjgGK0dV/lB6B75nVBI86k6AXJmRP0hgP58LZSob8g4E/D
	zoxV1ttcZLxK5FXVoiW7U8S9a7wvDmfbwaC1wNs12Ej7EyHkwiwyJVIlDXp5qlh2avyQ
	tVyIwSbQLfaKOAFYAedtwkGMZmGrsH5B+BBdWffLwJGwdYm0KXNOTrPaw9NA4s6MhyV3
	ZrjDOGez4DLc1rRZr7U3Aoo8TKysKJV98JfGkWL/TcvEDTBjyoqbMl+flcAuTgFbmJis
	2enA==
X-Received: by 10.70.51.67 with SMTP id i3mr57372712pdo.145.1432066164995;
	Tue, 19 May 2015 13:09:24 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id v4sm13460342pbs.0.2015.05.19.13.09.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 May 2015 13:09:23 -0700 (PDT)
Message-ID: <555B9872.50301@gmail.com>
Date: Tue, 19 May 2015 13:09:22 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <555B59D4.80304@linux.intel.com>
In-Reply-To: <555B59D4.80304@linux.intel.com>
Subject: Re: [meta-ruby] proposal: moving ruby to oe-core
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
X-List-Received-Date: Tue, 19 May 2015 20:09:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/19/2015 08:42 AM, Alexander Kanavin wrote:
> Hello meta-ruby maintainers,
>
> I am trying to update webkit-gtk in oe-core to latest upstream version
> (it's fallen badly out of date), and that requires having ruby during
> build time. So I would like to propose that ruby recipes are moved to
> oe-core, and you keep maintaining them there. How does it sound to you?

I don't have an issue with that. Do you need both Ruby and bundler? I 
believe there is value in having additional ruby packages outside core, 
like python is structured.

I think it might be more of issue for OE-core folks.
My concern is core is getting bloated.

regards and thanks for asking.
Armin
>
> Regards,
> Alexander

