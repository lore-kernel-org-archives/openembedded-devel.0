Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7067F60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:13:57 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wp4so457621obc.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RXCIupJKd+VXaQqZ7SEWRHW7gMj0lDQYEa3zSNRTTY0=;
	b=VvHIUmH2aW4GfU0JroVDpjWlFJN+DO775udTvwkOInlS2q1z3hO/SR7lZXEDuHusEm
	tTdk9Ke5tBJ1xUGf4G7Y7xTZnxOaRLf0UhDpokoTsWTVmur9SNzqH38sefHn4Jvq+A/+
	WeXhHgxTZSp+H60+SDKLYHLJpr80bVXuwchdRJGMBuY6Cc9VffoL9u/QQWjrGqHUzVbc
	iMcnPwMOeHC/e1kjY6xY3dA+6cvblR1d/RQR7Ol7IRdiQw7K79FxhUk6/g+cZ3K5Z8sa
	2q6C+4j/Q26iz9Sf1YwERcVd9USLz26Z8fMNMmU8YUapQC9noq5l+D3KCH2hk5D6LRiT
	5WjA==
MIME-Version: 1.0
X-Received: by 10.182.113.195 with SMTP id ja3mr1493575obb.46.1390400038423;
	Wed, 22 Jan 2014 06:13:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:13:58 -0800 (PST)
In-Reply-To: <1389960374-16694-2-git-send-email-koen.kooi@linaro.org>
References: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>
	<1389960374-16694-2-git-send-email-koen.kooi@linaro.org>
Date: Wed, 22 Jan 2014 12:13:58 -0200
X-Google-Sender-Auth: Y8WfEjat_U_v4Gqln-O2aE_aRzY
Message-ID: <CAP9ODKr8u4ybYPFzsjXZWxQW32Pf72+Vb_wJkRfb5OSR_a9zZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCHv2 2/3] acpica: replace patch with EXTRA_OEMAKE args
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
X-List-Received-Date: Wed, 22 Jan 2014 14:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 17, 2014 at 10:06 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> No need to patch the makefile when you can just passs CC=${TARGET_PREFIX}gcc to make.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>

You have a typo in the commit log: "pass"

What about the HOST variable from the Makefile which were removed and
now set to _CYGWIN?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

