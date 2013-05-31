Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id A7744608F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 14:25:38 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id uo1so2285164pbc.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=d2KBCBvgBoMXw6HT0ZiY/uykiVGKOYBHjm8auWISfvU=;
	b=jm8S7nTNBpxgOWVQwk1Ldt05ouV8W5TMhXrK0rSHcVNz9W/VxEhEU7KoK6yo2kmt+r
	ND7aKAqrH5jpiSeb7Pxn4hCE0VYwRD/4UAQny2MCRjsKHzUM3ecH+pMrXbEThILbIIEU
	hKW2nK9JiHEgArs+fxVQtIguF08XZ232+aNsxUzRcQl/+DU2oRJBa6hmAf5xOOFjFMGl
	LUkp9oe5yWmYW19MCdpGAefBL0i3sElAhzBa8jLtNq/l4q2segFjCGPRmn8XrWnkmXe0
	90nQthU5Hz+PDu/u7bvnAL/UQj3xdbxG0ajiXOITBXuQokZgSJXeSaNojmD6IAqmOD74
	DcyQ==
X-Received: by 10.66.155.138 with SMTP id vw10mr13724560pab.91.1370010339565; 
	Fri, 31 May 2013 07:25:39 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id ra4sm50055662pab.9.2013.05.31.07.25.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 07:25:38 -0700 (PDT)
Message-ID: <51A8B1C0.2090400@gmail.com>
Date: Sat, 01 Jun 2013 00:20:48 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1370008134-25208-1-git-send-email-net147@gmail.com>
In-Reply-To: <1370008134-25208-1-git-send-email-net147@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] llvm: install llvm-config in crossscripts
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
X-List-Received-Date: Fri, 31 May 2013 14:25:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2013 11:48 PM, Jonathan Liu wrote:
> The llvm-config script was being installed to the native sysroot but not
> in crossscripts. As a result, recipes would pick up the native
> llvm-config which would give flags for native LLVM instead of target
> LLVM and result in compile errors.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta-oe/recipes-core/llvm/llvm.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
> index a56fda0..59f4f25 100644
> --- a/meta-oe/recipes-core/llvm/llvm.inc
> +++ b/meta-oe/recipes-core/llvm/llvm.inc
> @@ -160,6 +160,7 @@ llvm_sysroot_preprocess() {
>   
>           install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
>           install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +        install -m 0755 bin/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}
>   }
>   
>   do_install_virtclass-native() {
Please disregard this patch. It seems to be installing it incorrectly.

Regards,
Jonathan

