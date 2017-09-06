Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 404EE77E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:02:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86K28QJ000892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 6 Sep 2017 13:02:08 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 13:02:07 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
	<CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <9fab8446-0159-e7c8-b81f-a4e7fa3a5882@windriver.com>
Date: Wed, 6 Sep 2017 15:02:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
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
X-List-Received-Date: Wed, 06 Sep 2017 20:02:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/6/17 2:58 PM, Andreas Müller wrote:
> On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> There is no upstream revision to the mixer to make it work w/o gstreamer-0.10
>>
>> also remove from packagegroup-xfce-extended
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb   | 14 --------------
>>  .../packagegroups/packagegroup-xfce-extended.bb            |  1 -
>>  2 files changed, 15 deletions(-)
>>  delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
>>
>> diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
>> deleted file mode 100644
>> index bdbec45..0000000
>> --- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -SUMMARY = "A volume control application based on GStreamer"
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>> -
>> -inherit xfce-panel-plugin
>> -
>> -DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
>> -
>> -SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
>> -
>> -SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
>> -SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
>> -
>> -RDEPENDS_${PN} = "gst-meta-audio"
>> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
>> index c07188f..ff024b3 100644
>> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
>> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
>> @@ -61,7 +61,6 @@ RRECOMMENDS_${PN} = " \
>>      xfce4-appfinder \
>>      xfce4-screenshooter \
>>      xfce4-power-manager \
>> -    xfce4-mixer \
>>      ristretto \
>>      xfce4-taskmanager \
>>      gigolo \
>> --
>> 1.8.3.1
>>
> NAK - I use it daily and there is no proper replacement (not using pulsaudio)

That is exactly why I removed it.. there is no proper replacement for it.
Between gstreamer-0.10 not being supported and the existence of it in
meta-openembedded causing preferred provider problems.  It really needs to be
replaced with something else.  I have no idea 'what else', but I was looking and
most other distributions have dumped it.

I saw some references to security issues in gstreamer-0.10 (not being resolved)
due to it no longer being supported as well, but no specifics.

--Mark

> Andreas
> 


