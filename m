Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 148697FC38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 21:40:48 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id x13so6332067plr.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 13:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=OTPMhp1BdUCYJFZjOC1woZSpUz+OrWJFYbjy5HTy6pI=;
	b=Q9XDxwzXGBQ//tIxbv/HeOt65BGAvVw+XoPTDA2qDg7zGu1dv0U8BagMEfDM2QL11M
	xi/kG3qYHN1+jh9gQnITbU8tUZM/6IKzlmOcFqUBRIfK71fj3o89z4CmfUQSEb3MB7Kj
	mzVo0nMXc03cs2GIZEM+QFAEWN5bFIhWIHCUjCmuaGnSiUqs9z0pibU8HQIGgG/Uk1WL
	VMvTQJZQyejPXVcQy+mIStjPRmkgAvhp+v2OsOIr5/2bibi5EFT7fw2esZu8yNcEaaRV
	Jv7Gk1uzRcAbKSC6AjuTvJLLtjy+xNIccUPj/eEoQM7jwKxi27+CB+fvY4Mx8JoT8qIQ
	EFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=OTPMhp1BdUCYJFZjOC1woZSpUz+OrWJFYbjy5HTy6pI=;
	b=uIxjlV3cNA5SeuWCsVkrNwyS2Gq2rx8swFK38P8BNXBxj6lwKPFnPDoHevDoWegFoO
	nxDMpBjvRAuRn5QZ2IZh7cnHDaSEjgf0x43P9rV/NJiePsDXkzPLQOerWsBbD8qyp1V9
	RPGKfQBPWAHJM8vdRghl+4tbWtdOIJQq5FCoihnc5RSDy4teAB772aaceRKqZoePT7nQ
	UrIU3/Udrf4FqyyVche/oFM+Q05RojeTEUtRlTBpSOK7VN5260HN2xA1we9QlMPkw6lW
	1bbpmi8HTz4pai3MOAZWMohJDkD8O8YmbxKrsHOldYPpmDfVjBcPh2mIqCpnxnrSCXp9
	x5IQ==
X-Gm-Message-State: APjAAAVuWoopwf0bk1X5ynYadITus/oxwCYbi1gT8P7wRm76mpjwUqwS
	+GFSXXjX24xXE5I4O6NtBxI=
X-Google-Smtp-Source: APXvYqzUdObcZDNsIJIJrOk7CtWjwjl8Y8ftq0hVWrp1trxKgLhPHGk0V0dHL4++ktddMXkHhU5/Dw==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr1387610pjz.74.1575927649831; 
	Mon, 09 Dec 2019 13:40:49 -0800 (PST)
Received: from apollo ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id d13sm295867pjx.21.2019.12.09.13.40.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 13:40:49 -0800 (PST)
Message-ID: <25ba6b79a3667c119d8aee93a2796d08534158b6.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Kang Kai
	<kai.kang@windriver.com>
Date: Mon, 09 Dec 2019 13:40:47 -0800
In-Reply-To: <CALbNGRS=Nzkq9V9xxHt8HxPzGKwc9oAOYnhOY6WtEojtN+YsPg@mail.gmail.com>
References: <20191118014035.15189-1-kai.kang@windriver.com>
	<CALbNGRT=hGkyD+ht3DfhAKooTo-g9w6v23cyyVJm=HX8XA1zxA@mail.gmail.com>
	<CALbNGRS=Nzkq9V9xxHt8HxPzGKwc9oAOYnhOY6WtEojtN+YsPg@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch] thunar: 1.8.9 -> 1.8.10
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
X-List-Received-Date: Mon, 09 Dec 2019 21:40:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-12-09 at 09:40 +0100, Andreas Müller wrote:
> On Tue, Nov 19, 2019 at 8:55 AM Andreas Müller <
> schnitzeltony@gmail.com> wrote:
> > On Mon, Nov 18, 2019 at 2:40 AM <kai.kang@windriver.com> wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > The tarball name uses all lower case now, so SRC_URI and S are
> > > not
> > > needded to be set in the recipe which have been configured in
> > > xfce.bbclass already.
> > > 
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > This one seems to have missed patchwork. Nevertheless
> > 
> > Acked-by: Andreas Müller <schnitzeltony@gmail.com>
> Does this need a resend?
> 

no, I have staged it. Patchwork missed it and so did I.

> Andreas


