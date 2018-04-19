Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9FFAA71BFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 12:09:19 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 85-v6so6364672iti.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fIqVtC63K4cinFCo7f9PKpF2Sz7CeyMOXb7tEN7pR10=;
	b=MGmgtVZQNJCimYwUbmlhkz/bM6diEIMVjZTGMFV4g7U2WTatLs0+j6RgaA+apLga5m
	vilyC4YiTRlxxqt1L2CgYuIwz+T4rXvvyT66eDeYcOzX0FnZkfFAengBljFDUkkdqbAS
	1KQyy453cLtMg9znGPUX7enJg6qj4RhGA7Se6s9nziL+8GjCOq1P48Rek6q1RS3CyyIK
	tIIztzsmfPRgsQ09t4IxyaPVD//BHfsjf/akNXUJACIyZZT6V6XUxK+YdOpEX3jTEJhJ
	qFpAwGONXWmoWX+DevOKaG9k1at8ZiY9iHMnINcCjQGXmF00WAehtl0u6s7KPRPlEhQ3
	tu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fIqVtC63K4cinFCo7f9PKpF2Sz7CeyMOXb7tEN7pR10=;
	b=HlQ2u87ulJoPhjYz3b3Ryv0vAKTzMKmsAEyaDxVwz1LXcBNe/Gs0+8lgT6v3DxmsIa
	Jc/UVGt0Upt3XGR8Lj476HgXw4rk1tMPWEf5ylGu2w1MfG4Sam7cIk5Tsbu15ADXES0t
	GU53Sw4qm2SS47faOVu7NW7GrXXLzBjQ0CKoR8A5Ggos+FDeo2UnK2/p8dyvJi7QT+ot
	iLxOb9vOrSi2ItzzKQzj5jOc3Pa3xj9WHV5obbT/0jlHZR2oS9po+cn6JPmyZB836XMe
	imJhp6JKn+qnW4CWCK6f0hdKH9skGPYLCjKoKHA4EJQHuoN5NZq8/d8ZfFg6ydcyEYy0
	ZSOA==
X-Gm-Message-State: ALQs6tBJBiL1e4+83tuVHU7nM/xjNkORU2VV35ATthiBLGs4Txy2txLd
	CnYfU5D21nLkeIQvTHwR8cRw7rUdW4aNHXWS5eY=
X-Google-Smtp-Source: AIpwx4+WbAAtJKh3m5PGQQax5mWEIzIGugyTkou/sBWhXEfNHY9NDMHcno/pAGvVzlUKRi9Z5MLAS+CFxdcKfHNg048=
X-Received: by 2002:a24:9710:: with SMTP id
	k16-v6mr6663658ite.150.1524139760336; 
	Thu, 19 Apr 2018 05:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.135 with HTTP; Thu, 19 Apr 2018 05:09:19 -0700 (PDT)
In-Reply-To: <CA+chaQf2-+XFBHtF5cx5_mCxjMj_EFqKDSSSFnuGfUkX_ArzSA@mail.gmail.com>
References: <20180418100454.3171-1-samuli.piippo@qt.io>
	<CA+chaQd4ygCH0erc913ZcW2_9sesz1WfsECY-YtXrwTiWXOfRg@mail.gmail.com>
	<CABXoSoX1_kbuDQX4UPHfcU7wEJTHvPxbLkD_kBkgXOoasjVLNg@mail.gmail.com>
	<CA+chaQdBh6hBdcVcK6EpSb9A+jyvWZJxEAwTj_vXJx76gMsL0Q@mail.gmail.com>
	<CABXoSoUT2EOb1Wzr4CofVBTGwuwAqPwpvKHqajQ97S0+pjUChg@mail.gmail.com>
	<CA+chaQf2-+XFBHtF5cx5_mCxjMj_EFqKDSSSFnuGfUkX_ArzSA@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 19 Apr 2018 15:09:19 +0300
Message-ID: <CABXoSoXHZOU6qGByjPVPmFkirxAxMstM5sLwPPX0-4xSe2yJ1g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][rocko][PATCH] qtbase: use mysql_config from correct path
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
X-List-Received-Date: Thu, 19 Apr 2018 12:09:19 -0000
Content-Type: text/plain; charset="UTF-8"

mysql5 dependency builds mariadb-native, which also provides
mysql_config. Without RSS that native version is first in the PATH,
which gives incorrect configs for cross-compilation.

On 19 April 2018 at 13:49, Martin Jansa <martin.jansa@gmail.com> wrote:
> How does RSS influence this? I think you're still talking about HOSTTOOLS
> not RSS.
>
> On Thu, Apr 19, 2018 at 12:09 PM, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>>
>> Works with master as well; this is really needed with morty and older
>> OE releases, where recipe-sysroot is not used.
>> I was using different branches myself, hence the mix up.
>>
>> On 19 April 2018 at 09:01, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > RSS is used since pyro release, but you probably meant HOSTTOOLS which
>> > are
>> > used since rocko, but then it wouldn't be needed in rocko, only in
>> > older.
>> >
>> > Please test it with master, if it works there I'll apply it to all
>> > branches,
>> > because people tend to use different branch of meta-qt5 with different
>> > OE
>> > releases.
>> >
>> > On Thu, Apr 19, 2018 at 7:46 AM, Samuli Piippo <samuli.piippo@gmail.com>
>> > wrote:
>> >>
>> >> only needed on rocko and older. With recipe-sysroot it works correctly.
>> >>
>> >> On 19 April 2018 at 08:42, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> > Is it needed in sumo and master branches as well? If yes, then it
>> >> > should
>> >> > be
>> >> > applied there first.
>> >> >
>> >> > On Wed, Apr 18, 2018 at 12:04 PM, Samuli Piippo <samuli.piippo@qt.io>
>> >> > wrote:
>> >> >
>> >> >> mysql_config from host sysroot is found first which gives wrong
>> >> >> paths
>> >> >> for cross-compilation. Use it from crosscompile path instead.
>> >> >>
>> >> >> Change-Id: Ia1e7d8e0c582016130f595b1be279255e9d0b055
>> >> >> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> >> >> ---
>> >> >>  recipes-qt/qt5/qtbase_git.bb | 2 +-
>> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >>
>> >> >> diff --git a/recipes-qt/qt5/qtbase_git.bb
>> >> >> b/recipes-qt/qt5/qtbase_git.bb
>> >> >> index 0e3a8ac..db6280f 100644
>> >> >> --- a/recipes-qt/qt5/qtbase_git.bb
>> >> >> +++ b/recipes-qt/qt5/qtbase_git.bb
>> >> >> @@ -119,7 +119,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
>> >> >>  PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
>> >> >>  PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb
>> >> >> xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
>> >> >>  PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
>> >> >> -PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
>> >> >> +PACKAGECONFIG[sql-mysql] = "-sql-mysql -mysql_config
>> >> >> ${STAGING_BINDIR_CROSS}/mysql_config,-no-sql-mysql,mysql5"
>> >> >>  PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
>> >> >>  PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
>> >> >>  PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
>> >> >> --
>> >> >> 2.17.0
>> >> >>
>> >> >> --
>> >> >> _______________________________________________
>> >> >> Openembedded-devel mailing list
>> >> >> Openembedded-devel@lists.openembedded.org
>> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >> >>
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-devel mailing list
>> >> > Openembedded-devel@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>
>

