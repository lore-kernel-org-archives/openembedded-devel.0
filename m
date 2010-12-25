Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWa8O-0003ZV-Mk
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 20:50:33 +0100
Received: by pwi8 with SMTP id 8so781112pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=LRTRbtePPSj8dDIgyapwlhRvtv2Zwor8IazK9tm5P90=;
	b=nDZLw7HJKmD/WLjd2yuvIIFyxUajNeTYYnBvp9CgwLM9siETv7UsvujURVkRowLJwY
	8SeekNIlNollGkYzVzf3F51znue+rZCWMb9GBL1lEotul/UpaPzA6WZ5MpZu+b7EbAt7
	KBDkP/QpMbhycwXK43aLGpUQ4Nqy24UTYnd1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=JTg9nN4GEc6vb7hSqKlFXPdt1KJjUE3yxaS5jBAAK2H1WyRWU73ZybAMaF34xL/pz2
	RAuQz/OeQZv8ZeSgYD6eKnS7OsTK0Qf1tIlt/AfYNShVqSs0QgDizFfhc4tLVCm4Zm1X
	U0CNyj88V/ZYjS3wrNt1wymiNRFwGPzqIzsBo=
Received: by 10.142.170.13 with SMTP id s13mr8467967wfe.139.1293306616639;
	Sat, 25 Dec 2010 11:50:16 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm14594256wfh.0.2010.12.25.11.50.15
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 11:50:15 -0800 (PST)
Message-ID: <4D164AF6.4050206@gmail.com>
Date: Sat, 25 Dec 2010 11:50:14 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinhwtWJfCFLWdB_QFVMWBYZi1G_C6sPt-qCAL8n@mail.gmail.com>	<AANLkTimGtgXwtoTS94WHRdNsgShmSkCxj25o6MnVfgHx@mail.gmail.com>
	<AANLkTi=9JdAfD7te7fySLJFvADFqAht=cE0typQsRxy7@mail.gmail.com>
In-Reply-To: <AANLkTi=9JdAfD7te7fySLJFvADFqAht=cE0typQsRxy7@mail.gmail.com>
Subject: Re: QA issue with staging (workdir) for .la files in xmlrpc-c package
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
X-List-Received-Date: Sat, 25 Dec 2010 19:50:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2010 1:44 AM, Martin Panter wrote:
> On 23 December 2010 18:43, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com>  wrote:
>> 2010/12/23 Martin Panter<vadmium+floss@gmail.com>:
>>> Hi all
>>>
>>> I'm having trouble building "xmlrpc-c", which I think is required for
>>> rtorrent. It's failing at the "do_qa_staging" stage with the messages
>>> such as "QA Issue with staging: libxmlrpc.la failed sanity test
>>> (workdir)".
>>>
>>> I gather the issue is that my sysroots/*/usr/lib/libxmlrpc.la file has
>>> the following, which mentions the tmp/work/ directory:
>>>
>>> # Libraries that this one depends upon.
>>> dependency_libs=' -L.libs
>>> -L/media/disk/home/vadmium/proj/aegle/build/tmp/work/armv7a-angstrom-linux-gnueabi/xmlrpc-c-1.06.41-r1/xmlrpc-c-1.06.41/src/../lib/libutil/.libs
>>> -lxmlrpc_util -lxml2 -lz -lm'
>>>
>>> So looks like another Libtool issue. But I'm stuck this time so if
>>> anyone has any hints that would be awesome. For instance why does that
>>> -L. . ./tmp/work/. . . component get there, and perhaps is there some
>>> Libtool option to prevent or fix it?
>>>
>>> I think the xmlrpc-c packages has its own version of Libtool (1.3.4?).
>>> I tried coaxing the build process to use OE's Libtool version
>>> (EXTRA_OEMAKE = "LIBTOOL='${HOST_SYS}-libtool'", after the import
>>> line, in the recipe file), but this didn't seem to help.
>>>
>>> Previously I thought I had another "QA issue" with this xmlrpc-c
>>> package, something about a "hash style", which I thought I solved by
>>> passing LADD='${LDFLAGS}' to the Make command. But recently when I
>>> removed this change I am not getting the earlier "hash style QA
>>> issue"; only this newer "workdir" one. But I may be confused.
>>>
>>> -Martin
>>>
>>> These are the full messages taken straight from log.do_qa_staging file
>>> with awesome-long path names:
>>>
>>> ERROR: QA Issue with staging: libxmlrpc.la failed sanity test
>>> (workdir) in path
>>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>>> ERROR: QA Issue with staging: libxmlrpc_server_abyss.la failed sanity
>>> test (workdir) in path
>>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>>> ERROR: QA Issue with staging: libxmlrpc_server.la failed sanity test
>>> (workdir) in path
>>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>>> ERROR: QA Issue with staging: libxmlrpc_server_cgi.la failed sanity
>>> test (workdir) in path
>>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>>> ERROR: QA Issue with staging: libxmlrpc_client.la failed sanity test
>>> (workdir) in path
>>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>>> FATAL: QA staging was broken by the package built above
>>
>> I *think* I've rebuild rtorrent yesterday. for beagleboard/minimal.
>> Didn't get the error. Can't verify things right now. Feel frree to
>> ping me this evening on irc (roughly 18.00-22.00 gmt) or tomorrow
>> during the day)
>> What libtool are you using? and is this on git head ?
>
> On 23/12/2010, Frans Meulenbroeks<fransmeulenbroeks@gmail.com>  wrote:
>> 2010/12/23 Martin Panter<vadmium+floss@gmail.com>:
>>> Hi all
>>>
>>> I'm having trouble building "xmlrpc-c", which I think is required for
>>> rtorrent. It's failing at the "do_qa_staging" stage with the messages
>>> such as "QA Issue with staging: libxmlrpc.la failed sanity test
>>> (workdir)".
>>>
>>> I gather the issue is that my sysroots/*/usr/lib/libxmlrpc.la file has
>>> the following, which mentions the tmp/work/ directory:
>>>
>>> # Libraries that this one depends upon.
>>> dependency_libs=' -L.libs
>>> -L/media/disk/home/vadmium/proj/aegle/build/tmp/work/armv7a-angstrom-linux-gnueabi/xmlrpc-c-1.06.41-r1/xmlrpc-c-1.06.41/src/../lib/libutil/.libs
>>> -lxmlrpc_util -lxml2 -lz -lm'
>>>
>>> So looks like another Libtool issue. But I'm stuck this time so if
>>> anyone has any hints that would be awesome. For instance why does that
>>> -L. . ./tmp/work/. . . component get there, and perhaps is there some
>>> Libtool option to prevent or fix it?


Yes it a mix of libtool and the xmlrpc-c build system combined issue. 
The patch you provided solved some part of the problem. I have committed 
a modified patch which fixes several problems along with this
one in xmlrpc-c recipe

-Khem


