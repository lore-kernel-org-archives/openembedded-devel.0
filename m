Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 56BD960557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:08:35 +0000 (UTC)
Received: by igcse8 with SMTP id se8so3567044igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=v3iFdbigEZakIUeiMWShUWgTO8TIpWs5nVleXdqmwVk=;
	b=XuwHWGmh0dnI2xnAJspMjTnIuJomF4s6JP/LgYBw+hDElTsrjzg3qCgKjQsUkKeN8G
	FplaWPX9xkLmVU4jEjopm0YzPshmW9j7kWRr6s4fO7NQEvDkpcnR9jpiTsfZQ05b+cSD
	CtUkEV7liBTDRwV2OAcerNeF40WxoH1pQRyPWOA1NHiSrtLzxVf9+Qnucn0zHRzSPcAr
	HWVf5anhyAewTMSYKKQmXJQp79mu9rxzN4vR5E4veffWm8+6xGZbL2z7VvjacElBHape
	wJVPH5K9jEyTeNpqvbzLEEbA0wjVRRzdP/+6FcYAN+YU9M7giGPedbvj8M3iiWM2SpCb
	sEpA==
X-Received: by 10.50.59.148 with SMTP id z20mr3450186igq.77.1440173316152;
	Fri, 21 Aug 2015 09:08:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 09:08:06 -0700 (PDT)
In-Reply-To: <1440146235-9630-3-git-send-email-kai.kang@windriver.com>
References: <1440146235-9630-1-git-send-email-kai.kang@windriver.com>
	<1440146235-9630-3-git-send-email-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 09:08:06 -0700
Message-ID: <CAMKF1srhV4VSLeNXahHGytoyH+=BbtW-gn0iyO6Nvzh_YMzDKQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/4] atftp: build with gcc 5.2
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
X-List-Received-Date: Fri, 21 Aug 2015 16:08:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 1:37 AM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> atftp fails to build with gcc 5.2:
>
> tftp_def.h:54:14: warning: inline function 'Strncpy' declared but never defined
>
> GCC 5 defaults to -std=gnu11 instead of -std=gnu89. The semantics of
> inline function changes. Pass '-std=gnu89' to gcc to compile atftp.
>
> Ref:
> https://gcc.gnu.org/gcc-5/porting_to.html
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-daemons/atftp/atftp_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> index b53f637..0ece58f 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> @@ -32,6 +32,8 @@ USERADD_PACKAGES = "${PN}d"
>  USERADD_PARAM_${PN}d = "--system --no-create-home --shell /bin/false \
>                          --user-group nobody"
>
> +EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -std=gnu89'"

this is a woraround and will work, however if you are at and fix it
once for all that will be desirable. eg. this file you could move the
definition of
inline function into the relevant .h file and make it a static inline

> +
>  do_install_append() {
>      install -d ${D}${sysconfdir}/init.d
>      install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

