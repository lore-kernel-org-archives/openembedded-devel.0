Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id E18AE6013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 09:26:32 +0000 (UTC)
Received: by wiun10 with SMTP id n10so88898122wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=gerH4cA5jGVUNzyuwXdJGteaaW5koJYhwfrC8i9H1JE=;
	b=z83U19aB/ly0UJLbXJFcoFUndWycg3/ejOHZ1qyqrDRTlnCU/EFSQjKlqGwiisy10Q
	VuaIvAs2uTqAoAyr0LGFrJcHupOetJRv/6MftAPBJGJTo0LzgtgaunP75IMI0wYzOJ3X
	XarcmLzVhBpo/h5XrxDuNmsAr+IrljjhGs4SDgdKp46+CWN1Y8TsH3SzPBRXMM2hlG6Q
	OZRvDbt83sajv/Q6kLYXxPhmpzvvkk5H9C2eF13+2+sHgfQHP3SDXHbyz+IisnCChiJX
	VWZOfYuyoDB0n9gA6rkLKFq53YhDf1f1NDGpYKtQe97tZc5nH/N5MtHlds+62+EeZgEN
	q4YA==
X-Received: by 10.180.74.144 with SMTP id t16mr17540997wiv.33.1431336393534;
	Mon, 11 May 2015 02:26:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm12336291wix.4.2015.05.11.02.26.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 02:26:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 11:27:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511092704.GH2400@jama>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
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
X-List-Received-Date: Mon, 11 May 2015 09:26:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2015 at 03:42:16PM +0800, Yi Zhao wrote:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

Changes 03, 18, 20 didn't make it to patchwork, because they were marked
as Spam by gmail, please try to resend or send cover letter with repo
url where I can cherry-pick them.

> ---
>  .../smstools3/smstools3_3.1.15.bb                  |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b=
/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> index 7a72a1e..c4b6b60 100644
> --- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> @@ -12,7 +12,7 @@ SRC_URI[md5sum] =3D "0241ef60e646fac1a06254a848e61ed7"
>  SRC_URI[sha256sum] =3D "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea0=
2f5bf05234814d59"
> =20
> =20
> -S =3D "${WORKDIR}/${PN}"
> +S =3D "${WORKDIR}/${BPN}"
> =20
>  RDEPENDS_${PN} =3D "bash"
>  INITSCRIPT_NAME =3D "sms3"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

