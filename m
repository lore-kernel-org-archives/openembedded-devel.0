Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 350E273E3B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 May 2015 00:08:37 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so106218627pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2015 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=qdeERCeXg4D1qWrdXXBDRsabYX5867WROaJQ1R8g1Xg=;
	b=wRbzTQoMs6wUXrodb2BHZx40xYeL6pEFUkBgJuWsUxL5PDyMMXj/JKWWHrN75dSLH0
	MjssYOd495GBh77Ik/F8eHSQAsg1bFwoWbTV9fGUMfU3kI9ap3F7cu99jATojFo2+yE8
	t969rpyAmAcE+CyHMvB6dWb+hdJ6VcV/cLiVV2VzZDXGRHGLOwZI4c/iwWCGhm3faPsY
	8o19TsRu1TEmVUB63QVABe9FPY+7QQim+PoIG/ER77aly/I66lL333wnGvP2cw6/3NmA
	Z+Od9KpMPYaBWJNOLhnhHIC/wW96OA+8fTvWt+OoP2DDYgXcrsCDxJPgcANxkWpUZSLq
	QSNg==
X-Received: by 10.69.25.41 with SMTP id in9mr21974418pbd.80.1430525319224;
	Fri, 01 May 2015 17:08:39 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:54d9:5aca:52b:ad71?
	([2601:c:a700:3ba7:54d9:5aca:52b:ad71])
	by mx.google.com with ESMTPSA id wh6sm5860994pbc.96.2015.05.01.17.08.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 May 2015 17:08:38 -0700 (PDT)
Message-ID: <55441583.40907@gmail.com>
Date: Fri, 01 May 2015 17:08:35 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1430483441-4566-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1430483441-4566-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-ruby][PATCH] ruby: explicitly disable dtrace support
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
X-List-Received-Date: Sat, 02 May 2015 00:08:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Martin,

Are you pushing in that change. As far as I know, I don't have write 
access for that layer. Let me know what process you want me to follow.

- armin

On 05/01/2015 05:30 AM, Martin Jansa wrote:
> both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
> | linking miniruby
> | load.o: In function `rb_f_load':
> | load.c:(.text+0x3af): undefined reference to `RUBY_DTRACE_LOAD_ENTRY_ENABLED'
> | load.c:(.text+0x428): undefined reference to `RUBY_DTRACE_LOAD_RETURN_ENABLED'
> | load.c:(.text+0x452): undefined reference to `RUBY_DTRACE_LOAD_RETURN'
> | load.c:(.text+0x492): undefined reference to `RUBY_DTRACE_LOAD_ENTRY'
> | load.o: In function `rb_require_internal':
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> index c463525..78c943c 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> +++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> @@ -18,6 +18,7 @@ PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
>   EXTRA_OECONF = "\
>       --disable-versioned-paths \
>       --disable-rpath \
> +    --disable-dtrace \
>       --enable-shared \
>       --enable-load-relative \
>   "
>

