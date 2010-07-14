Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZ9CC-0005My-0l
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 23:08:49 +0200
Received: by bwz10 with SMTP id 10so246946bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=J8rq9de42YEwOTpG2bWosAU9ZsUQN4QRyGKzEGWJNDg=;
	b=xxm1Di790hx+HmICJShgyrlOtlg8cUxv5nnlDOudhofzRJVbe7GMmC/tr3Si6tCdYK
	U9mr8NQ9vATSJZLaGDIqHSFSt4qrM1HMxvvPiVwXiCf9CSZM+uSeRVP6SDAwxZsZFK7y
	X2JAYEmOz/NPoAMNqN93+C96ne6W8ToK9+oD4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=svt/4bKVXGYHIzbmvdIufdDw64fVzJdRYt5srXLjtpkho+4BLzri3Xs51fvVnh+eUV
	805BP+G0dcthLTMH2Ct4wYRoGBwmyk9NFD9bAk318eqcYHotS3dlwldIDQWHsLZJUls9
	9O/nkS4RjCjVr7koZ9EuVHHvI6xzX6lN64At0=
MIME-Version: 1.0
Received: by 10.204.102.77 with SMTP id f13mr5467876bko.143.1279141725340; 
	Wed, 14 Jul 2010 14:08:45 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 14:08:45 -0700 (PDT)
In-Reply-To: <1278963950-2587-9-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
	<1278963950-2587-9-git-send-email-aalonso00@gmail.com>
Date: Wed, 14 Jul 2010 23:08:45 +0200
Message-ID: <AANLkTilN54QUbezTpeMC1Volugik_bpj-RK7aDf6fHQY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 9/9] glibc: fix LD_LIBRARY_PATH
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
X-List-Received-Date: Wed, 14 Jul 2010 21:08:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/12 Adrian Alonso <aalonso00@gmail.com>

> * Configure fails due to LD_LIBRARY_PATH
> * checking LD_LIBRARY_PATH variable... contains current directory
> * | configure: error:
> * | *** LD_LIBRARY_PATH shouldn't contain the current directory when
> * | *** building glibc. Please change the environment variable
> * | *** and run configure again.
>

This surprises me very much as others also use glibc 2.9 (I assume).
Can you take this up with the glibc maintainer?

>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  recipes/glibc/glibc_2.9.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
> index e7ab63d..4196704 100644
> --- a/recipes/glibc/glibc_2.9.bb
> +++ b/recipes/glibc/glibc_2.9.bb
> @@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
>  PACKAGES_DYNAMIC = "libc6*"
>  RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
>
> -PR = "${INC_PR}.3"
> +PR = "${INC_PR}.4"
>
>  # the -isystem in bitbake.conf screws up glibc do_stage
>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> @@ -143,6 +143,7 @@ do_configure () {
>                exit 1
>        fi
>        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
> +       export LD_LIBRARY_PATH=`echo ${LD_LIBRARY_PATH} | sed 's/^://'`
>        CPPFLAGS="" oe_runconf
>  }
>
> --
> 1.7.1.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

