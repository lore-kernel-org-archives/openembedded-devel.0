Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6FF7FD6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 11:37:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so6666851wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 03:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uvZTQn+GUVo+0EJUFzCsvFNzodf8Pc2Cr4YUTe1WLxE=;
	b=R82HMXMEiWq2IfA66Lmj+tFpZdzb87Tr8QDgKnR1lXW4ZnA3ZlXDqaPRKOHcw9Hoab
	54aPigesmi24mzDU7TxwgNRegd61ABewwybQWXgq0NZ7vHI6qXoUSXdEzZr5uD5nLyOV
	+Gz0qJHE+8KGzk4+N/N0SomA+7CUvX84/xk4HZieGUnNBFWHGokPbNkF7JeUFakFjV2Q
	a3/BbvqOGK/p8zPjd423dMG9YEtYZUCgxyY37/RTk/EoktzEwRRuaazYSkgxIPO4/V6g
	YatwIsYkcwDkKL2XAYEJ0MdDx97cFHWzuTarfpCbZpfbXbn2js3LI2w/sDFuQFnUw2GF
	icIw==
X-Gm-Message-State: APjAAAV0gKp9VkkLkp4uKmVBbARRCuP/CiY++dEgCc+iW3DrQbbD0nny
	yI28ko/cf99DiK+8/vs3Hh5+gI45a+g=
X-Google-Smtp-Source: APXvYqw6lReiehzwGHk7YznSvCniUChhjWvRZ23kDbl9/tuD3tjryFI47OVnmQkXBMtXXQ4x3U4VwQ==
X-Received: by 2002:a1c:6389:: with SMTP id
	x131mr13858945wmb.155.1580125072697; 
	Mon, 27 Jan 2020 03:37:52 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g7sm20243686wrq.21.2020.01.27.03.37.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 03:37:52 -0800 (PST)
Message-ID: <c5c24b0d8f7b6c1dca8e55d4acb6a050984e9716.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 11:37:51 +0000
In-Reply-To: <20200127112451.165555-4-richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<20200127112451.165555-4-richard.leitner@skidata.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 3/4] openjre-8: fix debuginfo fixup in do_install
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
X-List-Received-Date: Mon, 27 Jan 2020 11:37:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2020-01-27 at 12:24 +0100, Richard Leitner wrote:
> Based on a patch sent by Jacob Kroon.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Cc: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  recipes-core/openjdk/openjre-8_242.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_242.bb
> index 4ed2e6b..2c8a6a5 100644
> --- a/recipes-core/openjdk/openjre-8_242.bb
> +++ b/recipes-core/openjdk/openjre-8_242.bb
> @@ -11,7 +11,7 @@ do_install() {
>      cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
>      chown -R root:root ${D}${JRE_HOME}
>      install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
> -    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
> +    [ -d ${D}${JDK_HOME} ] && find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;

Does this line make sense? The JRE build should not produce any files in the JDK_HOME
directory, I think?

So the only 'fix' this is doing is to silence 'find' to not print a warning about a
directory it can't find?

Shouldn't the line be dropped completely instead?

Should we worry if the JRE build (sometimes?) places files into JDK_HOME?


A.

>  }
>  
>  FILES_${PN}_append = "\
> -- 
> 2.24.1
> 


