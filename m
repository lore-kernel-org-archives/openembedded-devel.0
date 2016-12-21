Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id D82717736F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:05:43 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id y22so1195202uay.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HUrPFcXCma66mEv194xAeXgRit8eAjSIP/8rydZnknk=;
	b=cCEdGJRmhpIsSOebSHXvgvHMeIop0P1YgjmpnXBtYNdPUbBOlDBIbKNJZQ+iYIAxiG
	8NtzqyVa0wXTJaHLBvWyam7+eXeKmgnd0Yr0pQ3O0T7wBC9aJnsGAc+Ib8QtczhgXPrB
	L6VjOH+I4kIoaOOkf8TXJLtcZLArIDG9C3cBAt0bx9Wmx/Y0jWmrlVWhJzZyhSN2pJ2E
	agkIxNhzQkhX1I5izOfHzOSo3I07snvxWb8uBZkMd+sVORrFOnJMQwBoh4MhffVYKEi4
	rA6HhVwJGaj3zhmVu/YlD72oGZZoySQqGHJKdPIq9X2J2XoOXtUbFpNdWmtQ1mpmb+0g
	UqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HUrPFcXCma66mEv194xAeXgRit8eAjSIP/8rydZnknk=;
	b=DTdBLHfldmv2kA7Swv6tskQ1Dc5iBDBBh2veypQ7gOMhwlRBrpIqf5KYwmNp0mYAEY
	xMatdPBf03PYvJR7bT9R8gc2YnGMY16JDA2UOykY7jzUZHwXUtIZ1I9SBjZxzD18PD77
	8shobOqjrfxrKyB1c3q4Uszhp0twveKpv9VKq00RU7nQbp73+JkQEXs9NRcegSmRi/N2
	obmnmZ83/Q73pB9s7Gcx+J6U+ZnYU+GzP3/ATj1bBPh+jN4x8r1aujnoq9ox1NiBUB6o
	XIlI11MWXktiVBgpSMKuLH1dxXbcMgK8UnuGsShCxp+EwqdmewXKRyH1IGQjl+lKOAqY
	0Q6A==
X-Gm-Message-State: AIkVDXLiKm0b2TcOFXAQyQSbOO+GK3mLf6tY/oWpmnLVy+MSkM5dVbxTZGNcXXoeCdcTyIHNjYMs45xMO1HE1w==
X-Received: by 10.176.1.17 with SMTP id 17mr2155720uak.143.1482300344661; Tue,
	20 Dec 2016 22:05:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 20 Dec 2016 22:05:14 -0800 (PST)
In-Reply-To: <20161220143231.GG3275@jama>
References: <20161216035947.18909-1-raj.khem@gmail.com>
	<20161216035947.18909-2-raj.khem@gmail.com>
	<20161220143231.GG3275@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2016 22:05:14 -0800
Message-ID: <CAMKF1srQLizr9Pmm4zYa1NxYE8bqWevRSAsFf1O8dmsniHin_g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/3] usrsctp: Add recipe
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
X-List-Received-Date: Wed, 21 Dec 2016 06:05:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 20, 2016 at 6:32 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Dec 15, 2016 at 07:59:46PM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-protocols/usrsctp/usrsctp_git.bb       | 24 ++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
>>
>> diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
>> new file mode 100644
>> index 0000000..291eaa9
>> --- /dev/null
>> +++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X and Windows."
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
>> +
>> +SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master"
>> +SRCREV = "dbfc1b8c4cf1a46a4d8987ba542d5ff06bdaf14c"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools pkgconfig
>> +
>> +DEPENDS += "openssl"
>
> Fails to build here:
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.20161218_140914.log//3_min/failed/usrsctp.log
>
>  Makefile.am: installing './INSTALL'
> | Makefile.am: error: required file './NEWS' not found
> | Makefile.am: error: required file './README' not found
> | Makefile.am: error: required file './AUTHORS' not found
> | Makefile.am: error: required file './ChangeLog' not found
> | Makefile.am: installing './COPYING' using GNU General Public License
> v3 file
> | Makefile.am:     Consider adding the COPYING file to the version
> control system
> | Makefile.am:     for your code, to avoid questions about which license
> your project uses
> | programs/Makefile.am: installing './depcomp'
> | autoreconf: automake failed with exit status: 1

Yeah sent a v2

>
>
>> +
>> +CFLAGS  += "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
>> +LDFLAGS += "-lssl -lcrypto"
>> +
>> +PACKAGECONFIG ?= "disablewarnings"
>> +PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
>> +
>> +EXTRA_OECONF += "--disable-inet \
>> +                 --disable-inet6 \
>> +                 --disable-shared \
>> +                 --disable-debug \
>> +               "
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

