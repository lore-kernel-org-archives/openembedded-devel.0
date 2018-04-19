Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id B7EB672ECD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 05:46:03 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 19-v6so5250878itw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 22:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zQ+GT3YVqsf1PhCXFLV8e3FGpBY+LtXEOPIZ/niXE6E=;
	b=GY83prxmCjXhIYqjBdUH73MsNPUtbhAcibQat48pJthFD2Y1mmi2N4bmjwS3jnjTuq
	44OHV85KSVqo4JETMqaulZgjgVKolK4uzTw9sOn/0OlL+O0iSlcuQsKUhMy0iJujOiE7
	4RVlKTbWm1RxTyyCdj0JIOTnVKP3IQ+uzE/CgEp1eYX01h4s/6ltIIACfxNe/4rSqy0+
	++r1aBH4TzeLCREPTX9A5kqpvzGw8iwFvTSE/jtZlMHM6/C/8EtM5jlMai2l337zxwlC
	Nkvy9s0ufg13fL8V/okJtqXQM/ESiWAJvt8bSyQBtbj2e5O8kOkM/NsCjljNOWeymAvH
	Rrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zQ+GT3YVqsf1PhCXFLV8e3FGpBY+LtXEOPIZ/niXE6E=;
	b=okHj/wjHDzTiFF0DjbP/WX9FY3+CrFiA4ViOF8TUEU1182TsM9tTo9uGPpp4Qu4Cv3
	Ebczs+NXcaR1J9qp/361EOJB2EoCzEeWwoBGBpZVgk68jv4VV9Y45CTkfNlLkT2y0i4E
	jQ53ML+NLQpoAx0/NL1qaecvb8wPc1PwQmt8QrQ5O9CQ6lvQuBcxYhjTfDzgBKHhhnva
	wDIDRZKhWyduGoFtAiTDqArysKLwD334YiyLUT9x22InMtTqfXDn1MpmdHxAml1rE/JZ
	jWmGNE8GdDQ0jN6IZOqNn5vAYGatJqIo7/coTTAsFvhH1U3Ldzfi7NZ0nWzYMnf7s5UV
	+BZA==
X-Gm-Message-State: ALQs6tBKeWLewdfsPkkpanuhuEDhn+6w48AdHIqNMBv9b1eXuCkUbOQ/
	1fQfSu8R3aOmrpcer0DIzyhA3jFj9wd+jebpf9k=
X-Google-Smtp-Source: AIpwx4//HXYEeBm2ely2nFBWyQgZNO9c91R4qVai1GqEOxToVswJnmc6nK0UlBujqTXUALfk3gykH+eMrl4rphheF2I=
X-Received: by 2002:a24:308e:: with SMTP id
	q136-v6mr1922466itq.9.1524116764476; 
	Wed, 18 Apr 2018 22:46:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.135 with HTTP; Wed, 18 Apr 2018 22:46:04 -0700 (PDT)
In-Reply-To: <CA+chaQd4ygCH0erc913ZcW2_9sesz1WfsECY-YtXrwTiWXOfRg@mail.gmail.com>
References: <20180418100454.3171-1-samuli.piippo@qt.io>
	<CA+chaQd4ygCH0erc913ZcW2_9sesz1WfsECY-YtXrwTiWXOfRg@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 19 Apr 2018 08:46:04 +0300
Message-ID: <CABXoSoX1_kbuDQX4UPHfcU7wEJTHvPxbLkD_kBkgXOoasjVLNg@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 05:46:03 -0000
Content-Type: text/plain; charset="UTF-8"

only needed on rocko and older. With recipe-sysroot it works correctly.

On 19 April 2018 at 08:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is it needed in sumo and master branches as well? If yes, then it should be
> applied there first.
>
> On Wed, Apr 18, 2018 at 12:04 PM, Samuli Piippo <samuli.piippo@qt.io> wrote:
>
>> mysql_config from host sysroot is found first which gives wrong paths
>> for cross-compilation. Use it from crosscompile path instead.
>>
>> Change-Id: Ia1e7d8e0c582016130f595b1be279255e9d0b055
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> ---
>>  recipes-qt/qt5/qtbase_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index 0e3a8ac..db6280f 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -119,7 +119,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
>>  PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
>>  PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb
>> xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
>>  PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
>> -PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
>> +PACKAGECONFIG[sql-mysql] = "-sql-mysql -mysql_config
>> ${STAGING_BINDIR_CROSS}/mysql_config,-no-sql-mysql,mysql5"
>>  PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
>>  PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
>>  PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

