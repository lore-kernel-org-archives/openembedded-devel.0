Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id E808E7FA20;
	Tue, 14 Jan 2020 21:55:21 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r21so13489093edq.0;
	Tue, 14 Jan 2020 13:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tM56XE/I0BubP6m/8L8jdOdJx0zQ5puojMqoc7TMdd0=;
	b=CW+twmSQHLm+X4TFKAGMyxT2LhGDLKyBWm9q1nPC11ssz29WBBc5GE4MHjq6lDO6pi
	tqW1ztqINLr35/thEH9vuEUFuMHtXZM18dvqoQ9hzUtWgLdI5YjsjVDUOp6WRM3C3AYK
	9gYPxANRzBuOaYin+lCCwf71SH7iIEpOH6RRZDxXWvpyzFXIPjlN1coewAtfquPR3v0X
	DZmYuQEXIlIc8wTyIM5cEVwfyXaJq1CEgY7MLn1To0b3R3UfLOompdoHYkdVak3Sk4wE
	0VwZdybyMt0m8ZNffyUBkZlIqVbD5yz5t3MC1Qo4uL8N6wd/Mf+JHyYZIX1V9lpufsdh
	HPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tM56XE/I0BubP6m/8L8jdOdJx0zQ5puojMqoc7TMdd0=;
	b=Y221SYkrsZ8SIaEawfli2qGowa88Sb7YzGv2dzalAqhX05oAKySa5zl9hUTfg3PvtH
	UVAek8On0q5n7RpWhJfvDBygeXNTYXo1HNOvwY6pDqVTqGsZrkNrBqJOj8wWa3qKlJlQ
	4DJQMuIHSJdyyG6vUi6tv3nVXOzDOSMAbWQ4MqvDYectkeg4ZlKDLC28ffnhbkdK1Aqq
	fZh0KQxtceUSqIkUpx6MGZs6AJC/eBuwMf/ZB8bxAdkA5dyx5UcS0sGdaPdtQBkizTRB
	A8fxcfCWt0Dle9dOj1c5YvVN4MzWw3Ppe+qncLcBcvpvySTGMaII2EulQl/vrmYhF8Es
	m8EA==
X-Gm-Message-State: APjAAAUkVBxPcCfTVCG0MYOOxEOVgtU7pEqdDDHql2CHlzPdPP4QcjH8
	/FJduDUre/18lg/6jul/A//u1bjTgdiAI2/57OK0T0j5
X-Google-Smtp-Source: APXvYqwrb1kCoI4bU4D28CNRP0NyklwBWS+rKNZdhYo/aHV7LzzwJBd876dVB3CWPCIjX/19YqOd815losfCY02aiz0=
X-Received: by 2002:aa7:d415:: with SMTP id z21mr25817057edq.264.1579038922232;
	Tue, 14 Jan 2020 13:55:22 -0800 (PST)
MIME-Version: 1.0
References: <157903709591.16469.5017474364348868055@git.openembedded.org>
	<20200114212458.07B2B232B91@git.openembedded.org>
In-Reply-To: <20200114212458.07B2B232B91@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Jan 2020 22:55:10 +0100
Message-ID: <CA+chaQdbbzzGQRxRvyKe2HXhoFZw0ySRNvR3qD5XUFz9CQofBg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 28/29: sstatesig: Improve debug output if getpwuid() fails
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
X-List-Received-Date: Tue, 14 Jan 2020 21:55:22 -0000
Content-Type: text/plain; charset="UTF-8"

Would it makes sense to print the exception in the same bb.warn, so that
the missing UID is written in the same line as the path - not in the
exception stack trace printed after? But maybe it's not important as with
raise there will always be just one exception like this and it will be
printed immediately after (while in my debug before I was listing all the
files with this issue without leaving the build to fail).

On Tue, Jan 14, 2020 at 10:25 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit 237b805cd97cede15a0a2985e80d7b79d78db880
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Tue Jan 14 21:05:10 2020 +0000
>
>     sstatesig: Improve debug output if getpwuid() fails
>
>     If getpwduid fails, we don't see which file it failed on which is key
> information
>     to aid debugging. Print this information when exceptions are raised.
>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oe/sstatesig.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 0e17ad6..4325b66 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -541,8 +541,12 @@ def OEOuthashBasic(path, sigfile, task, d):
>                      add_perm(stat.S_IXOTH, 'x')
>
>                  if include_owners:
> -                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
> -                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
> +                    try:
> +                        update_hash(" %10s" %
> pwd.getpwuid(s.st_uid).pw_name)
> +                        update_hash(" %10s" %
> grp.getgrgid(s.st_gid).gr_name)
> +                    except KeyError:
> +                        bb.warn("KeyError in %s" % path)
> +                        raise
>
>                  update_hash(" ")
>                  if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

