Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 234B96065F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2013 00:13:56 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so1288262pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 17:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fBcySIOmMXS1K94c8qykbGjW2ZWfd44hX650YZGCGsk=;
	b=fuRTAnbUK8ethjSVL/wD4+yHg1sNt6LAWP4DPHCYxt41sHkJqPBQfEBtyCyByXgsg2
	y+XiVSYEOxTu5dOh6cm8f61epV19qbPtHzIKCXxx/faPwG/1RJ9r3nVjKgbK1Ut4uwIG
	YqGouhsow97ZWFe9qr5yxjel+FgivbuH+rrdX5qFfvEViH/s6y7WHSaRKiytnnjTqm2q
	cT8tICkWw2e3YpqjJJW4Q2q6hG/w8TU22rxlnNeYFfBZhwaLq9HNf1nxzZUuW7tMu03s
	JwGyEbwsEFZethHVXFmfWZ1beTpxAFV9crOIlrd92fsIrA6BiKPSp2MFS76BGcBxSUD2
	z2Vg==
X-Received: by 10.68.253.138 with SMTP id aa10mr44772638pbd.24.1374711236619; 
	Wed, 24 Jul 2013 17:13:56 -0700 (PDT)
Received: from krys-red.trunet.local ([210.48.94.225])
	by mx.google.com with ESMTPSA id nj9sm5925664pbc.13.2013.07.24.17.13.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 17:13:55 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51F06DC0.5080802@gna.org>
Date: Thu, 25 Jul 2013 12:13:52 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1374701507-26976-1-git-send-email-chgans@gna.org>
	<20130724215553.GB17913@jama>
In-Reply-To: <20130724215553.GB17913@jama>
Subject: Re: [meta-qt5][dylan][PATCH] qtbase.inc: Fix qtbase-tools runtime depencency on perl
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
X-List-Received-Date: Thu, 25 Jul 2013 00:13:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25/07/13 09:55, Martin Jansa wrote:
> On Thu, Jul 25, 2013 at 09:31:47AM +1200, Christian Gagneraud wrote:
>> While building a custom rootfs using poky, meta-oe, meta-ti and meta-qt5 (all on Dylan branch), I got the following error:
>> [...]
>> | Computing transaction...error: Can't install qtbase-tools-5.0.2-r2.0@armv7a_vfp_neon: no package provides /usr/bin/perl
>> [...]
>>
>> qtbase-tools seems to depends on perl (at runtime), but this wasn't specified in any bb file, this patch fixes it.
>
> Have you tried which files require perl?

I didn't, but now I did:
christiaga@krys-red:~/projects/yocto/poky-ti-qt5$ file 
build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.0.2-r2.0/package/usr/bin/qt5/*|grep 
-i perl
build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.0.2-r2.0/package/usr/bin/qt5/syncqt: 
Perl script, ASCII text executable

>
>>
>> Signed-off-by: Christian Gagneraud <chgans@gna.org>
>> ---
>>   recipes-qt/qt5/qtbase.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
>> index f521a30..a72a3d6 100644
>> --- a/recipes-qt/qt5/qtbase.inc
>> +++ b/recipes-qt/qt5/qtbase.inc
>> @@ -23,6 +23,8 @@ SRC_URI += " \
>>
>>   DEPENDS += "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 ${ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS} ${FONTCONFIG_DEPENDS}"
>>
>> +RDEPENDS_${PN}-tools += "perl"
>> +
>>   # to provide xcb/xcb_icccm.h, xcb/xcb_image.h, xcb/xcb_keysyms.h and dbus/dbus.h
>>   # XCB_DEPENDS += "xcb-util-wm xcb-util-image xcb-util-keysyms dbus"
>>   # reenable when we switch to "-qt-xcb" and build of
>> --
>> 1.8.1.2
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


