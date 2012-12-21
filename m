Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmAVi-0003iZ-6b
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 22:52:06 +0100
Received: by mail-we0-f176.google.com with SMTP id r5so2317995wey.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=EYIqeaVvV4pSENqX/nKzsbYJ3/tEeoMEOaMPWkRBYs8=;
	b=ys26cIInfym8r42Yj6Tr1BR1ScIIG5fvtfUEeU/p+OOqjWRnX1umjm+EygMdV6Vao9
	r75AKKp2wKOlyL30zh1bUl4qf0dZkYjs8839eqDFUZfP7aC+K/9sGJTUV7wFSdsJWiU6
	otMBA+33RHeFFdw6AJuNHNaQfsH6qFXviPyLLyvOrcBfpWn/+wik1Ew4Wn+nVKe/c3me
	HC54AwhMDWjSfqROPkcCxSgNaL+7UXpExGAYyODwkPoqSxD5v8U31/cpl0Oi43c3bFce
	7xbxd4z/yvnUuQZCB3SIeP6NpJMLLwmjvCjTZBRJKj8bGlqcbRNNYqsD/3keEneHVbfU
	KMFw==
MIME-Version: 1.0
Received: by 10.180.90.106 with SMTP id bv10mr24950350wib.12.1356125840087;
	Fri, 21 Dec 2012 13:37:20 -0800 (PST)
Received: by 10.194.178.72 with HTTP; Fri, 21 Dec 2012 13:37:20 -0800 (PST)
In-Reply-To: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
References: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
Date: Fri, 21 Dec 2012 22:37:20 +0100
Message-ID: <CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] traceroute: Remove bashisms
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
X-List-Received-Date: Fri, 21 Dec 2012 21:52:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 21, 2012 at 10:23 PM, Morgan Little
<morgan.little@windriver.com> wrote:
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> index 719d9fb..d855c67 100644
> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> @@ -32,10 +32,8 @@ do_install() {
>
>      install -d ${D}${mandir}
>      install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
> -    pushd ${D}${mandir}
> -    ln -s ${PN}.8 ${PN}6.8
> -    ln -s ${PN}.8 tcptraceroute.8
> -    popd
> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8
> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8

Thanks for quick reply and fix, but I think this should be:
> +    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
> +    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8

${D} path won't be valid on target and missing slash after mandir

And is there something referencing those man pages with different
name? Or why are those symlinks provided?

Cheers,


