Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtOdR-00005b-5C
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:40:44 +0200
Received: by iwn2 with SMTP id 2so194076iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7YtE6/kIpMa1PvtjI4mn6soAe2YKbfewzkaKxRj0cuM=;
	b=FhZ5ows3nmfo5uQhOE6Xl+y8/Vlii1ngo7xeVi9jjNTLkp3acw4rdH4dvdy0PiQlxr
	3YBcwMOcKNDOeAXfnvuIacKO2cJjTEUmtQ1on2IRB0yws8hZpwy8ek+awbGnVgrGQuiA
	+/3AS9Vp5qdrHcA5FEt2h0yoH9uSLeqt65tHM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=G+xxSEikPHBVRtEwKXOStACd61PeYqq5jJa7fW9trDnF/KiCW4k9o1DKWeP6wmEQuc
	amKP0COOVjuU3QNjetlP54v3YCOcITy9QiE4XC6jL17Fc1xKqfcTZhLeD6OsjU9R3Nv/
	qOXVdlqAqiWdqdaebql2pVwNG5FNQ1Vl2S2Lo=
Received: by 10.231.19.74 with SMTP id z10mr10123232iba.120.1283967594138;
	Wed, 08 Sep 2010 10:39:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 10:39:34 -0700 (PDT)
In-Reply-To: <1283959306-16633-1-git-send-email-chase.maupin@ti.com>
References: <1283959306-16633-1-git-send-email-chase.maupin@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 10:39:34 -0700
Message-ID: <AANLkTi=1UB=yxN3L+08XkTHjyYPTnRPFLkgZyqYjAj=n@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Wed, 08 Sep 2010 17:40:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 8, 2010 at 8:21 AM, Chase Maupin <chasemaupin03@gmail.com> wrot=
e:
> * Added a description of the SOC_FAMILY variable that
> =A0can be set in the machine configuration files.
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
> =A0docs/usermanual/chapters/common_use_cases.xml | =A0 13 +++++++++++++
> =A01 files changed, 13 insertions(+), 0 deletions(-)
>
> diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/userman=
ual/chapters/common_use_cases.xml
> index d86d0ca..9d1dc6d 100644
> --- a/docs/usermanual/chapters/common_use_cases.xml
> +++ b/docs/usermanual/chapters/common_use_cases.xml
> @@ -94,6 +94,19 @@ SRCDATE =3D "20061014"
> =A0 =A0 =A0 =A0 </listitem>
> =A0 =A0 =A0 </itemizedlist></para>
>
> + =A0 =A0<para>There are also some optional variables that can be defined=
:
> + =A0 =A0<itemizedlist>
> + =A0 =A0<listitem>
> + =A0 =A0 =A0 =A0 =A0<para><command>SOC_FAMILY</command> describes a fami=
ly of processors
> + =A0 =A0 =A0 =A0 =A0 =A0that all share common features such as kernel ve=
rsions,
> + =A0 =A0 =A0 =A0 =A0 =A0bootloaders, etc. =A0This is used to allow overr=
ides for a whole
> + =A0 =A0 =A0 =A0 =A0 =A0set of devices rather than per machine overrides=
 being used.
> + =A0 =A0 =A0 =A0 =A0 =A0The use of SOC_FAMILY as an override is currentl=
y a distribution
> + =A0 =A0 =A0 =A0 =A0 =A0or local setting.
> + =A0 =A0 =A0 =A0 =A0</para>
> + =A0 =A0 =A0 =A0</listitem>
> + =A0 =A0</itemizedlist></para>
> +

You should also explain why it is different from MACHINE_CLASS and
possibly add one use case as an example

> =A0 =A0 <para>Next the kernel recipe needs to be added if it doesn't alre=
ady exist.
> =A0 =A0 </para>
> =A0 </section>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


