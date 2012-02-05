Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Ru3vf-0002YR-3G
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Feb 2012 16:22:59 +0100
Received: by eaal10 with SMTP id l10so1362775eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Feb 2012 07:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=R9feK9sEegCJ/Tdxd0fA42fuVVQsi84TSNsBhOLla54=;
	b=OwMsHojZH3Q6hxxWVlVSB9ADvSVBbWoAodVruxNgRjvgB3ziz12F4Lyw9P8O7ZXH3u
	iL26u0wJSAuPA41E8bRDiVPjybilPWRoh5Ubb4DZVQq3k5v+xewWV9ONSwDGPS3Qn8nB
	LYyqAdTCDZs+wPaDmRpKOsBTM1wCCI4NyoXfE=
Received: by 10.213.29.207 with SMTP id r15mr2261410ebc.84.1328454898921;
	Sun, 05 Feb 2012 07:14:58 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	o49sm49334499eei.0.2012.02.05.07.14.57 (version=SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 07:14:57 -0800 (PST)
Message-ID: <4F2E9C74.2020201@gmail.com>
Date: Sun, 05 Feb 2012 16:12:52 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
	<1328380249-11697-2-git-send-email-tworaz666@gmail.com>
	<CALbNGRSDEbmPKJi1CDNk1ifoLdG2x9C6q6d6pzo=X-NCFtMagQ@mail.gmail.com>
In-Reply-To: <CALbNGRSDEbmPKJi1CDNk1ifoLdG2x9C6q6d6pzo=X-NCFtMagQ@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH 1/3] xfconf: Update to latest stable version 4.8.1.
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
X-List-Received-Date: Sun, 05 Feb 2012 15:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/04/2012 07:52 PM, Andreas Müller wrote:
> On Sat, Feb 4, 2012 at 7:30 PM, Peter Tworek<tworaz666@gmail.com>  wrote:
>> http://git.xfce.org/xfce/xfconf/tag/?id=xfconf-4.8.1
>>
>> Run tested on netbook pro.
>>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> ---
>>   meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb |   15 ---------------
>>   meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb |   13 +++++++++++++
>>   2 files changed, 13 insertions(+), 15 deletions(-)
>>   delete mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
>>   create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
>>
>> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
>> deleted file mode 100644
>> index 65efffd..0000000
>> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -DESCRIPTION = "Xfce configuration daemon and utilities"
>> -SECTION = "x11/wm"
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>> -DEPENDS = "dbus-glib libxfce4util perl-native"
>> -
>> -PR = "r0"
>> -
>> -inherit xfce
>> -
>> -FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
>> -                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
>> -
>> -SRC_URI[md5sum] = "0f11ed1ec7789c5c4c3fcc7cdb3c2940"
>> -SRC_URI[sha256sum] = "e071d55982238f997a691ff4bb08ef39e4c86bae31cf69b6666bc0cdadd1b85d"
>> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
>> new file mode 100644
>> index 0000000..51df2ee
>> --- /dev/null
>> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION = "Xfce configuration daemon and utilities"
>> +SECTION = "x11/wm"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>> +DEPENDS = "dbus-glib libxfce4util perl-native"
>> +
>> +inherit xfce
>> +
>> +FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
>> +                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
>> +
>> +SRC_URI[md5sum] = "70b4185aa7eed8a85f015f16c5c86d36"
>> +SRC_URI[sha256sum] = "9860737539fab2b852e8c07c50c205a5fbe894b08bcb4488a70e3fd6c75993cb"
>> --
>> 1.7.3.4
>>
> Have same here but did not send because of following issue: After
> setting up 1st session (panels / plugins...). and closing session in
> the 2nd session panel is gone. Restarting manual causes annoying error
> messages. How did you test this one?
I haven't tested it with a clean session, just updated exiting version 
on my machine, logged out, logged in and it worked. Just for experiment 
I've made some changes to my existing panel setup, restarted the device 
and the changes are there, everything seems to be working fine. I'll 
retest it with clean $HOME, maybe this will trigger the issue.

/ptw


