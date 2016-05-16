Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 07E9873695
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 19:56:38 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 145so16604655pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=7GkBTyeTcAXe9xjJ1q949ZVuvcZx904I6CGtMmAx/Wg=;
	b=aRWI1Mo/mxyzIqZuA9qW2A4rZF7nvdUGfCLhG13l8jiEbvjKbBQDOr5ADOqSzK1MZm
	W0FFfJBWDUuE43LNh/+Kn2DBkuNPBB0IQwCUYB6jzu/whHLLn0nZZb0rFl9w9x6Nfnwb
	Yps9Fat5CUayzy5vjDqLpdz+JgCr9R0KA2LeEr+Rr+IUFSLNh5g0bM6hUWchKTP4mKSo
	X2CgI+CvLx4IZzIa9UgadTgMyGQwtcytmRvJrXPy5ZNTkA8QuPjzOLuTKJUg/uFbVse+
	flWnqvY75eMh1XM9BAmNH8XSw93GOcbl7Xg2HB00hPWQVgx6hYqJeSgR5mjDpxlc5bzN
	lWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=7GkBTyeTcAXe9xjJ1q949ZVuvcZx904I6CGtMmAx/Wg=;
	b=dmas8v0RhxxMwtkL7irIytn6Z65aha/1k83GmGVmVHtcrgZ6+u+4PhQ1RKK/0EkYOh
	r/lbD/7l4GzQY9BdouiEjnJM8Ys/jJ8mZ574Jdv8mtlgMNWDQt4zfLDatmww93ieT9Xj
	W5bsQaJ+SBEeIIErEuDPwqvJaOp4e5woRpb+zdGT8l9cS6RaKiCvHLLYBilOrjUbawzC
	Y9dE4mTQNHRT3r6Ohi4ki9c3RR+DIg/1zzFO+WIcq9HtOX76qqvxMAiRg6L+bEYSIumS
	gJ9JheCflwJl9F1Jk09pLU/6zGbarWWcr8oVyO3TS0MHb4IsK3YOO4QBTsTyJTOMmqI5
	4t1w==
X-Gm-Message-State: AOPr4FWb+YwZLsvIKzEXC7D0yszlyRk8GgKdywDOgJF7t3kj4phbfsWq6oMq8LOpEF3g6g==
X-Received: by 10.98.97.67 with SMTP id v64mr48325742pfb.149.1463428599421;
	Mon, 16 May 2016 12:56:39 -0700 (PDT)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	u2sm49140295pan.45.2016.05.16.12.56.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:56:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id 77so70492833pfv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 12:56:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.104.133 with SMTP id d127mr48032805pfc.112.1463428597838; 
	Mon, 16 May 2016 12:56:37 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 16 May 2016 12:56:37 -0700 (PDT)
In-Reply-To: <1463424030-12245-1-git-send-email-neenareddy.busireddy@nxp.com>
References: <1463424030-12245-1-git-send-email-neenareddy.busireddy@nxp.com>
Date: Mon, 16 May 2016 16:56:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr53TSB70qQbQoePCJ1HFbwPQpRcs31g-0c4HKLeC6sNA@mail.gmail.com>
Message-ID: <CAP9ODKr53TSB70qQbQoePCJ1HFbwPQpRcs31g-0c4HKLeC6sNA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] assimp: Add recipe for Open Asset Import Library
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
X-List-Received-Date: Mon, 16 May 2016 19:56:42 -0000
Content-Type: text/plain; charset=UTF-8

Hello Neena,

On Mon, May 16, 2016 at 3:40 PM, Neena Busireddy
<neenareddy.busireddy@nxp.com> wrote:
> Open Asset Import Library (short name: Assimp) is a portable Open Source
> library to import various well-known 3D model formats in a uniform manner.
>
> Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
> ---
>  meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
>
> diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
> new file mode 100644
> index 0000000..bf987af
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Open Asset Import Library is a portable Open Source library to import \
> +               various well-known 3D model formats in a uniform manner."
> +HOMEPAGE = "http://www.assimp.org/"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bc4231a2268da8fc55525ad119638a87"
> +
> +DEPENDS = "boost"
> +
> +SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}-3.1/${BPN}-${PV}_no_test_models.zip"
> +SRC_URI[md5sum] = "ccd4788204509da58a3a53c7aeda7a8b"
> +SRC_URI[sha256sum] = "da9827876f10a8b447270368753392cfd502e70a2e9d1361554e5dfcb1fede9e"
> +
> +inherit cmake
> +
> +FILES_${PN}-dev += "${libdir}/cmake/assimp-3.1/*.cmake"

The only remark I could do is to add ${libdir}/cmake so in case a new
major release happens it is not need to change the FILES assignment.

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

