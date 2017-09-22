Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F57171C27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 15:55:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8MFtFQn000648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Sep 2017 08:55:15 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 22 Sep 2017 08:55:14 -0700
To: Changhyeok Bae <changhyeok.bae@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <CACrLJgAyV=KOputf8o8O9=Acqu=V7gSUyY6hhBBFPBVECTFhVQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <049f79b1-0d56-554d-60fa-f60ed2a66861@windriver.com>
Date: Fri, 22 Sep 2017 11:54:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CACrLJgAyV=KOputf8o8O9=Acqu=V7gSUyY6hhBBFPBVECTFhVQ@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: How to use two toolchains
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 15:55:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-09-22 10:22 AM, Changhyeok Bae wrote:
> Hi
> 
> I would like to use 64 bit for kernel and 32 bit for userspace(rootfs).
> Toolchain is created by OE (Not prebuilt toolchain)
> Could you recommend good way to use different toolchains to achieve my goal?
> If you have good examples, it's very helpful to me.
> 
> Thanks
> Changhyeok
> 

This is referred to as a multilib build.
This Stack Overflow entry should get you started:

https://stackoverflow.com/questions/37271509/how-to-get-initramfs-libraries-for-32-and-64-bit-using-yocto

Also see:
5.6.2.2. Using Multilib¶
http://www.yoctoproject.org/docs/2.3/mega-manual/mega-manual.html

s/2.3/<your version of yocto>/

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

