Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id A36E8609AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 19:10:41 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f73so652049yha.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=Blps7eyDGwUnMa7PJ20gP6ab73nEfmA2OExbyD6jxx0=;
	b=rhMTZ/G9+7rw+iPkZ53RqOyvx1LkI/u2bDinRLJ0BXWo1DlZwCz0AX92YNj/6GSObC
	/fOqDbVkqhqzxqzDtwRNg+TsEBiJr3SsAUAf2b6zVUKaV3XuC7KiA7Tc4u4B9wxl88YB
	d+PWiDW+bILJA1tMineFSXudivOg2Zn44HfkLMiwKniD/wBvjAncGX9vDOGVxh82R20Z
	U9IE/udoas07R8CUFltyvKydFLnd48WEAxmMiqXGgoK8cLnNaKGRr83uOcSviWrad4au
	qYiZ6+Ud7Hnmp2n7B4OKsHSqA6vfkhTLgBY+ITSdT9F1YtTB/eapD8NAlc9sWRuI8JeD
	x0zA==
MIME-Version: 1.0
X-Received: by 10.236.43.98 with SMTP id k62mr49169723yhb.33.1398798633492;
	Tue, 29 Apr 2014 12:10:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 29 Apr 2014 12:10:33 -0700 (PDT)
In-Reply-To: <535FF887.3040708@pseudoterminal.org>
References: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
	<1398753593-4447-2-git-send-email-dv@pseudoterminal.org>
	<CAP9ODKpUHaxxyy8MQ2-f8XwD-tJWd6E+xW-Dr2B+Z-UB3s=n2A@mail.gmail.com>
	<535FF887.3040708@pseudoterminal.org>
Date: Tue, 29 Apr 2014 16:10:33 -0300
X-Google-Sender-Auth: 9bSiUx1kuHjI2rUR0c2QXwQeqz0
Message-ID: <CAP9ODKqJHi3eJa6n-wKh=FNBHL=dfjBCkTRXcDgL5Xytn8KADQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH v2 1/4] chromium: Add component-build PACKAGECONFIG option
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
X-List-Received-Date: Tue, 29 Apr 2014 19:10:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 29, 2014 at 4:07 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> On 2014-04-29 20:25, Otavio Salvador wrote:
>>
>> On Tue, Apr 29, 2014 at 3:39 AM, Carlos Rafael Giani
>> <dv@pseudoterminal.org> wrote:
>>>
>>> In a component build, the individual Chromium components are contained in
>>> separate shared objects. This is useful when building on a system with
>>> 8 GB RAM or less (since the linker needs at least that much for link
>>> time optimization otherwise if a non-component build is done), and during
>>> development and testing of Chromium internals.
>>>
>>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>>> ---
>>>   recipes-browser/chromium/chromium/component-build.gypi |  5 +++++
>>>   recipes-browser/chromium/chromium/google-chrome        |  2 ++
>>>   recipes-browser/chromium/chromium_35.0.1883.0.bb       | 11 +++++++++--
>>>   3 files changed, 16 insertions(+), 2 deletions(-)
>>>   create mode 100644
>>> recipes-browser/chromium/chromium/component-build.gypi
>>>
>>> diff --git a/recipes-browser/chromium/chromium/component-build.gypi
>>> b/recipes-browser/chromium/chromium/component-build.gypi
>>> new file mode 100644
>>> index 0000000..e58b4ca
>>> --- /dev/null
>>> +++ b/recipes-browser/chromium/chromium/component-build.gypi
>>> @@ -0,0 +1,5 @@
>>> +{
>>> +  'variables': {
>>> +     'component' : 'shared_library'
>>> +  },
>>> +}
>>> diff --git a/recipes-browser/chromium/chromium/google-chrome
>>> b/recipes-browser/chromium/chromium/google-chrome
>>> index 2f6ad2e..8ce400b 100644
>>> --- a/recipes-browser/chromium/chromium/google-chrome
>>> +++ b/recipes-browser/chromium/chromium/google-chrome
>>> @@ -1,6 +1,8 @@
>>>   #!/bin/sh
>>>
>>>   export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
>>> +export LD_LIBRARY_PATH=/usr/lib/chrome
>>> +
>>>   if [ "${USER}" = "root" ] ; then
>>>          /usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
>>>   else
>>> diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb
>>> b/recipes-browser/chromium/chromium_35.0.1883.0.bb
>>> index 2497f10..203474d 100644
>>> --- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
>>> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
>>> @@ -6,6 +6,7 @@ SRC_URI = "\
>>>
>>> http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
>>>           file://include.gypi \
>>>           file://oe-defaults.gypi \
>>> +        ${@bb.utils.contains('PACKAGECONFIG', 'component-build',
>>> 'file://component-build.gypi', '', d)} \
>>>           file://unistd-2.patch \
>>>           file://google-chrome \
>>>           file://google-chrome.desktop \
>>> @@ -27,6 +28,7 @@ EXTRA_OEGYP = " \
>>>          ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '',
>>> '-Dlinux_use_gold_flags=0', d)} \
>>>          -I ${WORKDIR}/oe-defaults.gypi \
>>>          -I ${WORKDIR}/include.gypi \
>>> +       ${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I
>>> ${WORKDIR}/component-build.gypi', '', d)} \
>>>          -f ninja \
>>>   "
>>>   ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES',
>>> 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
>>> @@ -65,6 +67,11 @@ do_install() {
>>>          install -m 0644 ${S}/out/Release/product_logo_48.png
>>> ${D}${bindir}/chrome/
>>>          install -m 0755 ${S}/out/Release/libffmpegsumo.so
>>> ${D}${bindir}/chrome/
>>>
>>> +       install -d ${D}${libdir}/chrome/
>>
>> This ought to b done inside of the 'if' block.
>
>
>
> I am not sure about this, because the export LD_LIBRARY_PATH=/usr/lib/chrome
> line is also introduced. What would be preferred? Set LD_LIBRARY_PATH to a
> potentially nonexisting path or always create /usr/lib/chrome ?
> I could also do a trick similar to the one for the chromium args, but I
> doubt more library paths will ever be added.

I see your point.

Ok so keep it as is now but please add a comment there.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

