Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7AD60043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 20:04:24 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l184so6146917lfl.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 13:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=En+WJrXhmm6Vc4uNm+izrgIIKUDlrBW+5WjVtpSB/Hc=;
	b=0DHUytIwvHBt8s16HAz/cq22gml6KJKsZCCe/wUpm3NknZnZEWJ5nGy4tEedGyLVkU
	oSXQOD+E8ue3nqrXs3bzbWhVqz4oAIA8Y7wfTnbW8wfrR30ANMWXK8aeGbgtohjPZRdb
	oum4MY9jx8u2G126N1Uzffl9crfensb+2Ge/96N3AUNBFDqll11UGCkbYOv0JFYBfDdK
	UbgA1mEY+7cWdY0lMwkZyZb8e7wueyE5ILpTv0C1qUh6CCcXkMut2Rw0bFJhuSNRidaY
	oA/KKcNCD5lQkLV+8PIakY7kF+on4kre217xgDWiiLI485rgjFFq2Q8SleHBYYNnPRDu
	OBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=En+WJrXhmm6Vc4uNm+izrgIIKUDlrBW+5WjVtpSB/Hc=;
	b=YIrHNW0k3FvK+yVwnfVbK/q0bhzHS4lN93W7SW+Am+a+ZRmz8+R9tL6Ya1QxYLK4XG
	8zep52+Z33rLj+t+zupL31rhhFR4wVyrTHtURlx9K5kTztJ/q72tUd0KViZVg7qAojqL
	uaSfwAI3bOGtABB9STfBU2fgb9iX/F5bkdwe+1elexN++Wjf08U0CvGjv6UVludQJZrt
	EqUrGtwTusYTNnNmhBu1t4ij/J1SwicjW2mRZei20Eiv1yzIy6YQ9y1op8twi5ZdzYDu
	39757n6wbKi4+ibIb3Rlbzo/cD+RWYSp/critcQ1JqO5VzPE9Bq2RXOtTiLcyGGt76Rh
	FoFg==
X-Gm-Message-State: ALyK8tJBx8raZMSBUkY+gO8rb1ql/JM2CPukva12Ky7bTjpmQ1MWKOyREMZVoFB76HxlvkH1C3NOp17/QHbFjQ==
X-Received: by 10.25.21.32 with SMTP id l32mr3370828lfi.229.1467230664451;
	Wed, 29 Jun 2016 13:04:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.160.133 with HTTP; Wed, 29 Jun 2016 13:04:23 -0700 (PDT)
In-Reply-To: <1467188567-28145-6-git-send-email-mingli.yu@windriver.com>
References: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
	<1467188567-28145-6-git-send-email-mingli.yu@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Jun 2016 22:04:23 +0200
Message-ID: <CA+chaQcPagpczOJiiOqUxtFcDWa6MWVjhZVij6PhB1_NhfP33Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 5/5] python-setuptools-scm: Add python-setuptools-scm bb
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
X-List-Received-Date: Wed, 29 Jun 2016 20:04:25 -0000
Content-Type: text/plain; charset=UTF-8

ERROR: python-setuptools-scm-1.11.1-r0 do_fetch: Fetcher failure:
Fetch command failed with exit code 8,
output:https://pypi.python.org/packages/source/s/setuptools_scm/setuptools_scm-1.11.1.tar.gz:
2016-06-29 07:45:31 ERROR 404: Not Found.

ERROR: python-setuptools-scm-1.11.1-r0 do_fetch: Function failed:
Fetcher failure for URL:
'https://pypi.python.org/packages/source/s/setuptools_scm/setuptools_scm-1.11.1.tar.gz'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python-setuptools-scm/1.11.1-r0/temp/log.do_fetch.7515


On Wed, Jun 29, 2016 at 10:22 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python-setuptools-scm bb as python-pytest-runner depends
>   on python-setuptools-scm
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python/python-setuptools-scm_1.11.1.bb             | 18
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-setuptools-scm_1.11.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/
> python-setuptools-scm_1.11.1.bb
> new file mode 100644
> index 0000000..0b306f4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "the blessed package to manage your versions by scm tags"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
> +
> +inherit pypi setuptools
> +
> +SRCNAME = "setuptools_scm"
> +
> +SRC_URI = "
> https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> "
> +
> +SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
> +SRC_URI[sha256sum] =
> "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +RDEPENDS_${PN} = "python-py python-setuptools python-argparse
> python-debugger python-json"
> +
> +
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

