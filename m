Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1ATf-0001Yw-98
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 05:42:55 +0100
Received: by pwj9 with SMTP id 9so602901pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 21:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=jYGMN7odJHIeQVpWHNtwdcgrqL2xGKkzZLvAtlFuAAU=;
	b=CUsu7bLAePZoGR+TdG1hNnF58zNHIQsoSMff3g0BUXeidE4EWbuOxf6KFZ/n5MpSRB
	3qYPHxw9BVaQb0p6GEKQpDtJ+EkIx5/9Cg6C5T/6FmHn1owsq/61xcisX/iQ3VsixCM+
	IeWLqYDcAB7Yu0/eJDkfetrA/p4AVhnm0b+Vw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=f/zExQfS90+xeIMGUwnSI/zdQqiDElA3QZN85QW7Fk8huNCXM8bgKYSXcTHz9E1UpJ
	TR1RcFTRhOq7T8y2xnEHhyFQ095jNM87I2PLArZ9OmD5mrOa28BYFAuAH6rOqeyxG24R
	vLg0aHjgZH0usFwPa4TLlyMAPobWoElNtU+e8=
Received: by 10.142.173.5 with SMTP id v5mr1775222wfe.66.1300595571276;
	Sat, 19 Mar 2011 21:32:51 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x11sm5315051wfd.1.2011.03.19.21.32.48
	(version=SSLv3 cipher=OTHER); Sat, 19 Mar 2011 21:32:49 -0700 (PDT)
Message-ID: <4D85835F.7070002@gmail.com>
Date: Sat, 19 Mar 2011 21:32:31 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299591298.3785.126.camel@mattotaupa>	<1300205205.4123.6.camel@mattotaupa>	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>	<1300364903.3950.21.camel@mattotaupa>	<1300402006.17833.14.camel@mattotaupa>	<AANLkTi=xe7p694-8-bnGV85H59M-tJvTUnwm6TgCFPZk@mail.gmail.com>	<1300449625.3830.47.camel@mattotaupa>	<20110319183329.GA14868@sakrah.homelinux.org>
	<1300583444.7379.1.camel@mattotaupa>
In-Reply-To: <1300583444.7379.1.camel@mattotaupa>
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Sun, 20 Mar 2011 04:42:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/19/2011 6:10 PM, Paul Menzel wrote:
> Am Samstag, den 19.03.2011, 11:33 -0700 schrieb Khem Raj:
>> On (18/03/11 13:00), Paul Menzel wrote:
>>> Date: Fri, 18 Mar 2011 12:03:43 +0100
>>>
>>> Xfce Session build depends on the executable `iceauth`, which fails when cross compiling for a different architecture.
>>>
>>>          checking if the linker (arm-oe-linux-gnueabi-ld --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi) is GNU ld... (cached) yes
>>>          checking whether to build with profiling support... no
>>>          checking whether to compile with coverage profiling instrumentation... no
>>>          checking whether to disable assertions... no
>>>          checking whether to build final version... yes
>>>          checking whether arm-oe-linux-gnueabi-ld --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi accepts -O1... yes
>>>          checking for iceauth... no
>>>          configure: error: iceauth missing, please check your X11 installation
>>>
>>> As suggested by Khem Raj [1] pass the value – `/usr/bin/iceauth` is taken – to the configure script so that the test is avoided.
>>>
>>> Therefore `iceauth` is removed from `DEPENDS` and the `PR` variable is incremented.
>>>
>>> This issue has been reported upstream as ticket #7420 [2].
>>>
>>> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/031115.html
>>> [2] http://bugzilla.xfce.org/show_bug.cgi?id=7420
>>>
>>> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
>>> ---
>>>   recipes/xfce-base/xfce4-session_4.6.1.bb |    6 ++++--
>>>   recipes/xfce-base/xfce4-session_4.6.2.bb |    6 ++++--
>>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-base/xfce4-session_4.6.1.bb
>>> index ba66ac1..5029b21 100644
>>> --- a/recipes/xfce-base/xfce4-session_4.6.1.bb
>>> +++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
>>> @@ -1,13 +1,15 @@
>>>   DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
>>> -DEPENDS = "lbwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
>>> +DEPENDS = "lbwnck libxfcegui4 libxfce4util dbus xfce-utils"
>>>   SECTION = "x11"
>>>
>>> -PR = "r4"
>>> +PR = "r5"
>>>
>>>   inherit xfce46
>>>
>>>   RDEPENDS_${PN} = "iceauth xfce-utils xinit dbus-x11"
>>>
>>> +EXTRA_OECONF += "ac_cv_path_ICEAUTH=/usr/bin/iceauth"
>>
>> Would it make sense to have iceauth-native instead ?
>
> It never really executes `iceauth` during compile time but just during
> configure to determine the runtime path. So `iceauth-native` is not
> needed and would be even result in the wrong path, I think.

weather it executes is during configure or during compile how does it 
matter ? in the end it needs iceauth and it will mean that you will ask
folks to have iceauth on their build host which is what I am asking to 
avoid. Either cache the variable or use iceauth-native so this dep is 
removed from build host packages.

>
>>>   FILES_${PN} += "${libdir}/xfce4/splash/engines/*.so"
>>>   FILES_${PN} += "${datadir}/xfce4/tips/*"
>>>   FILES_${PN} += "${datadir}/themes/Default/balou/*"
>>> diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb b/recipes/xfce-base/xfce4-session_4.6.2.bb
>>> index d7f768a..c937775 100644
>>> --- a/recipes/xfce-base/xfce4-session_4.6.2.bb
>>> +++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
>>> @@ -1,13 +1,15 @@
>>>   DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
>>> -DEPENDS = "libwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
>>> +DEPENDS = "libwnck libxfcegui4 libxfce4util dbus xfce-utils"
>>>   SECTION = "x11"
>>>
>>> -PR = "r0"
>>> +PR = "r1"
>>>
>>>   inherit xfce46
>>>
>>>   RDEPENDS_${PN} = "iceauth xfce-utils xinit dbus-x11"
>>>
>>> +EXTRA_OECONF += "ac_cv_path_ICEAUTH=/usr/bin/iceauth"
>>> +
>>>   FILES_${PN} += "${libdir}/xfce4/splash/engines/*.so"
>>>   FILES_${PN} += "${datadir}/xfce4/tips/*"
>>>   FILES_${PN} += "${datadir}/themes/Default/balou/*"
>>> --
>>> 1.7.4.1
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



