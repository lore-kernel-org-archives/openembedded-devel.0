Return-Path: <s.sonski@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5335677E88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 13:01:04 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h4so4110015qtk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rSy7RMWzDMmo9CcAXel7st921U3Lwy/FwlDFVUUewY0=;
	b=pASNHaE5yW5Vr2M6dQOZcqtO3YtunWuQJLcxSafVY2NNeiPtMUL8Y4/IEGqxRYw7Ab
	fooeCPs0nVpRC7L5wQ3iBWex38WzkO3Hka3hyJVKxGHosytautbuPyzS7bcxCywbeq8t
	LNVPL/Pnbf9vplwo2YXa3ufESDLdHP6TGGv/OvRNuCuZKNrsZeJWqszC6U+X0YxwPjry
	PN2WBSA5UgD5nwdiXakg0lVNf54328XhnWbLBO4UIip4HwhwH+tLqSLVMW5G3vma8akh
	3htyZkhve1IeaURmSzsEixYJQQgX4yTxOu9zrc9szjolvzSUk3T55AZ2aX3Cod0zWGSN
	40ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rSy7RMWzDMmo9CcAXel7st921U3Lwy/FwlDFVUUewY0=;
	b=X99sm+skE3rs2GET5B5sMiAzXdM9jHM4/useEjWyz9H9LvKkzQnw8yv5ZK7ABKG0nc
	m7bYGIiijKM0i8UxdrrK5fG6u+SAsV1oZcTLAS0hhP+P0c7TkCqai8ZieWwS70OvcgeW
	jsHyoXZvAm3Z81V43BlUjjEzctVU8tVdPpZGzrDCNQ4j1y2yC+8YYd4XXIyvqsPWpZ+V
	s6qByvtRtDASnBNfADF6agfqYrm8qUu4NoiyRaSVqEXgNJGswbutFERxVQDTevlUuGna
	w4Xc6SHaN4Qvod46B1LQGMiJPIU3WiP3hKvmz+RnfVnyTzU/RlQXFjIqQrlFlMdlfPP2
	yvhw==
X-Gm-Message-State: AMCzsaWtLjkCZcPuXr+SlpmeTW4eB92yCLfAvC8vK2YqcxbGDq97HDZ2
	Cf/pclgItwyPuaKpqsnctZynt39y9itjFtgSYsk=
X-Google-Smtp-Source: ABhQp+TpFJfP8yWvzyWhxA+MhqoE7pQrJoIvKtzcLGl9nk+4QR1juDo8Wr6Wc4jcnEI9dilfP/MS2ldoJA3fUtu+sw4=
X-Received: by 10.200.53.12 with SMTP id y12mr37637174qtb.84.1509022866191;
	Thu, 26 Oct 2017 06:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
In-Reply-To: <20171026125505.GW9221@denix.org>
From: Stefan Sonski <s.sonski@gmail.com>
Date: Thu, 26 Oct 2017 13:00:55 +0000
Message-ID: <CAGR_whvS2JZAOoku2t9HxERaFpyZfkVtkMdbMXoDDKBo_pP62g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Chris E. Rallis" <Chris.Rallis@ravenind.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Thu, 26 Oct 2017 13:01:05 -0000
Content-Type: text/plain; charset="UTF-8"

I have the same error if objcopy is set. I still don't get how objcopy
depends on qtpreparetool.

On Thu, Oct 26, 2017, 14:55 Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
> > Hi,
> >
> > On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
> > > Either this or the ptest change seems to cause:
> > > http://errors.yoctoproject.org/Errors/Details/157417/
> >
> > FTR, I see the same error locally. Reverting both 8fd20e8b1
> > ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
> > ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
> > branch of meta-qt5 fixes things for me.
>
> Have you tried bisecting by any chance?
>
>
> > > On Tue, Oct 17, 2017 at 9:56 PM, Stefan Sonski <s.sonski@gmail.com>
> wrote:
> > >
> > >> From: "Chris E. Rallis" <Chris.Rallis@RavenInd.net>
> > >>
> > >> Signed-off-by: Stefan Sonski <s.sonski@gmail.com>
> > >> ---
> > >>  classes/qmake5_base.bbclass | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> > >> index 8e1fe20..042008c 100644
> > >> --- a/classes/qmake5_base.bbclass
> > >> +++ b/classes/qmake5_base.bbclass
> > >> @@ -28,6 +28,7 @@ EXTRA_OEMAKE = " \
> > >>      OE_QMAKE_LINK='${OE_QMAKE_LINK}' \
> > >>      OE_QMAKE_LDFLAGS='${OE_QMAKE_LDFLAGS}' \
> > >>      OE_QMAKE_AR='${OE_QMAKE_AR}' \
> > >> +    OE_QMAKE_OBJCOPY='${OE_QMAKE_OBJCOPY}' \
> > >>      OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
> > >>      OE_QMAKE_WAYLAND_SCANNER='${OE_QMAKE_WAYLAND_SCANNER}' \
> > >>
> OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
> > >> @@ -42,6 +43,7 @@ export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
> > >>  export OE_QMAKE_LINK = "${CXX}"
> > >>  export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
> > >>  export OE_QMAKE_AR = "${AR}"
> > >> +export OE_QMAKE_OBJCOPY = "${OBJCOPY}"
> > >>  export OE_QMAKE_STRIP = "echo"
> > >>  export OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/
> > >> wayland-scanner"
> > >>
> > >> --
> > >> 2.14.2
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >>
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

