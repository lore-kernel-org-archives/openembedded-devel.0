Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1RpxlP-00067d-Kq
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 08:59:27 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Wed, 25 Jan 2012
	08:50:33 +0100
X-TM-IMSS-Message-ID: <16cb909a00098ef9@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 16cb909a00098ef9 ;
	Wed, 25 Jan 2012 08:50:27 +0100
Message-ID: <4F1FB448.3040404@nedap.com>
Date: Wed, 25 Jan 2012 08:50:32 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: build error
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
X-List-Received-Date: Wed, 25 Jan 2012 07:59:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
not sure if this is the right list...
Running into a failure:

    MACHINE=at91sam9263ek bitbake console-image-base
    //
    //
    | + rm -f
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-all
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-armv5te
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-at91sam9263ek

    | + true
    | + '[' -eq 0 ']'
    |
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/temp/run.do_rootfs.20251:
    line 214: [: -eq: unary operator expected
    | + set +x
    | log_check: Using
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/temp/log.do_rootfs.20251
    as logfile

    213    if true; then
    214        if [ $runtime_script_required -eq 0 ]; then
    215            # All packages were successfully configured.
    216            # update-rc.d, base-passwd are no further use, remove
    them now


No error when:

    MACHINE=at91sam9263ek bitbake console-image-base

Thanks!
Jaap

