Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A82F87618A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 21:03:26 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 04749F811DB; Tue, 21 Jul 2015 15:03:26 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 84184F811DA;
	Tue, 21 Jul 2015 15:03:26 -0600 (MDT)
Message-ID: <55AEB39E.6040604@mlbassoc.com>
Date: Tue, 21 Jul 2015 15:03:26 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: yocto@yoctoproject.org
References: <CAK5mtexxdYxhwvv-MB27Ur56iwAV8O3Y6ah_BPAo+R58NmNouQ@mail.gmail.com>	<55AEB069.80005@linux.intel.com>
	<CAK5mtextp+RKCnc+rKyEZ0AyKu+xH7ZvVTiUnAvZTuaK2V5TBg@mail.gmail.com>
In-Reply-To: <CAK5mtextp+RKCnc+rKyEZ0AyKu+xH7ZvVTiUnAvZTuaK2V5TBg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Bug in Open CV receipt
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
X-List-Received-Date: Tue, 21 Jul 2015 21:03:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-21 14:50, Victor Rodriguez wrote:
> On Tue, Jul 21, 2015 at 3:49 PM, Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>>
>>
>> On 07/21/2015 09:57 AM, Victor Rodriguez wrote:
>>>
>>> Hi team
>>>
>>> Few weeks ago I was having some problems with open CV receipt. In the
>>> begining I toght I was adding opencv tro my core-image-minimal-xfce
>>> just with this:
>>>
>>> IMAGE_INSTALL_append = " gcc gcc-dev openssh php mariadb opencv"
>>>
>>> Now after booting the image I realize that none of the libraries for
>>> open stack were added to my image
>>>
>>> What I had to do was the following:
>>>
>>>
>>> IMAGE_INSTALL_append = " libopencv-core-dev libopencv-highgui-dev
>>> libopencv-imgproc-dev libopencv-objdetect-dev libopencv-ml-dev
>>> opencv-staticdev python-opencv"
>>>
>>
>> A recipe can produce several packages. As I can see on opencv recipe, it can
>> produced the following ones:
>>
>> PACKAGES="opencv-staticdev opencv-dev opencv-dbg opencv-doc opencv
>> opencv-apps python-opencv"
>>
>> and dynamic ones (depending on what else you have install)
>>
>> PACKAGES_DYNAMIC="^opencv-locale-.* ^libopencv-.*"
>>
>> For the opencv case, it happens that the package opencv is empty, so you
>> need to append the other sub-packages it produces into your IMAGE_INSTALL
>> variable.
>>
>> So, it is not a bug, this is expected.
>>
>
> In my humble opinion this should change for OpenCV. But I would love
> to hear the feedback from others

Not everyone that uses OpenCV wants to develop programs on the unit.  Many
times all you need are prebuilt applications.  Yocto is designed for the
most flexibility, hence packages are not "forced upon" you - you need to
ask for them.

In the case of OpenCV (again this discussion really belongs on the OpenEmbedded
developers list BTW), perhaps there should be a opencv-develop pseudo-package
which installs all the bits that you are asking for.

>
>>
>>> Even last night when one of the opencv developers ask me for python
>>> opencv I had to add the last part python-opencv. That is not cool at
>>> all . If I add opencv in the beginning I assume we are more than cool
>>> with that and yocto will add all the packages . Unless I am doing
>>> something wrong, in taht case I am more than happy to get the
>>> feedback.
>>>
>>> Thanks a lot for all the help . If someone else can reproduce this bug
>>> I am more than happy to report it in bugzila (not sure the URL)
>>>
>>> Hope it helps to cut the time of some others
>>>
>>> Best regards
>>>
>>> Victor Rodriguez
>>>
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

