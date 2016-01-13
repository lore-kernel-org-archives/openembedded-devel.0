Return-Path: <brunovern.a@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 73A7A731D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:12:48 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id h129so56852779lfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 02:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=7yKqA4CZf3K0jzwOh9+DZrVYQit2unfkAbwJFExHxc4=;
	b=hDQjzNkZ2YfOaKr3/bLeOYxwZWeOC6lUhMpUPrRLaVF8cEbOAq49HZH7LCHiKt8DW9
	uoUJpB1f/ne6UN25Zzlv+NjPIpnKRiXGmTWkZ7WXrgpamIzNI/w2so5vAY7NjZIpRCUe
	Ox0LaoO8ZzMIHSbT0bK60Kkmsu7w2Atu/dHKoBYNh9NjR6GbsXNlsjAqkqCX2zHgDD9c
	ct9gVrjn5bLJyzsWYMwhIhS+NRWa4BdmT5sEKTZ6ngi42SXOODHey2+cBkCf6ILVuqtJ
	Njr3m6B3AElLQ7SBeAEWTXsvKdpiuxBJxKbEt9woKEBXlEP4sNVKxs+pe8iGwRFxNryD
	4Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=7yKqA4CZf3K0jzwOh9+DZrVYQit2unfkAbwJFExHxc4=;
	b=W95M2omi0QLzTgYdYxYdwaSfKH/quXNLlcv3m18Bf1APAx2OvB44me2VF0btViEwIL
	bjCH9WA8lblKSV7PpVfKFcnf+fnE8LP6gIigQJHvaYH7vTJwIJ0p9agqz7/jWsYCP/2s
	liAnKbPuakyyHSO8wohppZQ6tR+ZFXoZkh+NBUG5Ikubt4dhJmgun3eR5EJukvTqr5Ro
	sfop5S+AxPK+xc+h6AXxKgP0IyMUBgPJ9NmZ141NwwCBUyvmyGiplTIwL0t/fPjYG8G8
	hNi+Pb/M403NKRWIiocHAYIx/paiGp/e00ekvCYRfgy52NXBldzYmwHaLVR5eDEV9IIG
	Uo4g==
X-Gm-Message-State: ALoCoQmUTQvJHsp9jfCd9axZDLWKQ6xzCb9xPbM12Ei6DDhPgHKjWrzOtR3sV/SLEoS6jxMF/CYuh3H/2a7gH/VHK6E3hOkg9w==
X-Received: by 10.25.167.74 with SMTP id q71mr28114777lfe.22.1452679968455;
	Wed, 13 Jan 2016 02:12:48 -0800 (PST)
MIME-Version: 1.0
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
In-Reply-To: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Wed, 13 Jan 2016 10:12:38 +0000
Message-ID: <CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] OpenLDAP modules
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
X-List-Received-Date: Wed, 13 Jan 2016 10:12:48 -0000
Content-Type: text/plain; charset=UTF-8

To get the all the required files, I had to add the openldap-dev package.
Also the data dir: /var/openldap-data is not created by the recipe.
Regards

On Tue, Jan 12, 2016 at 1:51 PM Bruno Vernay <brunovern.a@gmail.com> wrote:

> Hi
> It seems that OpenLDAP modules are build, but not all files are installed
> on the target.
> I created an issue in GitHub:
> https://github.com/openembedded/meta-openembedded/issues/21
>
> Also I could not find any example or documentation on how to use this
> recipe (had to look at the code and trial and error). Is it the way to go
> or is there a place to contribute examples at least?
>
> Regards
> Bruno
>
>

