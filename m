Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1L97CJ-00023Y-1g
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Dec 2008 01:08:31 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id mB6NuZhB024212
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 6 Dec 2008 16:00:09 -0800 (PST)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 7 Dec 2008 01:02:18 +0100
Received: from palantir ([172.24.48.246]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 7 Dec 2008 01:02:17 +0100
Message-ID: <002f01c957ff$09d4fc80$f8c4af0a@palantir>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1228551396.14826.31.camel@aeglos.sweden.atmel.com>
	<19c1b8a90812061110n29618646y1d4574d96abec697@mail.gmail.com>
Date: Sun, 7 Dec 2008 01:02:02 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3350
X-OriginalArrivalTime: 07 Dec 2008 00:02:17.0732 (UTC)
	FILETIME=[116BBC40:01C957FF]
Subject: Re: Build of qemu-native fails.
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
X-List-Received-Date: Sun, 07 Dec 2008 00:08:31 -0000
Content-Type: text/plain; format=flowed; charset="utf-8"; reply-type=original
Content-Transfer-Encoding: 7bit




----- Original Message ----- 
From: "Khem Raj" <raj.khem@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Sent: Saturday, December 06, 2008 8:10 PM
Subject: Re: [oe] Build of qemu-native fails.


> On Sat, Dec 6, 2008 at 12:16 AM, Ulf Samuelsson <ulf@atmel.com> wrote:
>> Building the Angstrom for at91sam9263ek:
>>
>> The build of qemu-native fails!
>>
>> The normal build uses qemu-native-svn which fails, then I tried
>> qemu-native-0.9.1 with the same result.
>>
>> In 
>> ./work/armv5te-angstrom-linux-gnueabi/linux-libc-headers-2.6.23-r3/linux-2.6.23/include/linux/usbdevice_fs.h
>> it looks like:
>> struct usbdevfs_ctrltransfer {
>>        __u8 bRequestType;
>>        __u8 bRequest;
>>        __u16 wValue;
>>        __u16 wIndex;
>>        __u16 wLength;
>>        __u32 timeout;  /* in milliseconds */
>>        void __user *data;
>> };
>>
>> It does not like the __user in "void __user *data"
>>
>> In 
>> ./work/armv5te-angstrom-linux-gnueabi/linux-libc-headers-2.6.23-r3/image/usr/include/linux/usbdevice_fs.h
>> it looks the same as in recent kernels:
>>
>> /* usbdevfs ioctl codes */
>>
>> struct usbdevfs_ctrltransfer {
>>        __u8 bRequestType;
>>        __u8 bRequest;
>>        __u16 wValue;
>>        __u16 wIndex;
>>        __u16 wLength;
>>        __u32 timeout;  /* in milliseconds */
>>        void *data;
>> };
>>
>>
>> If I extract linux-2.6.23 and do
>> $ make ARCH=arm INSTALL_HDR_PATH=../headers headers_install
>> I don't get the "__user" inside this header file,
>>
>> Anyone knows why?
>
> Thats the difference between raw headers and the saniized headers. By
> doing  make ARCH=arm INSTALL_HDR_PATH=../headers headers_install you
> get sanitized headers.
> problem seems to be in  /usr/include/linux/usbdevice_fs.h thats on
> your build system. check that file and it might not be insalled
> correctly. What are you using for a build machine.
>
> Thx
>
> -Khem
>

Thanks.  I am using OpenSuSE 10.2

I got around the problem by doing a

#define __user

in the file including the usbdevice_:fs.h
but it is probably time to upgrade the machine anyway.

Best Regards
Ulf Samuelsson 



