Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id D9B8E795B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:46:01 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v17-v6so11469493wrr.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UNVxQperg9Cr/sCHl9IFW9z4BUgO+KDg6kGJzKxqLVE=;
	b=T0k1w/0YVVQGiFZjxUalG6E6+a5Plvwy1TgXut5biwSGH36ip66ZZe7W4dpjEX2ymY
	CcDVSSGsONscND60SlA4sCKTwlCTgznQDwgNsXh5wmxryuYNgjzJFulE4J6Y8p5UDf7H
	K1I95Gs3Fzb6SM02amQmYOGmp8OOVeu34sfzhdThZNNxMAKpJu7XWNoKLP3G4FuAft+4
	iLVGXZatsYhkolJ4ms+pmAfESK++JzYKih1w3eqxQ+1AkpkTfzqRJ2QhIld9k9DsR44o
	jk8ufHWI3iSF8rwdFsnntQ9mCvXzj6MlQ4jmSukERiwKHmg026jyU7z8QKzfkizztW7F
	GZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UNVxQperg9Cr/sCHl9IFW9z4BUgO+KDg6kGJzKxqLVE=;
	b=avl9fFv9TXFLlkwJ8dLm2werXqrrxaVcRdHUF3AZs5SWadN65efE9r8cNzHXuW30bp
	n+0aM1YZDEUrowNYSgptTZvpWIxg1p6Q7G5XiwJapmYEUsgryrdDhwmjMJp9OQ2eIGJs
	lCjUihP0mzpjvvRdGMEaxUDEtZMUZW1ELF2Yh/jKTkmWrLNKuMFe6K2pGg/619Qb4XxO
	70ZQYhQknRn5SPHy2dwNECydy5OaN5M8maPMFDyaNCUdomFDUATGNsnzDna54MG2XpmR
	WUWvVCKNv7r7UCKW0v4rMgeNio8yb6MPRYPg4W3BQXMDWNd+wu37Qqr4VVhMiFQjaLAs
	eb+A==
X-Gm-Message-State: APzg51C9KycSKY4eqIO8eWcR/Z5XigYACH5PCc3wZo/f4P9/hAP51dB3
	9Sgp8jhYUY2I70lpck42wPxX4AHwbdn+0Tv4t9jw3qyH
X-Google-Smtp-Source: ANB0VdapNaGO8pT6x2W0MsRlXqkPQhwxhh4b8dpxFSQP6OhBp/xHwqWlM0Yv/W1WR+nAKdaiUPF+WQN9N/6YPrhNlI0=
X-Received: by 2002:adf:aa9c:: with SMTP id
	h28-v6mr11377942wrc.149.1535726762443; 
	Fri, 31 Aug 2018 07:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180831144216.5212-1-ross.burton@intel.com>
In-Reply-To: <20180831144216.5212-1-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 31 Aug 2018 16:45:51 +0200
Message-ID: <CA+chaQcmKvqbQ4pzX94deHRj7SP6Sn+3O=o=zsdgM=F2Of3mYg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-protobuf: disable clean
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
X-List-Received-Date: Fri, 31 Aug 2018 14:46:02 -0000
Content-Type: text/plain; charset="UTF-8"

Isn't this already covered by:
http://git.openembedded.org/meta-openembedded/commit/?id=19aeaf028f6819e5fa705593d4bcdbf0b98143e0
http://git.openembedded.org/meta-openembedded/commit/?id=e65b1c4ebbbf2174125e7c659b908dd0f46c4509
https://patchwork.openembedded.org/patch/154300/
?

On Fri, Aug 31, 2018 at 4:42 PM Ross Burton <ross.burton@intel.com> wrote:

> The distutils class does a 'setup.py clean' but this breaks the protobuf
> build:
>
> | Can't find required file: ../src/google/protobuf/descriptor.proto
> | Generating google/protobuf/descriptor_pb2.py...
> | ERROR: python3 setup.py build_ext execution failed.
>
> Disable the clean to work around this.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-python/recipes-devtools/python/python-protobuf.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc
> b/meta-python/recipes-devtools/python/python-protobuf.inc
> index 6a0568ae62..421775d394 100644
> --- a/meta-python/recipes-devtools/python/python-protobuf.inc
> +++ b/meta-python/recipes-devtools/python/python-protobuf.inc
> @@ -25,3 +25,5 @@ RDEPENDS_${PN} += " \
>
>  # For usage in other recipies when compiling protobuf files (e.g. by
> grpcio-tools)
>  BBCLASSEXTEND = "native"
> +
> +CLEANBROKEN = "1"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

