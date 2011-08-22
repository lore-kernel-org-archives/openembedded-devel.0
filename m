Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QvY8A-0003sZ-OR
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 19:17:46 +0200
Received: by gwb11 with SMTP id 11so2923490gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Qm6ut7qyvdcZibI8XSVwLWNiGvZziRWpnt7FECnfvNE=;
	b=swU/eUnc2Gdqj8XqPvNG29AcxWHJ9WHm43dfLgxrstH0e/GTdiMK1qMHT3s6mJHTd6
	30/bB4nlxUrDk0h9OR/jmERRufTv05dQLaQTPb9fp0rextLfHomdcOckZlleij7bc+gc
	3FFpwNMZv49KZVCxDKVufVGbeI84adI65ygeE=
MIME-Version: 1.0
Received: by 10.42.29.193 with SMTP id s1mr2625613icc.439.1314033181713; Mon,
	22 Aug 2011 10:13:01 -0700 (PDT)
Received: by 10.42.220.70 with HTTP; Mon, 22 Aug 2011 10:13:01 -0700 (PDT)
In-Reply-To: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
References: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
Date: Mon, 22 Aug 2011 12:13:01 -0500
Message-ID: <CA+M6bXk5g10JhXzQ8KeBO_2FcU=4zuF-JS3iFMrQrxB4HO-+Dw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
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
X-List-Received-Date: Mon, 22 Aug 2011 17:17:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2011 at 9:32 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * Added recipe file to build 3.0-a9 version.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0.../lmbench-3.0-a9/update-results-script.patch =A0 =A0 | =A0155 ++++++=
++++++++++++++
> =A0meta-oe/recipes-support/lmbench/lmbench_3.0-a9.bb =A0| =A0 75 ++++++++=
++
> =A02 files changed, 230 insertions(+), 0 deletions(-)
>
> diff --git a/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-result=
s-script.patch b/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-resu=
lts-script.patch
> new file mode 100644
> index 0000000..3feb657
> --- /dev/null
> +++ b/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-results-scrip=
t.patch
> @@ -0,0 +1,155 @@
> +Now that we have our binaries in /usr/bin rather than the normal
> +lmbench hierarchy we need to update the scripts as well to bave well her=
e.

There's now a defined patch header, please update to this.

> diff --git a/meta-oe/recipes-support/lmbench/lmbench_3.0-a9.bb b/meta-oe/=
recipes-support/lmbench/lmbench_3.0-a9.bb
[snip]
> +python do_unpack () {
> + =A0 =A0 =A0 bb.build.exec_func('base_do_unpack', d)
> + =A0 =A0 =A0 bb.build.exec_func('byebk_do_unpack', d)
> +}
> +
> +byebk_do_unpack () {
> + =A0 =A0 =A0 find ${S}/.. -name BitKeeper -o -name SCCS | xargs rm -rf
> +}

All of this, I believe, dates back to when OE was in BK and that could
be problematic, we should drop this now I think.

Thanks!

--=20
Tom


