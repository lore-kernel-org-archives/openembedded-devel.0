Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PrE0S-0002f8-Fl
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 19:27:40 +0100
Received: by iyj8 with SMTP id 8so5151139iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3E72RMEJ1K6LjYp1vzNOKT111zc0GD7/PHlhL5tXx1o=;
	b=obAnVwNQz3C1yiPGfgXT/JR6m+1IQENUZHiioEGkFhaI6MCAzTpGjkV63Mirljfw0R
	bEY4K1QGozTfyasbVax0Fp1KOxc5NcZxGoCNVgyxuDRbdEFrDPvpeIcBccTQUL1kFIXR
	iILKrgkU5szjiyqrF9wM1njLE8r6c0zf0sj6Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=c0vhJpwZ6My+aV1osIoP6bufofyQrFEyJvZZ9ZjPkceDinagghvPVBwiFYyR/WoWvw
	iPWZzhi6Tl06peRLG/1/RkReqZRLUSkOWIserHgIBLIER2hoL2K3ZBXW3xejoMwg4Fnf
	FvGorXQ+Ijb7VpJH9vu07uzg7bSX/ztiFpZqQ=
MIME-Version: 1.0
Received: by 10.42.7.129 with SMTP id e1mr739764ice.500.1298226383377; Sun, 20
	Feb 2011 10:26:23 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sun, 20 Feb 2011 10:26:23 -0800 (PST)
In-Reply-To: <4D612958.70402@mentor.com>
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5ED835.7040800@eukrea.com>
	<AANLkTimfZ4vp-8RPHxTWPfo5m_0zfTwM611Q+d+jWuK8@mail.gmail.com>
	<201102191252.05388.schnitzeltony@gmx.de>
	<AANLkTinfrqy3eSJajojfDiAJcPcMM9MbTZo94YVGz+ba@mail.gmail.com>
	<4D5FF708.90903@mentor.com>
	<AANLkTim-b=vO2vD5sgTo5bKduF=OYqAczS7f3YYdgPUy@mail.gmail.com>
	<4D612958.70402@mentor.com>
Date: Sun, 20 Feb 2011 19:26:23 +0100
Message-ID: <AANLkTi=TqJ-+OdXWVNrvmHUxNg2CSEhbzSOEM-GtZ7QK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sun, 20 Feb 2011 18:27:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/20 Tom Rini <tom_rini@mentor.com>:
> On 02/20/2011 05:42 AM, Frans Meulenbroeks wrote:
>>
>> 2011/2/19 Tom Rini<tom_rini@mentor.com>:
>>>
>>> On 02/19/2011 06:26 AM, Otavio Salvador wrote:
>>>>
>>>> On Sat, Feb 19, 2011 at 11:52, Andreas Mueller<schnitzeltony@gmx.de>
>>>> =A0wrote:
>>>>>
>>>>> On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
>>>>>>
>>>>>> I am fine with the patch, but perhaps a better solution would be to
>>>>>> introduce a var to decide whether it is a fatal or not.
>>>>>> That way people distro's that use libtool 2.4 can decide to make it =
a
>>>>>> fatal. (or individual users in their local.conf)
>>>>>>
>>>>>> Frans
>>>>>
>>>>> How comes that I sometimes feel handled as spammer ;-) ?
>>>>>
>>>>> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
>>>>> February/029534.html
>>>>>
>>>>> anyway - treating RPATH errors as fatal has lead to many QA fixes and
>>>>> further
>>>>> will follow...
>>>>>
>>>>> my opinion now: keep RPATH errors fatal as developer's =A0whip :-)
>>>>
>>>> I agree about keeping it configurable.
>>>>
>>>> Besides I think that we ought to keep it fatal until quite near of
>>>> release since we'll be "forced" to fix most of many of them.
>>>
>>> I just want to state, again, that most of these just go away with libto=
ol
>>> 2.4. =A0Now, if people are looking for something to work on that won't =
just
>>> go
>>> away with an update to libtool 2.4:
>>> - iscsi-target needs some love again for various kernel versions as tha=
t
>>> looks to be killing calamari and neek for nas-server-image
>>
>> Peeked at iscsi-target for calamari. Some inet fields have changed
>> name in 2.6.32 or so, and apparently this is not handled fully.
>> Instead of trying to fix it, I moved the calamari recipe to 2.6.34
>> (which I'm already using for half a year or so, but apparently never
>> pushed).
>
> Thanks.
>
>> I'll also see if I can update the neek version (probably also by
>> moving the kernel version forward.
>> Tomorrow I'll discuss this with Walter who afaik is the only other neek
>> user.
>
> Note that I also see:
> - uclibc total failure, but I assume unsupported and I'll drop
> - minimal fails everywhere else with:
> ERROR: QA Issue with staging: libsupc++.la failed sanity test (workdir) i=
n
> path
> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image=
/DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/li=
b
> ERROR: QA Issue with staging: libstdc++.la failed sanity test (workdir) i=
n
> path
> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image=
/DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/li=
b
> ERROR: QA staging was broken by the package built above
>

Peeked some more itnto this.

If I peek in ./nios2-linux/usr/lib/libsupc++.la I see:

# libsupc++.la - a libtool library file
# Generated by ltmain.sh - GNU libtool 1.4a-GCC3.0 (1.641.2.256
2001/05/28 20:09:07 with GCC-local changes)
#
# Please DO NOT delete this file!
# It is necessary for linking the library.

# The name that we can dlopen(3).
dlname=3D''

# Names of this library.
library_names=3D''

# The name of the static archive.
old_library=3D'libsupc++.a'

# Libraries that this one depends upon.
dependency_libs=3D'
-L/home/frans/oe/tmp_minimal/work/nios2-linux/gcc-cross-4.1.2-r27.2/gcc-4.1=
.2/build.i686-linux.nios2-linux/nios2-linux/libstdc++-v3/src
-L/home/frans/oe/tmp_minimal/work/nios2-linux/gcc-cross-4.1.2-r27.2/gcc-4.1=
.2/build.i686-linux.nios2-linux/nios2-linux/libstdc++-v3/src/.libs
-lm -L/home/frans/oe/tmp_minimal/work/nios2-linux/gcc-cross-4.1.2-r27.2/gcc=
-4.1.2/build.i686-linux.nios2-linux/./gcc
-L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/nios2-linux/bin
-L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/nios2-linux/lib
-L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/lib/gcc/nios2-li=
nux/4.1.2
-L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/nios2/lib/gcc/nios2-li=
nux/4.1.2/../../../../nios2-linux/lib
-L/home/frans/oe/tmp_minimal/sysroots/nios2-linux/lib
-L/home/frans/oe/tmp_minimal/sysroots/nios2-linux/usr/lib -lgcc_s -lc
-lgcc_s

...

For other platforms I see
# libsupc++.la - a libtool library file
# Generated by libtool (GNU libtool 1.3134 2009-11-29) 2.2.7a
#
# Please DO NOT delete this file!
# It is necessary for linking the library.

# The name that we can dlopen(3).
dlname=3D''

# Names of this library.
library_names=3D''

# The name of the static archive.
old_library=3D'libsupc++.a'

# Linker flags that can not go in dependency_libs.
inherited_linker_flags=3D''

# Libraries that this one depends upon.
dependency_libs=3D''
...

Note the different versions of libtool and the different dependency libs
I guess the libsupc++ comes from gcc and nios2 has a very old gcc
(4.1.2), but there is no newer version (nios2 support is not
mainlined).
Anyone a suggestion?

Frans.


