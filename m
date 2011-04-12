Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1Q9RjF-0007fI-4L
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 02:45:13 +0200
Received: from homiemail-a17.g.dreamhost.com (mailbigip.dreamhost.com
	[208.97.132.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id AF129178D5C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 17:43:00 -0700 (PDT)
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 5B04B7A8073
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 17:42:58 -0700 (PDT)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=nWQAkxw/dlVZ67z3WRz+/wKpFJ7h8/MpPkNiE2PLsqaQmN+wQPMvBX37gqzXy
	JmSGxyPK8a2btawqHE2/YW12OeinGUBw84O1xHsoHbUzfIdCZSZtXENF4lRLdnWZ
	fZHpWhnpOBei+xLHiAubie/fJj8R9gFpGTPRDRgxcrHa4U=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=GnodR
	XwiJ+1U7FGO56JOHWvwgqM=; b=MSEHPyXJUekR3W+ltB773fh8gukLIMCRI4v1c
	5ICNzWEWQslSyriUpX3FYAg86jTH8gNJH0Uu2WG9FP6Mfsikvrd9bGLvwxrsK/iQ
	pfqK5L+XmL88MawGJslOPeqk5M18cDCoubQfdJbw50BYCJEyaitepB2eeG0x7IaD
	uPF/4I=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 2F3C17A8064
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 17:42:58 -0700 (PDT)
Message-ID: <4DA3A017.1030004@gumstix.com>
Date: Mon, 11 Apr 2011 17:43:03 -0700
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D9F52B0.9030808@gumstix.com> <4D9F7C9E.9000202@gumstix.com>
In-Reply-To: <4D9F7C9E.9000202@gumstix.com>
Subject: Re: firefox fails at xpidl: missing glib
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
X-List-Received-Date: Tue, 12 Apr 2011 00:45:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11-04-08 02:22 PM, Neil MacMunn wrote:
> On 11-04-08 11:23 AM, Neil MacMunn wrote:
>> I'm trying to bitbake firefox with this configuration.
>>
>>> Build Configuration:
>>> BB_VERSION = "1.12.0"
>>> METADATA_BRANCH = "unstable"
>>> METADATA_REVISION = "219f1e9"
>>> TARGET_ARCH = "arm"
>>> TARGET_OS = "linux-gnueabi"
>>> MACHINE = "overo"
>>> DISTRO = "angstrom"
>>> DISTRO_VERSION = "v20110408"
>>> TARGET_FPU = "hard"
>>
>> But it fails in the directory
>> ...work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/xpcom/typelib/xpidl
>>
>>
>>
>>> gcc -o host_xpidl.o -c
>>> -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include
>>>
>>> -O2 -g -DXP_UNIX -O3 -DMDCPUCFG=\"md/_linux.cfg\" -I. -I.
>>> -I../../../dist/include -I../../../dist/include/nsprpub
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> xpidl.c
>>> xpidl_idl.c
>>> gcc -o host_xpidl_idl.o -c
>>> -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include
>>>
>>> -O2 -g -DXP_UNIX -O3 -DMDCPUCFG=\"md/_linux.cfg\" -I. -I.
>>> -I../../../dist/include -I../../../dist/include/nsprpub
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> xpidl_idl.c
>>> xpidl_util.c
>>> gcc -o host_xpidl_util.o -c
>>> -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include
>>>
>>> -O2 -g -DXP_UNIX -O3 -DMDCPUCFG=\"md/_linux.cfg\" -I. -I.
>>> -I../../../dist/include -I../../../dist/include/nsprpub
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> xpidl_util.c
>>> xpidl_header.c
>>> gcc -o host_xpidl_header.o -c
>>> -isystem/home/neil/overo-oe/tmp-unstable/sysroots/x86_64-linux/usr/include
>>>
>>> -O2 -g -DXP_UNIX -O3 -DMDCPUCFG=\"md/_linux.cfg\" -I. -I.
>>> -I../../../dist/include -I../../../dist/include/nsprpub
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss
>>>
>>> -I/home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nspr
>>>
>>> xpidl_header.c
>>> In file included from xpidl.c:42:
>>> xpidl.h:49: fatal error: glib.h: No such file or directoryIn file
>>> included from xpidl_util.c:42:
>>> xpidl.h:49: fatal error: glib.h: No such file or directory
>>
>> cp sysroots/x86_64-linux/usr/include/glib-2.0/glib.h
>> sysroots/x86_64-linux/usr/include/ got me to another missing header
>> error. Comparing the log of my last successful build, this is missing.
>>
>>> -pthread
>>> -I/home/neil/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libIDL-2.0
>>>
>>> -I/home/neil/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
>>>
>>> -I/home/neil/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
>>>
>>>
>>
>> What would cause these includes to be omitted?
>>
>> --
>> Neil
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> I manually changed this line
>
>> HOST_LIBIDL_CFLAGS =
> to
>> HOST_LIBIDL_CFLAGS = -pthread
>> -I/home/neil/overo-oe/tmp-overo/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libIDL-2.0
>> -I/home/neil/overo-oe/tmp-overo/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
>> -I/home/neil/overo-oe/tmp-overo/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
>>
>
> in autoconf.mk and the compile succeeded. autoconf.mk.in hasn't changed
> since my previous successful build. This is a clean build so maybe
> libIDL was missing?
>


I hit this problem again on another machine and found that
>
> HOST_LIBIDL_LIBS   = -pthread -lIDL-2 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0

also needs to be added and building libIDL first doesn't change anything.







