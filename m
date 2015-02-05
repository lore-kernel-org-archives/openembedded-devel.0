Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 22DEB60169
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 20:09:03 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wo20so9101687obc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 12:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=5W1X0SAjeTal7Nc6JuKSRdT/oKZ3wejqodxZu9h0m6Y=;
	b=nM/nLETee3ahkkSdrsL9J3zCS9ize5eoezu8IBLfq/221I8CMLull4jzANRttaBkIO
	JthhRoIjjIvdV2jOqlDVguVrdxVmh0B9KO9WZbkqLg3ff0CtmGvY1t1oC6k99OJCH4fQ
	LVSat0sy3U+5+ZjPYEfd+iPez7cMl7aq6cIdT5yTo45CLOQxZCFE5GOxAEmsAG0Mp4BL
	pNjj74SV3NYrZfavvBb7OCkiUvSNv8dXveXo0zSJK7hz005OarEGpuDnzxbrwZrO82f0
	ms8cvs2Py5SpZymn7UOv5RjWex5faWAPozuBIZi0UtS5SJTOubk+Nwtk8nuJ6dPBtAwf
	xeGA==
X-Gm-Message-State: ALoCoQnHP9ZtXlyVZQv6d6DfpkoU149buJKj7oltxAf39jTf15l8IhlWJnxHsDoQeucK6CxVjrfc
X-Received: by 10.182.58.20 with SMTP id m20mr3655147obq.32.1423166943303;
	Thu, 05 Feb 2015 12:09:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Thu, 5 Feb 2015 12:08:42 -0800 (PST)
In-Reply-To: <CACS+7ZQ0xqDt9DoWAdJ94V2xMiMuoQJcCw2ciKJF+r=_zSQAYg@mail.gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
	<1423081763-2905-4-git-send-email-danismostlikely@gmail.com>
	<CAP71WjxPCVC6BcdmrDUz0HJ36Uw-4P-a4skKEFOZtudE2PWSDg@mail.gmail.com>
	<CACS+7ZQ0xqDt9DoWAdJ94V2xMiMuoQJcCw2ciKJF+r=_zSQAYg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 5 Feb 2015 21:08:42 +0100
Message-ID: <CAP71WjxqmFWuZ9NJRdxns4+ZrUUWmKcTDg4gz_9YJF5LE0eFkg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 05 Feb 2015 20:09:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 5, 2015 at 5:10 PM, Dan McGregor <danismostlikely@gmail.com> wrote:
> In my testing I explicitly disabled x11 in PACKAGECONFIG. I suspect
> there may be something broken in its X11 support, maybe I should
> remove x11 from the default PACKAGECONFIG set?

indeed, without X11 emacs now works fine in non X11 environment. i am
not sure what to say then... if i use debian or ubuntu on the same
board, emacs works fine with or without X11, so we must be doing
something wrong in the recipe..

