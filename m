Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id DB72C60EE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 22:22:28 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so3643932ieb.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 15:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=a3KnkfPe+Am5ay3n5nj0Eet9JMsDHDHsGGQ42uxUevU=;
	b=oIQOBA4DOzSP5qg1Tm3fnP+O0jxuqhnuCKcZs4gdLdmpO++S5bgPYvEyYRI2SPfCBr
	pNtwYY9hC1+YGJLPQ65+RbuTwDdBFwY3w3+LySFBqzHhuj3RvNcxsU9Fd85cqahtKRGq
	BzIrNrmRo5bK5cmcZCDiuo67QSDzQb2q2eYg10tSTmWuYRpQz1V4WE7bNaaes+Iqicfr
	4ASw5a9G2HDPN2/hthrqZ0FJESbCSNYCxIDdZrAkqspOrdi2xIUcMkQmSH6sCYg4k02G
	/iBDLYbgTlCMKqOkNmPpU0PWI3D8LDBC145hinwo2vi2TiTR71VKcpiIDzoxvIiHMSFv
	Y04Q==
MIME-Version: 1.0
X-Received: by 10.50.114.168 with SMTP id jh8mr2231771igb.6.1379110950510;
	Fri, 13 Sep 2013 15:22:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 13 Sep 2013 15:22:30 -0700 (PDT)
In-Reply-To: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
References: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
Date: Fri, 13 Sep 2013 19:22:30 -0300
X-Google-Sender-Auth: 9xmlGLCu8lw3dR88tw_cAZUYE3w
Message-ID: <CAP9ODKrVsBfpHDtwp031feCOitJEG6fi=bKah4e0sH5_Wkh6cg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [meta-oe][PATCHv5] libsoc: new recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 22:22:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 7:15 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jack@embed.me.uk>
>
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
...

The recipe is clean now ... but ...

> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "libsoc is a C library for interfacing with common SoC peripherals through generic kernel interfaces"
> +HOMEPAGE = "https://github.com/jackmitch/libsoc"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
> +
> +inherit autotools
> +
> +SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70"
> +SRC_URI = "git://github.com/jackmitch/libsoc.git"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} = "libgcc"

I am a little concerned /why/ this is need. Your code seems quite
simple and I don't understand why this special need. Did you try to
install and use it without this RDEPENDS ? It should work just fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

