Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SOjhc-0002wl-28
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:03:16 +0200
Received: by lbbgo4 with SMTP id go4so1617822lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 22:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Yy4xNe99N6kaxY3ytSMn0siVG/9aOuINzmFu02I4+NI=;
	b=qedyu4RkdbaulQF1aO797Z5r//CzvJw7mSkeTDG3Vv2dLq0cyzyG9oeGhsRnwk8O39
	1o2lCJpr4nX0Zsg/mXZYK3Nms0QDVqgj1Vr5pFttvKnzpdgisGaQ/JJk/ZymGEZrhzFq
	tb6orQRMy3+Hzmc/TIp0bnsNzjacZD2vnNkXahCceW1jeXhzn1DtixZbbuqiY2cU/HBq
	v3EGR/32ZmGs1bwgmVD96FalAkIi8R5B4oIJgmU3FQPvx3LLw29Hm9wHp1bNoWrjLlcS
	slGD9PRh0sKxn2BOjIxfcXgYKgKrwoVL/g4UlBRwl4HKy4UB14B+Uwdo5ltyP1TcYY4D
	lcEA==
Received: by 10.112.8.5 with SMTP id n5mr9691631lba.48.1335765212970;
	Sun, 29 Apr 2012 22:53:32 -0700 (PDT)
Received: from [192.168.0.121] (147.84-49-231.nextgentel.com. [84.49.231.147])
	by mx.google.com with ESMTPS id
	r5sm19207929lbj.12.2012.04.29.22.53.29 (version=SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 22:53:29 -0700 (PDT)
Message-ID: <4F9F79F8.9000706@gmail.com>
Date: Tue, 01 May 2012 07:51:52 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1335472546-9653-1-git-send-email-tasskjapp@gmail.com>
	<1335481339-4539-1-git-send-email-tasskjapp@gmail.com>
	<CAMKF1sqPuudkP78FbnCR6cd0-RBEurcGScYms-3ZSmwQwsVU8Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqPuudkP78FbnCR6cd0-RBEurcGScYms-3ZSmwQwsVU8Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] synergy: add synergy 1.3.8
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
X-List-Received-Date: Mon, 30 Apr 2012 06:03:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2012 12:33 AM, Khem Raj wrote:
> On Thu, Apr 26, 2012 at 4:02 PM, Tasslehoff Kjappfot
> <tasskjapp@gmail.com>  wrote:
>> Signed-off-by: Tasslehoff Kjappfot<tasskjapp@gmail.com>
>> ---
>>   meta-oe/recipes-support/synergy/synergy_1.3.8.bb |   22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb
>>
>> diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
>> new file mode 100644
>> index 0000000..40efcb1
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION = "Synergy - control multiple computers with one keyboard and mouse"
>> +HOMEPAGE = "http://synergy.googlecode.com"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
>> +LICENSE = "GPLv2"
> use GPL-2.0
Will do.
>
>> +SECTION = "x11/utils"
>> +
>> +DEPENDS = "libx11 libxtst"
>> +
>> +SRC_URI = "http://synergy.googlecode.com/files/synergy-${PV}-Source.tar.gz"
>> +
>> +SRC_URI[md5sum] = "3534c65ecfa6e47d7899c57975442f03"
>> +SRC_URI[sha256sum] = "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edbfacc03"
>> +
>> +S = "${WORKDIR}/${PN}-${PV}-Source"
>> +
>> +inherit cmake siteinfo
>> +
> why is siteinfo needed ?
Leftover from a copy-paste from another recipe using cmake.



