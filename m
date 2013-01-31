Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U11Y0-0001j1-69 for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 22:20:06 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U11J4-0005GI-Go for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 22:04:26 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 22:04:26 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 22:04:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 31 Jan 2013 22:03:59 +0100
Message-ID: <keem7q$lsm$1@ger.gmane.org>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
	<20130131165633.GF2102@jama.dyndns-home.com>
	<21F2D8CF-6E10-41F8-9A55-99949E2CEB79@dominion.thruhere.net>
	<20130131180051.GG2102@jama.dyndns-home.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <20130131180051.GG2102@jama.dyndns-home.com>
X-Enigmail-Version: 1.5
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
X-List-Received-Date: Thu, 31 Jan 2013 21:20:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-01-13 19:00, Martin Jansa schreef:
> On Thu, Jan 31, 2013 at 06:07:37PM +0100, Koen Kooi wrote:
>> 
>> Op 31 jan. 2013, om 17:56 heeft Martin Jansa <martin.jansa@gmail.com>
>> het volgende geschreven:
>> 
>>> On Wed, Jan 30, 2013 at 09:02:35AM +0100, Koen Kooi wrote:
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
>>>> .../nodejs/nodejs/0002-Enable-NEON.patch           | 27 ++++++++++ 
>>>> ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++ 
>>>> meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 61
>>>> ++++++++++++++++++++++ 3 files changed, 117 insertions(+) create
>>>> mode 100644
>>>> meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch 
>>>> create mode 100644
>>>> meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
>>>>
>>>> 
create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>>> 
>>> FWIW: 0.6.21 fails exactly the same as 0.6.20 but I've merged it as
>>> it's not worse.
>>> 
>>> I've tried 0.8.18 today and it fails: ERROR: Function failed:
>>> do_configure (see
>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_configure.30923
>>> for further information) ERROR: Logfile of failure stored in:
>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_configure.30923
>>>
>>> 
Log data follows:
>>> | DEBUG: Executing python function sysroot_cleansstate | DEBUG:
>>> Python function sysroot_cleansstate finished | DEBUG: Executing shell
>>> function do_configure |
>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>> 2:
>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>> Cannot fork |
>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>> 2:
>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc:
>>> Cannot fork | Traceback (most recent call last): |   File
>>> "./configure", line 473, in <module> |     configure_node(output) |
>>> File "./configure", line 371, in configure_node |     cc_version,
>>> is_clang = compiler_version() |   File "./configure", line 331, in
>>> compiler_version |     version = tuple(map(int,
>>> proc.communicate()[0].split('.'))) | ValueError: invalid literal for
>>> int() with base 10: '' | ERROR: Function failed: do_configure (see
>>> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_configure.30923
>>> for further information) NOTE: recipe nodejs-native-0.8.18-r0: task
>>> do_configure: Failed ERROR: Task 22884
>>> (virtual:native:/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb,
>>> do_configure) failed with exit code '1'
>>> 
>>> Any idea?
>> 
>> That's likely the gcc wrapper script I added maybe it doesn't like your
>> native gcc. FWIW I only tested it on fedora 18
> 
> Here it's on Ubuntu 12.04
> 
> but wrapper is in $WORKDIR and PATH contains WORKDIR, so I guess that 
> those wrappers are fork bombing poor jenkins.. (at least here because 
> CC/CXX variables are just gcc/g++)

I've hear people report this issue before, but I've never managed to
reproduce or debug it :(

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRCtw/MkyGM64RGpERAqXDAJ9m7dGMDMVuFg/XdYw+QGN3uzpaWQCePtbG
OoLxGkT94IuoEehKUqJG7Qs=
=ax5F
-----END PGP SIGNATURE-----



