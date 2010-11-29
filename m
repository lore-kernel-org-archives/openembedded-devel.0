Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PNBJB-0004Nl-Dl
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 22:30:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id E3D4D8FEA29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 16:29:30 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19834-07 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 29 Nov 2010 16:29:30 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 1CE0E8FE69B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 16:29:30 -0500 (EST)
Message-ID: <4CF41B36.2070407@cbnco.com>
Date: Mon, 29 Nov 2010 16:29:26 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291049553-8442-1-git-send-email-msmith@cbnco.com>
	<AANLkTinst=Y1PMamwfmWNhLiYFanxTS_V-rJAmGbnTOt@mail.gmail.com>
In-Reply-To: <AANLkTinst=Y1PMamwfmWNhLiYFanxTS_V-rJAmGbnTOt@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xf86-input-tslib 0.0.6: move udev rule to	/etc/udev/rules.d
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
X-List-Received-Date: Mon, 29 Nov 2010 21:30:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Mon, Nov 29, 2010 at 8:52 AM, Michael Smith <msmith@cbnco.com> wrote:
>> /lib/udev/rules.d is a symlink to /etc/udev/rules.d.
>>
>> Signed-off-by: Michael Smith <msmith@cbnco.com>
> 
> Will it upgrade seemlessly on deployed systems ?

Hmm. No. The symlink /lib/udev/rules.d gets removed because it's in the 
file list for the old package.

Should I add a postinst to recreate the symlink if it's missing? (should 
actually be in the postrm for the old version but that would require 
time travel)

Mike

> patch looks ok otherwise
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>
> 
>> ---
>>  recipes/xorg-driver/xf86-input-tslib_0.0.6.bb |    6 +++---
>>  1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb b/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
>> index a1cecaa..4b910dd 100644
>> --- a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
>> +++ b/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "X.Org X server -- tslib input driver"
>>  DEPENDS += "tslib"
>>  RRECOMMENDS_${PN} += "tslib-calibrate"
>>  RSUGGESTS_${PN} += "hal"
>> -PR = "${INC_PR}.1"
>> +PR = "${INC_PR}.2"
>>
>>  SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2;name=archive \
>>            file://double-free-crash.patch \
>> @@ -20,8 +20,8 @@ do_configure_prepend() {
>>  do_install_append() {
>>         install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
>>         install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
>> -        install -d ${D}/lib/udev/rules.d
>> -        install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}/lib/udev/rules.d/
>> +        install -d ${D}/${sysconfdir}/udev/rules.d
>> +        install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}/${sysconfdir}/udev/rules.d/
>>  }
>>
>>  FILES_${PN} += "${datadir}/hal /lib/udev"
>> --
>> 1.6.3.2
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



