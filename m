Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E24860088
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 21:13:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7HLDexW013448
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Aug 2015 14:13:40 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 14:13:40 -0700
Message-ID: <55D24E83.7080508@windriver.com>
Date: Mon, 17 Aug 2015 17:13:39 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Kang Kai
	<Kai.Kang@windriver.com>, Joe MacDonald <joe_macdonald@mentor.com>
References: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>	<55D179C1.5010402@windriver.com>
	<20150817150349.GD8518@mentor.com>
In-Reply-To: <20150817150349.GD8518@mentor.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 21:13:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-08-17 11:03 AM, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.17 (Mon 14:05) Kang Kai wrote:
>
>> On 2015年08月12日 10:05, kai.kang@windriver.com wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Upgrade inetutils from 1.9.2 to 1.9.4.
>>
>> Ping?
>
> Since I'm seeing a lot of these lately I thought I might explain my
> current workflow.

Thanks for the background.

> For build or security issues, I'm trying to stay on
> top of them and be as responsive as possible,

okay.

> but for general recipe
> updates, particularly ones like this where the log shows essentially
> nothing critical has changed, I'm holding off until at least my
> autobuilders get to chew on them and reassure me we're not bringing in
> new QA (or worse) issues,

I'd hope that means a day or two and not a week, right?

> and ideally I prefer to see a pass in one of
> Martin's "state of the world" builds.

I assumed that the state-of-the-world builds would be for master
and the release branches but no:
    http://www.openembedded.org/wiki/Bitbake_World_Status_Setup

    "It's not using "master" branches,
      but "jansa/master" branches in ..."

They appear to happen every day:
    http://logs.nslu2-linux.org/buildlogs/oe/world/
And the stats are published once or twice a week, most of the time...
    http://www.openembedded.org/wiki/Bitbake_World_Status

Hmmm, would newer build systems be useful:
    "Usually I build for 3 MACHINE qemuarm, qemux86, qemux86-64.
     Each MACHINE takes about 20-24hours so sometimes there is
     bigger delay."

> I also try to give everyone on
> the list a reasonable amount of time to respond to anything as well, but
> that's not a gating factor.

What's a reasonable time? ~ 1-2 days?

Just trying ensure that our ping time is reasonable. :)

../Randy
>
> Just FYI.
>
> -J.
>
>>
>>>
>>> * add homepage
>>> * update inetutils/version.patch
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   .../inetutils/{inetutils-1.9.2 => inetutils}/fix-disable-ipv6.patch  | 0
>>>   ...tils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch | 0
>>>   .../{inetutils-1.9.2 => inetutils}/inetutils-1.8-0003-wchar.patch    | 0
>>>   .../inetutils-1.9-PATH_PROCNET_DEV.patch                             | 0
>>>   .../inetutils/{inetutils-1.9.2 => inetutils}/rexec.xinetd.inetutils  | 0
>>>   .../inetutils/{inetutils-1.9.2 => inetutils}/rlogin.xinetd.inetutils | 0
>>>   .../inetutils/{inetutils-1.9.2 => inetutils}/rsh.xinetd.inetutils    | 0
>>>   .../inetutils/{inetutils-1.9.2 => inetutils}/telnet.xinetd.inetutils | 0
>>>   .../telnetd-Fix-deadlock-on-cleanup.patch                            | 0
>>>   .../inetutils/{inetutils-1.9.2 => inetutils}/tftpd.xinetd.inetutils  | 0
>>>   .../inetutils/{inetutils-1.9.2 => inetutils}/version.patch           | 2 +-
>>>   .../inetutils/{inetutils_1.9.2.bb => inetutils_1.9.4.bb}             | 5 +++--
>>>   12 files changed, 4 insertions(+), 3 deletions(-)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/fix-disable-ipv6.patch (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/inetutils-1.8-0003-wchar.patch (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/rexec.xinetd.inetutils (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/rlogin.xinetd.inetutils (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/rsh.xinetd.inetutils (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/telnet.xinetd.inetutils (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/telnetd-Fix-deadlock-on-cleanup.patch (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/tftpd.xinetd.inetutils (100%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/version.patch (93%)
>>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9.2.bb => inetutils_1.9.4.bb} (97%)
>>>
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/fix-disable-ipv6.patch
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0003-wchar.patch
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
>>> similarity index 100%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
>>> similarity index 93%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
>>> index 1caa2d3..532a0e5 100644
>>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch
>>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
>>> @@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
>>>   -AC_INIT([GNU inetutils],
>>>   - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
>>> -+AC_INIT([GNU inetutils],[1.9.2],
>>> ++AC_INIT([GNU inetutils],[1.9.4],
>>>     [bug-inetutils@gnu.org])
>>>    AC_CONFIG_SRCDIR([src/inetd.c])
>>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
>>> similarity index 97%
>>> rename from meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
>>> rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
>>> index 6209272..cdcba83 100644
>>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
>>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
>>> @@ -2,6 +2,7 @@ DESCRIPTION = "The GNU inetutils are a collection of common \
>>>   networking utilities and servers including ftp, ftpd, rcp, \
>>>   rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
>>>   talkd, telnet, telnetd, tftp, tftpd, and uucpd."
>>> +HOMEPAGE = "http://www.gnu.org/software/inetutils"
>>>   SECTION = "net"
>>>   DEPENDS = "ncurses netbase readline"
>>>   LICENSE = "GPLv3"
>>> @@ -21,8 +22,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>>>              file://telnetd-Fix-deadlock-on-cleanup.patch \
>>>   "
>>> -SRC_URI[md5sum] = "aa1a9a132259db83e66c1f3265065ba2"
>>> -SRC_URI[sha256sum] = "0423ea40a160cd4630f817e247df5c08ecc625378d2bb56a0509117a36a89913"
>>> +SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
>>> +SRC_URI[sha256sum] = "be8f75eff936b8e41b112462db51adf689715658a1b09e0d6b05d11ec92cc616"
>>>   inherit autotools gettext update-alternatives texinfo
>>
>>
>> --
>> Regards,
>> Neil | Kai Kang
>>
>>
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

