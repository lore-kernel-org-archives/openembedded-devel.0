Return-Path: <cynthia.ms.chiu@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 881706067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 16:25:09 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id c199so4735295oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 09:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=rMV4ARJ34CfQoxaW1v6pmb+leZjvjVj+/43et64seaI=;
	b=z3UneEX8tCS6PTspiEhQFNT/tyvFPtjZpCESUh06BHMV6RDh+R5eqvGIMCvHfFoPuF
	cYq9ff+p0yDkQhe/4jIyqzgNGLtm28UyD4MN2BQeVFClBGT4zEt5NBIv2J403YgwOD5M
	bZr2LoEnW5Zn6t0hkBD4Lgu5z6ThHyMtxMDoOXylAzm0eoZ8kGU0nvOvcvvmp97LLoBo
	hYbgofcbkUK8WoflzJJWSk2q+WoVOR3/+E/3uLz1DASkQvEHA6i1uCTx6/KaI8FIz8z1
	0nPrHv3myqQ9R1ZZ2sbowkt8Qx8HBYBecqLlpHuBjzaWyiM2R+AYDgUqbss6CcSnBLMz
	5QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=rMV4ARJ34CfQoxaW1v6pmb+leZjvjVj+/43et64seaI=;
	b=UITqRAvxR0SACJxe1sYHwUDC39Ns081rKm3yNANC4HEe4dhuA8XlvVLfLJUpLAoI7e
	PE9FCEuFLymJjBRuSCmIUXco6KDEKIiiR9XGzv+12VtIRgKV3UbAiBhir3a44O4mmnhd
	sNYTrt+DH/+bl/pIvpdfXKIxDr1svKf56EsXBPrnjPYiXs/W9CTBgH17uqZs7uWWnhe7
	9JqK20PjEy8GFCQocBnI510kQkyWDTVqvzPBRotH0z88Cc3ncpumszOYtZb28e44Phi/
	HZ8DV+XnAsXZFZphQlqAV04dGNUNxk1Q+QMSikbw66llOLFBFBhdOROCy0SYtnXJTrco
	mD5A==
X-Gm-Message-State: ALyK8tKCkYj4qWRgaj95Pc9MfzRIoyDpbAYocmcFDtCLQ+6D6uPIMqQCD8MpZFhFWL1mzK3+SYAlNQDjuiGpZg==
X-Received: by 10.157.37.181 with SMTP id q50mr6067005ota.79.1468427110553;
	Wed, 13 Jul 2016 09:25:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.105.213 with HTTP; Wed, 13 Jul 2016 09:25:10 -0700 (PDT)
In-Reply-To: <CADNbA1rUxG5LJb5VahaWFVkvfTM99N5Ba7VrxV9e5f_LnbXx9w@mail.gmail.com>
References: <1468421827-11561-1-git-send-email-cynthia.ms.chiu@gmail.com>
	<CADNbA1q33HHYm-52EZjFLE1beKLusD_rHTD4HJGiLP_5mAOvxw@mail.gmail.com>
	<CADNbA1rUxG5LJb5VahaWFVkvfTM99N5Ba7VrxV9e5f_LnbXx9w@mail.gmail.com>
From: Cynthia Chiu <cynthia.ms.chiu@gmail.com>
Date: Wed, 13 Jul 2016 10:25:10 -0600
Message-ID: <CAFn+KXCXJ8_90D8KAy_kO9hFWmFs1wLVnh=WhnGk91jXuEpdyA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] CANopenNode: recipe for building the CANopenSocket tools
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
X-List-Received-Date: Wed, 13 Jul 2016 16:25:12 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for your feedback! I have updated it to use gitsm.

On Wed, Jul 13, 2016 at 9:50 AM, Derek Straka <derek@asterius.io> wrote:

> Have you tried using the gitsm (
>
> https://www.yoctoproject.org/docs/2.1/bitbake-user-manual/bitbake-user-manual.html#gitsm-fetcher
> )
> fetcher instead of git?  I believe gitsm should do all of the submodule
> init and update actions automatically rather than having to use a
> do_compile_prepend.
>
> -Derek
>
>
> On Wed, Jul 13, 2016 at 10:57 AM, cynthiachiu <cynthia.ms.chiu@gmail.com>
> > wrote:
> >
> >> Initial check-in for the CANopenSocket tools recipe.
> >>
> >> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> >> ---
> >>  .../canopennode/canopensocket_git.bb               | 31
> >> ++++++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >>  create mode 100644 meta-oe/recipes-extended/canopennode/
> >> canopensocket_git.bb
> >>
> >> diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> >> b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> >> new file mode 100644
> >> index 0000000..4506698
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> >> @@ -0,0 +1,31 @@
> >> +SUMMARY = "Linux CANOpen tools"
> >> +DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
> >> +LICENSE = "GPLv2"
> >> +LIC_FILES_CHKSUM =
> >> "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >> +
> >> +SRC_URI = "git://github.com/CANopenNode/CANopenSocket.git"
> >> +SRCREV = "${AUTOREV}"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +do_compile_prepend() {
> >> +    cd ${S}
> >> +    git submodule init
> >> +    git submodule update
> >> +}
> >> +
> >> +do_compile() {
> >> +    cd ${S}/canopend
> >> +    make
> >> +    cd ${S}/canopencomm
> >> +    make
> >> +    cd ${S}/canopencgi
> >> +    make
> >> +}
> >> +
> >> +do_install(){
> >> +    install -d ${D}${bindir}
> >> +    install -m 0755 ${S}/canopend/app/canopend ${D}${bindir}
> >> +    install -m 0755 ${S}/canopencomm/canopencomm ${D}${bindir}
> >> +    install -m 0755 ${S}/canopencgi/canopen.cgi ${D}${bindir}
> >> +}
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

