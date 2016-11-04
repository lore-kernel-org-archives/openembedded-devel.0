Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 7DC9B71AA9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 21:08:37 +0000 (UTC)
Received: (qmail 30781 invoked by uid 1003); 4 Nov 2016 21:08:38 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.116.4)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	4 Nov 2016 21:08:38 -0000
To: openembedded-devel@lists.openembedded.org
References: <1478225282-27345-1-git-send-email-timothy.t.orling@linux.intel.com>
	<CAMKF1spNzuAWTGU+S_n2v8PD8yZSz8OhRfj6NwZs_Qfu3rK5KA@mail.gmail.com>
	<CANx9H-C=g=ai3AO-95nWa49+9Jv=_00AA7sBBcBXHN4OVjG_Zg@mail.gmail.com>
	<CANx9H-BkdLaOBamyAW5BNVSDaG7ZjMHxBE0YBN9vM7D9Y7rjyA@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <ecca4885-a1e1-6290-0840-fd73023221e7@balister.org>
Date: Fri, 4 Nov 2016 17:08:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-BkdLaOBamyAW5BNVSDaG7ZjMHxBE0YBN9vM7D9Y7rjyA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] mariadb: use faster download URL
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
X-List-Received-Date: Fri, 04 Nov 2016 21:08:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 11/04/2016 12:44 AM, Tim Orling wrote:
> On Thu, Nov 3, 2016 at 9:42 PM, Tim Orling <ticotimo@gmail.com> wrote:
> 
>>
>>
>> On Thu, Nov 3, 2016 at 8:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Thu, Nov 3, 2016 at 7:08 PM, Tim Orling
>>> <timothy.t.orling@linux.intel.com> wrote:
>>>> The current URL takes about 2 hours to download.
>>>
>>> how fast is new one, do they keep the tarballs there for long time ?
>>> or shove them into archive after new release is out
>>>
>>> 10 MB/s vs. 3.4KB/s by my test.
>> It is the same organization, just a different server.
>> We could instead trust GitHub archives if you prefer. But the current URL
>> is just not working.
>>
> 
> And from what I can tell by browsing the URL, all the old versions are
> still there.
> 

I can't comment on the new URL, but I noticed the agonizingly slow
download the other day when I did a really clean test build.

Philip

>>
>>
>>>>
>>>> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>>>> ---
>>>>  meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
>>> b/meta-oe/recipes-support/mysql/mariadb.inc
>>>> index edef40b..689b8ab 100644
>>>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>>>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>>>> @@ -4,7 +4,7 @@ SECTION = "libs"
>>>>  LICENSE = "GPLv2"
>>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260a
>>> a954499f7abaabaa882bbe"
>>>>
>>>> -SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${
>>> PV}.tar.gz \
>>>> +SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/m
>>> ariadb-${PV}.tar.gz \
>>>>             file://fix-cmake-module-path.patch \
>>>>             file://remove-bad-path.patch \
>>>>             file://fix-mysqlclient-r-version.patch \
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>

