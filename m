Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1T9C8R-0001ja-Bx
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 11:42:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=12958; q=dns/txt;
	s=iport; t=1346837438; x=1348047038;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to; bh=bHO/F3tttm4hcTL/0u/NQxQ9LwuqNtHNZdmHlfJ9Ew8=;
	b=T+u17oPvMxpvRnjH49CacDb7D6exHcF90OFycS4/0AF/UOHiQg4Xz92j
	CmY5ZD8F8DnV3z4RT2I0CM8uhw5pY6PnMSuToxyPKLpLWYj4YTSFkIGYH
	q1Sw6IGBxV6IHOPMkdug3NiHOEvYjphRqAWrdbHlify/hjyLWu9LeRnMA s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgsFAF8bR1CQ/khR/2dsb2JhbABFi2SvOIEHgiABAQEDAQEBAQ8BOAEiChELGAkWDwkDAgECARUBLxMGAgEBHodlBguaEZFTAY5RixGHAgOTLYIsgRSES4hUgWeCZQ
X-IronPort-AV: E=Sophos;i="4.80,372,1344211200"; d="scan'208,217";a="7817967"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-4.cisco.com with ESMTP; 05 Sep 2012 09:30:36 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q859UaRj013745
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2012 09:30:36 GMT
Message-ID: <50471BBC.4080306@cisco.com>
Date: Wed, 05 Sep 2012 11:30:36 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.6esrpre) Gecko/20120730 Thunderbird/10.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346836952-1804-1-git-send-email-mertsas@cisco.com>
	<20120905092549.GO3372@jama.jama.net>
In-Reply-To: <20120905092549.GO3372@jama.jama.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] task-x11*: Rename to packagegroup to match oe-core.
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
X-List-Received-Date: Wed, 05 Sep 2012 09:42:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ok. Nice. Did not see your patches there.

- Martin

On 09/05/12 11:25, Martin Jansa wrote:
> On Wed, Sep 05, 2012 at 11:22:32AM +0200, Martin Ertsaas wrote:
>> ---
>>  .../packagegroups/packagegroup-x11-server_1.0.bb   |   23 +++++++++++++++
>>  .../packagegroups/packagegroup-x11_1.0.bb          |   30 ++++++++++++++++++++
>>  meta-oe/recipes-core/tasks/task-x11-server_1.0.bb  |   23 ---------------
>>  meta-oe/recipes-core/tasks/task-x11_1.0.bb         |   30 --------------------
>>  4 files changed, 53 insertions(+), 53 deletions(-)
>>  create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
>>  create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
>>  delete mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
>>  delete mode 100644 meta-oe/recipes-core/tasks/task-x11_1.0.bb
> NACK
>
> see my previous patches (and cover of last pull request).
>
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/packagegroup
>
> after
> http://patchwork.openembedded.org/patch/35839/
> http://patchwork.openembedded.org/patch/35841/
> are applied in oe-core
>
> Cheers,
>
>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
>> new file mode 100644
>> index 0000000..7e43d55
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
>> @@ -0,0 +1,23 @@
>> +DESCRIPTION = "Task for an image with Xserver"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
>> +PR = "r9"
>> +
>> +inherit task
>> +
>> +# for backwards compatibility
>> +RPROVIDES_${PN} += "task-xserver"
>> +
>> +XSERVER ?= "xserver-xorg \
>> +           xf86-input-evdev \
>> +           xf86-input-mouse \
>> +           xf86-video-fbdev \
>> +           xf86-input-keyboard \
>> +"
>> +
>> +
>> +RDEPENDS_${PN} = " \
>> +  ${XSERVER} \
>> +"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
>> new file mode 100644
>> index 0000000..326e09f
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION = "The X Window System -- install this task to get a client/server based display multiplexer."
>> +SECTION = "x11/server"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +PR = "r11"
>> +
>> +inherit task allarch
>> +
>> +PACKAGES += "${PN}-utils"
>> +
>> +RRECOMMENDS_${PN} = "\
>> +  ${PN}-server \
>> +  ${PN}-utils \
>> +"
>> +
>> +# xserver-common, x11-common
>> +VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
>> +
>> +# elsa or xserver-nodm-init(-systemd)
>> +VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
>> +
>> +RDEPENDS_${PN}-utils = "\
>> +  ${VIRTUAL-RUNTIME_xserver_common} \
>> +  ${VIRTUAL-RUNTIME_graphical_init_manager} \
>> +  xauth \
>> +  xhost \
>> +  xset \
>> +  xrandr \
>> +"
>> +
>> diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
>> deleted file mode 100644
>> index 7e43d55..0000000
>> --- a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -DESCRIPTION = "Task for an image with Xserver"
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
>> -PR = "r9"
>> -
>> -inherit task
>> -
>> -# for backwards compatibility
>> -RPROVIDES_${PN} += "task-xserver"
>> -
>> -XSERVER ?= "xserver-xorg \
>> -           xf86-input-evdev \
>> -           xf86-input-mouse \
>> -           xf86-video-fbdev \
>> -           xf86-input-keyboard \
>> -"
>> -
>> -
>> -RDEPENDS_${PN} = " \
>> -  ${XSERVER} \
>> -"
>> -
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
>> deleted file mode 100644
>> index 326e09f..0000000
>> --- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -DESCRIPTION = "The X Window System -- install this task to get a client/server based display multiplexer."
>> -SECTION = "x11/server"
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> -PR = "r11"
>> -
>> -inherit task allarch
>> -
>> -PACKAGES += "${PN}-utils"
>> -
>> -RRECOMMENDS_${PN} = "\
>> -  ${PN}-server \
>> -  ${PN}-utils \
>> -"
>> -
>> -# xserver-common, x11-common
>> -VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
>> -
>> -# elsa or xserver-nodm-init(-systemd)
>> -VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
>> -
>> -RDEPENDS_${PN}-utils = "\
>> -  ${VIRTUAL-RUNTIME_xserver_common} \
>> -  ${VIRTUAL-RUNTIME_graphical_init_manager} \
>> -  xauth \
>> -  xhost \
>> -  xset \
>> -  xrandr \
>> -"
>> -
>> -- 
>> 1.7.8.6
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


