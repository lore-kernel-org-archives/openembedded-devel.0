Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 647C665CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 06:29:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K6ToE4025448
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 23:29:50 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 23:29:49 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1439345155-27884-1-git-send-email-kai.kang@windriver.com>
	<20150819195731.GB5444@deserted.net>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55D573E3.4090404@windriver.com>
Date: Thu, 20 Aug 2015 14:29:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150819195731.GB5444@deserted.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 20 Aug 2015 06:29:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年08月20日 03:57, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH] inetutils: 1.9.2 -> 1.9.4] On 15.08.12 (Wed 10:05) kai.kang@windriver.com wrote:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade inetutils from 1.9.2 to 1.9.4.
> You don't appear to be working against the meta-openembedded tree on
> this, I got a merge conflict on:
>
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
> Which, after a bit of head-scratching, suggests your tree has this patch
> merged:
>
> http://patchwork.openembedded.org/patch/96727/
>
> but, based on this discussion (also recorded in patchwork):
>
> http://comments.gmane.org/gmane.comp.handhelds.openembedded/69654
>
> we rejected it.
>
> Anyway, I've resolved it and am merging the result.  Please try to
> ensure you're working on the current up-stream tree, though.

My fault. Sorry, I'll be more careful next time.

--Kai

>
> -J.
>
>> * add homepage
>> * update inetutils/version.patch
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../inetutils/{inetutils-1.9.2 => inetutils}/fix-disable-ipv6.patch  | 0
>>   ...tils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch | 0
>>   .../{inetutils-1.9.2 => inetutils}/inetutils-1.8-0003-wchar.patch    | 0
>>   .../inetutils-1.9-PATH_PROCNET_DEV.patch                             | 0
>>   .../inetutils/{inetutils-1.9.2 => inetutils}/rexec.xinetd.inetutils  | 0
>>   .../inetutils/{inetutils-1.9.2 => inetutils}/rlogin.xinetd.inetutils | 0
>>   .../inetutils/{inetutils-1.9.2 => inetutils}/rsh.xinetd.inetutils    | 0
>>   .../inetutils/{inetutils-1.9.2 => inetutils}/telnet.xinetd.inetutils | 0
>>   .../telnetd-Fix-deadlock-on-cleanup.patch                            | 0
>>   .../inetutils/{inetutils-1.9.2 => inetutils}/tftpd.xinetd.inetutils  | 0
>>   .../inetutils/{inetutils-1.9.2 => inetutils}/version.patch           | 2 +-
>>   .../inetutils/{inetutils_1.9.2.bb => inetutils_1.9.4.bb}             | 5 +++--
>>   12 files changed, 4 insertions(+), 3 deletions(-)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/fix-disable-ipv6.patch (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/inetutils-1.8-0003-wchar.patch (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/rexec.xinetd.inetutils (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/rlogin.xinetd.inetutils (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/rsh.xinetd.inetutils (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/telnet.xinetd.inetutils (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/telnetd-Fix-deadlock-on-cleanup.patch (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/tftpd.xinetd.inetutils (100%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.2 => inetutils}/version.patch (93%)
>>   rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9.2.bb => inetutils_1.9.4.bb} (97%)
>>
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/fix-disable-ipv6.patch
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0003-wchar.patch
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnetd-Fix-deadlock-on-cleanup.patch
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/telnetd-Fix-deadlock-on-cleanup.patch
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
>> similarity index 93%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
>> index 1caa2d3..532a0e5 100644
>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
>> @@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
>>    
>>   -AC_INIT([GNU inetutils],
>>   - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
>> -+AC_INIT([GNU inetutils],[1.9.2],
>> ++AC_INIT([GNU inetutils],[1.9.4],
>>     [bug-inetutils@gnu.org])
>>    
>>    AC_CONFIG_SRCDIR([src/inetd.c])
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
>> similarity index 97%
>> rename from meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
>> rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
>> index 6209272..cdcba83 100644
>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
>> @@ -2,6 +2,7 @@ DESCRIPTION = "The GNU inetutils are a collection of common \
>>   networking utilities and servers including ftp, ftpd, rcp, \
>>   rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
>>   talkd, telnet, telnetd, tftp, tftpd, and uucpd."
>> +HOMEPAGE = "http://www.gnu.org/software/inetutils"
>>   SECTION = "net"
>>   DEPENDS = "ncurses netbase readline"
>>   LICENSE = "GPLv3"
>> @@ -21,8 +22,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>>              file://telnetd-Fix-deadlock-on-cleanup.patch \
>>   "
>>   
>> -SRC_URI[md5sum] = "aa1a9a132259db83e66c1f3265065ba2"
>> -SRC_URI[sha256sum] = "0423ea40a160cd4630f817e247df5c08ecc625378d2bb56a0509117a36a89913"
>> +SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
>> +SRC_URI[sha256sum] = "be8f75eff936b8e41b112462db51adf689715658a1b09e0d6b05d11ec92cc616"
>>   
>>   inherit autotools gettext update-alternatives texinfo
>>   
>> -- 
>> 1.9.1
>>
>>
>>


-- 
Regards,
Neil | Kai Kang


