Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rv8In-0008R3-EC
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 15:15:17 +0100
Received: by bke17 with SMTP id 17so508320bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 06:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=f/AZdX/Uc/RQIq2Eybxf8OCYTRQSf8x2Jpuc5B1nWck=;
	b=uTMzagd6GHN0k0EwKgptK3uNj7vzjleHpX963IDTcANYSnSBGj59xMBI9cIXr3mE0x
	XtO9it9oQnZSsPNtOz6P0d3MGLaErsIz9W4EoOEtKFGiksZrZo5NrRLV4OtTjSRQnwn/
	BSqLJ9us0I6WxI4ysmfDJ+KGCbSHRlk0uoRzc=
Received: by 10.205.131.13 with SMTP id ho13mr12863340bkc.58.1328710033378;
	Wed, 08 Feb 2012 06:07:13 -0800 (PST)
Received: from [192.168.0.44] (cwr150.internetdsl.tpnet.pl. [83.19.125.150])
	by mx.google.com with ESMTPS id cz3sm4889946bkb.3.2012.02.08.06.07.11
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 06:07:12 -0800 (PST)
Message-ID: <4F32810F.5060801@gmail.com>
Date: Wed, 08 Feb 2012 15:05:03 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
	<1328380249-11697-2-git-send-email-tworaz666@gmail.com>
	<CALbNGRSDEbmPKJi1CDNk1ifoLdG2x9C6q6d6pzo=X-NCFtMagQ@mail.gmail.com>
	<4F2E9C74.2020201@gmail.com>
In-Reply-To: <4F2E9C74.2020201@gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 14:15:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/05/2012 04:12 PM, Peter Tworek wrote:
> On 02/04/2012 07:52 PM, Andreas Müller wrote:
>> On Sat, Feb 4, 2012 at 7:30 PM, Peter Tworek<tworaz666@gmail.com>  
>> wrote:
>>>
>>>
>>> Run tested on netbook pro.
>>>
>>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>>> ---
>>>   meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb |   15 ---------------
>>>   meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb |   13 +++++++++++++
>>>   2 files changed, 13 insertions(+), 15 deletions(-)
>>>   delete mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
>>>   create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
>>>
>>> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb 
>>> b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
>>> deleted file mode 100644
>>> index 65efffd..0000000
>>> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
>>> +++ /dev/null
>>> @@ -1,15 +0,0 @@
>>> -DESCRIPTION = "Xfce configuration daemon and utilities"
>>> -SECTION = "x11/wm"
>>> -LICENSE = "GPLv2"
>>> -LIC_FILES_CHKSUM = 
>>> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>>> -DEPENDS = "dbus-glib libxfce4util perl-native"
>>> -
>>> -PR = "r0"
>>> -
>>> -inherit xfce
>>> -
>>> -FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
>>> -                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
>>> -
>>> -SRC_URI[md5sum] = "0f11ed1ec7789c5c4c3fcc7cdb3c2940"
>>> -SRC_URI[sha256sum] = 
>>> "e071d55982238f997a691ff4bb08ef39e4c86bae31cf69b6666bc0cdadd1b85d"
>>> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb 
>>> b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
>>> new file mode 100644
>>> index 0000000..51df2ee
>>> --- /dev/null
>>> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
>>> @@ -0,0 +1,13 @@
>>> +DESCRIPTION = "Xfce configuration daemon and utilities"
>>> +SECTION = "x11/wm"
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM = 
>>> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>>> +DEPENDS = "dbus-glib libxfce4util perl-native"
>>> +
>>> +inherit xfce
>>> +
>>> +FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
>>> +                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
>>> +
>>> +SRC_URI[md5sum] = "70b4185aa7eed8a85f015f16c5c86d36"
>>> +SRC_URI[sha256sum] = 
>>> "9860737539fab2b852e8c07c50c205a5fbe894b08bcb4488a70e3fd6c75993cb"
>>> -- 
>>> 1.7.3.4
>>>
>> Have same here but did not send because of following issue: After
>> setting up 1st session (panels / plugins...). and closing session in
>> the 2nd session panel is gone. Restarting manual causes annoying error
>> messages. How did you test this one?
> I haven't tested it with a clean session, just updated exiting version 
> on my machine, logged out, logged in and it worked. Just for 
> experiment I've made some changes to my existing panel setup, 
> restarted the device and the changes are there, everything seems to be 
> working fine. I'll retest it with clean $HOME, maybe this will trigger 
> the issue.
>
> /ptw

Ok, I've managed  what I think is the same problem you're seeing. What I 
did was:
1. Modify xfce4-panel (add some new plugin, remove exiting one etc)
2. Switch to virtual terminal (chvt 1)
3. Kill X server.

After that when I start xfce4 once again, there is high chance that 
xfce4-panel will crash. I couldn't reproduce the problem if I cleanly 
logged out from xfce4. I've tried it several times and everything works 
as I'd expect it to. My guess is that the problem arises when xfconfd is 
killed while it's trying to save something to the disk. Looking at the 
changelog only this [1] commit looks like it might have anything to do 
with the issue. Other ones seem harmless. I'll try to look into this 
closer when I'll have some free time.

/ptw

[1] 
http://git.xfce.org/xfce/xfconf/commit/?h=xfce-4.8&id=2a4673e1dae7d766d095582b47aa2b1c31e3de71


