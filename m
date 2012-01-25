Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1Rpyr5-0008Pz-5b
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 10:09:23 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Wed, 25 Jan 2012
	09:57:35 +0100
X-TM-IMSS-Message-ID: <1708f1cc0009922b@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 1708f1cc0009922b ;
	Wed, 25 Jan 2012 09:57:29 +0100
Message-ID: <4F1FC3FF.7020502@nedap.com>
Date: Wed, 25 Jan 2012 09:57:35 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4F1FB448.3040404@nedap.com> <20120125080745.GA3843@jama.jama.net>
In-Reply-To: <20120125080745.GA3843@jama.jama.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: build error
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
X-List-Received-Date: Wed, 25 Jan 2012 09:09:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/25/2012 09:07 AM, Martin Jansa wrote:
> On Wed, Jan 25, 2012 at 08:50:32AM +0100, Jaap de Jong wrote:
>> Hi,
>> not sure if this is the right list...
>> Running into a failure:
>>
>>      MACHINE=at91sam9263ek bitbake console-image-base
>>      //
>>      //
>>      | + rm -f
>>      /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe
>>      /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-all
>>      /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-armv5te
>>      /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-at91sam9263ek
>>
>>      | + true
>>      | + '[' -eq 0 ']'
>>      |
>>      /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/temp/run.do_rootfs.20251:
>>      line 214: [: -eq: unary operator expected
>>      | + set +x
>>      | log_check: Using
>>      /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/temp/log.do_rootfs.20251
>>      as logfile
>>
>>      213    if true; then
>>      214        if [ $runtime_script_required -eq 0 ]; then
>>      215            # All packages were successfully configured.
>>      216            # update-rc.d, base-passwd are no further use, remove
>>      them now
>>
>>
>> No error when:
>>
>>      MACHINE=at91sam9263ek bitbake console-image-base
> try this
> http://patchwork.openembedded.org/patch/20111/
That helped!
A bit... until the next error

    | Configuring task-base-extended.
    | Configuring run-postinsts.
    | Collected errors:
    |  * extract_archive: Cannot create symlink from ./var/run to
    'volatile/run': File exists.
    | + '[' '!' -z '' ']'
    | + package_tryout_install_multilib_ipk
    | + multilib_tryout_dirs=

Which is true:

    $ ll
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/
    total 40
    drwxr-xr-x 2 jdj jdj 4096 2012-01-24 13:45 backups
    drwxr-xr-x 2 jdj jdj 4096 2012-01-24 13:45 cache
    drwxr-xr-x 6 jdj jdj 4096 2012-01-25 09:27 lib
    drwxr-sr-x 2 jdj jdj 4096 2012-01-24 13:45 local
    drwxr-xr-x 3 jdj jdj 4096 2012-01-25 09:26 lock
    drwxr-xr-x 2 jdj jdj 4096 2012-01-24 13:45 log
    drwxr-xr-x 2 jdj jdj 4096 2012-01-24 13:45 run
    drwxr-xr-x 3 jdj jdj 4096 2012-01-25 09:26 spool
    drwxr-xr-x 2 jdj jdj 4096 2012-01-24 13:45 tmp
    drwxr-xr-x 7 jdj jdj 4096 2012-01-24 13:39 volatile

    $ ll
    /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-linux-gnueabi/core-image-base-1.0-r0/rootfs/var/volatile/
    total 20
    drwxr-xr-x 2 jdj jdj 4096 2012-01-24 13:45 cache
    drwxrwxrwt 3 jdj jdj 4096 2012-01-25 09:26 lock
    drwxr-xr-x 2 jdj jdj 4096 2012-01-24 13:45 log
    drwxr-xr-x 3 jdj jdj 4096 2012-01-25 09:26 run
    drwxrwxrwt 2 jdj jdj 4096 2012-01-24 13:45 tmp

Any ideas?
Jaap

> Cheers,
>
>> Thanks!
>> Jaap
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

