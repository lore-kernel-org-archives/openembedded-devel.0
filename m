Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 40FC56B880
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 00:04:05 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id y1so1664284lam.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 16:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:in-reply-to:message-id:references:user-agent
	:mime-version:content-type;
	bh=IBZPYHo1pIdMrGOefgv30ke0DbGGs47Bw0uT508dG58=;
	b=yjgc0DtbNLZLS/FKtTPWAjK2TtYvlQJsy7hBQhazzGGchvc7821YlntWdsXC9C8u0f
	m8+zpYrLx6wMbS/IQ+kpw9LuOowNBWXo1kEnd8v60r31ACzo3lLbDTar7kvbsV1BNERc
	jWxNgkKAZO+e3nTl2xLEv7wF2EE3QC4lxJJIajmPJMn4HBlX//e2bGamZ5wkTBO0Vuvo
	MI9PcCbC5RIjnGBZ128s1+xLU/NOIE1J4uF7aJQyjSAshAVP23wx8gKN/Nx7yOu6Eu9f
	Z5mK5n/O9MfhDEcOJ+83KdQaNC12ImMyaXx4KpaRPRA88nFSeEteP16krKYft0txgLfi
	3hzg==
X-Received: by 10.152.163.69 with SMTP id yg5mr12054463lab.33.1389657845210;
	Mon, 13 Jan 2014 16:04:05 -0800 (PST)
Received: from [192.168.0.156] (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id c3sm4964569lbp.2.2014.01.13.16.04.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 16:04:04 -0800 (PST)
Date: Tue, 14 Jan 2014 01:03:49 +0100 (CET)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20140113101147.GI16995@jama>
Message-ID: <alpine.LFD.2.11.1401140055500.20049@localhost.localdomain>
References: <CAPbeDCnrC84D8tqjT-A29YLO_hn2K1wQ5a_cK85uMVfGEzbrhQ@mail.gmail.com>
	<20140113101147.GI16995@jama>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Subject: Re: [meta-qt5][jansa/qt5-5.2.0] libQt5*.la references OE build directories
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
X-List-Received-Date: Tue, 14 Jan 2014 00:04:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed


On Mon, 13 Jan 2014, Martin Jansa wrote:

> On Mon, Jan 13, 2014 at 01:58:25AM +0100, Jacob Kroon wrote:
>> Hi,
>>
>> I'm seeing what I believe is a problem with the *.la files in the Qt5
>> dev-packages.
>> The files references paths in my OE build environment, like so:
>>
>> ...
>> # Libraries that this one depends upon.
>> dependency_libs='-lQt5Gui
>> -L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandboard-solo/usr/lib
>> -lQt5Core -lpthread '
>> ...
>> # Directory that this library needs to be installed in:
>> libdir='/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandboard-solo/usr'
>> ...
>>
>> I noticed this since my Qt5 autotools project wouldn't link properly when
>> using the SDK, unless I first removed all libQt5*.la files.
>>
>> I'm not quite sure where to look for the problem so any pointers would be
>> appreciated.
>
> Probably bad rebase on my side, please compare
>
> mkspecs/features/qt_module.prf in 5.1.1 and 5.2.0
>
> changed in:
> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase-5.1.1/0008-qt_module-Fix-pkgconfig-replacement.patch
> and
> https://github.com/meta-qt5/meta-qt5/blob/jansa/qt5-5.2.0/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
>
> Or better in meta-qt5's qtbase repo:
> https://github.com/meta-qt5/qtbase/blob/b5.1.1/mkspecs/features/qt_module.prf
> https://github.com/meta-qt5/qtbase/blob/b5.2.0/mkspecs/features/qt_module.prf
>

I tried building Qt 5.1.1 from master again, the .la-files do look 
better, "libdir" looks correct (taken from libQt5Svg.la):

<snip>
# Directory that this library needs to be installed in:
libdir='/usr/lib'
</snip>

however

<snip>
dependency_libs='-lQt5Gui 
-L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandboard-solo/usr/lib 
-lQt5Core -lpthread '
</snip>

Dunno wether this is a problem or not, I never tried building the 
project with 5.1.1 using the SDK.

Will hopefully have some time tomorrow to look at the links you sent.

Thanks,

Jacob

