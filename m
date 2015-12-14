Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 51B156FF73
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:56:20 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so107896185pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=aliDowhkLuq7XP9fxACnmxfoCBwDH/aFSaD2mnaSLjc=;
	b=rgbKJnFjvacM5p3D08YV6ALRWQJ2f1yGYxq/LRbj7u1catjmO6TZrh4LMFVierpEy/
	CFLkHGYu7n+lPX8aFkrnqohsJZv05WEGO6z2kG8aRIVbqIH0hlGJkfdvhJOVgayefD0M
	Iqsjrbfm6P+tlyUAWo+O/98O7imlX5c3HvbohRzPyJZSUaghYwnRuZfXOk0CiwlQ+sMd
	vd9YHz+SdKKgA/Rby39fLHiqWCCjUGLZvagiwghRoXSakYnxVXoukFhCfdmbo0aCXg6f
	qT349NjmWatifvADU0GhWB6GJokHDTATL00CC0lzU2mktFfUhL/pBejYhq0fLIJW6ZHC
	lgQQ==
X-Received: by 10.67.6.1 with SMTP id cq1mr47840531pad.78.1450119381713;
	Mon, 14 Dec 2015 10:56:21 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:ed26:217b:90d5:71ba?
	([2601:202:4000:1239:ed26:217b:90d5:71ba])
	by smtp.googlemail.com with ESMTPSA id
	g86sm12000695pfd.40.2015.12.14.10.56.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 10:56:20 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <cover.1450027640.git.akuster808@gmail.com>
	<c2c72c32cd47ebaaaac9cdbc769e0f4a8e5eac80.1450027640.git.akuster808@gmail.com>
	<20151214162656.GA2212@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <566F10D0.20507@gmail.com>
Date: Mon, 14 Dec 2015 10:56:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151214162656.GA2212@jama>
Subject: Re: [PATCH 04/14] net-snmp: fix cross compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 18:56:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 12/14/2015 08:26 AM, Martin Jansa wrote:
> On Mon, Dec 14, 2015 at 07:33:57AM -0800, Armin Kuster wrote:
>> From: Rafaël Carré <funman@videolan.org>
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../0002-config_os_headers-Error-Fix.patch         | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
> 
> There is another patch for net-snmp in master next, which actually adds
> this .patch file to SRC_URI, this change alone doesn't do anything and
> shouldn't be backported imho.

hmm, I will take a look at that.

thanks,
Armin
> 
>>
>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
>> new file mode 100644
>> index 0000000..a90ce1f
>> --- /dev/null
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-config_os_headers-Error-Fix.patch
>> @@ -0,0 +1,31 @@
>> +From e24fcd140f3f6dd18fd836b197c6d4bb773e50e7 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
>> +Date: Wed, 4 Nov 2015 16:49:30 +0100
>> +Subject: [PATCH] config_os_headers: Error Fix
>> +
>> +ERROR: This autoconf log indicates errors, it looked at host include
>> +and/or library paths while determining system capabilities.
>> +---
>> + configure.d/config_os_libs2 | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
>> +index 47491e2..e3647f9 100644
>> +--- a/configure.d/config_os_libs2
>> ++++ b/configure.d/config_os_libs2
>> +@@ -226,10 +226,10 @@ if test "x$with_nl" != "xno"; then
>> +     case $target_os in
>> +     linux*) # Check for libnl (linux)
>> +         netsnmp_save_CPPFLAGS="$CPPFLAGS"
>> +-        CPPFLAGS="-I/usr/include/libnl3 $CPPFLAGS"
>> ++        CPPFLAGS="$CPPFLAGS"
>> +         NETSNMP_SEARCH_LIBS(nl_connect, nl-3,
>> +             [AC_CHECK_HEADERS(netlink/netlink.h)
>> +-            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES -I/usr/include/libnl3"],
>> ++            EXTERNAL_MIBGROUP_INCLUDES="$EXTERNAL_MIBGROUP_INCLUDES"],
>> +             [CPPFLAGS="$netsnmp_save_CPPFLAGS"], [], [], [LMIBLIBS])
>> +         if test "x$ac_cv_header_netlink_netlink_h" != xyes; then
>> +             NETSNMP_SEARCH_LIBS(nl_connect, nl, [
>> +-- 
>> +2.5.0
>> +
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 

