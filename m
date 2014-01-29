Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id D50DB6E791
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:26:11 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so11334163ykr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=IPWEQXC/ANecsxJUwCYkko5YUXlJCJiGKjJoaGwe07M=;
	b=dbRuK/GgbBoU3J0wntQPfelTxZSARQoH+DhpWlwFwrOkHLq/dpBxHaXUZzsTWVDTfz
	U/YgrBDYTAGzwE6u1KUpKciE285abHC+JrKHKs+p2vBqQIVt6ARe2zsLlQyTEP5JyvR6
	9nQWzgPUiVARMRfHM04x0CGUSmyKAVouOS55ifCh41ERtfuWGC59ScuqyHZk34LmuOZz
	VD8HzQaqcz5JEwMrKKjNi9j3xEWb+hta5sjeQ8bg04IkBwNKwKLYgZWgEUrQcEBlVNp2
	iqu+dUv731ul65TQ/UuGRDfChwyq0sKdxMvG+JTu7aLMwzYbFZrdctk0DVnDEEJVb8mG
	Q98Q==
MIME-Version: 1.0
X-Received: by 10.236.2.166 with SMTP id 26mr2755762yhf.79.1391027172164; Wed,
	29 Jan 2014 12:26:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.62.84 with HTTP; Wed, 29 Jan 2014 12:26:12 -0800 (PST)
In-Reply-To: <CAMCfZKEwQWimV0j8FE1Z1KVW=xUCZgR36_Li1fNuiZfwYm7yrA@mail.gmail.com>
References: <CAMCfZKEwQWimV0j8FE1Z1KVW=xUCZgR36_Li1fNuiZfwYm7yrA@mail.gmail.com>
Date: Wed, 29 Jan 2014 18:26:12 -0200
X-Google-Sender-Auth: U-skFXwt0Nsi1UwZnYDCG5ZDjOk
Message-ID: <CAP9ODKp_JRLSYgh_LrUjtsUkG9_FLibNbmYuoa-gPRkVxyLxqg@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Jan 2014 20:26:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Jan 29, 2014 at 10:10 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> It seems that journald version 206 has an issue with storage. It is not
> respecting the configuration and my storage is getting full after sometime.
...
> I'd tested journald version 208 with the same config and it worked.

Please isolate the patch which fixes the issue in 208 so we can
backport it to the Dora version.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

