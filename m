Received: from smtpauth21.prod.mesa1.secureserver.net ([64.202.165.38])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PrWre-00059K-Ky
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 15:35:52 +0100
Received: (qmail 795 invoked from network); 21 Feb 2011 14:27:50 -0000
Received: from unknown (209.242.7.132)
	by smtpauth21.prod.mesa1.secureserver.net (64.202.165.38) with ESMTP;
	21 Feb 2011 14:27:50 -0000
Message-ID: <4D627669.5010605@mwester.net>
Date: Mon, 21 Feb 2011 08:27:53 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D61CA73.7000306@mwester.net>
	<AANLkTimUMs9CBky1JmzY7BUMQTdHfUsyRqdMa7JvgufX@mail.gmail.com>
In-Reply-To: <AANLkTimUMs9CBky1JmzY7BUMQTdHfUsyRqdMa7JvgufX@mail.gmail.com>
Subject: Re: [PATCH] squid: fix references to host headers and libs
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
X-List-Received-Date: Mon, 21 Feb 2011 14:35:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/2011 2:34 AM, Khem Raj wrote:
> On Sun, Feb 20, 2011 at 6:14 PM, Mike Westerhof <mike@mwester.net> wrote:
>> This patch changes hard-coded references to /usr and /opt in the various
>> squid config.test scripts to point to the correct sysroot paths.
>>
>> Signed-off-by: Mike Westerhof <mike@mwester.net>
>> ---
>> diff --git a/recipes/squid/squid_3.1.9.bb b/recipes/squid/squid_3.1.9.bb
>> index 713b1ea..ecd6fdc 100644
>> --- a/recipes/squid/squid_3.1.9.bb
>> +++ b/recipes/squid/squid_3.1.9.bb
>> @@ -1,4 +1,4 @@
>> -PR = "${INC_PR}.0"
>> +PR = "${INC_PR}.1"
>>
>>  include squid.inc
>>
>> @@ -18,6 +18,11 @@ do_configure_prepend() {
>>        export ac_cv_epoll_ctl=yes
>>        export ac_cv_epoll_works=yes
>>        export ac_cv_func_setresuid=yes
>> +       # Patch up the various config scripts to refer to sysroot
>> +       for i in `find ${S} -name config.test`; do
>> +           sed -i -e 's|/usr|${STAGING_DIR_HOST}/usr|g' \
> 
> I dont know if this works for say micro distro. May be using
>  STAGING_EXECPREFIXDIR instead of ${STAGING_DIR_HOST}/usr
> 
> or using
> 
>  ${STAGING_DIR_HOST}${exec_prefix}
> 
> would be more portable

Does micro actually change the structure of the *staging*
directories, then?

What I'm trying to do here is perhaps best expressed by example.
Here's a few lines from one of those config.test files:

if [ -f /usr/include/db.h ] && grep dbopen /usr/include/db.h; then
    exit 0
fi
exit 1

I'm simply prefixing those paths with the correct path to the
sysroot, so it becomes:

if [ -f /r/slug/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/include/db.h ] && grep dbopen /r/slug/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/include/db.h; then
    exit 0
fi
exit 1

Would these paths be different for micro, then?

-Mike (mwester)

> 
>> +                  -e 's|/opt|${STAGING_DIR_HOST}/opt|g' "$i"
>> +       done
>>  }
>>
>>  do_install_append() {
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> 



