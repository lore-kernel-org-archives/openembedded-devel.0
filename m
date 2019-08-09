Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86E8B7F396
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 01:43:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x791hZ8A002749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2019 18:43:36 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 18:43:35 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190808093210.149215-1-kai.kang@windriver.com>
	<20190808093210.149215-2-kai.kang@windriver.com>
	<CAMKF1soxeBna0ocvLeqGSj4pemgaSv0JoxR5TS2TDvpXvOcVZA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <3b1c9841-d845-210e-c89f-462846900907@windriver.com>
Date: Fri, 9 Aug 2019 09:41:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soxeBna0ocvLeqGSj4pemgaSv0JoxR5TS2TDvpXvOcVZA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] xfce4-datetime-setter: add recipe
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
X-List-Received-Date: Fri, 09 Aug 2019 01:43:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/9 上午5:52, Khem Raj wrote:
> On Thu, Aug 8, 2019 at 2:33 AM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Because xfce4-settings turn back to its official upstream, it missing
>> function to set date and time. Add it from Andreas's repo on github.
>> It depends on dbus service org.freedesktop.timedate1 which is provided
>> by systemd, so add systemd to RDEPENDS.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../xfce4-datetime-setter_3.32.2.bb            | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>>
>> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>> new file mode 100644
>> index 000000000..7a28b6101
>> --- /dev/null
>> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION = "A fork of (early) gnome-control-center datetime panel for XFCE. \
>> +It is based upon GTK3 and embedds into recent xfce4-settings."
>> +HOMEPAGE = "https://github.com/schnitzeltony/xfce4-datetime-setter"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
>> +
>> +DEPENDS = "glib-2.0-native libxfce4ui"
>> +
>> +SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https"
>> +SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit gettext meson
>> +
>> +FILES_${PN} += "${datadir}/icons/hicolor"
>> +
>> +RDEPENDS_${PN} = "systemd tzdata"
> On systemd-less systems it wont work
>
> ERROR: Nothing RPROVIDES 'systemd' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> RDEPENDS on or otherwise requires it)
> systemd was skipped: missing required distro feature 'systemd' (not in
> DISTRO_FEATURES)

It uses functions from dbus service org.freedesktop.timedate1 to set 
time and date. Without this dbus service, xfce4-datetime-setter doesn't 
work.
And this dbus service is provides by systemd. The alternative is to 
require distro feature 'systemd'. But I think RRDEPENDS should be more 
proper.

Regards,
Kai


>> --
>> 2.20.0
>>

-- 
Kai Kang


