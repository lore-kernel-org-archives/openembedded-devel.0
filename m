Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8E57871C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 17:06:19 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r78so17281318wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SzWHqpF32lY3/cCjgaKCQuxLv/TsxNsubl1Jqo6KVzw=;
	b=QpamqYc1uKrYu0wXRyEIgkAZKoB0rnfpGFIrLSfJYfxXvwgVz0MyUTK0XEW8MJAij9
	Lg4ef0RhSmCx2zKVweij7VHdo/TS1rOyDG7cM2wvXpyfC73kYhqYe+PbIuOyHmnGZpvs
	Hbg7sslpmaD3h/Cgjjf23fLfy+XRAYze/sh6jTQSsjemndoGpGZLsa0UEsitgODNtC+I
	zaNIkbPFQzEdwG+c87ZO9nzFs72PXkWrM3UNu15hAXrHcjmoGdRwcWz1YWkn0260y5h5
	Fq9v9xfoB61J5NGi3me/t6f2F389YkgyTvZfT+ovSatBy84CBso4DHiQrZ/ufnEFVr/g
	+lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SzWHqpF32lY3/cCjgaKCQuxLv/TsxNsubl1Jqo6KVzw=;
	b=sHkIsrpG02nghOwK0r9lCNlXCZIqnnOLwpMPWzIAJV+zr+N5C+8PqPqtPRWw6r5QMU
	4Va6TKXGChYWtUQsk4ZG5a0NPtqZoEjvE4d+KAjIYJ2gqyo+tsDQkYVk4R8STsIQxN0n
	VJUPZdTjRSN749RhJf/U5vkZoPpAJdiBoHD8MRj4dDhNd/YCeBJHx6Xrqf2KN3QvCGyo
	4HRSsDjOdK/1ycmRIDPKB8MttYrFkyFga9n8PVPuN4jIwPZVoo9LJ2wZ8sckmr9w8Bc7
	o4YxoLD1BwtdC9G5r5qk4YySQC+r4sKCHoyacs6oDo97RmraJxl1gQiq/5OMz3lMuzej
	evZQ==
X-Gm-Message-State: AKwxytfZP6K5FKX/AAC/kSYH5Bzu17Z7bPx5KGbd0/hqIUL38dGocVpW
	K7lRDeu/hIc/8HVH0Zc/GragE42qJhg9SRh3ONOslQ==
X-Google-Smtp-Source: ACJfBotXjKV08WOyp6tqIUP3YQXzhBJaTfRgBSk7+50NgAB6YWOOaB6yolU8yk5VI7wHIi8KzgI4CUVBVk4/TCe/vio=
X-Received: by 10.28.109.79 with SMTP id i76mr2575052wmc.142.1516208780799;
	Wed, 17 Jan 2018 09:06:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Wed, 17 Jan 2018 09:06:19 -0800 (PST)
In-Reply-To: <CAP9ODKryMRC89jUui6wtsZii8Q_WHhGhrtRT=so019oHzLUjLA@mail.gmail.com>
References: <CAP9ODKryMRC89jUui6wtsZii8Q_WHhGhrtRT=so019oHzLUjLA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Jan 2018 18:06:19 +0100
Message-ID: <CA+chaQdZE_4orLtqrQezX8bLFyb_kH3xMbW6OG07uobgNZ7_kw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: qtbase failing due host contamination
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
X-List-Received-Date: Wed, 17 Jan 2018 17:06:20 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, I'm seeing these errors on various files (including qtbase, e.g.
ERROR: QA Issue: qtbase:
/qtbase-mkspecs/usr/lib/mkspecs/modules/qt_lib_core.pri is owned by uid
1101, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]) for some time.

There is Yocto ticket with more details:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434

On Wed, Jan 17, 2018 at 12:19 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello folks,
>
> Did someone see:
>
> ERROR: qtbase-5.9.3+gitAUTOINC+4d8ae444c2-r0 do_package_qa: QA Issue:
> qtbase: /qtbase-staticdev/usr/lib/libQt5PlatformCompositorSupport.a is
> owned by uid 1001, which is the same as the user running bitbake. This
> may be due to host contamination [host-user-contaminated]
>
> In any builds?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

