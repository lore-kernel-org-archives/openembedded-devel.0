Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Ru5gH-0004yh-7B
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Feb 2012 18:15:14 +0100
Received: by eekd41 with SMTP id d41so1613562eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Feb 2012 09:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=z1tnk9xcYi9yqMzJW6UMyfWyDyzMlKmhDx9ipLm8+S8=;
	b=x1pwI90U80mIGGeWctdIQoDptCmJNEL+pQc+CT7VTL/X67CxLX/AofMhSYNmi/kDeg
	f/kCHLYFqP/avzczUobx2Rh5fCT5nvTzP0+TqgsakT8N+emznrm/g2pEV/lYnidAnxi/
	rK8zvK7PzFAAi8us0AHqAimiKtalQgJ/O6ERE=
Received: by 10.14.23.199 with SMTP id v47mr3676421eev.81.1328461632097;
	Sun, 05 Feb 2012 09:07:12 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	e12sm50400273eea.5.2012.02.05.09.07.10 (version=SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 09:07:11 -0800 (PST)
Message-ID: <4F2EB6C2.5030508@gmail.com>
Date: Sun, 05 Feb 2012 18:05:06 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
	<1328380249-11697-4-git-send-email-tworaz666@gmail.com>
	<CALbNGRQ6m2YV5xNiD-CZoBs_OkM7YtiqG_MSkMRaAbcFARaMEw@mail.gmail.com>
In-Reply-To: <CALbNGRQ6m2YV5xNiD-CZoBs_OkM7YtiqG_MSkMRaAbcFARaMEw@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH 3/3] xfce4-panel: Disable building of static libraries.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Feb 2012 17:15:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/05/2012 06:00 PM, Andreas Müller wrote:
> On Sat, Feb 4, 2012 at 7:30 PM, Peter Tworek<tworaz666@gmail.com>  wrote:
>> Current recipe triggers several QA warnings about non -staticdev packages
>> containing .a files. The offending files are static versions of panel
>> plugins. They have no actual use. They're just a byproduct. Xfce4-panel
>> contains only one more library libxfce4-panel. Similary to panel plugins
>> it's static version is rather useless.
>>
>> Disabling building of static libs makes -dev package smaller and fixes
>> all QA warnings.
>>
>> Run tested on netbook pro.
>>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> ---
>>   .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb  |   13 +++++--------
>>   1 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
>> index 0cd8eba..937b078 100644
>> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
>> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
>> @@ -4,15 +4,17 @@ LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
>>   DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
>>
>> -PR = "r1"
>> +PR = "r2"
>>
>>   inherit xfce
>>
>> +EXTRA_OECONF = "--disable-static"
> I think hereby you disable static for the whole: panel+plugins. I
> would feel better if you simply have
>
> FILES_${PN}-staticdev += "${libdir}/xfce4/panel/plugins/*.*a \

The question is do we really need static version of panel plugins. They 
can't be used for anything, really. Even if you package them, you have 
no way of using those static libs. There are no headers which define 
what functions those libs expose. If you feel bad about 
--disable-static, than how about:
do_install_append () {
find "${D}/${libdir}/xfce4/panel/plugins" -name '*.a' -exec rm -f {} +
}

??

> below.
>> +
>>   python populate_packages_prepend() {
>>         plugin_dir = bb.data.expand('${libdir}/xfce4/panel/plugins/', d)
>>         plugin_name = bb.data.expand('${PN}-plugin-%s', d)
>>         do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
>> -                         '${PN} plugin for %s', extra_depends='', prepend=True,
>> +                         '${PN} %s plugin', extra_depends='', prepend=True,
>>                           aux_files_pattern=['${datadir}/xfce4/panel/plugins/%s.desktop',
>>                                              '${sysconfdir}/xdg/xfce/panel/%s-*',
>>                                              '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
>> @@ -23,12 +25,7 @@ PACKAGES_DYNAMIC = "${PN}-plugin-*"
>>
>>   FILES_${PN} += "${libdir}/xfce4/panel/migrate \
>>                  ${libdir}/xfce4/panel/wrapper"
>> -
>> -FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
>> -                  "
>> -
>> -FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.*a \
>> -                   "
>> +FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug"
>>
>>   SRC_URI[md5sum] = "9d7bf0503d5867c4044cef04bb5845b1"
>>   SRC_URI[sha256sum] = "66f1266a1242ee5ecada995a4a584dd9802aa24456759b40b0c29227c39bed03"
>> --
> Regards
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



