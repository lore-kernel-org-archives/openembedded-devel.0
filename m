Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtcZc-00053P-Qy
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 11:10:24 +0100
Received: by eaal10 with SMTP id l10so1008963eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=nZmlewqKc2icr4gItfJFLtfHFtYni14vwsEA3tHN9kA=;
	b=AzlFTKkXLy1/rudKP+zERHWvYrzzaOiWHsmYdMPAol63kyJO2Eehn/fwF5wuc740mH
	nfRFZUqz0hlS7eux2KqChHSoF715zrGVXoEPMzryyIyPaG+QAhwVqlxvGcLcMn7DTgsf
	VqT6aNqo7Dy3fo+K1G6ge9SSTjslA6r3b/Zt8=
Received: by 10.213.17.137 with SMTP id s9mr253820eba.111.1328349745862;
	Sat, 04 Feb 2012 02:02:25 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	a58sm32856751eeb.8.2012.02.04.02.02.24 (version=SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 02:02:25 -0800 (PST)
Message-ID: <4F2D01B6.90806@gmail.com>
Date: Sat, 04 Feb 2012 11:00:22 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328313811-12627-1-git-send-email-tworaz666@gmail.com>
	<CALbNGRRRH2QCkdpzKyHwdOzd-jPGkV2Fmhff9cD5aVBggoQS7g@mail.gmail.com>
In-Reply-To: <CALbNGRRRH2QCkdpzKyHwdOzd-jPGkV2Fmhff9cD5aVBggoQS7g@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH] xfce4-power-manager: Add initial recipe for version 1.0.10.
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
X-List-Received-Date: Sat, 04 Feb 2012 10:10:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/04/2012 03:50 AM, Andreas Müller wrote:
> On Sat, Feb 4, 2012 at 1:03 AM, Peter Tworek<tworaz666@gmail.com>  wrote:
>> Run tested on netbook pro.
>>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> ---
>>   .../xfce4-power-manager_1.0.10.bb                  |   28 ++++++++++++++++++++
>>   1 files changed, 28 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb
>>
>> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb
>> new file mode 100644
>> index 0000000..4641178
>> --- /dev/null
>> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb
>> @@ -0,0 +1,28 @@
>> +DESCRIPTION = "Power manager for the Xfce desktop environment"
>> +HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-power-manager"
>> +SECTION = "x11"
>> +
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>> +
>> +inherit xfce
>> +
>> +DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
>> +           libxrandr virtual/libx11 libxext xfce4-panel"
>> +RDEPENDS_${PN} = "networkmanager udisks upower polkit"
>> +
>> +EXTRA_OECONF = " \
>> +    --enable-polkit \
>> +    --enable-network-manager \
> networkmanager conflicts with conman. I don't if this makes sense to
> use conman with xfce (am using networkmanager too). What happens if
> this option is not set?

Haven't tested it (yet), but I think it should work fine without 
networkmanager, event when it's enabled. You'll probably see some 
warnings in you logs, saying that it can't contact it via dbus, but that 
should be it. Anyway I'll try to verify my theory...

>> +    --enable-panel-plugins \
>> +    "
>> +
>> +PACKAGES += "xfce4-brightness-plugin"
>> +FILES_${PN} += "${datadir}/polkit-1"
>> +FILES_xfce4-brightness-plugin = " \
>> +    ${libdir}/xfce4/panel-plugins/xfce4-brightness-plugin \
>> +    ${datadir}/xfce4/panel-plugins/xfce4-brightness-plugin.desktop \
>> +    "
>> +
>> +SRC_URI[md5sum] = "38cbd272eb30e36ae538d9f38858bd38"
>> +SRC_URI[sha256sum] = "80e4bb44f81c485ec09654dde432d6e28667d49a787625632a4413aac30422f0"
>> --
>> 1.7.3.4
>>
>>
> This was part of my TODO - Thanks. Give it a test next week.
You're welcome.

/ptw


