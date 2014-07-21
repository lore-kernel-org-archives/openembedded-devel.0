Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id AAC7C65E2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:27:39 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id e16so4972236lan.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=VvRYC/Oegb8mheEo50GAfBmhu9QEwxiCKdErjcqfZk4=;
	b=N69sMd/P+U2PiUyAG9UC0UEJgZhaqTbF/xkWeFUgGNOTMDHtE42ZeF5RQXkSIEjDu+
	cEQfQomXKbi1bNXmM3axuepTi91v3Hi0YTevJjD/FYq3/YGFejybbqXLhvmaJVnnKiQF
	Gzvxa7FN4gpCpE8HHkImkXFATmyCDDR4NX6QfSMUD9gHJmr2pu2agm67j8aIhmf29a4I
	tRhHDAer0/q2PHQEZe5qhN6nYimskYk9VyB11WcYaV9al9cK/XeVsB2TFg6RI+IjqQKN
	7TD7qkOEuV1vjafqGYYI3A6gFFfo6wEhIGH4VN6WcUpjH34jt+gsLeV2Vpd9YMp1yOaI
	A9lg==
X-Received: by 10.152.204.102 with SMTP id kx6mr28089306lac.32.1405956459942; 
	Mon, 21 Jul 2014 08:27:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Mon, 21 Jul 2014 08:27:19 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407210555370.10857@localhost>
References: <alpine.LFD.2.11.1407210555370.10857@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 21 Jul 2014 08:27:19 -0700
X-Google-Sender-Auth: EER4l9Bk9myAw9VQkh3TDJecbMY
Message-ID: <CABcZANkamKKfYkMBnit4H8go-_BY_0ePWbg32Fx6oCjNVspiwg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: i'm assuming some "do_<task>[dirs] =" directives are redundant, yes?
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
X-List-Received-Date: Mon, 21 Jul 2014 15:27:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 21, 2014 at 2:59 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   pedantic observation -- i notice in base.bbclass:
>
> do_unpack[dirs] = "${WORKDIR}"
>
>   and over in patch.bbclass:
>
> addtask patch after do_unpack
> do_patch[dirs] = "${WORKDIR}"
>
>   so given that patching has been added as a task after unpacking,
> wouldn't ${WORKDIR} already be guaranteed to exist? doesn't hurt, of
> course, and no, i have no intention of trying to clean any of that up
> :-), i just wanted to clarify the actual mechanics.


'dirs' isn't just a list of dirs to create, it also sets the current
working directory for the task. The last directory listed is where the path
is set.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

