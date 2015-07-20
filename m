Return-Path: <prvs=63617955b=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id A1E3E65CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 11:10:44 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CcBACa1qxV/0oKEKxchFAGw1kCgXQBAQEBAQGBC4QkAQEEbgoRCw0LCRYPCQMCAQIBRQYNBgICiC/FKwEBCCKLHi6FDRaEFQEElFKNZIQagm4WjEWDYYEJgxttgUeBBAEBAQ
X-IPAS-Result: A2CcBACa1qxV/0oKEKxchFAGw1kCgXQBAQEBAQGBC4QkAQEEbgoRCw0LCRYPCQMCAQIBRQYNBgICiC/FKwEBCCKLHi6FDRaEFQEElFKNZIQagm4WjEWDYYEJgxttgUeBBAEBAQ
Message-ID: <55ACD72D.6040806@skidata.com>
Date: Mon, 20 Jul 2015 13:10:37 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <556EA59A.8010007@skidata.com>
	<CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
In-Reply-To: <CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH] openjdk-7: 75b13-2.5.4: fix xawt build
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
X-List-Received-Date: Mon, 20 Jul 2015 11:10:47 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi,

On 07/07/2015 03:57 PM, Otavio Salvador wrote:
> On Wed, Jun 3, 2015 at 3:58 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> The icedtea-jdk-nio-use-host-cc.patch disabled the build of xawt.
>> Therefore all awt based java application which were run on X11 failed
>> starting the GUI with an java.awt.HeadlessException.
>>
>> This patch enables xawt again by adapting
>> icedtea-jdk-nio-use-host-cc.patch.
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> ---
>> This patch was only tested with yocto-1.6.3 (daisy) on an armv7a
>> cortexa9 with vfpv3d16. Please test it on further platforms!
>>
>> This is my first patch to this mailinglist so hopefully I got everything
>> right. If not please give me some feedback on what to improve for the
>> next one ;-)
>> ---
> 
> Sorry for the long time to get to this patch. I would like to ask if
> you could run a test in master so we avoid surprises. If you confirm
> it works I am fine in commiting it.
> 

Thank you for your feedback. I will test that patch today with the
current master branches of meta-java, poky and meta-openembedded. I'll
get back to you as soon as I have any results.

best regards,
Richard L

