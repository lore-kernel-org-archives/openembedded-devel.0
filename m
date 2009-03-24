Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lm8e0-00085S-O5
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 16:34:24 +0100
Received: by gxk18 with SMTP id 18so6360042gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/Dk7KY7erTYAyjTKkgMJeaxRB7HeUUIFW20f67ovQEk=;
	b=fXpQL8Fm9AGOSJkiXWytzb7J/OCWJnZCMN3+UpaYhbwU/mkW4XGo2DeIIcBWfjoyYr
	wfhJnPc21hA1MPRmcw8CEzUZc+CaV8Hpd0tEBk5t4jsnLn4GImrFTeRGmqmlbRmC1igE
	eMtmfvlwHEJT/hanRDj0UCuDYysyrrcM+9bKk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=T/8PwCvgeOCnI3CW7px3htHYxD8FVL/SOM5uauxSAOiKblA4w0G8vi74VHV/1ebLRm
	zgTsRqljRR1IVhEev/JL3F1ABdH31rnioe8Nmqby8aYhyLbxUAluW/1HK0z12vmh6zxe
	RW27VO0DtoBYGiXUwvBPCPdNpZBDWHj0+/IzQ=
MIME-Version: 1.0
Received: by 10.150.52.2 with SMTP id z2mr14535854ybz.217.1237908773696; Tue, 
	24 Mar 2009 08:32:53 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.00.0903191110370.9227@localhost.localdomain>
References: <alpine.DEB.1.00.0903191110370.9227@localhost.localdomain>
Date: Tue, 24 Mar 2009 11:32:53 -0400
Message-ID: <f96d234e0903240832k104f0753see3623d67d71dbb8@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] class_siteinfo.xml: Replace packages/ with recipes/.
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
X-List-Received-Date: Tue, 24 Mar 2009 15:34:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

applied, thanks.

On Thu, Mar 19, 2009 at 2:11 PM, Theodore A. Roth <taroth@gmail.com> wrote:
>
> ---
> =A0docs/usermanual/reference/class_siteinfo.xml | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/usermanual/reference/class_siteinfo.xml b/docs/usermanu=
al/reference/class_siteinfo.xml
> index 4d66e85..82dbd84 100644
> --- a/docs/usermanual/reference/class_siteinfo.xml
> +++ b/docs/usermanual/reference/class_siteinfo.xml
> @@ -148,7 +148,7 @@
>
> =A0 =A0 <variablelist>
> =A0 =A0 =A0 <varlistentry>
> - =A0 =A0 =A0 =A0<term>org.openembedded.dev/packages/&lt;packagename&gt;/=
site-&lt;version&gt;/</term>
> + =A0 =A0 =A0 =A0<term>org.openembedded.dev/recipes/&lt;packagename&gt;/s=
ite-&lt;version&gt;/</term>
>
> =A0 =A0 =A0 =A0 <listitem>
> =A0 =A0 =A0 =A0 =A0 <para>This directory is for site files which are spec=
ific to a
> @@ -158,7 +158,7 @@
> =A0 =A0 =A0 </varlistentry>
>
> =A0 =A0 =A0 <varlistentry>
> - =A0 =A0 =A0 =A0<term>org.openembedded.dev/packages/&lt;packagename&gt;/=
site/</term>
> + =A0 =A0 =A0 =A0<term>org.openembedded.dev/recipes/&lt;packagename&gt;/s=
ite/</term>
>
> =A0 =A0 =A0 =A0 <listitem>
> =A0 =A0 =A0 =A0 =A0 <para>This directory is for site files which are spec=
ific to a
> @@ -177,4 +177,4 @@
> =A0 =A0 =A0 </varlistentry>
> =A0 =A0 </variablelist>
> =A0 </section>
> -</section>
> \ No newline at end of file
> +</section>
> --
> 1.5.4.3
>
>
> Signed-off-by: Theodore A. Roth <taroth@gmail.com>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


