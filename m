Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id 34FF66BA10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 19:06:40 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id m140so4790179itg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=97IVj6ASWqGvKC87EEO2B4mykIXmsAec3euEQb+Vokw=;
	b=RhwucgY7s6V86B3cKs2bw4I/S3+CRMTZ2VNAjjYbBxPod7BYhI6XJth6cgzRus3a4B
	4Lt7VhbmlvVCySceCOq+qS9zlKw5SKkfUjzuU8+dtCz3z4MVKJ3dHQEoZUTHI/SYRnNO
	FFSPejXFDoIALchtgy08Okc324mEa8AGr48ZT4KirTdJ+GUH0FoNpmPM/5ewA+fKOW7S
	8W1Ve5hae3TqLdqODltcNaPvDWBwU6v9oQ6fIrn5su+GD3fZPIlxv9ixN7TLqI2gecV5
	nRC+qpY0a1Qlqz68DKZ6L22nbe0i/2/LqEynQzX88XYQOdY7m6QBDP1WQAxlN6bbsz93
	kPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=97IVj6ASWqGvKC87EEO2B4mykIXmsAec3euEQb+Vokw=;
	b=uGuiEC84kZo+OPb3+gXn4Baeu1gBlVM8DsVtNXJnPKM3nLJ5YmzNcZrZgHbD6FV/ni
	AExZHAKEBiGUtvScbiR2H/RnwCkYh+h2+f/fR/4X8TBn3i4xhC51+HwOWzr4/gFEE3mK
	oL9a/M7UHKBz8a0C/kPCRF33YcxBF4WhcN9J2BC6QcxPFSy4ZsjKQMA7ufdtiXPjLAoS
	IY+pLrvO8ENPB70IBid3SUOjn0GFDIrnVJD/8nkGTyxzS+Sp5TvV8bB4EFHo20rVwlmA
	44mNv0z05pnMmE4FOIqGLkSyeuhzq7ISHNti49EpW4Ae7Nn5i43l3zJXU6wc8e5cFnkZ
	SDMg==
X-Gm-Message-State: APjAAAXpnIca1EaNvjjS22QXfowiUOYJRpzajk73YN+4cpk7lY8HYt5Y
	sjRHyP69UHuZQDB3N7ZIJHGYkRUOuX5TaSjflkynBYOy
X-Google-Smtp-Source: APXvYqwPds4/NcwJADyF8wdmBp7wT2LnQCFi9IR5OgMLkveKXpItJh8VwzYx/JYpCyamu4LYDMjDvd/u7LGJC86EUQI=
X-Received: by 2002:a24:ee03:: with SMTP id b3mr9521428iti.158.1558552002077; 
	Wed, 22 May 2019 12:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.6750B23534D@git.openembedded.org>
In-Reply-To: <20190522154956.6750B23534D@git.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 22 May 2019 21:06:30 +0200
Message-ID: <CALbNGRS52_LUD8pDuE-cXt5PK8Pqf-TZbFyQdcgGxQanZNx3vg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe-commits] [meta-openembedded] 02/09: mozjs: Upgrade to version 60.x
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
X-List-Received-Date: Wed, 22 May 2019 19:06:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
>
> This is an automated email from the git hooks/post-receive script.
>
> khem pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 8587370567e7f2f398ae1efa77989b1110d15a77
> Author: Khem Raj <raj.khem@gmail.com>
> AuthorDate: Tue May 21 23:27:16 2019 -0700
>
>     mozjs: Upgrade to version 60.x
>
Haven't found this on mailing list so:

I ve done similar here and I saw that

* musl patch can go (tested)
* polkit needs update - current version requires mozjs 52.x (shall I
send the patch I have already?)

Andreas

