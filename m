Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRWc-0003B0-41
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:41:12 +0200
Received: by fxm9 with SMTP id 9so590619fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qc8vOyw7S6YODn7EdYbzIk0qu4r6BIgEt+TntNC9gWM=;
	b=Rs0THLQmm1lJNImS9nGb3CzSQGp4xqcaGDHTZ4ldgh6zT17HmAdPqoQhq2WVlAhmI1
	/G7Aq6pUkPS9Ghn+lDAvAcxLukiZdatogjXCf/7uE81xl9aUVUE7ZqfYkMrP2uDZ7pAE
	I2O84x0UhVsCOIDSjnzGBwVftxWn/k8pwX8f4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BijG80h4q01EcVb7ka48qyB7bk/3XnZBChFLPRJuzVxYP9UohmTYB4yWqYHQxomq9o
	p8CjpCgGJNYBjU2pl3JTJ1+6MnZqYUCb3pLswJCuHWhNW0Ftlz3K7KgvQoVHgIvxpOJO
	Ujdz2jhxYgIK3KyBE0OOQnqOwD76za4TtHppg=
MIME-Version: 1.0
Received: by 10.223.64.194 with SMTP id f2mr11423015fai.2.1275637009452; Fri, 
	04 Jun 2010 00:36:49 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:36:49 -0700 (PDT)
In-Reply-To: <1275510896-30845-3-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-3-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:36:49 +0200
Message-ID: <AANLkTinLqCdhWrZamX6ikf7G8yAONWO18awGZBvWCbD5@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 02/16] classes/gettext.bbclass: Account for libiconv and libintl too.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:41:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0classes/gettext.bbclass | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/classes/gettext.bbclass b/classes/gettext.bbclass
> index a40e74f..d0578b0 100644
> --- a/classes/gettext.bbclass
> +++ b/classes/gettext.bbclass
> @@ -4,14 +4,14 @@ def gettext_after_parse(d):
> =A0 =A0 =A0 =A0 cfg =3D oe_filter_out('^--(dis|en)able-nls$', bb.data.get=
Var('EXTRA_OECONF', d, 1) or "", d)
> =A0 =A0 =A0 =A0 cfg +=3D " --disable-nls"
> =A0 =A0 =A0 =A0 depends =3D bb.data.getVar('DEPENDS', d, 1) or ""
> - =A0 =A0 =A0 =A0bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libic=
onv|virtual/libintl)$', depends, d), d)
> + =A0 =A0 =A0 =A0bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libic=
onv|virtual/libintl|gettext|gettext-native)$', depends, d), d)
> =A0 =A0 =A0 =A0 bb.data.setVar('EXTRA_OECONF', cfg, d)
>
> =A0python () {
> =A0 =A0 gettext_after_parse(d)
> =A0}
>
> -DEPENDS_GETTEXT =3D "gettext gettext-native"
> +DEPENDS_GETTEXT =3D "gettext gettext-native virtual/libiconv virtual/lib=
intl"
>
> =A0DEPENDS =3D+ "${DEPENDS_GETTEXT}"
> =A0EXTRA_OECONF +=3D "--enable-nls"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


