Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 82C2B75678
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 16:28:14 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so61105587igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 09:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=37KW+r/7K/RN3Q6/Wr3BisxNe4dnAxzg9lUvNpOmFgY=;
	b=L0KkW0af8YI2TGl8mfhmXMLFWHXa8Us5pb/Xur8OYzN4gDDAuaGQAP7qYQEO9rOq8L
	JUp4anA1lFuwOjB2YOaHQtuhd5AgQOFFnW3TDl5rpwji4fA/I0cIWnNcvz8jit9L8shj
	mWV1vjFrrtfNbOr/nuJCP+sDt1DEtWa8Vdgl9tKAXw64H75DENoHxZmtXNBnuiVtdFo1
	sASOtChL1KuQF15liSc5CwE4J93BKpNi6gp7xwyZAt1GKfSqE1+BtkOf75mEMAXg9QOu
	A36LgO/zMHooO5fnMomC7YZY/4mtRJeCJhMrixHN+2EpvCBrSgGmcSSBZ1aG0bNTMnF0
	E1+Q==
X-Received: by 10.42.83.212 with SMTP id i20mr24188648icl.91.1433780895328;
	Mon, 08 Jun 2015 09:28:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Mon, 8 Jun 2015 09:27:44 -0700 (PDT)
In-Reply-To: <ml3j12$nio$1@ger.gmane.org>
References: <1433468641-18841-1-git-send-email-raj.khem@gmail.com>
	<ml3j12$nio$1@ger.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jun 2015 12:27:44 -0400
Message-ID: <CAMKF1sqJVfp+nAa7cihKBEqHdWAb560KUHJaTxv1539Ag7TQdA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpufrequtils: Create proper symlinks to versioned library
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
X-List-Received-Date: Mon, 08 Jun 2015 16:28:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 8, 2015 at 4:16 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> -CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' ==
>> 'no']} " +EXTRA_OEMAKE_append = " ${@['', 'NLS=false']['${USE_NLS}' ==
>> 'no']} "
>
> That's not mentioned in the commit message

ugh, I did forget, it makes it compile on musl as well and utilizes
provided provisions
from makefiles itself instead of injecting the flags. May be an a
commit ammend before applying for Martin :)

