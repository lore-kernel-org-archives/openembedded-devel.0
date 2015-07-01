Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED7D65C89
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:49:57 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so26198557pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=lCyBLHiDHNYKX/1FtWNM6HUUmMbk9Oxtkym6tCwy6QY=;
	b=hA3ZBx0FnsOfFM/GjrFZtMwB/70hZBn9VvLNMYGfKZsvGp5dF9tGL5zNr9lQ3rflbs
	+3aQnjy/BVlPTeeRPOgXIhoYyshVHHwEMHzPrbjGq9I9sCW99uLCa69zGvmqKXhfemYI
	yM84QFUuzVxr+LGFD6ixxj8v2wpuyOavCkl/6sLL8U9zsOwSqJqVg5klOZfdnR+B9tHl
	55tz/hWgt09OhKiSYrvhmQsR52FU6AhT1TeRs1YXsq9eGsyNfYaZuJdV91ZM0Lccfr9v
	Vc4PHDX7PuyC+Wb/Twi9DdAXn4yx4Vyo5KCqPtK8Aa5+MqTXou/dEe+tOd6PxN187yz0
	HvHw==
X-Received: by 10.68.181.163 with SMTP id dx3mr54656231pbc.5.1435758597577;
	Wed, 01 Jul 2015 06:49:57 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id s1sm2411844pda.54.2015.07.01.06.49.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:49:56 -0700 (PDT)
Message-ID: <5593EFFF.4060502@gmail.com>
Date: Wed, 01 Jul 2015 23:49:51 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1435741531-30306-1-git-send-email-net147@gmail.com>	<5593B688.4070304@opendreambox.org>
	<20150701131955.GH2409@jama>
In-Reply-To: <20150701131955.GH2409@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] libconnman-qt5: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 13:49:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/07/2015 11:19 PM, Martin Jansa wrote:
> On Wed, Jul 01, 2015 at 11:44:40AM +0200, Andreas Oberritter wrote:
>> Hello Jonathan,
>>
>> On 01.07.2015 11:05, Jonathan Liu wrote:
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> ---
>>>   recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>   create mode 100644 recipes-qt/libconnman-qt/libconnman-qt5_git.bb
>>>
>>> diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
>>> new file mode 100644
>>> index 0000000..0ca57e2
>>> --- /dev/null
>>> +++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
>>> @@ -0,0 +1,17 @@
>>> +require recipes-qt/qt5/qt5.inc
>>> +
>>> +SUMMARY = "Qt Library for ConnMan"
>>> +HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
>>> +LICENSE = "Apache-2.0"
>>> +LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
>>> +DEPENDS += "qtbase qtdeclarative"
>>> +PV = "1.0.89+git${SRCPV}"
>>> +
>>> +SRCREV = "79a8d10479ba55951ffa375a66797eedff230dd3"
>>> +SRC_URI = "git://github.com/nemomobile/libconnman-qt.git"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +inherit pkgconfig
>>> +
>>> +RDEPENDS_${PN} += "connman"
>> I have a slightly different version in my meta-qt5 repo (fido):
>>
>> https://github.com/opendreambox/meta-qt5/commit/9e616b42e266f1c804daae1eb5dcf693c0f07b42
>>
>> Can you please compare both versions and make sure that the things you
>> omitted aren't needed anymore? Note that libconnman-qt.inc is equal to
>> the version in meta-openembedded.
> Another recipe to the party :)
> https://github.com/webOS-ports/meta-webos-ports/blob/master/meta-luneos/recipes-connectivity/connman/libconnman-qt_git.bb
>
> Yes, it would be nice to consolidate all 3 in one which suits us all.
>
>
>
I initially had a recipe similar to the one in opendreambox with the 
.pro variable hacks but it required libconnman-qt.inc from 
meta-openembedded. I wanted to remove the meta-openembedded dependency 
so I refactored it. In the process I tested without the hacks and I 
reused the logic from qt5.inc to reduce duplication.

I have successfully tested building the recipe with an application that 
depends on libconnman-qt5 using both the C++ and QML bindings and using 
it on the target device.

Regards,
Jonathan

