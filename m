Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCF377161
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 19:07:14 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so30352720pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1at+3NRn6fYUYhnsnQMA6YNyAjOvF9BuToi817QbEZc=;
	b=grF+uCPyxbvqtGJC3bbxLZUyXmeuJUGg0C6OXTfI/oow0XATxXkIn0cdON3CBFxNBB
	fOe6wY4XCIWOYo3CDX7k4wZ6coDZJo7bhJnlQ2cf7jKQPTJKMbJ2reiCxjkhpWAc8H4I
	9nWrUqhKWvVuifCa4iqwVKC4HLjTX96MgBnYmcx09wokHfZ1PPtsg0tPtnaAzeIhoYz7
	gG/1xEu0qUa90YUACMrXKWxBnzLFbmelLL/JpyJ8jKzZ0BFyJN36MYfxx6JD+O97vk3E
	Xl/nVBqYLcLWXbartvwcalbT/yWjQrOMpmZ51U013qy48VH6hyO4/jOeUK3u2zDS3p2a
	IBTQ==
X-Received: by 10.68.243.37 with SMTP id wv5mr17929734pbc.68.1445022434482;
	Fri, 16 Oct 2015 12:07:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:197c:ac43:581b:7cb1?
	([2601:202:4000:1239:197c:ac43:581b:7cb1])
	by smtp.googlemail.com with ESMTPSA id
	xm9sm22593728pbc.32.2015.10.16.12.07.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 12:07:13 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1443708188-9180-1-git-send-email-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56214ADA.20901@gmail.com>
Date: Fri, 16 Oct 2015 12:07:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1443708188-9180-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][master][fido][dizzy][meta-oe] llvm.inc: fix PACKAGES_DYNAMIC
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
X-List-Received-Date: Fri, 16 Oct 2015 19:07:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

merged to staging


On 10/01/2015 07:03 AM, Martin Jansa wrote:
> * all dynamically created packages start with libllvm${LLVM_RELEASE}-
>   libllvm${LLVM_RELEASE}-%s-dbg
>   libllvm${LLVM_RELEASE}-%s
>   libllvm${LLVM_RELEASE}-%s-staticdev
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/llvm/llvm.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
> index 0597be1..04c87aa 100644
> --- a/meta-oe/recipes-core/llvm/llvm.inc
> +++ b/meta-oe/recipes-core/llvm/llvm.inc
> @@ -132,7 +132,7 @@ FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
>                     ${libdir}/${LLVM_DIR}/LLVMHello.so \
>  "
>  
> -PACKAGES_DYNAMIC = "^libllvm-.*$"
> +PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
>  
>  INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
>  
> 

