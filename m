Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC5F7E0D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 17:02:20 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id f24so17096821qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 10:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hgTrgSCh64LR7gcwsSxE91AcJc3cjIDmgntezAe/F70=;
	b=Hs3u4HKeL2ZrW/Rbaxqjf8qwnr/k8STFiHWL5pAKnslepN5u2c8OEznvCQH11cbyeU
	PHiimC4a4IKZQJxl9mV0gPjSpGB9DZwyUCUsopMmvqJ/oqZLnObCSUfC/k2l96/7R49f
	HdLRfw9uBfGDPw8U5FZqYxecoCeU0sCoujQ+4uCHwpjy78PRuLqVybv6YsS+XpNMBvYz
	gGHJqX7AQSj1tfHYVcv4eVG3tSq442YUMdIObsrG65oxs/R4MoREKF+oXx6Q8S3ebZia
	elw6z1VcFMpFOuJguzXHbGhrLCmjVKH9D5z2/Coh5PayJ1ZGOUIbP4EMfOS7X5xvTaz4
	ynOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hgTrgSCh64LR7gcwsSxE91AcJc3cjIDmgntezAe/F70=;
	b=TsxYwK0ECSUGoBN8J3/kLfwFbUpqRbzyZvwnTt1eHuJQBDXVMhdOdK0ktaDLivSxVR
	qVsDEHFK+5FH1EVXd1MCgJk8E84I9TJyfyUWn9xxQLAodFRxv372SoMED9LwFcx3cyLp
	Fz2+WR0hne7muNdS37Mr8X+GD7h+uJXp2aFMbUWuUSo3p3po9QD4p26OpIGQfFkhl77a
	7gbmu0YqIlLrTfczWBpEr6/E8EbhICavn1eu1mjXwaFUzGq0gnv1QfyUrHYxwpsPeK9T
	PJFJn/+1oDokw+dky97Lq9VXmZH5/Q1J2bbySiVLaWFVPyjS3Ri07XUjLGdt1HC/TtTG
	vcdg==
X-Gm-Message-State: APjAAAWY8fXL6aIJSpS3rDudaT1qOBn3rW7MX7pgUyZd5+hV1UtUUf80
	bFbHb4V+q0b0Ltla6HzF5qkwj5mgoOx1Jw9fzagzRY7I
X-Google-Smtp-Source: APXvYqw4en+rpnefSL7q1t7hQlhIM8kUUGjMgyNc4cnTbaC3lNiXe/L5o68Ey45nQCq/IHV9KXtPLpuxzwXiIQ3llQA=
X-Received: by 2002:aed:23a8:: with SMTP id j37mr25599429qtc.53.1558371740943; 
	Mon, 20 May 2019 10:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190520165216.12220-1-thstead@steadtechnology.co.uk>
In-Reply-To: <20190520165216.12220-1-thstead@steadtechnology.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2019 10:01:55 -0700
Message-ID: <CAMKF1spAD7nDdAw0Jc_-oy0WBqTYZdJspsmbHBUL-YJXPYgH5w@mail.gmail.com>
To: thstead <thstead@steadtechnology.co.uk>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] Upgraded python-pysnmp from version 4.3.5. to 4.4.9. This upgrade was required to correct an issue with the Integer32.clone method taking vairable parameters as opposed to the 4 defined in v4.3.5. The error was occurs within __SNMP-FRAMEWORK-MIB.py
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
X-List-Received-Date: Mon, 20 May 2019 17:02:20 -0000
Content-Type: text/plain; charset="UTF-8"

Add something about why License checksum is changes in commit message
secondly, format the commit message such that the subject line is followed by
an empty line before detailed description starts in commit message.

On Mon, May 20, 2019 at 9:59 AM thstead <thstead@steadtechnology.co.uk> wrote:
>
> Signed-off-by: thstead <thstead@steadtechnology.co.uk>
> ---
>  .../python/{python-pysnmp_4.3.5.bb => python-pysnmp_4.4.9.bb}      | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pysnmp_4.3.5.bb => python-pysnmp_4.4.9.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb
> rename to meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> index 0b38d58e4..9ff4df2c9 100644
> --- a/meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb
> +++ b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> @@ -6,14 +6,15 @@ DESCRIPTION = "SNMP v1/v2c/v3 engine and apps written in pure-Python. \
>  HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
>  SECTION = "devel/python"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=280606d9c18f200e03e0c247ac61475a"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
>
>  SRCNAME = "pysnmp"
>
>  SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "387aaa23c168ccc0b59775cfdf519fc0"
> -SRC_URI[sha256sum] = "38253fe95cea33f352fb36e85f3c2874043401724300c4888df74835161169d2"
> +SRC_URI[md5sum] = "6d1b514997326bed18f1ae1510f6b1c9"
> +SRC_URI[sha256sum] = "d5d1e59780126e963dd92e25993b783295734e71bef181f602e51f7393260441"
> +
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

