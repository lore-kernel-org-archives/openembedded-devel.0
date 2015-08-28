Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id CEAE976DE5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 03:51:20 +0000 (UTC)
Received: by iofe124 with SMTP id e124so14793594iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Rr9PKHDKQoFwAxdoleFfUjL96WiyC6MDxjjwdSezKEE=;
	b=qYjCFO5FInTK+kHuK53LsOK6Z43ihDz+9NFLp7RzyDaPj1gDvrpHrm/2lp+4yyKQgg
	IftU9ZAocQfoXnxBb5VPehxqHZjFAULvouxf+K+POPjrw21f7aOEtbF3R6jItYA4lVS4
	TDT29ravu6qowuIlmSM/U1SKvf5+Ob8yDdcBT4j82ayTrU3pObkl9UJ+N7UUg1kvC4rp
	VBwgqp7jfDUKiq8xPdV/zO7NdtGPsKBMKGKzqFlct3PrMoTzUV7mwwyVu7rQnMZU9goy
	cUjqT8lO7+FHc+vXynFrQKzz+6rgL9bdLNZtFAc1NRawpj1QMmC9IinahxNfX0XKZo72
	tiPw==
X-Received: by 10.107.14.84 with SMTP id 81mr14401514ioo.195.1440733880811;
	Thu, 27 Aug 2015 20:51:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 20:50:51 -0700 (PDT)
In-Reply-To: <55DECD46.2020602@opendreambox.org>
References: <1440650132-10281-1-git-send-email-TicoTimo@gmail.com>
	<55DECD46.2020602@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 20:50:51 -0700
Message-ID: <CAMKF1spG4MmH1BsJqh91H44GW5uPV9ny5DXk0utMR9+VAzpzhQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] vlc: fix for libtool error
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
X-List-Received-Date: Fri, 28 Aug 2015 03:51:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 1:41 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
>> +    sed -i -e s:'${top_builddir_slash}libtool':'${top_buildir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
>                                                               ^
> this looks like a typo (missing d).
>

did not understand where 'd' should be, but I hope '' around
${top_builddir_slash} will avoid bitbake exapnding it.

