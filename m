Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 78DD16CD74
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 00:15:54 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so3185263obc.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Feb 2014 16:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jJuQLtc+uPNigjAslJpw7g0dDN1mc4pFSsoaZY7Azjs=;
	b=O37pA/xAmQmUeM5vPkoJqHQF8lMJgUL0aIXtbka6Y1OUidsSrcT4PbMwX1jxdafQEd
	YJ69ju86/AGFOumdQS+Y1kGlAXgsw7WmHY8rGZrUCKHBNV1liX6I6OJsgXhzebM4mFIZ
	J8dEOtHCakF83j6Sna5sPlEZQh99kC7Azj3/xtNLMzQJSO6FknxmGcbSfxSNraLazFMw
	DvRESo5JXt4VAGP9H2llrfpijEZbWnUddWyZziVeC14QPqewnVpnMgkozWWGUL5f3OOM
	xJYHSre7aUEbHgnYlcOci2WoQmEZ42LjFjyWKnLUmZQxHI5kQOiC3462MRLOVdXNwDjr
	Celg==
X-Gm-Message-State: ALoCoQkEmZrDXyUj5McQUt3cWWT2cM6H0ypuGDa+gvdCG96xYko2E0HT/MouOKbXgIiMDtsZeg2r
X-Received: by 10.60.84.199 with SMTP id b7mr5081120oez.55.1391732154992; Thu,
	06 Feb 2014 16:15:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Thu, 6 Feb 2014 16:15:34 -0800 (PST)
In-Reply-To: <1385430478-31824-2-git-send-email-denis@denix.org>
References: <1385430478-31824-1-git-send-email-denis@denix.org>
	<1385430478-31824-2-git-send-email-denis@denix.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 7 Feb 2014 01:15:34 +0100
Message-ID: <CAP71Wjx52AHWurONaP7Fsq9A9jGKuy1S9+xviYQ7+iCUGYnRdw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK tools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2014 00:15:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

On Tue, Nov 26, 2013 at 2:47 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> +do_install() {
> +    # Fix install paths for all
> +    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> +
> +    # switch back the proper qmake
> +    rm ${B}/bin/qmake
> +    mv ${B}/bin/qmake-real ${B}/bin/qmake
> +
> +    oe_runmake install INSTALL_ROOT=${D}
> +
> +    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
> +    # e.g. qt3d, qtwayland
> +    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> +}

about this patch (which was merged already), i am wondering if this is
okay to do something like above. basically in the do_install task we
are 'corrupting' the output of the do_compile task. Here we remove
${B}/bin/qmake for example. so if the do_install fails for whatever
reason, it will never be able to resume properly, since ${B} is no
longer what it should be after a legitimate do_compile. i was
debugging some weird build issues, and I am wondering if my problem
doesn't come from that...

