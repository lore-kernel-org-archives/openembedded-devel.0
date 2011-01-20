Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PfzVK-00026e-Ll
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 19:45:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 01A96314D0C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 19:44:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sf6jcPJ-4coO
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 19:44:19 +0100 (CET)
Received: from [172.22.22.61] (ip-178-200-120-208.unitymediagroup.de
	[178.200.120.208])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 36950314D0BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 19:44:19 +0100 (CET)
Message-ID: <4D388284.6020105@opendreambox.org>
Date: Thu, 20 Jan 2011 19:44:20 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295542406-7879-1-git-send-email-obi@opendreambox.org>	<1295542406-7879-3-git-send-email-obi@opendreambox.org>
	<4D38728F.1070002@mwester.net>
In-Reply-To: <4D38728F.1070002@mwester.net>
Subject: Re: [PATCH 3/3] madwifi-ng-r3314: Apply patches from OpenWrt 10.03
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
X-List-Received-Date: Thu, 20 Jan 2011 18:45:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/20/2011 06:36 PM, Mike Westerhof wrote:
> On 1/20/2011 10:53 AM, Andreas Oberritter wrote:
>> [This revision is not pinned in OE, but used by opendreambox.]
> 
> What machines/distros has this sequence of three patches been tested with?

Patch 1 removes a dead recipe.
Patch 2 has been tested on mipsel 32-bit with rev 3314.
Patch 3 is a dead recipe I'm reviving and has been tested on mipsel 32-bit.

Machine dm8000, distro opendreambox.

> Does it build for both LE and BE?

I haven't tested Patch 3 on BE, but since there aren't any known users
in OE, I suppose this question is rather academic. OpenWrt uses these
patches on multiple architectures with multiple kernel versions.

The other patches don't change any code, so there's no reason it should
depend on any byte order.

In case you're wondering about the removal of
30-define-ioreadwrite32be-for-little-endian-too.patch, you probably
missed these lines of the recipe which apply lots of patches from
OpenWrt's subversion repository:

>> +SRC_URI += " \
>> +        svn://svn.openwrt.org/openwrt/trunk/package/madwifi;module=patches \
>> +        http://mirror2.openwrt.org/sources/ath_hal-${HAL_VERSION}.tgz;name=hal \
>> +        file://fix-target-mips32.patch \
>> +        file://remove-wprobe.patch;apply=no \
>> +        "
>>  SRC_URI[md5sum] = "2c7352cbbdac995de8c3bce5b80db5f2"
>>  SRC_URI[sha256sum] = "0599c75b95ba63bdc554cb8124192e62c75fbeb71b9e8a5a7bc351c8e0666758"
>> +SRC_URI[hal.md5sum] = "4ab7ae8bdb96c0be388c98bf8f92d5ca"
>> +SRC_URI[hal.sha256sum] = "ced93d25aea7ee43807147a0269e69a072e718d59e7dab904bbe48b900409483"
>> +
>> +addtask postpatch after do_patch before do_configure
>> +
>> +do_postpatch() {
>> +        rm -rf hal
>> +        cp -a ${WORKDIR}/ath_hal-${HAL_VERSION} hal

Btw., now that we're talking about patches, somehow I lost a commit,
which added this line to restore the old behaviour of starting up in STA
mode:

            rm -f ${WORKDIR}/patches/104-autocreate_none.patch

I'll fix this before pushing it.

>> +        rm -f ${WORKDIR}/patches/446-single_module.patch
>> +        for i in ${WORKDIR}/patches/*.patch; do
>> +                oenote "Applying openwrt patch '$i'"
>> +                patch -p1 -i $i
>> +        done
>> +        patch -p1 -i ${WORKDIR}/remove-wprobe.patch
>> +}

Regards,
Andreas


