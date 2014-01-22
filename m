Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9203F6B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:30:09 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so493791oag.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=8Oa5rooEva8mwjUwU8ocNZzbsh+TDgJX9gkYaVMDcvU=;
	b=taRGULbwdXM/rEbcGbCCfRtEFIUUQsDduGL2+pS4oRlSW+nRlzw2G0LxFymQ+T4zJn
	MrNFS8LFnkbA2dbHGDTzYw5yJWjj90suB8sdj/8CjqSUtmaBiwRbLcSwqN/nnxlwvpZV
	3IpDEDayFO5CGkk4S9rJD7RFQ7Fa9YUR6l4ww+0n9HB1UytkTwfZ1sOR2JaqsSOgSMuc
	ECdPn/kgKXDalgzu0sRF+mQNcodvW4H0Sqb3leUEaMxdbYHRQnNVx0aLJti7/FoBs0T8
	9gHU2xeNRnlm1qGkDX64qYgsBfpgklR4VOUZnYQut8/B5I3pC/YKbjcKy6nAONzqnxWb
	axgg==
MIME-Version: 1.0
X-Received: by 10.182.194.5 with SMTP id hs5mr1497466obc.19.1390401010506;
	Wed, 22 Jan 2014 06:30:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:30:10 -0800 (PST)
In-Reply-To: <1390284784-25950-1-git-send-email-rongqing.li@windriver.com>
References: <1390284784-25950-1-git-send-email-rongqing.li@windriver.com>
Date: Wed, 22 Jan 2014 12:30:10 -0200
X-Google-Sender-Auth: mFbr8Df2v1JAdrdgIB2topAa8K8
Message-ID: <CAP9ODKoUDMLD834HhwQOpyn6Q4Gb2jtN7Rw2EB7pnqW+G9H+pw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH meta-networking] inetutils: disable rpath
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
X-List-Received-Date: Wed, 22 Jan 2014 14:30:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 21, 2014 at 4:13 AM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> The rpath, which configuration computers, is a host-related path in
> cross-compile environment; In fact, need to not add rpath into elf
> file.
>
>    WARNING: QA Issue: package inetutils-ftp contains bad RPATH
>    /buildarea/build/new/bitbake_build/tmp/sysroots/qemux86-64/usr/lib64 in file
>    /buildarea/build/new/bitbake_build/tmp/work/x86_64-wrs-linux/inetutils/1.9.1-r1/packages-split/inetutils-ftp/usr/bin/ftp.inetutils
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

