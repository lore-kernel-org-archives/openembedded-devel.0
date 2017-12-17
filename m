Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id EE5D160123
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:48:45 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id 69so9457086ybc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NK9q15+dQVNxo5mCXkKUyBdAPSej8WgoNTtU+rwDSGY=;
	b=uD032G4pFgLyZoVJFwAfbx54Rv4hBNPis1iKgjoYz2sttunwcwQdSXfXU2U9ZsStn/
	OBP9GFF/t9+BskpY59xtglAz4CEXWCc1PpnSPLcDcWL8DHLEmgdqUM2jQ7V59Kwuhd5i
	H86Gchn8aAnsgtQdY9RPSTaW+jsktGzXayvGyop3VhK8mw5ZMSehu2YRrElzlBG7sFQ/
	g7Sncy9o+VmOt2GaDbExoZp3CNtjHiL9jVkh/xkbI4GX0qRnuOGgKyhVesrovTYzTQUH
	3gNv4j2UQZ0ic99QQhZlfdmgFSdKwwTo0BwgmGocBnwTH3ZtZpQplIdmKSL4K4F1Am1E
	OMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NK9q15+dQVNxo5mCXkKUyBdAPSej8WgoNTtU+rwDSGY=;
	b=T+jwsWxdCmTZpKgDTmYE0Y4Lfq1swg3l3nqaUGlIX8dpGMkKzJFl1bPAz6j7OjN4ok
	ZZibSTNg65E43P64Y6HMWRlonvmRB6TzCwp3PLXNyV/VxFkGxxYQv+GU9L0Sd5xwZh/p
	Ywv2F1BHRYHVqRzMxysmJbvF7wja9a9fCZhm8L9yOvuqrESsdN2n2wKzDXfZ/iXNXwot
	qiZQ6UWau+bEGh7hWcTAzvL5FDZC7oUjSOFnKEDoNi7mSlfq9TUfsXHGx6s3dDtGTtu1
	iXmRVtuq5ElvRy3YgFaPKVkjTttoUfbusc+oo7pp+gYExgQ2TK6TmMu+HyEI3eQsi6TS
	xmeA==
X-Gm-Message-State: AKGB3mKEoPICywaEgAcJ6ctu90YTD91W7Ui6BLFTfFwIz54D+BrcnOOE
	I83NvPlPjlbm6k0mNpbSelJ5wWcjS/T/l86OMDI=
X-Google-Smtp-Source: ACJfBou3U5TeAtYzUgyZJZXhjZS3PGDwwb7+yILsl+TGzzKowRemtrTa18jMyl9AcEHCCe9sCRAJ0lGPnyZmOS6vlAU=
X-Received: by 10.37.197.143 with SMTP id v137mr3203237ybe.368.1513529326669; 
	Sun, 17 Dec 2017 08:48:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.97.6 with HTTP; Sun, 17 Dec 2017 08:48:46 -0800 (PST)
In-Reply-To: <20171214100929.11094-1-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 17 Dec 2017 17:48:46 +0100
Message-ID: <CALbNGRTV2evX1efqP-76=AzQegO4OXv5x10pCjdKkHSmhM2P6A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: akuster <akuster@mvista.com>
Subject: Re: [PATCH 0/5] few fixes
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
X-List-Received-Date: Sun, 17 Dec 2017 16:48:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 11:09 AM, Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
wrote:

> The following changes since commit acfb8417e370d017e7307872e61564
> deeda76a13:
>
>   python3-dominate: new recipe (2017-12-11 07:58:58 -0800)
>
> are available in the git repository at:
>
>   https://github.com/schnitzeltony/meta-openembedded.git patches
>
> for you to fetch changes up to 77a0b0909e81f350e7c00d0e3b613a49656a0ed7:
>
>   plymouth: fix path to systemd-tty-ask-password-agent (2017-12-14
> 11:02:54 +0100)
>
> ----------------------------------------------------------------
> Andreas M=C3=BCller (5):
>       fltk: add -fPIC to compile flags
>       gvfs: update 1.32.1 -> 1.34.1
>       plymouth: do not install systemd units manually
>       plymouth: packageconfig gtk needs gtk+3 as depends
>       plymouth: fix path to systemd-tty-ask-password-agent
>
> Please ignore this series. I will send out reworked V2 within the next
hours.

Andreas

