Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lom0u-0000Wx-Dq
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 00:01:08 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1842773ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 14:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=00D3/s7pmk4dvwxZF5jP57vgS9OINDF/ySmNl0Keb+g=;
	b=UcFzOOUE/JlhWffLRE8Ou2mDZrqnqRuFzihLxmqkPbSoAs5HGwt4j1pLWQHzNdnmZw
	49hyI7cWFAklg0yrU1Z6IpSlUT0g9ghuljo9vctj7JHhpUBjMNri7qTXj7rDh8uqGF1F
	JkAO5jtPInZ4ei4Vl9BpTPud0GEJZIb8Z2rFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wReeciY+O0N6BD/cEgeVrJoLxzxW1GD+lTX61ah4NBWxRt8pWFmwQKxkZPOCnvSBwj
	X6+2K91QVUJWow4GcHQkEY4siUep1cq14WfJJwKgN6sQ7YABOli6OGKF/gh93MbPfDia
	BI/8vrqCu8PzczwT+YrvAtIy+45O2Q3iYgyII=
MIME-Version: 1.0
Received: by 10.100.96.9 with SMTP id t9mr5414380anb.9.1238536721440; Tue, 31 
	Mar 2009 14:58:41 -0700 (PDT)
In-Reply-To: <1238532011-2963-1-git-send-email-k.kooi@student.utwente.nl>
References: <1238532011-2963-1-git-send-email-k.kooi@student.utwente.nl>
Date: Tue, 31 Mar 2009 14:58:41 -0700
Message-ID: <19c1b8a90903311458k56ee153fkb6977ce7349b78fc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH] gcc 4.3.x: disable thumb mode for now, glibc 	builds don't like it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Mar 2009 22:01:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

can you post the error message and commandline or better preprocessed
file of the error thats happening when compiling libgcc in thumb mode
plz.

We could try to fix the libgcc problem.

Thx

-Khem

On 3/31/09, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> From: Koen Kooi <koen@openembedded.org>
>
>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/gcc/gcc-4.3.1.inc |    1 +
>  recipes/gcc/gcc-4.3.2.inc |    1 +
>  recipes/gcc/gcc-4.3.3.inc |    1 +
>  3 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
> index 7f7f15e..cdab6dc 100644
> --- a/recipes/gcc/gcc-4.3.1.inc
> +++ b/recipes/gcc/gcc-4.3.1.inc
> @@ -1,5 +1,6 @@
>  # No armeb and thumb patches - really needs checking
>  DEFAULT_PREFERENCE = "-99"
> +ARM_INSTRUCTION_SET = "arm"
>
>  require gcc-common.inc
>
> diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
> index 1fc05af..aeb3477 100644
> --- a/recipes/gcc/gcc-4.3.2.inc
> +++ b/recipes/gcc/gcc-4.3.2.inc
> @@ -1,5 +1,6 @@
>  # No armeb and thumb patches - really needs checking
>  DEFAULT_PREFERENCE = "-999"
> +ARM_INSTRUCTION_SET = "arm"
>
>  require gcc-common.inc
>
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index d5d5db0..4bed0e4 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -1,5 +1,6 @@
>  # No armeb and thumb patches - really needs checking
>  DEFAULT_PREFERENCE = "-999"
> +ARM_INSTRUCTION_SET = "arm"
>
>  require gcc-common.inc
>
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


