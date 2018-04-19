Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A71F65CC6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:09:57 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id u62-v6so5981485ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dgpkbKd1HYPKJqpziYawrHmKCTA02ST6TY+64N2h4Ks=;
	b=FhKWS9OpQZUB5KgIyOEKr8vRimSvMG++EV+wT0mIIVgT0ZS6knDZfA7wniP8d38hXp
	aASMlThar6aMClGufVFkVvlfWgrA80l4xx3Q9Erz33oYiv4IKrz4KDjpgsMGcs465Q+T
	809urldgudhq8nUFEY6eGlbxSVEzJumlTjGSSuyRoLYNLs0dONHcTA6Uc+NqDv4363Oo
	e3mHRawofTuYmeV4/s/vZjvPpQ76YHsUBx3Vr4qLd46/n1mftXwcZzBI0KNQwjLuqvC0
	nDtR2IX7aD4hUSXr35GNS1S4r+6v0axPUJgAV/Eu3IgSk75Fl2U6eKOUH4AST9ifaOrt
	wm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dgpkbKd1HYPKJqpziYawrHmKCTA02ST6TY+64N2h4Ks=;
	b=qGjJuNL8EvbTsGsSiEmOkUaPoZgodsn6n0nPJnh00tUpte9aPM3+V+iaqJMkM93vNW
	e8Pkk7NFdEZ4Qubxy0e8+2MTUnf4E0/M9z+0wVXTYcH7MK1TikplDq5UZOtYdrn7+WzO
	3niVJxPihxpOnLh7qUdwI+6osYsW94KEyIbrvfDrvV5k63qN+ASElqm4nkzLSO0pBg/9
	uYScfNcrts9c1Kluzcetnzt8jnV4WoJFHGsi7Ovh4RhPIlHMAft6w5ME/Aa7qI/D1esZ
	4r/wlwpy7HByuQjQyX0mzL8JnbXzJIqCYgF9PBSVjMVIeO26SVCJ5l7myYalKmIvk1L8
	OTpw==
X-Gm-Message-State: ALQs6tAs2Zty3+QkNlhyUzoTCrnVaXocx7mrX9ahMMa2mpR+HaF3zKsb
	h+8HXIUnhNnVaGdHSjHCcdP5NLTyCFGe8ACXjr8=
X-Google-Smtp-Source: AIpwx4/Z6ykb1Q3Ibv72M4La0gG5X4UvFybrXSG5W9HH/NJ3UjG5kbDlUPa2kBTrbzMEOyTtPcBpMVNx3MeKDE69WiE=
X-Received: by 2002:a24:9502:: with SMTP id
	m2-v6mr5548840itd.121.1524132598453; 
	Thu, 19 Apr 2018 03:09:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.135 with HTTP; Thu, 19 Apr 2018 03:09:57 -0700 (PDT)
In-Reply-To: <CA+chaQdBh6hBdcVcK6EpSb9A+jyvWZJxEAwTj_vXJx76gMsL0Q@mail.gmail.com>
References: <20180418100454.3171-1-samuli.piippo@qt.io>
	<CA+chaQd4ygCH0erc913ZcW2_9sesz1WfsECY-YtXrwTiWXOfRg@mail.gmail.com>
	<CABXoSoX1_kbuDQX4UPHfcU7wEJTHvPxbLkD_kBkgXOoasjVLNg@mail.gmail.com>
	<CA+chaQdBh6hBdcVcK6EpSb9A+jyvWZJxEAwTj_vXJx76gMsL0Q@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 19 Apr 2018 13:09:57 +0300
Message-ID: <CABXoSoUT2EOb1Wzr4CofVBTGwuwAqPwpvKHqajQ97S0+pjUChg@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 10:09:58 -0000
Content-Type: text/plain; charset="UTF-8"

Works with master as well; this is really needed with morty and older
OE releases, where recipe-sysroot is not used.
I was using different branches myself, hence the mix up.

On 19 April 2018 at 09:01, Martin Jansa <martin.jansa@gmail.com> wrote:
> RSS is used since pyro release, but you probably meant HOSTTOOLS which are
> used since rocko, but then it wouldn't be needed in rocko, only in older.
>
> Please test it with master, if it works there I'll apply it to all branches,
> because people tend to use different branch of meta-qt5 with different OE
> releases.
>
> On Thu, Apr 19, 2018 at 7:46 AM, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>>
>> only needed on rocko and older. With recipe-sysroot it works correctly.
>>
>> On 19 April 2018 at 08:42, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Is it needed in sumo and master branches as well? If yes, then it should
>> > be
>> > applied there first.
>> >
>> > On Wed, Apr 18, 2018 at 12:04 PM, Samuli Piippo <samuli.piippo@qt.io>
>> > wrote:
>> >
>> >> mysql_config from host sysroot is found first which gives wrong paths
>> >> for cross-compilation. Use it from crosscompile path instead.
>> >>
>> >> Change-Id: Ia1e7d8e0c582016130f595b1be279255e9d0b055
>> >> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> >> ---
>> >>  recipes-qt/qt5/qtbase_git.bb | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/recipes-qt/qt5/qtbase_git.bb
>> >> b/recipes-qt/qt5/qtbase_git.bb
>> >> index 0e3a8ac..db6280f 100644
>> >> --- a/recipes-qt/qt5/qtbase_git.bb
>> >> +++ b/recipes-qt/qt5/qtbase_git.bb
>> >> @@ -119,7 +119,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
>> >>  PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
>> >>  PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb
>> >> xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
>> >>  PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
>> >> -PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
>> >> +PACKAGECONFIG[sql-mysql] = "-sql-mysql -mysql_config
>> >> ${STAGING_BINDIR_CROSS}/mysql_config,-no-sql-mysql,mysql5"
>> >>  PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
>> >>  PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
>> >>  PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
>> >> --
>> >> 2.17.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

