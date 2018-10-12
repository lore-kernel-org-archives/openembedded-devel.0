Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 526F179BD8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 19:51:33 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y81-v6so10751896oia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 12:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6n9iWziYqfa0kbHAVRBWmK+pSY1Ccc1ErWcTX2jhITo=;
	b=oDD6W8MGg7wdKOT/i/EB3zzhw2FcL/n4u3pK7rmTfXC3ENPnv6HQw/nUyJG0L+0Ug+
	qw9UPB0iSMyrVua5ZzJhhTstwoKUqPrqpOPYLQzuZer3xeyVDZdbLa9hB9kneZjfiCEo
	MDj/HIV1xJqZp6280ECQ74LVdr1TYqMyPS7cXtQukHc3lxZDW/jH5bcq1jiZihQBuQGL
	oAdV+bnpt7B9mkWKmp66zX80jKMjpxpatY9jh9TMOkEdKJ1DPKtKO5YH3YxjHs28t8Uw
	Cr/Y8Rhpc+HqSvV1tEdOYONI9W3pYNp0VDPKSPDabM0r/Zj6pZB0MjkGHd9asS9CJFKN
	+iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6n9iWziYqfa0kbHAVRBWmK+pSY1Ccc1ErWcTX2jhITo=;
	b=qVHF+Q8pzl803xunkR94cnTsyCvXB33TXkJ1uxYZWCHIrj0t4PBnUwGNol4OqyKa68
	zFDUb1+zrN8DVyilJr98B5lZk8/0DZ2r1p1zUi92XRbTBanqmUUZyUmkznk9nMst8Osb
	NgfW6YR/csn+HypgUPKeMwxrNFwHRqTChohSbcyVxYaQkxnL5hLmNXNYiVKr4jTqKaez
	2PiLIX+oPl7+4fMrOOk1ti3kl8n4HbWa0G8hWl1OcNbmlqvq8ho72vz6f1UinB8Uoqlk
	ScGHjwIiCxnMGBi5oui5MZXaZ8MLgl59tMfy0o4wsWwSJgEwO6ZXrQrYw/IlDpuo7eTM
	o6WA==
X-Gm-Message-State: ABuFfohKf4F4/z31zAZ9+LQHzJd25Yg+PHOboe07YsRpvAgBaXrTi+WB
	IS7pq+E9YgOpaIMiPvd5/tO8fXhVmne2YSNxbjY=
X-Google-Smtp-Source: ACcGV62/XwZ3srsaf4cn115PBRk4tjuVx9juYESDCY44uQz4rvUeqP1YauT5LpxzElHlFOEGC9WF4AtA62iJDg1LSzE=
X-Received: by 2002:aca:3f87:: with SMTP id
	m129-v6mr3796006oia.228.1539373894236; 
	Fri, 12 Oct 2018 12:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
	<1539357981-3675-5-git-send-email-akuster808@gmail.com>
In-Reply-To: <1539357981-3675-5-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 12 Oct 2018 21:51:21 +0200
Message-ID: <CALbNGRTxEzy8ZYxpKW0ORh9Ca9ODNYrmMxhcMQYYxDaL97N=3w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/5] blueman: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 19:51:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 5:27 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Nothing RPROVIDES 'thunar'
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-connectivity/blueman/blueman_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
If thunar is the only reason then this has to go to append in
meta-xfce - there thunar PACKAGECONFIG is activated.

Andreas

