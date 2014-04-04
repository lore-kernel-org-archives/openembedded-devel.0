Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9B26E61639
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Apr 2014 20:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C5D03314B14C;
	Fri,  4 Apr 2014 22:37:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YQiNwOiB62rj; Fri,  4 Apr 2014 22:37:31 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.117.139])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A7D0B314B14B;
	Fri,  4 Apr 2014 22:37:31 +0200 (CEST)
Message-ID: <533F180A.80900@opendreambox.org>
Date: Fri, 04 Apr 2014 22:37:30 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <1393618507-29414-1-git-send-email-obi@opendreambox.org>	<1393618507-29414-3-git-send-email-obi@opendreambox.org>	<CAJ86T=VCOWmE-eyYvpKLjfYhgyFSn0URjo_9yu7V9OGoUUD8aA@mail.gmail.com>
	<CAJ86T=XJ4XN5bDs4yKgUS7DFSkp9jSti7cKrDCYrcHRDyOtA6g@mail.gmail.com>
In-Reply-To: <CAJ86T=XJ4XN5bDs4yKgUS7DFSkp9jSti7cKrDCYrcHRDyOtA6g@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH 3/3] qtwebkit: add packageconfig for gstreamer, qtlocation and qtsensors
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
X-List-Received-Date: Fri, 04 Apr 2014 20:37:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Andre,

On 04.04.2014 05:34, Andre McCurdy wrote:
>> On Fri, Feb 28, 2014 at 12:15 PM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>>> Use gstreamer for 1.x, gstreamer010 for 0.10.x.
>>>
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> ---
>>>  recipes-qt/qt5/qtwebkit.inc | 24 +++++++++++++++++++++++-
>>>  1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
>>> index c35504e..90bd981 100644
>>> --- a/recipes-qt/qt5/qtwebkit.inc
>>> +++ b/recipes-qt/qt5/qtwebkit.inc
>>> @@ -5,7 +5,29 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>>>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>>>                      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
>>>
>>> -DEPENDS += "qtdeclarative qtlocation qtsensors icu ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
>>> +DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
>>> +
>>> +PACKAGECONFIG ??= "gstreamer qtlocation qtsensors"
>>> +PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
>>> +PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
>>> +PACKAGECONFIG[qtlocation] = ",,qtlocation"
>>> +PACKAGECONFIG[qtsensors] = ",,qtsensors"
>>> +
>>> +do_configure_prepend() {
>>> +    # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
>>> +    sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
>>> +    # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
>>> +    sed -e 's/\s\(packagesExist(".*\<gstreamer-0.10\>.*")\)/ OE_GSTREAMER010_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
>>> +    # disable qtlocation test if it isn't enabled by PACKAGECONFIG
>>> +    sed -e 's/\s\(qtHaveModule(positioning)\)/ OE_QTLOCATION_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
>>> +    # disable qtsensors test if it isn't enabled by PACKAGECONFIG
>>> +    sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
>>> +}
>>> +
>>> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer', 'CONFIG+=OE_GSTREAMER_ENABLED', '', d)}"
>>> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
>>> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtlocation', 'CONFIG+=OE_QTLOCATION_ENABLED', '', d)}"
>>> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtsensors', 'CONFIG+=OE_QTSENSORS_ENABLED', '', d)}"
>>>
>>>  # qtwebkit gets terribly big when linking with all debug info, disable by default
>>>  QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
>>> --
>>
>> With this change I'm seeing that the CONFIG+= options from the qmake
>> command line are being added to CONFIG after features.prf has already
>> been evaluated. Therefore OE_GSTREAMER_ENABLED etc evaluates as false
>> and qtwebkit is always configured without video support.
>>
>> From the configure log:
>>
>>> ! Missing GStreamer or QtMultimedia, disabling HTML5 media element support
>>
>> From the qmake debug log:
>>
>>> DEBUG 1: ... features.prf:106: condition "OE_GSTREAMER_ENABLED" is false (around line 5480 of the log)
>>> ...
>>> DEBUG 1: (command line):65535: CONFIG := ... OE_GSTREAMER_ENABLED (around line 5802 of the log, just prior to starting on WebKit.pro).
>>
>> I'm testing with dora + master branch of meta-qt5.
>>
> 
> Hi all,
> 
> I'm still seeing problems since this commit. Even when these new
> options are enabled via PACKAGECONFIG, qtwebkit is being configured as
> if they were all disabled.
> 
> The issue seems to be that the "CONFIG+=OE_xxx_ENABLED" options on the
> qmake command line don't work as intended. The options are added to
> CONFIG _after_ features.prf is parsed, so testing them in features.prf
> always evaluates to false.
> 
> Symptoms are "disabling HTML5 media element support" showing up in the
> qtwebkit configure log and libQt5WebKit.so.5.2.1 not having any
> runtime dependency on libgstreamer, etc.
> 
> Is anyone else seeing the same thing ?

thanks for your reminder. After your first mail I got distracted and
forgot about looking into this.

I was able to reproduce it and just submitted a patch to the mailing
list. I build-tested it with PACKAGECONFIG = "", "gstreamer" and
"gstreamer qtlocation" on dora.

Regards,
Andreas

