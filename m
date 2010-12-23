Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1PVhjH-0001nu-NI
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 10:45:00 +0100
Received: by wwi17 with SMTP id 17so5905459wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 01:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=0b0/oAGBnaYx4Eykb4vn8vsKBH/hZ7uqIY4owGeaS/Y=;
	b=C1CutFqxQnVbwmn88KtpBzxgi0n3omYUD/orVRX8tYGzObFwdnGv7bJnR1cJSbVSzC
	gT4IsSdvAKiqJUctvDssTmf3WiRUOXc/KxqydttZKN+5TCBIyKlzKrbcmaYco5CCCoJI
	KOn7WHvLo3KiwsXnHIOhURXswLYY/nRPy9/qA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=jqSI/lpK/0Aauh8LiVDWrfk2R6EaOVyBrgiIHafZ+odVC2Xmk7ny1UC1gJVLhlN0jT
	dON8QhqpdApRij/1dzOrVNmcw6gez0kmLhzW3lpcXux55JS0byKT+3R4M9geiWQcAceI
	xAbdBV+ePUhULUi4b1sU95OBkhFyV/S+OSG6U=
MIME-Version: 1.0
Received: by 10.216.178.132 with SMTP id f4mr11411462wem.62.1293097489521;
	Thu, 23 Dec 2010 01:44:49 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Thu, 23 Dec 2010 01:44:49 -0800 (PST)
In-Reply-To: <AANLkTimGtgXwtoTS94WHRdNsgShmSkCxj25o6MnVfgHx@mail.gmail.com>
References: <AANLkTinhwtWJfCFLWdB_QFVMWBYZi1G_C6sPt-qCAL8n@mail.gmail.com>
	<AANLkTimGtgXwtoTS94WHRdNsgShmSkCxj25o6MnVfgHx@mail.gmail.com>
Date: Thu, 23 Dec 2010 20:44:49 +1100
X-Google-Sender-Auth: hJpWZSDXfLomjUT-MKJYmIMDSnc
Message-ID: <AANLkTi=9JdAfD7te7fySLJFvADFqAht=cE0typQsRxy7@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 23 Dec 2010 09:45:00 -0000
Content-Type: text/plain; charset=UTF-8

On 23 December 2010 18:43, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/12/23 Martin Panter <vadmium+floss@gmail.com>:
>> Hi all
>>
>> I'm having trouble building "xmlrpc-c", which I think is required for
>> rtorrent. It's failing at the "do_qa_staging" stage with the messages
>> such as "QA Issue with staging: libxmlrpc.la failed sanity test
>> (workdir)".
>>
>> I gather the issue is that my sysroots/*/usr/lib/libxmlrpc.la file has
>> the following, which mentions the tmp/work/ directory:
>>
>> # Libraries that this one depends upon.
>> dependency_libs=' -L.libs
>> -L/media/disk/home/vadmium/proj/aegle/build/tmp/work/armv7a-angstrom-linux-gnueabi/xmlrpc-c-1.06.41-r1/xmlrpc-c-1.06.41/src/../lib/libutil/.libs
>> -lxmlrpc_util -lxml2 -lz -lm'
>>
>> So looks like another Libtool issue. But I'm stuck this time so if
>> anyone has any hints that would be awesome. For instance why does that
>> -L. . ./tmp/work/. . . component get there, and perhaps is there some
>> Libtool option to prevent or fix it?
>>
>> I think the xmlrpc-c packages has its own version of Libtool (1.3.4?).
>> I tried coaxing the build process to use OE's Libtool version
>> (EXTRA_OEMAKE = "LIBTOOL='${HOST_SYS}-libtool'", after the import
>> line, in the recipe file), but this didn't seem to help.
>>
>> Previously I thought I had another "QA issue" with this xmlrpc-c
>> package, something about a "hash style", which I thought I solved by
>> passing LADD='${LDFLAGS}' to the Make command. But recently when I
>> removed this change I am not getting the earlier "hash style QA
>> issue"; only this newer "workdir" one. But I may be confused.
>>
>> -Martin
>>
>> These are the full messages taken straight from log.do_qa_staging file
>> with awesome-long path names:
>>
>> ERROR: QA Issue with staging: libxmlrpc.la failed sanity test
>> (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_server_abyss.la failed sanity
>> test (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_server.la failed sanity test
>> (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_server_cgi.la failed sanity
>> test (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_client.la failed sanity test
>> (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> FATAL: QA staging was broken by the package built above
>
> I *think* I've rebuild rtorrent yesterday. for beagleboard/minimal.
> Didn't get the error. Can't verify things right now. Feel frree to
> ping me this evening on irc (roughly 18.00-22.00 gmt) or tomorrow
> during the day)
> What libtool are you using? and is this on git head ?

On 23/12/2010, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> 2010/12/23 Martin Panter <vadmium+floss@gmail.com>:
>> Hi all
>>
>> I'm having trouble building "xmlrpc-c", which I think is required for
>> rtorrent. It's failing at the "do_qa_staging" stage with the messages
>> such as "QA Issue with staging: libxmlrpc.la failed sanity test
>> (workdir)".
>>
>> I gather the issue is that my sysroots/*/usr/lib/libxmlrpc.la file has
>> the following, which mentions the tmp/work/ directory:
>>
>> # Libraries that this one depends upon.
>> dependency_libs=' -L.libs
>> -L/media/disk/home/vadmium/proj/aegle/build/tmp/work/armv7a-angstrom-linux-gnueabi/xmlrpc-c-1.06.41-r1/xmlrpc-c-1.06.41/src/../lib/libutil/.libs
>> -lxmlrpc_util -lxml2 -lz -lm'
>>
>> So looks like another Libtool issue. But I'm stuck this time so if
>> anyone has any hints that would be awesome. For instance why does that
>> -L. . ./tmp/work/. . . component get there, and perhaps is there some
>> Libtool option to prevent or fix it?
>>
>> I think the xmlrpc-c packages has its own version of Libtool (1.3.4?).
>> I tried coaxing the build process to use OE's Libtool version
>> (EXTRA_OEMAKE = "LIBTOOL='${HOST_SYS}-libtool'", after the import
>> line, in the recipe file), but this didn't seem to help.
>>
>> Previously I thought I had another "QA issue" with this xmlrpc-c
>> package, something about a "hash style", which I thought I solved by
>> passing LADD='${LDFLAGS}' to the Make command. But recently when I
>> removed this change I am not getting the earlier "hash style QA
>> issue"; only this newer "workdir" one. But I may be confused.
>>
>> -Martin
>>
>> These are the full messages taken straight from log.do_qa_staging file
>> with awesome-long path names:
>>
>> ERROR: QA Issue with staging: libxmlrpc.la failed sanity test
>> (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_server_abyss.la failed sanity
>> test (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_server.la failed sanity test
>> (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_server_cgi.la failed sanity
>> test (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> ERROR: QA Issue with staging: libxmlrpc_client.la failed sanity test
>> (workdir) in path
>> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>> FATAL: QA staging was broken by the package built above
>
> I *think* I've rebuild rtorrent yesterday. for beagleboard/minimal.
> Didn't get the error. Can't verify things right now. Feel frree to
> ping me this evening on irc (roughly 18.00-22.00 gmt) or tomorrow
> during the day)
> What libtool are you using? and is this on git head ?

I'm using a git master from last week, and I think the normal Libtool
it's using is 2.4. More configuration I'm currently using that might
be relevant, from my conf/local.conf file:
MACHINE = "beagleboard"
DISTRO = "angstrom-2010.x" (maybe might it be wiser for me to go back
to 2008.1?)
Bit bake 1.10.0 installed (too many issues with 1.10.1)


