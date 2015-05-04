Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3045F7169F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 May 2015 20:22:01 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so93689591igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 May 2015 13:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ojNY2nQdZzfbjyOpPG2MCOReUQsAa3TgByfNl68gtEk=;
	b=TDXrN4gxBo9uBIKmveybS5FZbIw+brl/DLjhtkRohxLt+EDjd1y/Lx15zb7vdZMiam
	eMJe9AAO1TlXMu67KHFhjKgaDVj3fXT1/9gbzlSBqBwYKc4ujts5UlGGDv09vKp/OSC/
	SrjR0o1ZybeuQ17oIJDsFt1lfhbYn/o1PRV42Red53y3cyUgQ9s8/6D83j4ezeu407Cp
	ab79Dd67KoyZX2s+OSYGqqKPPkSH+ib1SjzN5pVUJSWDXot5i8+JpSTXSWuj23qu62hP
	kvGN9/zp7l+fGMMhVPO6a1sBA9+6yoDNc9kCKvQv24HImmZJI6ppi/3Dk0hg9PnHSEP8
	a5Qw==
X-Received: by 10.50.117.35 with SMTP id kb3mr452603igb.13.1430770922465; Mon,
	04 May 2015 13:22:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Mon, 4 May 2015 13:21:32 -0700 (PDT)
In-Reply-To: <1430732876-15399-1-git-send-email-b40290@freescale.com>
References: <1430732876-15399-1-git-send-email-b40290@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 May 2015 13:21:32 -0700
Message-ID: <CAMKF1so7KpzaY8Yog-s7hkgG1ujDxvgZL1wiPivTVmccF6=2-A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] polkit: do not hardcode the libdir
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
X-List-Received-Date: Mon, 04 May 2015 20:22:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 4, 2015 at 2:47 AM,  <b40290@freescale.com> wrote:
> +-libprivdir = $(prefix)/lib/polkit-1
> ++libprivdir = $(prefix)/${base_libdir}/polkit-1

who defines base_libdir ?

