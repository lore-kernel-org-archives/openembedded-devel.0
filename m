Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9Hp2-00024A-Ds
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:47:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 875F55BC388
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2012 17:34:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 8sOIlHUqcf2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2012 17:34:58 +0200 (CEST)
Received: from [IPv6:2a02:2308::1ab:f800:2] (unknown
	[IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id 150DC5BC332
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2012 17:34:58 +0200 (CEST)
Message-ID: <50477113.3070205@outrightsolutions.nl>
Date: Wed, 05 Sep 2012 17:34:43 +0200
From: Sander van Grieken <sander@outrightsolutions.nl>
Organization: Outright Solutions
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
	<5047582A.4060601@communistcode.co.uk>
In-Reply-To: <5047582A.4060601@communistcode.co.uk>
Subject: Re: [meta-oe][PATCH 1/2] libimobiledevice: add recipe for Apple products protocol support
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
X-List-Received-Date: Wed, 05 Sep 2012 15:47:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/05/2012 03:48 PM, Jack Mitchell wrote:
> On 05/09/12 14:35, Sander van Grieken wrote:
>> Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
>> ---
>>   .../libimobiledevice/libimobiledevice_1.1.4.bb     |   22
>> ++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644
>> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
>>
>> diff --git
>> a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
>> b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
>>
>> new file mode 100644
>> index 0000000..a4ebeab
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
>> @@ -0,0 +1,22 @@
>> +LICENSE = "GPLv2 & LGPLv2.1"
>> +LIC_FILES_CHKSUM = "\
>> +    file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
>> +    file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
>> +    "
>> +
>> +HOMEPAGE ="http://www.libimobiledevice.org/"
>> +
>> +DEPENDS = "libplist usbmuxd libtasn1 gnutls libgcrypt"
>> +
>> +PR = "r0"
>> +
>> +SRC_URI = " \
>> +   
>> http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar.bz2
>> \
>> +    "
>> +
>> +SRC_URI[md5sum] = "3f28cbc6a2e30d34685049c0abde5183"
>> +SRC_URI[sha256sum] =
>> "67499cfaa6172f566ee6b0783605acffe484fb7ddc3b09881ab7ac58667ee5b8"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF = " --without-cython "
>
> Should these not also go in the already present
> meta-oe/recipes-extended/libimobiledevicefolder?
>
I have no idea, I mainly followed the location of usbmuxd..

Advice?



