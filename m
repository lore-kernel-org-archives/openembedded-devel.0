Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7oha-0006Wu-G6
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 14:57:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id EF49A315A13A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 14:48:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id u1OjriFKqZxK
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 14:48:23 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecefe.pool.mediaWays.net
	[89.14.206.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8C55E315A132
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 14:48:23 +0100 (CET)
Message-ID: <4F60A1A6.4090204@opendreambox.org>
Date: Wed, 14 Mar 2012 14:48:22 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20120313114820.9572210335@opal>
	<20120314070803.GB3919@jama.jama.net>
	<20120314084016.GD3919@jama.jama.net>
In-Reply-To: <20120314084016.GD3919@jama.jama.net>
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Wed, 14 Mar 2012 13:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 14.03.2012 09:40, Martin Jansa wrote:
> On Wed, Mar 14, 2012 at 08:08:03AM +0100, Martin Jansa wrote:
>> On Tue, Mar 13, 2012 at 11:48:20AM +0000, git@git.openembedded.org wrote:
>>> Module: openembedded-core.git
>>> Branch: master
>>> Commit: 4c41a3204ef72f53813ddc86fe525fa9c6714daa
>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=4c41a3204ef72f53813ddc86fe525fa9c6714daa
>>>
>>> Author: Andreas Oberritter <obi@opendreambox.org>
>>> Date:   Wed Mar  7 21:36:28 2012 +0100
>>>
>>> qt4: fix deps in libQtWebkit.la and QtWebKit.pc
>>>
>>> * Both files contain -L../../WebCore/release -L../../JavaScriptCore/release -lwebcore -ljscore
>>> * These paths and libs don't get installed.
>>> * When building a shared lib with libtool, that links
>>>   with libQtWebKit, libtool adds these unneeded parameters
>>>   to the linker command-line, thus linking fails.
>>
>> BTW: here with bitbake having R/W to rootfs every qt4-x11-free build
>> creates /include/WebCore/libdummy.prl (yes really in root)
>> anynone seen this?
>> -rw-r--r-- 1 bitbake bitbake 680 Mar 14 01:13 /include/WebCore/libdummy.prl

I'm only using qt4-embedded, with which I haven't noticed this file.

>> Maybe it's sign of another small issue in qt4 build.
> 
> It's created during do_configure and probably caused by
> ./qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit2/Makefile:all: Makefile /include/WebCore/libdummy.prl  /include/WebCore/$(TARGET)
> ./qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit2/Makefile:/include/WebCore/libdummy.prl:
> 
> But in unpacked sources closest thing to libdummy.prl is 
> ./Source/WebKit2/DerivedSources.pro:TARGET = dummy

I thought that Qt 4.8 didn't use WebKit2 by default. Did you enable it
manually?

Regards,
Andreas


