Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5527F9A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 18:07:32 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z67so8165559qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/YYBxMGdsueUgrF4oeO2/jUodm2qFKeCh4mQSX6xQhs=;
	b=cCYLjd8A3idAOZyzDO7F3+mgnMhjP1g0i+bxk876rTcP1Wm/Q+9EiHqLUL0LvYelTk
	47faUPVZNExwNlMzp9MSsJwie8EEMZTOpW/Ka/6hxChOp2wZaUU/1DvL9PI0Rhbf7QZZ
	VfJpqwtho2VUirTJBDiVMxls9wpeInXb2Q7ezSeaWosu1VjzlVC32h+z3E0E98rRWda7
	QPJYqkIHwtm0s6epnAY5UKcw0y8zCmrTP7Q6+IyH9q9LHSSw7lkjSOSeEzcLKb8tw2P7
	fqtNXp6ycsFN/WWOgehsjuYw5GB92LkRlulv1r8kWLIWIToUH+6r8hiHJSFz/sR4KwnZ
	0UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/YYBxMGdsueUgrF4oeO2/jUodm2qFKeCh4mQSX6xQhs=;
	b=ikONNZDC8vIS41b3xwyScC1VO4/VpEIuYpV+fXhLljTGLwF8jnGiBpF07pEwP63if2
	E/YfxYtWeE5iBAGzxd2+zH/T6MT31BxbNLoLiS/X9/UL87nniJ3r5fGd+AHrKScWbNFB
	ZvvwMsai5YdR8lXsTztF7NDr4f7MzWnv17HEHm2JPx7HTqPw+3l80VDj0LrOfY7B7Wqr
	EchNqPRV/SI+8aXgx7mdhSuSo4yg5S5DAUKbEqyx7FKcvx5xs3IxI5xvu/flU7trpg5K
	QRMGrnHPXSb6KqbUiKd+QCLVS5WrCQsEyeQL0wfL+j4jM+NLXeNYrTEjoIfSOfcbx7c2
	N3MA==
X-Gm-Message-State: APjAAAVZjh9kgaWuseBz1EoCUVb16X3MbR1PmsCSHBDKO/m/V7MuKWYB
	6jdt88wQOmH1f9fs8vNnpv8ntKU4bDv9n3IQWrs=
X-Google-Smtp-Source: APXvYqz9v+zn1gLba/scR5yQfXGGoIqs2mR5BgOrs4Gr60sfxofrr+Li+wzfLhnwtQ+tw4f8fgeemkFFODVsJ87MJIU=
X-Received: by 2002:a37:84c3:: with SMTP id g186mr4938277qkd.71.1569002852826; 
	Fri, 20 Sep 2019 11:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568988163-30013-2-git-send-email-vincent.prince.external@saftbatteries.com>
In-Reply-To: <1568988163-30013-2-git-send-email-vincent.prince.external@saftbatteries.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Sep 2019 11:07:05 -0700
Message-ID: <CAMKF1sq_aV4azpAuOK9zcBup1CuXiJDdM+wTPs_Gwr7EUHdJfg@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH v2 1/4] python*-psutil: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 20 Sep 2019 18:07:32 -0000
Content-Type: text/plain; charset="UTF-8"

I have taken v1 of the first three patches. if there are any changes
in these three patches please send the delta on top of current master

I have taken fourth patch

On Fri, Sep 20, 2019 at 7:03 AM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
> ---
>  meta-python/recipes-devtools/python/python-psutil.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
> index e466c5c..0908c1c 100644
> --- a/meta-python/recipes-devtools/python/python-psutil.inc
> +++ b/meta-python/recipes-devtools/python/python-psutil.inc
> @@ -18,3 +18,5 @@ RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-threading \
>      ${PYTHON_PN}-xml \
>  "
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>

