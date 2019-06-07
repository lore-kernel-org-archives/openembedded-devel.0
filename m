Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B57E87E180
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 07:17:52 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id i10so632848iol.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jun 2019 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m0KxAA78JgR7EcrnAh2ncA2xeg1rzneGOl+hGCV51e0=;
	b=nuqcXKjt3EFmaBxNI1j8rLXBl8pcoq0DW1Sjhv7k5XHLxvZnwrUgLoVAN3U3NZWBKk
	oTawwR52E1cbmdcEr+i35njUW7FcTY8pZFXdw8Vwf/4v6D8tLuB5vVQym1G7FgE2tsuh
	ZDe0Ni22Q0JdG/9Pg/ujj7dRzx98xOgQLyMCPlibyFlsD81jEAiqhbNkPtCfekudaXio
	/mNZeaF/8XGQBEN0EXKUCV2ADaS2kxawUOsq95nM7B9HpVZQaafu92JeeaODsGdz5Z8E
	+UN/uFjqTnqGWBejWAbvMe58Kz49Fdu3XAWXPpdXP3ICRD/wEyC29KVOo/IQMmx7vgqA
	rz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m0KxAA78JgR7EcrnAh2ncA2xeg1rzneGOl+hGCV51e0=;
	b=BegAOEtPn0WU3lrYGoJArxkvUEgqOUyWWciZ9AIyjSOQKeWDwQMxf/4qhMi4h1JDSl
	sZjNuWs2pCIpS0xNv44BoSHl7pQ0p8jpAsBkB6MOemm6cj+tQzjYjw0QzVc1nykMr3x7
	6tF9uT/4sHRRX0YkM+UW0DYOc++ALpqmH514BOK5PlnZJVY5apg23XxPQey0Y4FTYaYW
	4oPcSlqsEn1KQdf2bqhgw3B7oKi7+VwPwnG0Qf6m2B7hFjwkpsuH+XlcpjsnJqFK2fjC
	c46dYZCyxl6w+qI7CcTaKhEcGuWYGzL+3pKoCDnqJ3ABpfWQf5coZc8bcRrO/5WBvoqb
	mvxA==
X-Gm-Message-State: APjAAAVtSU2QLjEHy5a1rjIA+Du/XD4jM9F1Jf5zJcOwxIvoIVYX1SXZ
	wxAZgETllh8orup6dmMXT5sYmJ95cITVQ1lyvCI=
X-Google-Smtp-Source: APXvYqzzXupIW27mHJO0BylenQ6gGKPgWuAADivGYfNTN86Pb8pFln8vN7Y0FNFOO490Z06B77bqfqDNvdCLT+boBuA=
X-Received: by 2002:a05:6602:2181:: with SMTP id
	b1mr34477037iob.198.1559891873506; 
	Fri, 07 Jun 2019 00:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <1559613157-28527-1-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1559613157-28527-1-git-send-email-yi.zhao@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 00:17:42 -0700
Message-ID: <CANx9H-Bqm8GyHP=yMYvrMFyMzHXG_=NsTKCPgR20rdS8avh=iQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	open.source@oleksandr-kravchuk.com
Subject: Re: [meta-networking][PATCH] python-ldap: add python-pyasn1 and python-pyasn1-modules as runtime dependencies
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
X-List-Received-Date: Fri, 07 Jun 2019 07:17:52 -0000
Content-Type: text/plain; charset="UTF-8"

This recipe needs a python3 version as well. Python2 will be EOL soon.

On Mon, Jun 3, 2019 at 6:53 PM Yi Zhao <yi.zhao@windriver.com> wrote:

> According to Doc/requirements.txt, this package needs python-pyasn1 and
> python-pyasn1-modules as runtime dependencies.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> index d10f11b..af8961e 100644
> --- a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> +++ b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
> @@ -26,4 +26,6 @@ do_configure_prepend() {
>  RDEPENDS_${PN} = " \
>      ${PYTHON_PN}-pprint \
>      ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-pyasn1 \
> +    ${PYTHON_PN}-pyasn1-modules \
>  "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

