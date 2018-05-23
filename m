Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id A6D9A745BD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 00:51:12 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d4-v6so13586558ual.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 17:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rte12fWvc6AB1M6Y12dAEAPy9aQgQSKjM2Xv0LSl9d8=;
	b=pI1TvronaIyMIw7JxOVnxCnwf+V2ubdHXE6J5jbvFwy3hhZh0vUDpBaMCzBXhuzUVA
	peUrix7TWR3OEYdjWQJrXrv2iBZLqXlDwkqqwvAybcBa7mzBbAvW5tW1jIsT90qxyBU6
	n2YflK4KB7KXNxLJfdyxkP15v3NrdW0KkyN64In518vRV1pwhedn05lPr6h0C6tjHVwC
	0idIlnzo3lakDNEqix7gzOjlAU6f8/fmfAoAyrzgpsMDloe/wyDEayW7apCNABsQg+Zc
	k4IY+yIqpe6o/60Lu0O2Dq6OoWvYdrj3Gvso4OEIlu6BnomO28q5KaEBwikceeJGeudV
	oDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rte12fWvc6AB1M6Y12dAEAPy9aQgQSKjM2Xv0LSl9d8=;
	b=kc3+fjw5MQElZ8cMIK1pfWZESE1cazmGErcJv9Wt6y+VNPRF2opy9ByJo6B3DSgYKj
	TJo1fS12mZC1AVuip+eI4HtOS83MNH4p0K1X+S9iExF+S+m4cgFuq9UTMQfIDRrEbReQ
	fNlzMzV3LUJ6biEG+SYGTqHLcHqNBpWBK+3XY6SuA2yYD4pwo13sjsdJdaACVZUKpyr/
	S8jGFmkBm+JOk10+ssb3bYyYogs/XoxuOQ2pN4e2eAkiMb4NcCGuUndDlZ5oDFKKtyfR
	3QH1Imhlk7k6QVkOq6SMbREKQlgxni4BSyAtb+S90ezzesYfIL+BfLp2GgFzzvq86iag
	iecQ==
X-Gm-Message-State: ALKqPweB8BsjTAylazyEdPFylJGU/rTkcrJd3W58wJhJqrFpfSM/iH6W
	Ro6Btd5r2W5YqRx7tvOSWueHNK3w1n3HJv1aVRv27g==
X-Google-Smtp-Source: AB8JxZppKYqdrmch5gPWaqzNfLTVsTccv5cbT2Eh2KqdhxZhHfmtxwr2fXFvYIxLz6gsIoiDUwVLZ1eJVJm5cHZcJss=
X-Received: by 2002:a9f:2823:: with SMTP id
	c32-v6mr524120uac.193.1527036672823; 
	Tue, 22 May 2018 17:51:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Tue, 22 May 2018 17:51:12
	-0700 (PDT)
In-Reply-To: <20180522111047.26685-1-richard.leitner@skidata.com>
References: <20180522111047.26685-1-richard.leitner@skidata.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 May 2018 17:51:12 -0700
Message-ID: <CAJ86T=V_p1Lr7W-L-3s2dUntjkHmoJr4emiRnFpywZaqK8yApA@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH] pam-plugin-ldapdb: add recipe
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
X-List-Received-Date: Wed, 23 May 2018 00:51:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 4:10 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> Add recipe for version 1.3 of pam-plugin-ldapdb, a PAM module for
> directly binding a user DN to an LDAP server.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  .../recipes-extended/pam/pam-plugin-ldapdb_1.3.bb  | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
>
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> new file mode 100644
> index 000000000..a68d1999f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "PAM searchless LDAP authentication module"
> +HOMEPAGE = "https://github.com/rmbreak/pam_ldapdb"
> +BUGTRACKER = "https://github.com/rmbreak/pam_ldapdb/issues"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=41ab94182d94be9bb35e2a8b933f1e7d"
> +
> +DEPENDS += "libpam openldap"

The usual convention is to assign to DEPENDS with = rather than +=

> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"
> +
> +SRC_URI = "https://github.com/rmbreak/pam_ldapdb/archive/v${PV}.tar.gz"

To give the local file a meaningful file name, you can have bitbake
rename it as part of the download process by adding
";downloadfilename=${BP}.tar.gz" to the end of SRC_URI.

Note however that there have recently been a series of patches merged
to meta-oe which updated recipes to build from git clones rather than
github tar file archives, so you may want to consider doing that in
this recipe too.

> +SRC_URI[md5sum] = "2dd4f1370fcfe995ee0ad09611109b87"
> +SRC_URI[sha256sum] = "8ed92b36523556bb5d9bf3eb33a1035e46041d4be767c8d62136930c0ca0e45b"
> +
> +S = "${WORKDIR}/pam_ldapdb-${PV}"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
> +}
> +
> +FILES_${PN} = "${base_libdir}/security/pam_ldapdb.so"

It's conventional to add to the default packaging rules rather than
over-ride them, ie use += here rather than =

