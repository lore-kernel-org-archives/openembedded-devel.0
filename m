Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1D69B6C3EF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 05:18:32 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id o125so43921792qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 21:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=miLU/sO9JK/e97BDLmc+8cnGsZivXSo4WXUNZ2/4SEc=;
	b=WvRsu4chG053bQcvseN82tOg2LDAVkAkn5MPXBzwDt8x52T1D0i3/YKEZ8G8/wi1wL
	Sa4R+Cs+f0OwTcj66H1f9x/QtPTARpT2JZLg3TWrF26nKBHcUsmfGY3jTu+FUpFB+bn+
	8wYd6noYu8kLzjw+OlwiHe5Z9U5Ri4AdcIIj5Z8usyTfTaobmymCBYOa9Ct/Rli9m6Oc
	1EcJsBfuMOwsFgqW6vYKwEZiLqg2XXTB6AXnB0mbOK1jgnAUuI1b7hvUwRcDbjjO+56N
	M16QhNtxkX97kEv8baLRDEDrJxYfwvxnmIyDEqGZJCtw+Nn9B4d2ayDoMQXHCkyI5lOD
	6BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=miLU/sO9JK/e97BDLmc+8cnGsZivXSo4WXUNZ2/4SEc=;
	b=NvZ/BjKbZytcItKYMWU1WAIr6YGMnxx8ZbMdpndtABNp10tARZlId/qqwXtEStA6k3
	qfugm3bu2g5ByqRtNcX3tw01xWr290E40OzePRuagarPpW2AppHV9MMUI37I60gK4efz
	yfKdNyA+wFZvb4mI9fPxCTirmS3WKerpiRJxyqqe+U0JkilQUORobAGuo7/2eYb8ARDr
	ROaSEXMZpeaPtZHkNG4up+yt4GFLBfcy50VEaK3/KZwAuN3WH4sJ/GbWOb9hoXRvGus9
	PwZ4YGhobB3ltczLJNbOMw7ckHr046LqA3/Riv41Vs8/3fLLnOxGK2ODYbgmHx1qF5Nr
	93Eg==
X-Gm-Message-State: AGRZ1gIN3FfzmIM+UPqtQyAffR9utgTy9Ms3xuIvnoMittnPhye43W0A
	jt0FgVY+N85MggJXhNDaIIFYq1UOvqkFk/H7M4Q=
X-Google-Smtp-Source: AJdET5d2wQsM3pdjynWsMsFftMeXOvoEvjFr3kBLbANISmyW9E42kahD1AZr6lO/sysB+2qNjGWvk3lW29mz3MkK+uo=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr16223171qvd.224.1542518313684;
	Sat, 17 Nov 2018 21:18:33 -0800 (PST)
MIME-Version: 1.0
References: <CA+2FH0+dA+YDr6cU-WbXAXX5EmH7CnO4CDxWgtXy-680KF5FyA@mail.gmail.com>
	<CA+2FH0K_gV1i-kXHYAEdEemcE6NaqXhci-fd0eeB6cirL0Yjrg@mail.gmail.com>
In-Reply-To: <CA+2FH0K_gV1i-kXHYAEdEemcE6NaqXhci-fd0eeB6cirL0Yjrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Nov 2018 21:18:22 -0800
Message-ID: <CAMKF1sqCx2Zgteicu9XmQ=qE+_vtc6MgG-Np1JnvT_MtYVMgoQ@mail.gmail.com>
To: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia] Add a working Tvheadend recipe
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
X-List-Received-Date: Sun, 18 Nov 2018 05:18:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 17, 2018 at 1:44 PM Peter Ba=C5=A1ista <pbasista@gmail.com> wro=
te:

> Hi,
>
> a few months ago, I have created a PR on GitHub about adding a working
> Tvheadend recipe:
>
> https://github.com/openembedded/meta-openembedded/pull/91
>
> I would like to have it merged, because I believe that Tvheadend can be
> very helpful with setting up a TV streaming server on linux-based DVB
> receivers.
>
> But it seems like no one has looked into it yet. Therefore, I would like =
to
> ask here how the process works.
>

Thanks for asking here usual process is to submit patches to
openembedded-devel mailing list

GitHub repos are primarily for mirroring we do not use it to run
contributions yet

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded



> Thank you.
>
> Regards
> Peter Ba=C5=A1ista
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

