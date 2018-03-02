Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB0071993
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:17:10 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id w63so2442048ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 09:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Guo2koL7e0iIK6gsb5GXE8WpUJxeR0GffJTakp4AG58=;
	b=M4CZkqe+9nNJZadfcW+bukivwx2e6BM7VjWExbObTTv9kxGmYVWblw00O7QzGhhYmb
	9/n+o0JaPdYWwc4cLFcKpTUfDujJ+1TLPXflWEZrx9/MFbsHDu0+HIFRmTvgTEgnqEkr
	fJ6mHWgunnHnUeq34Cg3iobovY4bNSGe+Io88iF1Y47/7KZqq/brIFYqr17r2wDRjUQF
	HC/BR03afIxeNTiqr1cO2S1NgiCEp7A04s5EQkg6c0Xxc+jQbi6KdeQX9VZKkj9QBu/R
	+hpQ1MBDoyk82h36pnXTV4wu+9IW2Q0qa+X3IOZ5aVXwggcU7E98ie94yL1MD0Jfi+8F
	5Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Guo2koL7e0iIK6gsb5GXE8WpUJxeR0GffJTakp4AG58=;
	b=tIh2hQV3UXOswPygnrWvCdHtix7x3bEVEEV8ev2j2T04sJ5MU+Lj08lEG4bJLtDDbF
	YVR8FWA8wrV0U4C2VwHunDTFXbH7QtVyAmuwBx6JeHoaEAoO0kKDX13DqjeO1x98TCzu
	lU5+G3z8Df0VR7hf5BuZGQT2y5q8OF3wrs0wBHnlAF03wTiPOmYUs0hRc5kK/12i6y2/
	xr1lITz4UccGT9yqjsDkBzVA2aUmlVRkyYrDL4UDwb2dUs04E1OSMhvwTp8pjc//OAz9
	S54vIu3FXe8flZ5MYOYepoWgZ3FCJKlG+67lu/DAKz0umvc3STuztYiYzcvOkE+RxMKu
	syuw==
X-Gm-Message-State: AElRT7HzmLPJcDP7Y+PdWfnUWWehm7gOCkbaf+gRPaV3Ufa0nFmBLBwH
	yFFxer1Qt1VfdAC0EuIS4L846fz1vioCgv4grkOJ8A==
X-Google-Smtp-Source: AG47ELv/+bWJn9Ox+q6XcNSd0varETIjWyrygc6wBLwiI+N9zWdoSJUXx74HbXlDv32DVrEW7EGKsxu0HxTxhX3Qg3E=
X-Received: by 10.36.81.196 with SMTP id s187mr3402819ita.139.1520011032162;
	Fri, 02 Mar 2018 09:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20180302170307.jmf5hyru6lwv6kjq@mbedesk.sonatest.net>
In-Reply-To: <20180302170307.jmf5hyru6lwv6kjq@mbedesk.sonatest.net>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Fri, 02 Mar 2018 17:17:01 +0000
Message-ID: <CAE=T-s72xDp1uwWSeB3si3Nyq3r=SYhoEgJHscyOkmCqsv6cjg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: meta-python/python-matplotlib
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
X-List-Received-Date: Fri, 02 Mar 2018 17:17:11 -0000
Content-Type: text/plain; charset="UTF-8"

It should read

"
python
import matplotlib.pyplot as plt
"

instead of

"
python
import matplotlib.plot as plt
"

On Fri, Mar 2, 2018 at 12:03 PM Maxime Roussin-Belanger <
maxime.roussinbelanger@gmail.com> wrote:

> When I run matplotlib in a genericx86-64 image it's missing the dependency,
> python-cycler.
>
> I patch that dependency, and then run it again with
>
> "
> python
> import matplotlib.plot as plt
> "
>
> Now I get another missing dependency "Cannot import name '_path'"
>
> I've tried to make it work, but alas. Have any other developers encountered
> this problem?
>
> Is it a problem with the recipe itself?
>
> Thanks,
> Max
>
> --
Max

