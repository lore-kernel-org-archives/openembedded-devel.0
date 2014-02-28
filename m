Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 05E256F286
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 00:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AC87C31499DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 01:59:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hSoeMPuxaFoB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 01:59:05 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.254.61])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1AF563149857
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 01:59:05 +0100 (CET)
Message-ID: <530FDF58.8040505@opendreambox.org>
Date: Fri, 28 Feb 2014 01:59:04 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1393446351-9280-1-git-send-email-obi@opendreambox.org>
	<20140226210522.GT26981@jama>
In-Reply-To: <20140226210522.GT26981@jama>
Subject: Re: [meta-qt5][PATCH] qtwebkit: accept gstreamer 0.10 as an option
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
X-List-Received-Date: Fri, 28 Feb 2014 00:59:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 26.02.2014 22:05, Martin Jansa wrote:
> On Wed, Feb 26, 2014 at 09:25:51PM +0100, Andreas Oberritter wrote:
>> There's no configuration knob, though. QtWebKit will prefer
>> gstreamer 1.0 if available.
> 
> Can you please add configuration knob first?
> 
> The problem is that without the knob it will be undeterministic, with
> gstreamer010 in PACKAGECONFIG you can run 2nd build with gstreamer10
> already staged for some other component and the resulting qtwebkit will
> be different than in 1st build.

I'll see what I can do. I'm not a big fan of (Qt)WebKit's build system,
so this might take a while.

FWIW, I noticed that qtlocation and qtsensors are optional build
dependencies which need packageconfigs, too.

Regards,
Andreas

>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  recipes-qt/qt5/qtwebkit.inc | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
>> index aea9dad..5e96f39 100644
>> --- a/recipes-qt/qt5/qtwebkit.inc
>> +++ b/recipes-qt/qt5/qtwebkit.inc
>> @@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>>                      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
>>  
>> -DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
>> +DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 libxslt"
>> +
>> +PACKAGECONFIG ??= "gstreamer10"
>> +PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
>> +PACKAGECONFIG[gstreamer10] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
>>  
>>  # qtwebkit gets terribly big when linking with all debug info, disable by default
>>  QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
>> -- 
>> 1.8.3.2
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


