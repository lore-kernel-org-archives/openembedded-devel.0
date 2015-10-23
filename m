Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF37160034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:30:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9NAUI62002074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:30:18 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 23 Oct 2015 03:30:17 -0700
Message-ID: <562A0C38.2000204@windriver.com>
Date: Fri, 23 Oct 2015 18:30:16 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1445491305-39447-1-git-send-email-wenzong.fan@windriver.com>	<CA+chaQf5_A_4gm34f7sdU=ES_5k4fF_-=aRYBo7BiKLbOaR=nQ@mail.gmail.com>
	<CALbNGRSR81R9NGHjBQLb47XyR1v-_9VKwhYEdV8NHu3qocDagQ@mail.gmail.com>
In-Reply-To: <CALbNGRSR81R9NGHjBQLb47XyR1v-_9VKwhYEdV8NHu3qocDagQ@mail.gmail.com>
Subject: Re: [PATCH][meta-multimedia] gst-plugins-good: fix depends to libgudev
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
X-List-Received-Date: Fri, 23 Oct 2015 10:30:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/2015 06:41 PM, Andreas Müller wrote:
> On Thu, Oct 22, 2015 at 11:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> This shouldn't be needed when:
>> http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111271.html
>>
>> is merged.
>>
>> On Thu, Oct 22, 2015 at 7:21 AM, <wenzong.fan@windriver.com> wrote:
>>
>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>
>>> * udev provides libgudev but it won't be built with systemd;
>>> * systemd provides udev but no libgudev, libgudev has been removed
>>>    from systemd and it's a independent project now; libgudev only be
>>>    built if systemd distro feature enabled.
>>>
>>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>> ---
>>>   .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb    | 5
>>> ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>>> gst-plugins-good_0.10.31.bb
>>> b/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>>> gst-plugins-good_0.10.31.bb
>>> index af18281..3f3478f 100644
>>> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>>> gst-plugins-good_0.10.31.bb
>>> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>>> gst-plugins-good_0.10.31.bb
>>> @@ -11,12 +11,15 @@ PACKAGECONFIG ?= "jpeg v4l \
>>>       ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio',
>>> '', d)} \
>>>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>>>   "
>>> +
>>> +GUDEV="${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'libgudev',
>>> 'udev', d)}"
>>> +
>>>   PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>>>   PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
>>>   PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
>>>   PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
>>>   PACKAGECONFIG[gdkpixbuf] =
>>> "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
>>> -PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2
>>> --without-gudev,udev"
> There should be a patch replacing udev by libgudev in the
> dependencies. No need for DISTRO_FEATURE magic here - this is done in
> udev/libgudev.

Thanks for your review, I'll send v2 patch that only change "udev -> 
libgudev".

Wenzong

>
> Andreas
>

