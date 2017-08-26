Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCA68784A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 00:13:48 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 63so1760544pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k0fbak1DWrsiNjaaiLbwiYV9o9779MIOJKZcvYbAFdU=;
	b=G0cguMJt/hR7DzKTm+ShhGee3AHEjhdW2m+sAn5TvTYkZdO/MZen4kR3QY9T2N+7hm
	6To+eumjPyD9ebM4uRuZ//lcdM8KI6CilB/TiaQqgXaCnUFRQ/FT0D+R0yTqEennK8h7
	5nQzvxsjBb+QSE57AOqcvItSVWzJdJji/7sh9N62/84X9MalqVuyUcqVUu1C7i4H+QIS
	dARNQ8djkUYROvi+zYOuJzdQzJuMc4SHgrD67uk08KfjENIWlp0T9yfpOE8ulcqhICjW
	wk0KP6cQOrq3NI5pg/DeV9vnvbN3njF5Okiu6495YDWxcFKC9Ssc+ut8ylue08PM5gPW
	qhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k0fbak1DWrsiNjaaiLbwiYV9o9779MIOJKZcvYbAFdU=;
	b=Zc8Teidh501bw/eDOx3MY3VMHr1aRkT5jQpp+ATTGC3ynco/bMrwvo2Rq1OPcgx8Zc
	GpupmXcIrCfYSDORpXBnfX7vbyUNOrJFzOeZJNPUpBlHDb6WUSRP1Wbb/dRyrC0NAQc8
	vDHgXbHfFTDMjOftjXO67hz7S6DF/dEey3KPbzjlISlSzvCS2s3Zd++CkBDPyhmavUio
	212iIb+o4159tsFSLTt5BaQSF7p//gPUnOb67tKI/1UCeu7EP+Nu7yojR3+rRbv8cDrS
	RO6j+/oHKfmh6UAR0gVjrygeOTzKWOhVIg7GqTvUqdP9g8F40VV2MDJx6IRz68JeH2Bg
	zVkA==
X-Gm-Message-State: AHYfb5hUl7cYaZKk9XvpQ3lh8fx2qdrTfb5arfg8Bl5/MwSghNJLAA1N
	KddWJHsmAzlmXeBkwJXrL4zvXeb8rw==
X-Received: by 10.99.116.79 with SMTP id e15mr191922pgn.317.1503706430070;
	Fri, 25 Aug 2017 17:13:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 25 Aug 2017 17:13:19 -0700 (PDT)
In-Reply-To: <20170825225423.7248-1-jslater@windriver.com>
References: <20170825225423.7248-1-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Aug 2017 17:13:19 -0700
Message-ID: <CAMKF1spt4LGdD0KWww+TUu9pRFsSrQdLQ+PVKg2wixWvoUCBnw@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] enscript ndisc6: specify target location of perl
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
X-List-Received-Date: Sat, 26 Aug 2017 00:13:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 3:54 PM, Joe Slater <jslater@windriver.com> wrote:
> configure finds the host perl, so we do not let it look
> by setting PERL in the environment.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb | 5 +++++
>  meta-oe/recipes-extended/enscript/enscript_1.6.6.bb    | 6 ++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> index bea5e13..7771069 100644
> --- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> @@ -49,6 +49,11 @@ or IPv4."
>  DESCRITPION_${PN}-rdnssd       = "Daemon to autoconfigure the list of DNS \
>  servers through slateless IPv6 autoconfiguration."
>
> +# We do not run perl during the build, but only use it on the target.
> +do_configure_prepend() {
> +    export PERL="/usr/bin/perl"
> +}
> +
>  do_install_append () {
>      rm -rf ${D}${localstatedir}
>      # Enable SUID bit for applications that need it
> diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> index 9612988..bf63ccf 100644
> --- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> +++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> @@ -19,4 +19,10 @@ inherit autotools gettext
>  SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
>  SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
>
> +# We do not run perl during the build, but only use it on the target.
> +do_configure_prepend() {
> +    export PERL="/usr/bin/perl"
> +}

May be using something like

EXTRA_OECONF += "'PERL=${USRBINPATH}/env perl'"

would avoid hardcoding the perl path

> +
>  RDEPENDS_${PN} = "perl"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

