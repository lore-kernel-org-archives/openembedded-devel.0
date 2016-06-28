Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 80CB960119
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 14:56:00 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id a2so2088913lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ZxYO3yadYZ0aRS+rerWnZK8iDqPaoG3iXeBROkQLIBw=;
	b=krMcDxmEljs+NB6Ea3zSF6goaYNR/ZdL+naSIg7mb3ID6oJDdg/frzC5jig6Bqy9e8
	EpHck8bDISQ0fMcdtRWXBVm17DNTcBlS92U2Hf47lU666gkvHMD0WlIatW4Gt4wS4Ex+
	FE7cHvOZ1Unf/xejF0m1jRFhLmFvIJM8EWxgVN+I1LYjecXJ15pmaNGNwpUAY5rkbD1w
	1zd3Ed55cmYoir5E3ZURpxhy7LJUGjhEXw9tG8cgI8JMnMWkJ5/lppahe9LdvX7CagEs
	5OpdoZ/OL4j+mIJoP5uq0PfljI4dcDcmSs8VOTX8+00ZUQQnX0vKrHaS6k4kver7MutB
	vn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ZxYO3yadYZ0aRS+rerWnZK8iDqPaoG3iXeBROkQLIBw=;
	b=lwoqz6krijjorZqKku5QCllOEM2So6DwvUIjfCBvGnDWgoETV8frc+gGYgNAKAIZVd
	PAYP1mh04e4en6YGJjt92PeNf7T0HZvAMbuqwZAqOzY44cD/NGPRbVSyDYT5c7/5XvSQ
	K1zE833geyzmKZXr/hb2PANg4TKG4D6xdAsk73NJs1yJtqPShqT7cd+mXV6MpEY81oSc
	lUGC/Jd8ML/HR8/RM+UejNGnauO4jwnSCecVXzCBClXLagKqBUD+516S6E9dfYH+KjIi
	ggWmJw5/nIAA2PFcINoeu2xwJkLigdyT3EyeypIB0mpfHafNq8wYNmYa4YUcdg0Z02jT
	aZRw==
X-Gm-Message-State: ALyK8tLLCWF+81UvW+p/9rtbjqbLiyICloTEozOcWAz/FsQTBaR8Ff3s3T6yn5RzHBFViHHhhgTD0o5OVQXscg==
X-Received: by 10.25.159.8 with SMTP id i8mr1326116lfe.74.1467125759953; Tue,
	28 Jun 2016 07:55:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.23.39 with HTTP; Tue, 28 Jun 2016 07:55:59 -0700 (PDT)
In-Reply-To: <1467102993-4925-2-git-send-email-mingli.yu@windriver.com>
References: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
	<1467102993-4925-2-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Jun 2016 07:55:59 -0700
Message-ID: <CANx9H-Bd94VW0SkM2=PN5LGKQ9EePa7bUO5wzX6PGP5wrJVs=g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/3] python-mccabe: Remove pytest
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
X-List-Received-Date: Tue, 28 Jun 2016 14:56:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 28, 2016 at 1:36 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Remove pytest to avoid dependency on python-runner
>   as only one file test_mccabe.py import pytest and this
>   test_mccabe.py file not install on our target eventually.
>
> That "one file" is where all the tests are housed. Just because you don't
plan to install the tests on target is no reason to disable testing. If
anything we need to see more testing of recipes, not less. The solution is
to add a recipe for the dependency of python-pytest-runner. Then you can
inherit ptest and package the tests separately.


> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python-mccabe-Remove-pytest.patch              | 32
> ++++++++++++++++++++++
>  .../recipes-devtools/python/python-mccabe_0.4.0.bb |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
> b/meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
> new file mode 100644
> index 0000000..ebe70c5
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
> @@ -0,0 +1,32 @@
> +From 7c0dc893cd3e57df16cf43d2c51c047997ea5c69 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 22 Jun 2016 02:33:48 +0000
> +Subject: [PATCH] python-mccabe: Remove pytest
> +
> +* Remove pytest to avoid dependency on python-runner
> +  as only one file test_mccabe.py import pytest and this
> +  test_mccabe.py file not install on our target eventually.
> +
> +Upstream-Status: Inappropriate[oe specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + setup.py | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index e59903d..64c3ded 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -33,8 +33,6 @@ setup(
> +     license='Expat license',
> +     py_modules=['mccabe'],
> +     zip_safe=False,
> +-    setup_requires=['pytest-runner'],
> +-    tests_require=['pytest'],
> +     entry_points={
> +         'flake8.extension': [
> +             'C90 = mccabe:McCabeChecker',
> +--
> +2.8.2
> +
> diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> index 0958f75..1377446 100644
> --- a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> @@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://README.rst;md5=f8b50fba1711ecac6bcdb6324f85a66d"
>
> +SRC_URI = "file://python-mccabe-Remove-pytest.patch"
>  SRC_URI[md5sum] = "8c425db05f310adcd4bb174b991f26f5"
>  SRC_URI[sha256sum] =
> "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca49822688642207b"
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

