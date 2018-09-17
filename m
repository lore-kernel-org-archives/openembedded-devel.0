Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB89C7947E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:11:35 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id l42-v6so15326898qtf.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=K2UVRrQvlqlMP9W87Gr5z/lf1DuGbWSxc3BvIt3Ws20=;
	b=fuvmxnshDKY0rbREhvPJiK5k0wfDKodw3WJwHsdSUivsFu3Ojwn1OhATA8xzNIQZMX
	BJQoCiKzrKIu1ZgU40nxhH1xFSrxZZ9HikFfN3WW427QAULctoAn1YJS+tJASGS+Tnw3
	tQVBcVy5Q4pA/1pPyOUYqejo2qca/imj9utXe/PnAIFE0EdYsz5EDkhEWy9k3mY/IIIi
	rJHm0vh+q+j1hWdUAqj7pdtE+dHrob60uaRRUvbIMR78by2oLdyRDj2Jse/7GsJDoaXL
	RHdvg9OD+1MWaRSFbMIduUshHPxLUsi+1J1W1dHHkvCBiGaeDT/TRUy5Jckw7g5CNwkM
	GhaQ==
X-Gm-Message-State: APzg51CT8wXyhzcS4OpOSKqM+Go2kpbNJJ4d9QENnAbHGMalF4IyLyWr
	VkqAlBeNTTcKddZZwDQgi6u3obPW
X-Google-Smtp-Source: ANB0Vdajkb/8p3oWHPTHu5+qdRPN7htuzouvfu1pn9mOPgntNOkTB0GB9HO2gZrDAh2dlhPrFubsXQ==
X-Received: by 2002:ac8:5056:: with SMTP id
	h22-v6mr17827534qtm.71.1537193496607; 
	Mon, 17 Sep 2018 07:11:36 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	s64-v6sm8494716qkc.70.2018.09.17.07.11.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 07:11:35 -0700 (PDT)
Message-ID: <4f82c15835c890729dff215334ef2c8d19276230.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2018 15:11:34 +0100
In-Reply-To: <1536317071-17077-1-git-send-email-yevgenyp@pointgrab.com>
References: <1536317071-17077-1-git-send-email-yevgenyp@pointgrab.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-8, openjre-8: Fix PROVIDES assignment
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
X-List-Received-Date: Mon, 17 Sep 2018 14:11:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 13:44 +0300, Yevgeny Popovych wrote:
> PROVIDES is a recipe-specific variable, not package-specific like
> RPROVIDES.
> This bug would prevent you from having recipes DEPEND on java2-runtime
> or java2-vm (assuming you have set PREFERRED_PROVIDER correctly).

Looking at all uses of this, I don't think the intention is to be able to
DEPENDS on java2-vm or java2-runtime at all.

Regarding java2-vm:

java2-vm was originally used in the OpenJDK 6 & 7 recipes to be able to
select shark, zero, cacao, or jamvm VMs. OpenJDK-6 is not available any
more, and OpenJDK-7 has removed support for most of this in commit
38f4c1365c11 ("openjdk7: remove broken/unsupported VM's")

It is not clear why it was added to the OpenJDK-8 recipe either.

Given OpenJDK-7 has no way of using the VM compiled as part of OpenJDK-8,
and given that no part of the OpenJDK-8 makes use of the java2-vm part, the
correct solution here is to actually *remove* the incorrect PROVIDES
statement for java2-vm completely.


Regarding java2-runtime:

Again, looking at the other uses of this:
java2-runtime is a virtual runtime package name, which is provided by
different *runtime* packages (created by the OpenJDK-7, OpenJDK-8, JamVM, or
Cacao recipes). Other recipes only ever RDEPEND on java2-runtime. It makes
not sense for OpenJDK-8 to PROVIDES java2-runtime given the above.

So for this, PROVIDES_${PN} = "java2-runtime" should be indeed removed, but
without any replacement.


Cheers,
Andre'

> 
> Change-Id: I602d98241d2a6f42a13a1fa1edad049d4e8792b0
> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
> ---
>  recipes-core/openjdk/openjdk-8_172b11.bb | 4 ++--
>  recipes-core/openjdk/openjre-8_172b11.bb | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-
> core/openjdk/openjdk-8_172b11.bb
> index c1c6e1e..22d0113 100644
> --- a/recipes-core/openjdk/openjdk-8_172b11.bb
> +++ b/recipes-core/openjdk/openjdk-8_172b11.bb
> @@ -47,10 +47,10 @@ FILES_${PN}-doc_append = "\
>  
>  FILES_${PN}-source = " ${JDK_HOME}/src.zip "
>  
> +PROVIDES = "java2-vm"
> +PROVIDES = "java2-runtime"
>  RPROVIDES_${PN} = "java2-vm"
> -PROVIDES_${PN} = "java2-vm"
>  RPROVIDES_${PN} = "java2-runtime"
> -PROVIDES_${PN} = "java2-runtime"
>  
>  inherit update-alternatives
>  
> diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-
> core/openjdk/openjre-8_172b11.bb
> index dd29691..d8d4ba8 100644
> --- a/recipes-core/openjdk/openjre-8_172b11.bb
> +++ b/recipes-core/openjdk/openjre-8_172b11.bb
> @@ -35,10 +35,10 @@ FILES_${PN}-doc_append = "\
>      ${JRE_HOME}/THIRD_PARTY_README \
>  "
>  
> +PROVIDES = "java2-vm"
> +PROVIDES = "java2-runtime"
>  RPROVIDES_${PN} = "java2-vm"
> -PROVIDES_${PN} = "java2-vm"
>  RPROVIDES_${PN} = "java2-runtime"
> -PROVIDES_${PN} = "java2-runtime"
>  
>  inherit update-alternatives
>  
> -- 
> 2.7.4
> 


