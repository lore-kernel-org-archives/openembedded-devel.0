Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NuCSs-0000z1-IX
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 23:20:47 +0100
Received: by qyk33 with SMTP id 33so2987011qyk.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to:cc
	:content-type; bh=9D42NUic1d1TI5XN0YPzH4qCFEXpmV3+dIH02rzU1JI=;
	b=aDQ2GMeNR24XddKywLY3n6b6WQNYUqv5VDIAdTdXSNFM9/yDaCISNJmnLxEz2xdbAy
	vq15/5RLacBKlTe+kYX0jWcA13AxpyATfsxR+ALb4ir4QZiySvJDcsCO/60N4Y2QMI4+
	pUMjqjulI7v6LVLh8OydJ/axtAswTRGqNetSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=ueA5uRD5YYLSNyagaQbvJ7OFeWfPHTg8hd0lev6ZnucwCdE4Egurh4W6sRqnWiSa4s
	Ty+FMDsOmSXjjhnIH3mgEtlZEw5kVLYNhCVVyQ8fuU9swEXgC0Xjt6Qiooqp0fwIKAIk
	jndrLlMnY/3TjmNaqvBSuZOX9d0DvuUBrapU0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.66 with SMTP id ld2mr1671432qcb.78.1269382656226; Tue, 
	23 Mar 2010 15:17:36 -0700 (PDT)
In-Reply-To: <1269377516-6969-1-git-send-email-ospite@studenti.unina.it>
References: <1269377516-6969-1-git-send-email-ospite@studenti.unina.it>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 15:17:16 -0700
X-Google-Sender-Auth: e59e786c3ce7993f
Message-ID: <b6ebd0a51003231517i1bc3b18ci34ea9bfc3424be66@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] base.bbclass: add missing import of metadata_scm
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
X-List-Received-Date: Tue, 23 Mar 2010 22:20:47 -0000
Content-Type: text/plain; charset=UTF-8

Applied, thanks, nicely spotted, and sorry about that :)

On Tue, Mar 23, 2010 at 1:51 PM, Antonio Ospite <ospite@studenti.unina.it>wrote:

> In commit 89b7e433719f43f1c36c76cb8856d559014e99bc metadata_scm.bbclass
> functions were factored out from base.bbclass, but the new file was not
> included.
>
> This prevented METADATA_SCM, METADATA_REVISION, METADATA_BRANCH to be
> set; for instance this caused oestats-client stop working.
>
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>  classes/base.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 182ce62..cda9b8f 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -7,6 +7,7 @@ inherit packagedata
>  inherit mirrors
>  inherit utils
>  inherit utility-tasks
> +inherit metadata_scm
>
>  die() {
>        oefatal "$*"
> --
> 1.7.0.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

