Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id 79B6961FEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 18:32:29 +0000 (UTC)
Received: from [192.168.1.100] (blfd-4db0ef1f.pool.mediaWays.net
	[77.176.239.31])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 0DBA01840A4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:32:28 +0200 (CEST)
Message-ID: <51B61BBB.1030508@herbrechtsmeier.net>
Date: Mon, 10 Jun 2013 20:32:27 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <3389668.90m8Qn9G8H@luxon> <5622796.kW1BjNgdNO@luxon>
	<519F7FA9.60100@herbrechtsmeier.net> <16136190.1I5tgHWYiU@luxon>
In-Reply-To: <16136190.1I5tgHWYiU@luxon>
Subject: Re: [meta-qt5] Problems with Qt5 and CMake
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
X-List-Received-Date: Mon, 10 Jun 2013 18:32:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.06.2013 16:09, schrieb Manuel Nickschas:
> On Friday 24 May 2013 16:56:41 Stefan Herbrechtsmeier wrote:
>> Am 24.05.2013 15:03, schrieb Manuel Nickschas:
>>> The path specified there is clearly wrong for cross-compiling, because it
>>> references the location in the target itself, without prepending the
>>> sysroot prefix. Thus, it won't find moc. In particular, it needs not even
>>> find the moc from the target sysroot, but from the native sysroot, as
>>> it's a host tool.
>> All paths in the target sysroot represents the path on the target. They
>> should be
>> adapted via an variable or automatically detected during runtime.
> What would be the proper way of doing this in the CMake files shipped by
> Qt5?
>
> /usr/bin/qt5/moc is hard-coded. We could prepend that with
> ${STAGING_DIR_NATIVE} maybe, which could be exported (via
> EXTRA_OECMAKE) by recipes so it's picked up by CMake, and it would
> resolve to nothing if it's not set (so the CMake file would still work outside of
> Bitbake).
You can try to import the executable from a file passed via -P parameter 
to cmake. I'm not sure if this works.

add_executable(Qt5::rcc IMPORTED)
set_target_properties(Qt5::rcc PROPERTIES IMPORTED_LOCATION 
"${STAGING_BINDIR_NATIVE}/rcc4")

Regards,
   Stefan


