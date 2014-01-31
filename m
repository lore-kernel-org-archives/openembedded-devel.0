Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8DED76E987
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:47:30 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so25284058ykt.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=OEBJ9dSRpb0BUxW4rd234Xnp26ikf2vFrf21Bh1H9X4=;
	b=Eb8iKeyKF3GRwoTq9nnwNEp8kHwhvI0qEXgl10zj2Fv+j8wcOXODby+ae7LOeLBxXc
	uSxOJcLu3uZDZs1lCeE8n/4pi2Vy8Obh8/+WVM10cw1Itj+b8LZ3dg759c+PstZjuLlt
	Qd1SN5YOE71s1/l1jhrS+1a47X8UjXPy9MEl8EMjXSe1dXq5wIPtim+EqU3PxSkL17jj
	yb5NCoAxFba78vcpJaV4SpDluIqd8mTqmBg7LiBl6t4Wy0vq2eHhHURj68rJ4WtOX7Hv
	l5BpSdWZGUkXH14UNnsbffsBSXq+5oHd7XU8niekatYiP5dqSuX8X6cjRQFmDBxbaYZv
	2pAg==
MIME-Version: 1.0
X-Received: by 10.236.15.102 with SMTP id e66mr2746192yhe.69.1391190451007;
	Fri, 31 Jan 2014 09:47:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.62.84 with HTTP; Fri, 31 Jan 2014 09:47:30 -0800 (PST)
In-Reply-To: <CAMCfZKFg-39ZX0hpWxbYLQSz0eo-6NW9This3Kcg6D600-w9Yg@mail.gmail.com>
References: <CAMCfZKEwQWimV0j8FE1Z1KVW=xUCZgR36_Li1fNuiZfwYm7yrA@mail.gmail.com>
	<CAP9ODKp_JRLSYgh_LrUjtsUkG9_FLibNbmYuoa-gPRkVxyLxqg@mail.gmail.com>
	<CAMCfZKFg-39ZX0hpWxbYLQSz0eo-6NW9This3Kcg6D600-w9Yg@mail.gmail.com>
Date: Fri, 31 Jan 2014 15:47:30 -0200
X-Google-Sender-Auth: HmywSzdc7fau3kT0OOUjrNt41Qc
Message-ID: <CAP9ODKr+PSfPthrzi+khaFKVUU4FFNYY-Dop03mhjmFphBSnDw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Systemd journald (206) storage issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2014 17:47:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Diego,

On Fri, Jan 31, 2014 at 3:35 PM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> On Wed, Jan 29, 2014 at 6:26 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:
>
>> Please isolate the patch which fixes the issue in 208 so we can
>> backport it to the Dora version.
>>
>
> Otavio,
> I found this bug on systemd project:
> Bug 68161 - journalctl ignored disk space restrictions
> https://bugs.freedesktop.org/show_bug.cgi?id=68161
>
> And applied these patches:
> http://cgit.freedesktop.org/systemd/systemd/commit/?id=629bfc5a
> http://cgit.freedesktop.org/systemd/systemd/commit/?id=48979861
>
> I tested and it solved the issue.
>
> Should I have to send these patches and the modified recipe to ML?

Yes, properly document it in commit log and tag the recipe as
'for-dora' so Martin and Koen follow it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

