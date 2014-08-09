Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDA765E2B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 18:22:31 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id 10so4665661lbg.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=4+ztSUEyieJd88FMJE887Pd2AMbKGLkguIhEG+of9hI=;
	b=niwBEM07VJn9pW6H9gYnEriy1555KM/EAPKcWizfNeeznmTJ8x3SzndfmjX8c0Vkrk
	KPJDj+WVOBwSqM7FIR35SxxbdHVdwM5n0GG7N35LA25yiClUGII8WuDvcXUhYMyE6sRQ
	lmF54yULrugEXg3UhIzVC0dSLVGBJJ4qrAfm9vc6oYPWbPmVf5tJZvOPtBkrD8YrLLLN
	+xoFD1+kursrGHuQCFCkBEvupGhoUds6mMnAaFwxzkMCczjJoFXGUNvJCaHvoFfdmDZz
	5+60mzM/8ZTiX38SvhLjVp7tLY82rPXRt7ijgDXPoj78A1KRt4tHuZzcjDhFylxwqxGt
	7AnQ==
X-Received: by 10.152.26.100 with SMTP id k4mr28411623lag.30.1407608552220;
	Sat, 09 Aug 2014 11:22:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Sat, 9 Aug 2014 11:22:11 -0700 (PDT)
In-Reply-To: <01b401cfaf9f$14258da0$3c70a8e0$@lge.com>
References: <017701cfaf7e$77e1a390$67a4eab0$@lge.com>
	<20140804030800.GB18172@haswell>
	<01b401cfaf9f$14258da0$3c70a8e0$@lge.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 9 Aug 2014 11:22:11 -0700
X-Google-Sender-Auth: CJW1595pUcK9KOLE03hjC_WC-dQ
Message-ID: <CABcZANnn4CSDe4Gvc+nuM39u9dQK74zuLnzw8Uf6sKfDp5v2Gw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How to apply "-Wl,--build-id" in all recipes?
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
X-List-Received-Date: Sat, 09 Aug 2014 18:22:36 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 3, 2014 at 9:46 PM, Changhyeok Bae <changhyeok.bae@lge.com>
wrote:

> As I said, I applied the variable in local.conf.
> The LDFLAGS env. variable is included '-Wl,--build-id'.
> However, the variable is not applied at the linking time.
>

All recipes *should* ensure that the buildsystem of what they're building
obeys our LDFLAGS, but plenty do not. We used to spot these cases via the
GNU_HASH warnings, but now we build the internal toolchain with the default
gnu hash so cases where LDFLAGS isn't being obeyed are slightly more
difficult to detect unless you'er building with an external toolchain.
There are some fixes for such issues floating around in the meta-sourcery
repository until I get time to push them. So I expect it's a case by case
thing. It should be applied for most things, but it's possible that it
doesn't in others, and it'd be a bug in the cases where it isn't.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

