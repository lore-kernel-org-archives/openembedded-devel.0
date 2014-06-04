Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5884365ED7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:36:39 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so201149ykq.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=x7PrefR5liyq04PMA0iaObQFZBpe4zSmBMXqO+f9ong=;
	b=poqvVJ3eSpmcpHSl56MPpGGZxwN5BQVWzrfkjymnbKenZ/0Ea2Pt8zgWLAZReQGm+Z
	1VzYWhsELmOBwwhbPc2Kuvp/4Dh3uX+XuwyK2LjYZcDYeR26r1bUf6zpQ3naAIbuMRZp
	GiM75eXC/y7xbRsT/2PczWoNP6EzX/jXOLbvsIfU77gENbA+DdpCQ0XXjYYZObf1B7VV
	lvaHxTWh+yZFx89LMClx9ay7PEY5o9suErTCk42Sf4uEp32mKxGhB0p0gT0p33ql/hWi
	FBDh+6ovDZ5BfO471Co4FE2OjYhtcQPqnbL+hnDq/d3x7pK+NDPbsh2ushoynD/5ECbn
	gfhA==
MIME-Version: 1.0
X-Received: by 10.236.230.6 with SMTP id i6mr78274877yhq.14.1401925000452;
	Wed, 04 Jun 2014 16:36:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Wed, 4 Jun 2014 16:36:40 -0700 (PDT)
In-Reply-To: <1401923502-22673-1-git-send-email-akuster@mvista.com>
References: <1401923502-22673-1-git-send-email-akuster@mvista.com>
Date: Wed, 4 Jun 2014 20:36:40 -0300
X-Google-Sender-Auth: gzkuH83RFD-vGS6_RAnAJwxbjlU
Message-ID: <CAP9ODKqPZu_wOQgg05KX_PXWFP68_1J-7PPKu=X4MxL77DFM1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] radvd: fix install issue for S!=B
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
X-List-Received-Date: Wed, 04 Jun 2014 23:36:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 4, 2014 at 8:11 PM, Armin Kuster <akuster@mvista.com> wrote:
> Some files are in "S" that are needed for install.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta-networking/recipes-daemons/radvd/radvd.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
> index 9e19401..b7353fc 100644
> --- a/meta-networking/recipes-daemons/radvd/radvd.inc
> +++ b/meta-networking/recipes-daemons/radvd/radvd.inc
> @@ -33,6 +33,7 @@ do_install_append () {
>
>      install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd
>      # Documentation
> +    cd ${S}

Don't 'cd'...

>      for i in radvd.conf.example README; do \
>          install -m 0644 $i ${D}${docdir}/radvd; \
>      done

Please use:

install -m 0644 ${S}/$i ${D}${docdir}/radvd; \


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

