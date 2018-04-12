Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A88917454C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 14:30:59 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l16so6258018wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tFJAMDZsk/rJplOaj3llCYzUozrjNrM2Ypwr7qmAN4E=;
	b=XqDZVdMhoCOWt+ofQZmfUa2JN+UF0ilZXQaJhboD3oUpOLWeosSBIuaNBJcw+NP9Il
	X6OQlu3fpR9Mn+2o/FsVaLBKrmOWkbOayk0g1q5bSlqPLIrFS358BWfp5VAP86zL/N/0
	jdnmFtFGE+B46wn6V1dKrH91DWHEKJU+lj5Zr+T06wcHwRoVA2Y25lyyW/48CYBWthHc
	eiH6FbS2UbaYaAxqBGbktueETPTyMGQG+50DWX57s0YuNfs0RUmmDDYDvjYG+o1nebD5
	NtLmaBNifE+Nb/2VJiFndfZt49lLddQIzPuf27gJcckHmdw33/JDQMEXHuF00cRgafA4
	ps8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tFJAMDZsk/rJplOaj3llCYzUozrjNrM2Ypwr7qmAN4E=;
	b=VN8Ano2IKwrrr2E6r8ORqOdE3pqsxArWqnc2P1wJ/eP8P2JGUWMczFZm762uQuNTWj
	GLTmASAxoUdhAOxHYA0jHPFzolrEzaoiDJMkyVd9ccU9/wBBQBscbESMuugrDZvohxF0
	Fss/GigN8LPFAhl011On5S/skAkSBwzD+c5ASIQyRjJ1pRuQZjfk3j6M1qT2jV7mkPiw
	oOPI7yuA7O61Vct3SVIorA41lNOa3zmOQuwb1/7TdzaR5a9RAVtZ2jNMsAmmFfEBH5hm
	8UTaPWMSveYC+FmGuBnD9YmSWoaaZAoZd1eK9b2BXCXjbvdt+cH5Z3HOkYxqzN36zGSD
	zLvw==
X-Gm-Message-State: ALQs6tD91y8pBGJbHY1N9140gXQm+8VZx3wzkkfjW3Ty5yhLxImYsAJq
	6hxblrHc4JLdYKAgG9Py3rSiAVOQIGyy3abJN3gStg==
X-Google-Smtp-Source: AIpwx48Vw0xdun2X68+dVyKaq7zTsWh8lyTMqO0tMn+cvlTw6Sqnz3VDAKk93l3WsbspXw//0Cgbl1lTIzsSI6YemZw=
X-Received: by 10.28.15.15 with SMTP id 15mr909192wmp.60.1523543460051; Thu,
	12 Apr 2018 07:31:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Thu, 12 Apr 2018 07:30:59 -0700 (PDT)
In-Reply-To: <7f04089b-7479-2575-6d91-8887118d19f8@zonque.org>
References: <20180412133558.9655-1-Martin.Jansa@gmail.com>
	<7f04089b-7479-2575-6d91-8887118d19f8@zonque.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Apr 2018 16:30:59 +0200
Message-ID: <CA+chaQcg-01rq7Nq1iGZM80Cce1wN-g-gDc1iNS4RC3QJBhw8Q@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][rocko][WIP][PATCH] qt5: upgrade to 5.9.5
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
X-List-Received-Date: Thu, 12 Apr 2018 14:31:00 -0000
Content-Type: text/plain; charset="UTF-8"

>  Also, I guess you also need to bump the version number in recipes-qt/qt5/qt5-git.inc,
right?

Right I forgot to squash that change to this one. Well that's one of the
reasons why this have [WIP] in subject.

Were you testing it on top of latest rocko branch? Your errors show
;nobranch=1 which shouldn't be there since:
https://github.com/meta-qt5/meta-qt5/commit/32bb7d18a08d1c48873d7ab6332d4cc3815a4dff

And for the errors we need to wait until github mirror is synced again:
latest commit on codereview.qt-project.org is 28 hours old and that's what
is now in SRCREV:
https://codereview.qt-project.org/gitweb?p=qt%2Fqtbase.git;a=shortlog;h=refs%2Fheads%2F5.9

but github is 1,5 month behind missing last 35 commits:
https://github.com/qt/qtbase/commits/5.9

Hopefully this issue with github mirror is only temporary and will be fixed
soon.

On Thu, Apr 12, 2018 at 4:12 PM, Daniel Mack <daniel@zonque.org> wrote:

> On Thursday, April 12, 2018 03:35 PM, Martin Jansa wrote:
> > * use latest revision from 5.9, because 5.9.5 tag is only on 5.9.5
> >   branch which might get removed in future I was told
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> I'm getting the following errors with this patch:
>
> WARNING: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Failed
> to fetch URL
> git://github.com/qt/qtxmlpatterns.git;name=qtxmlpatterns;branch=5.9;
> nobranch=1;protocol=git,
> attempting MIRRORS if available
> ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Fetcher
> failure: Unable to find revision
> 3444bfc8039c5090b02fd7f98abe8064a73019d7 in branch 5.9 even from upstream
> ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Fetcher
> failure for URL:
> 'git://github.com/qt/qtxmlpatterns.git;name=qtxmlpatterns;branch=5.9;
> nobranch=1;protocol=git'.
> Unable to fetch URL from any source.
> ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Function
> failed: base_do_fetch
> ERROR: Logfile of failure stored in:
> /home/daniel/src/nepos/poky/build/tmp-glibc/work/aarch64-
> nepos-linux/qtxmlpatterns/5.9.4+gitAUTOINC+3444bfc803-r0/
> temp/log.do_fetch.3513
> ERROR: Task
> (/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/
> recipes-qt/qt5/qtxmlpatterns_git.bb:do_fetch)
> failed with exit code '1'
> WARNING: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Failed
> to fetch URL
> git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
> nobranch=1;protocol=git,
> attempting MIRRORS if available
> ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher
> failure: Unable to find revision
> f2095f2c66d0dae8525879f6c14165ace650e7f1 in branch 5.9 even from upstream
> ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher
> failure for URL:
> 'git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
> nobranch=1;protocol=git'.
> Unable to fetch URL from any source.
> ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Function
> failed: base_do_fetch
> ERROR: Logfile of failure stored in:
> /home/daniel/src/nepos/poky/build/tmp-glibc/work/x86_64-
> linux/qtbase-native/5.9.4+gitAUTOINC+f2095f2c66-r0/temp/log.do_fetch.3509
> ERROR: Task
> (/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/
> recipes-qt/qt5/qtbase-native_git.bb:do_fetch)
> failed with exit code '1'
> WARNING: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Failed to fetch
> URL
> git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
> nobranch=1;protocol=git,
> attempting MIRRORS if available
> ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher failure:
> Unable to find revision f2095f2c66d0dae8525879f6c14165ace650e7f1 in
> branch 5.9 even from upstream
> ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher failure
> for URL:
> 'git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;
> nobranch=1;protocol=git'.
> Unable to fetch URL from any source.
> ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Function failed:
> base_do_fetch
> ERROR: Logfile of failure stored in:
> /home/daniel/src/nepos/poky/build/tmp-glibc/work/aarch64-
> nepos-linux/qtbase/5.9.4+gitAUTOINC+f2095f2c66-r0/temp/log.do_fetch.3511
> ERROR: Task
> (/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/
> recipes-qt/qt5/qtbase_git.bb:do_fetch)
> failed with exit code '1'
>
>
>
> Also, I guess you also need to bump the version number in
> recipes-qt/qt5/qt5-git.inc, right?
>
>
> Thanks,
> Daniel
>

