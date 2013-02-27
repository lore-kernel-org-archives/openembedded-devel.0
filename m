Received: from mail-ie0-f176.google.com ([209.85.223.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UAl2Q-0000qw-OX
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 18:43:52 +0100
Received: by mail-ie0-f176.google.com with SMTP id k13so895941iea.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 09:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=UMQrNOsDsJUeZ/f9VTT36VstfvIzib1Z7+lmaiT20AU=;
	b=T7tZXCSP09uFI/rr2Q6o/W0SGu0Yw/vP43pMwRi8hxy6GKyfayLlchYv/LrSOeAw9Y
	mgH6Ivi3Lzz+l3/1fHrRKQCD01MiTgjpT32AyvP2CB15THG79+xFUNQasLj5xiwjZGOL
	eYNCda+2NLdvs/SvT9saVJijOVqixNVT0IEB9Ag7FsQEnA/bYpRsT9IqL45T+M+uik3T
	9744fHkV3At9ej/NeVNgO9g30sw57iNvv7wcW/6YBZXbVx2CZfq4sw0jBx4srAZY/OMv
	MXQQrPSZV3EErQUVdy73zATJPtJHZqJZEU0roKF2Yi+LDBWs/8qfgut8u6BAniaazuuo
	YE3w==
X-Received: by 10.50.36.199 with SMTP id s7mr7894210igj.56.1361986028884;
	Wed, 27 Feb 2013 09:27:08 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id ur12sm2526418igb.8.2013.02.27.09.27.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 09:27:07 -0800 (PST)
Message-ID: <512E41F1.2070409@felipetonello.com>
Date: Wed, 27 Feb 2013 09:27:13 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1361388555-28107-1-git-send-email-ftonello@cercacor.com>
	<20130226235955.GA8208@jama.dyndns-home.com>
In-Reply-To: <20130226235955.GA8208@jama.dyndns-home.com>
X-Gm-Message-State: ALoCoQl8aR+eMWg87j2fP/GR6ZO6DA2k4RF5ICDVhPtRmDd+1FjnnBvpzljLHmMqwW2s7p1v9anG
Subject: Re: [meta-oe][PATCH] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 27 Feb 2013 17:43:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 02/26/2013 03:59 PM, Martin Jansa wrote:
> On Wed, Feb 20, 2013 at 11:29:15AM -0800, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in any Qt4
>> environment.
>>
>> This recipe can be extended by a .bbappend to add .desktop, icon and others to
>> the target device.
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   27 +++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>>
>> diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>> new file mode 100644
>> index 0000000..e345131
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION = "A terminal emulator for Harmattan (Nokia N9/N950) with a custom \
>> +virtual keyboard and usability-enhancing features such as URL grabber, pan \
>> +gestures and customizable shortcut menu. Designed especially to be used with \
>> +screen and irssi."
>> +HOMEPAGE = "http://hqh.unlink.org/harmattan"
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +SECTION = "qt/app"
>> +
>> +PR = "r0"
>> +
>> +inherit qt4x11 pkgconfig
>> +
>> +SRC_URI = " \
>> +  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
>> +"
>
> Missing checksums:
> NOTE: Running task 14747 of 25316 (ID: 16879, /home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb, do_rm_work_all)
> ERROR: Fetcher failure for URL: 'http://hqh.unlink.org/harmattan/fingerterm-1.0.2.tar.gz'. No checksum specified for /home/jenkins/oe/shr-core-branches/shr-core/downloads/fingerterm-1.0.2.tar.gz, please add at least one to the recipe:
> SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448"
> SRC_URI[sha256sum] = "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82d95150"
> ERROR: Function failed: Fetcher failure for URL: 'http://hqh.unlink.org/harmattan/fingerterm-1.0.2.tar.gz'. No checksum specified for /home/jenkins/oe/shr-core-branches/shr-core/downloads/fingerterm-1.0.2.tar.gz, please add at least one to the recipe:
> SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448"
> SRC_URI[sha256sum] = "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82d95150"
> ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/fingerterm/1.0.2-r0/temp/log.do_fetch.16478
>

Sorry. I'm fixing and will send a new patch.

Felipe

>> +
>> +S = "${WORKDIR}/${PN}"
>> +
>> +FILES_${PN} = " \
>> +  ${bindir}/${PN} \
>> +"
>> +
>> +do_install() {
>> +  install -d ${D}${bindir}
>> +  install -m 0744 ${S}/${PN} ${D}${bindir}
>> +}
>> \ No newline at end of file
>> --
>> 1.7.9.5
>>



