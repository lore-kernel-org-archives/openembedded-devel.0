Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07D40795EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:35:35 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n6-v6so15190779qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Tr6Eu/KTfd0CdCCaikfyQLwaZVft/tCXqy5bfeBdDc=;
	b=MgYIBDe6LC3D5Z4MdnRe95rpcUYuHtbutjIAZInBIPCayNJRUedA9bmXQXvs4XfCI2
	pBlJjzOyLElc/zGCKPVjWX8qfWaU0ATxg/xzRBMdH3zwox37ZkeiF2YMbkZqkJKdX93P
	0HOHlFsQZ9yKgOwdFZa657a1k2MZBKGOL5Du2QoNJJZO4eN8zM1t9f5712JZsKZJ6/zV
	337AdtZ0AdCew/o17/RzwEDeUKjhXKW19oIChe6K00zBNPFSDWS6pXEmJhBY2AjH5BTD
	6RyBvwqi9j9LRw0u4aAuwkL9bAyYx/OVtn+DyjBLPFIWbOhrjuDb6yXwy9+OECP9/337
	KWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Tr6Eu/KTfd0CdCCaikfyQLwaZVft/tCXqy5bfeBdDc=;
	b=hA9Rg44NgoxOSOEMaMNiVJod2zFN4RXCQ6vevFIZoo04K+UDH9nY4E7idn+OnkdZ9X
	PPlOKn9Wk0jXveGrmUUg+UcqnYEU0AkAOjLHLXHBjuG1hJoQZ6JivzJTVdja2v73zyv0
	PSj+oqyuGoJ4AnFczbK8OmxXicIhNSaoqILtXCFhyEAIejKyjHXuSkttoBtSRE40DMbB
	cI73/dxji8xNDV63vXk2Qu3X4Sm8pVFUXFoK2sxhm6IG/XmKSlPb1VHhxwWZpYFQ97nj
	6CTpiaEIeUhFlQPxMFs+EW2TlQ2UiUX47J1yBXll/+v9zTEI7I7YuTqU8J7IicELszJF
	Q7Cw==
X-Gm-Message-State: APzg51A3Xnp1un6G188HX1vVXlCOl0q34sakn+wYWWr69Bb8kIqYpOLU
	+P9WQhnztv5t6Zmtpx3RB1XJWkN+ubvd4tJJxwk=
X-Google-Smtp-Source: ANB0Vda950vfofn+fw0LZKbzFB0EshgsH7bZgLcx/HRdrkMH9pVXX4hTzAxNwWjPYW5Y7fvowYMGq8UE11L82YN8eQY=
X-Received: by 2002:ac8:4304:: with SMTP id
	z4-v6mr16207121qtm.295.1535733336615; 
	Fri, 31 Aug 2018 09:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180831144201.5100-1-ross.burton@intel.com>
In-Reply-To: <20180831144201.5100-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 09:35:10 -0700
Message-ID: <CAMKF1sqDUFO5L3QWqpqBARB+zb7WLHB8jopL3MVVCwraLpD7Vw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] postgresql: use util-linux's uuid
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
X-List-Received-Date: Fri, 31 Aug 2018 16:35:36 -0000
Content-Type: text/plain; charset="UTF-8"

its already in see
http://git.openembedded.org/meta-openembedded/commit/?id=140bf68e37

On Fri, Aug 31, 2018 at 7:42 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Postgreqsql was configured to use ossp-uuid but ossp-uuid is dead and everyone
> will be building util-linux anyway, so use the libuuid.so from there.
>
> Confusing the option is called e2fs because the library originated in e2fsprogs.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> index 1301060ee5..44a1b30fe0 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -59,7 +59,7 @@ PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
>  PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
>  PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
>  PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
> -PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
> +PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
>  PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
>  PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
>  PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

