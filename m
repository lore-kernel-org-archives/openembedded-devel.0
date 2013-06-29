Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C18E6AF02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 05:36:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5T5aRGD012488
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2013 22:36:28 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 28 Jun 2013 22:36:26 -0700
Message-ID: <51CE7258.7010909@windriver.com>
Date: Sat, 29 Jun 2013 13:36:24 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1372213028.git.hongxu.jia@windriver.com>
	<702dd5ac09c4e06fcad0b1831217ea3416d6c764.1372213028.git.hongxu.jia@windriver.com>
	<2693732.0LEd3dIQS8@helios>
In-Reply-To: <2693732.0LEd3dIQS8@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] qt-x11-free: add missing DEPENDS on libglu for LSB Library Check
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
X-List-Received-Date: Sat, 29 Jun 2013 05:36:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

Got it

Thanks,
Hongxu

On 06/28/2013 06:50 PM, Paul Eggleton wrote:
> Hi Hongxu,
>
> On Wednesday 26 June 2013 10:38:52 Hongxu Jia wrote:
>> When libglu is missing in qt-x11-free's DEPENDS, the LSB 4.1 Library
>> Check will fail:
>> ...
>> Checking library symbols (libqt-mt.so.3)
>> Did not find _ZN10QGLContext10currentCtxE (unversioned) in libqt-mt.so.3
>> Unmangled symbol name: QGLContext::currentCtx
>> ...
>>
>> [YOCTO #4016]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   recipes-qt3/qt3/qt-x11-free_3.3.7.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
>> b/recipes-qt3/qt3/qt-x11-free_3.3.7.bb index a67dd63..af4fc01 100644
>> --- a/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
>> +++ b/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
>> @@ -1,4 +1,4 @@
>> -DEPENDS = "qt-x11-free-native freetype virtual/libx11 libxmu libxft libxext
>> libxrender libxrandr libxcursor  virtual/libgl" +DEPENDS =
>> "qt-x11-free-native freetype virtual/libx11 libxmu libxft libxext
>> libxrender libxrandr libxcursor  virtual/libgl libglu" PROVIDES = "qt3x11"
>>   PR = "${INC_PR}.1"
> Merged to meta-qt3, thanks.
>
> I noticed we didn't actually specify in the README in meta-qt3 where patches
> should be sent, I have now fixed this. In future if you have any patches for
> this layer could you please send them to the yocto@yoctoproject.org mailing
> list.
>
> Thanks,
> Paul
>


