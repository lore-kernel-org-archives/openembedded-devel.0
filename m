Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA0F67FA98
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 21:11:13 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id h9so12415447ioh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xEaqyqZGr/FsUtgZOkrGmKOBLmR6ZCtVi+Tt4zsqrqw=;
	b=lqt4cbHmU6EDKscIF4UMNhdVugQelLWrOy482KBymjPi8KP738WRaG7E0hB/3weqx1
	dPul1uyixopxUmLbzpqg3k3W8jkHMt+PijkiCkDvlotZzy6l/u301ROhzeAlqq0fgKU4
	T9GDtFCFFTz9Y0yIPvdZcF0Vcj6RGdyCAJd806pBosAaog5xuafLqOg5eo2uptDfxLJi
	B6UuPDjkereTOcKOjzmpi6/92v6CBHEC6yjkHks3yQAGIauVlAPy8rGHEyhip6ZC8nOK
	rVlh4DM2EQlF7l5F8CQn91fSS6dhLjYce7i/xYn6Pf8rrXSQLkkZ3UYQbLpYYxa6hBpO
	Cnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xEaqyqZGr/FsUtgZOkrGmKOBLmR6ZCtVi+Tt4zsqrqw=;
	b=poO+uR7k5yZbZ/t1T2g8hwqMAAR8QYXtGNKe7vaROGTWwQ+oYMOvDO1PjPpZ4KQ8si
	pJLqfVmcHttfqwNxNOdZo88fTfSwIyXOtAaKZOiTcLh7JEiUWKQvTbJsoP+jQfuC56wf
	Dw308DhsPnpVYzY4sWy6pASsyi6uFJVVAapiG5mn9o40XQcg7f3U4/9Kk8zHQFQznbhu
	dh8f1t4XkGwOY76MOKawjdebikt5j4Fc70xD2Z8G3lxXvH6+SuLlcVqu4lRBxkqX1g8g
	x9zXDsh+xny9tjG5262n2Sz02hSaNzjOmPtJZRE29IpDyvCiDVzxGYsI29VQxn4eU6j2
	8asg==
X-Gm-Message-State: APjAAAXppl27l6GhpfLD9gPUeCzI8eRb4Xc3s6CVLTOhraX3jYyLIGxf
	CSeUO5xgFhZ104DFdTAaWYYZlnHrroN+g+ljOaY=
X-Google-Smtp-Source: APXvYqwAjFCd8DDp6L+nFvK7C5NEkJoHiemqXmCGpRi/p42hZYQ5aKpizlyVTh/IeQFn+Bl6iIL99fGYtOFejJMlIiE=
X-Received: by 2002:a05:6638:928:: with SMTP id
	8mr18759644jak.124.1572297074758; 
	Mon, 28 Oct 2019 14:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
	<20191027233545.4146-16-schnitzeltony@gmail.com>
	<CAMKF1sp17i93Od+zEiRP3d5dNG0B2E0iSYhWbBaK4-hdwT-bbQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp17i93Od+zEiRP3d5dNG0B2E0iSYhWbBaK4-hdwT-bbQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 28 Oct 2019 22:11:03 +0100
Message-ID: <CALbNGRRbMbzGDQCqE2RGxSTiNV1hFHPEyd4kNUKG_HEQnJwgwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 15/19] glade3: upgrade 3.8.5 -> 3.8.6
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
X-List-Received-Date: Mon, 28 Oct 2019 21:11:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 28, 2019 at 9:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/274843/
>
Forgot to add itstool to inherit - oh I wish my environment would be
closer to autobuilder...

Andreas

