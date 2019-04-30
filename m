Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 470B27DD4C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:48:59 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id b10so2627416wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=LsHnVg8A+73LTH1yXF7OGsje+o1L/2TUGkv9OZZaEgQ=;
	b=Al4ydozVVTZXqE9JolVHeJ+qHkFoZH8KvzXSFIzKtLC9D4Voal4QMtf0yP2DME00C/
	MWjXxN+rAUHmnbRWf98E+nhp5ytxYE+kAE3u6aQrK/OZ80TpaR7wo2Qe85i+4Rfq1F0B
	TPIb3zweAgnSeam5DGjUU112Ul0YAz3oDdkN7iIyLHLzA45nVdNUquOywveJ2vnF19kp
	baVVpfPsv5j3hAnJgvjT+HIYU/dfb0zXGzXY4XQ4Fh2XKRBkiLFVIdyhvsk2OgaZnRUO
	By5DQjiizDmGDnaJ0nGsJZHSi2RadLZZwi/67nZLqD1jO8Whf5UVqaU9dUKHAEa49WoF
	anxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=LsHnVg8A+73LTH1yXF7OGsje+o1L/2TUGkv9OZZaEgQ=;
	b=Bm1EA4OkMBREggXkHepsig4l1XQqi7jPdAc+vQhv/gKQ5JkVgkEfNjT1MpxJEr4iDk
	d0TSyUjQdqYrQcI2KG/izk1wkmHtpSsvm/2BA5Q7wUrTuexmNGkfukt45cnpg0It+mc1
	FdByqvuUHOVgtHROZefKmfwLeZbLbkEvXxPw/5F9nJdGb4bl8FgweEbdYFwaFU4yXtZ+
	HqlF78/dcv92v1vRj/x4PAn8Km98FXSdufuEvbP2G7EJTOpCxWAAk5X5Wh6Nyc/1U80u
	QMokycsSyWrCkrtDMLamkCX7C6o2lmMk4/7yjq9sootcK3WPY8K5sLojnsPrEZq6doL7
	nHEw==
X-Gm-Message-State: APjAAAVF458Jz1gULv2KG8W4NjBBdsZQWRlqDVym9YGuC0NhVSDLVWcU
	7sqtU7ldJV1oPZjVdJeCnN4cp4JM++AOvmyBWTsDfg==
X-Google-Smtp-Source: APXvYqzz32WAnI5CJDdj31axONFXgsqsBHSVO9SB/GmsGT1ROf7yw/K1wDAO4vQB1HPBVfzyi412RrMCFHCYqmMnwRE=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr1281507wmg.132.1556610539495; 
	Tue, 30 Apr 2019 00:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <1551959871-9647-1-git-send-email-marek.belisko@open-nandra.com>
In-Reply-To: <1551959871-9647-1-git-send-email-marek.belisko@open-nandra.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 30 Apr 2019 09:48:48 +0200
Message-ID: <CAAfyv36SJe1D=qQA_jDdRBbv_VAJEUBvimSxc8vhVNRoZ4C=DA@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH] jamvm: Disable inlining
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
X-List-Received-Date: Tue, 30 Apr 2019 07:48:59 -0000
Content-Type: text/plain; charset="UTF-8"

Ping. any comments on this?

On Thu, Mar 7, 2019 at 12:57 PM Marek Belisko <marek.belisko@open-nandra.com>
wrote:

> This will fix crashes seen when build openjdk-8:
>
> ERROR: jaxp1.3-native-1.4.01-r0 do_compile: Function failed: do_compile
> (log file is located at
> /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
> ERROR: Logfile of failure stored in:
> /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | Illegal instruction (core dumped)
> | WARNING: exit code 132 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
> ERROR: Task
> (virtual:native:/home/jenkins/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:do_compile)
> failed with exit code '1'
>
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  recipes-core/jamvm/jamvm.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
> index fc21380..8a1ed63 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -29,7 +29,7 @@ do_configure_append_class-native() {
>  }
>
>
> -EXTRA_OECONF = "--with-classpath-install-dir=${prefix}
> --libdir=${libdir}/jamvm --enable-ffi"
> +EXTRA_OECONF = "--with-classpath-install-dir=${prefix}
> --libdir=${libdir}/jamvm --enable-ffi --disable-int-inlining"
>
>  # Needed for big compilation targets like OpenJDK
>  CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
> --
> 2.7.4
>
>
marek

