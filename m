Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42EB56065F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 08:56:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7K8uDeo024635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 01:56:13 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 01:56:12 -0700
Message-ID: <52132F2A.2020305@windriver.com>
Date: Tue, 20 Aug 2013 16:56:10 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
	<CAGNsrLDyg3Rq0Gk+sG8Vp4y0i+=me2eTjadW2tt4dyU_qU0_cw@mail.gmail.com>
	<5211762A.3020201@windriver.com>
	<CAJTo0LYFNSGhEjjMLTO4zTSTMXQC+vnxada0nb+EaVWWnn9Rxw@mail.gmail.com>
In-Reply-To: <CAJTo0LYFNSGhEjjMLTO4zTSTMXQC+vnxada0nb+EaVWWnn9Rxw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/13] meta-filesystems creation
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
X-List-Received-Date: Tue, 20 Aug 2013 08:56:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2013 04:36 PM, Burton, Ross wrote:
> Hi,
>
> On 19 August 2013 02:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
>> gitpkgv.bbclass is in meta-oe.
>>
> Is this the only part of meta-oe that meta-filesystems needs?  If it's
> genuinely useful should we this be considered for oe-core?
I am afraid not, libimobiledevice and samba are in meta-oe,
and they are needed by meta-filesystems.

./recipes-filesystems/ifuse/ifuse_1.1.2.bb:6:DEPENDS = "fuse 
libimobiledevice"
./recipes-filesystems/smbnetfs/smbnetfs_git.bb:6:DEPENDS = "fuse samba"

> (layers that depend on meta-oe bother me, especially when they depend on
> just a tiny fraction of it)
>
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


