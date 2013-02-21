Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8aQq-0006B1-SO
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 18:59:46 +0100
Received: by mail-qc0-f180.google.com with SMTP id v28so3734258qcm.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2013 09:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=0AVX8BChLY8Tot8fMZuvaVnnmwnXx/dGBamOiE9m5u0=;
	b=aoRT8QfSWMIoLBtAKA3aMzLrFBT15tcNHiDOkVB00CWd/d103yqhj9fGtGAYauNo0h
	k96b6c0+4ZbqlBqNskvG+2LT7Qjp27MkBM5xL3ja2A8+EhxMtMCq6EqTjrz6y2qs0N+Y
	pu0X7L4qPxFualey5Hr/pBtFwBweAIKCIqci7KyYNRqXvF/VU+PC/6iZj70I4noronsA
	fWCGVTcl6/xoB+msLUQNY+Rv5bra4TkbLJhlYp0P5hQ3DQBDS+E7zzTTzlfdAACSA8nV
	0TvUAaQDXcLH/qiMnFpsNT29zX2ARikGsUP3DvohlB0/hD4RmkyOMYl6hgK4BuXHWSyK
	YhYg==
X-Received: by 10.224.181.208 with SMTP id bz16mr340435qab.2.1361468611970;
	Thu, 21 Feb 2013 09:43:31 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id o5sm33930905qao.12.2013.02.21.09.43.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Feb 2013 09:43:30 -0800 (PST)
Message-ID: <51265CC3.7020805@felipetonello.com>
Date: Thu, 21 Feb 2013 09:43:31 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1361400195-4717-1-git-send-email-ftonello@cercacor.com>
	<20130221142847.GC3821@windriver.com>
In-Reply-To: <20130221142847.GC3821@windriver.com>
X-Gm-Message-State: ALoCoQlTA3ghhLWLJCIWv/cYwbxKs7wPTk7uIXI29tf+NvG+6fsKVb4owDYoWkNKJaTFrrp6x6RE
Subject: Re: [meta-networking][PATCH] macchanger: added 1.5.0 recipe
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
X-List-Received-Date: Thu, 21 Feb 2013 17:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/21/2013 06:28 AM, Joe MacDonald wrote:
> Hey Felipe,
>
> [[oe] [meta-networking][PATCH] macchanger: added 1.5.0 recipe] On 13.02.20 (Wed 14:43) eu@felipetonello.com wrote:
>
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> This is a useful utility to manipulate the mac address of a device.
>
> I'm unfamiliar with this tool, does it do something more than you can do
> with ifconfig today?  It looks like maybe it provides a database of MAC
> addresses and allows the user to decide they want to change their
> RTL-8139 to look like a Centrino wireless card on the network, but I
> can't tell from looking at the page.

It's a helper tool to manipulate mac addresses. From its help:

GNU MAC Changer
Usage: macchanger [options] device

   -h,  --help                   Print this help
   -V,  --version                Print version and exit
   -s,  --show                   Print the MAC address and exit
   -e,  --endding                Don't change the vendor bytes
   -a,  --another                Set random vendor MAC of the same kind
   -A                            Set random vendor MAC of any kind
   -r,  --random                 Set fully random MAC
   -l,  --list[=keyword]         Print known vendors
   -m,  --mac=XX:XX:XX:XX:XX:XX  Set the MAC XX:XX:XX:XX:XX:XX

So it's useful when you want to set random mac addresses, change vendor 
id, do not change vendor id. Stuff like that.

Felipe

>
> Thanks,
> -Joe.
>
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   .../recipes-support/macchanger/macchanger_1.5.0.bb |   25 ++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>   create mode 100644 meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
>>
>> diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
>> new file mode 100644
>> index 0000000..0d78c34
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "Tool to view/change network interface MAC addresses"
>> +DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
>> +HOMEPAGE = "http://www.alobbs.com/macchanger"
>> +LICENSE  = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +PR = "r0"
>> +
>> +SRC_URI  = "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
>> +SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
>> +
>> +FILES_${PN} = " \
>> +  ${bindir}/${PN} \
>> +  ${datadir}/${PN}/wireless.list \
>> +  ${datadir}/${PN}/OUI.list \
>> +"
>> +
>> +FILES_${PN}-doc = " \
>> +  ${datadir}/info \
>> +  ${datadir}/man \
>> +"
>> +
>> +inherit autotools
>> \ No newline at end of file



