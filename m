Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kbaker@gmail.com>) id 1U3juR-00010O-20
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 10:06:15 +0100
Received: by mail-ie0-f173.google.com with SMTP id 9so4765137iec.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 00:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=+6h9PLY45SGuMpd2YtoGqveE7qK8oGKKG4CtXUMNlW4=;
	b=nXnRPZUcyEA3i2nn6akBhscjZEiGQ9eFU0LvPrPmjW0N9d2/d1Yvdy6Hl5iTiRQ466
	IEZYZQ+iZX6MQnGUU9Lh06CH7j8l1U9rsELag/YOtmwJe/QDtMvqQJfrMgmffQ+KqKhd
	Y7KN6FMYPrIkJugNUvGrYx9S3j+RK7e3+SXlaPPWHbUdSdbd/SKAPSXhh8gklBdj+mNm
	dSzipP+72HZtYzdMoX7duDfnmnK5A7SN2OJSZnmho+eJTrZR0T0BRvWn2fEaZ/p90dOb
	a4dxTi/aw2olVMZtt3IaB9DnFNB4nlSOh/1bRKtjR+bwKNcjSn4hhJ0LApAwVKL3g+dO
	917g==
X-Received: by 10.50.169.103 with SMTP id ad7mr767416igc.105.1360313420890;
	Fri, 08 Feb 2013 00:50:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.136.35 with HTTP; Fri, 8 Feb 2013 00:50:00 -0800 (PST)
In-Reply-To: <keem7q$lsm$1@ger.gmane.org>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
	<20130131165633.GF2102@jama.dyndns-home.com>
	<21F2D8CF-6E10-41F8-9A55-99949E2CEB79@dominion.thruhere.net>
	<20130131180051.GG2102@jama.dyndns-home.com>
	<keem7q$lsm$1@ger.gmane.org>
From: Kevin Baker <kbaker@gmail.com>
Date: Fri, 8 Feb 2013 02:50:00 -0600
Message-ID: <CA+NaiT97Ot7sry5Bw_f1Wi46eS1OB7TY8VgtuQ1J8zD9VYw9Cw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Fri, 08 Feb 2013 09:06:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 31, 2013 at 3:03 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 31-01-13 19:00, Martin Jansa schreef:
>> On Thu, Jan 31, 2013 at 06:07:37PM +0100, Koen Kooi wrote:
>>>
>>> Op 31 jan. 2013, om 17:56 heeft Martin Jansa <martin.jansa@gmail.com>
>>> het volgende geschreven:
>>>
>>>> On Wed, Jan 30, 2013 at 09:02:35AM +0100, Koen Kooi wrote:
>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> ---
>>>>> .../nodejs/nodejs/0002-Enable-NEON.patch           | 27 ++++++++++
>>>>> ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++
>>>>> meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 61
>>>>> ++++++++++++++++++++++ 3 files changed, 117 insertions(+) create
>>>>> mode 100644
>>>>> meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
>>>>> create mode 100644
>>>>> meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
>>>>>
>>>>>
> create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>>>>
>>>> FWIW: 0.6.21 fails exactly the same as 0.6.20 but I've merged it as
>>>> it's not worse.
>>>>
>>>> I've tried 0.8.18 today and it fails: ERROR: Function failed:
>>>> do_configure (see
>>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_configure.30923
>>>> for further information) ERROR: Logfile of failure stored in:
>>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_configure.30923
>>>>
>>>>
> Log data follows:
>>>> | DEBUG: Executing python function sysroot_cleansstate | DEBUG:
>>>> Python function sysroot_cleansstate finished | DEBUG: Executing shell
>>>> function do_configure |
>>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>>> 2:
>>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>>> Cannot fork |
>>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>>> 2:
>>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>>> Cannot fork | Traceback (most recent call last): |   File
>>>> "./configure", line 473, in <module> |     configure_node(output) |
>>>> File "./configure", line 371, in configure_node |     cc_version,
>>>> is_clang = compiler_version() |   File "./configure", line 331, in
>>>> compiler_version |     version = tuple(map(int,
>>>> proc.communicate()[0].split('.'))) | ValueError: invalid literal for
>>>> int() with base 10: '' | ERROR: Function failed: do_configure (see
>>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_configure.30923
>>>> for further information) NOTE: recipe nodejs-native-0.8.18-r0: task
>>>> do_configure: Failed ERROR: Task 22884
>>>> (virtual:native:/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb,
>>>> do_configure) failed with exit code '1'
>>>>
>>>> Any idea?
>>>
>>> That's likely the gcc wrapper script I added maybe it doesn't like your
>>> native gcc. FWIW I only tested it on fedora 18
>>
>> Here it's on Ubuntu 12.04
>>
>> but wrapper is in $WORKDIR and PATH contains WORKDIR, so I guess that
>> those wrappers are fork bombing poor jenkins.. (at least here because
>> CC/CXX variables are just gcc/g++)
>
> I've hear people report this issue before, but I've never managed to
> reproduce or debug it :(
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFRCtw/MkyGM64RGpERAqXDAJ9m7dGMDMVuFg/XdYw+QGN3uzpaWQCePtbG
> OoLxGkT94IuoEehKUqJG7Qs=
> =ax5F
> -----END PGP SIGNATURE-----
>
Hello,

Unfortunately I didn't see this patchset before doing some work on the
nodejs recipe...

I was trying to get an environment setup for building native packages
with nodejs's included node-gyp and a -native package. There are some
additional steps to do with node-gyp to make it figure out how to
build native recipes. I did get it setup and building finally...
node-gyp needs a bit of work though to work well in a cross-compile
environment, as there is some host-environment contamination (using
$HOME while running node-gyp), and some other issues with running in a
sysroot. I also couldn't get gcc through gyp to find the
<sysroot>/usr/include/node/*.h files when compiling, so opted instead
to manually symlink them to <sysroot>/usr/include/*.h which worked for
now.

some more discussion:
https://groups.google.com/d/topic/nodejs/88mcwGCnCro/discussion

I have posted what I have been working on to
https://github.com/ventureresearch/meta-venture-external/tree/master/recipes-devtools/nodejs
. Note my recipes are somewhat different and do not follow from any
recent patches, so just for reference. But the resulting binary does
run and work on armv7a; additionally the natively built sqlite3 binary
runs (but I know I'm installing it to the wrong location on the target
FS, so don't use it.)

BTW, You can remove the patch
file://0003-Resolve-bad-rpath-issue-when-linking.patch as using the
CXX with LD as Martin has posted fixes the initial issue. Also, with
this patch enabled native modules fail to link at runtime (see
https://github.com/joyent/node/issues/3623)

Thanks!
Kevin


