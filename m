Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 30EE07499C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 08:54:33 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id r13-v6so12632822wrj.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4E06Ca7ESU6Esn4upUzDn2SjeuJiHHuppq7RsfXJAKY=;
	b=S9t5KMslmt0eEeFd63DJ6GkXiz3axi6jVBDEnk+BU0sscDbKmXDpeYtAwIzW/jYVYl
	E7zm4RXreT1XQTELO/7pzNDuR2dtz5G1/m6dYL8dV05jDsdWI32WRGuTdVWwbrzarPIb
	SPx5ABRrz/7IpWseCbX6nduCFHYkQD9E4Hj/UEg/Z84GPE0O6aOlneooS9E/4bvP8fGP
	2c8wZQz5BA1b/AEADSZtQ5qcXC5XHAooHlUnlHPAoJ8XAqsE1rIYNo0cP78pwOtnts+G
	BX9pV+gHgBXMAJJgh9BEN33vCg3Xy3+hBrTflsUsks0ncS0OvaOT3THPXRlyB/oiOkTY
	mXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4E06Ca7ESU6Esn4upUzDn2SjeuJiHHuppq7RsfXJAKY=;
	b=iZKislhfrOkiEgRASDqdK51gmgPQ0tUz610lzQQN3cEZM06ifC2IPVxzzhWoX3656p
	EAkV2WmQmar2po7HYM6oJsDOyVy67SJBzrE6Hcosaah9gRHd/cdae0HGjtp0Dk/QV1Ew
	Lpz4y9W5uZfeIgHXigLuecjejuSSsF0SqWUyqMgdDdZ1QgJtnXXfVjHvHMWOgRlNIric
	JV4Y4e/BlGeHPyI1Rr1YmGxdIAXENNIvOUnGhbtakt7AMlceNtQOgAEjzeIDFJMalWi4
	lS1cL2n4UDuNZREbvDL22Gqswvh7GQjechrR6vbEGnLXUYbnR2CL51auELchT52Nksu+
	nLVg==
X-Gm-Message-State: ALKqPwe3uWI2k1K1avThc8LF6bMUYx+0ay7QXidYRVrQhSc8RqmMOKuZ
	lUGxhZDPYptNU543aBZ/ww1234I6ZrQtc/ovWMQ=
X-Google-Smtp-Source: AB8JxZp3YcKKRWduHiuJAuG2ZApDKww0QHWExcv49XJJGGlXbLoesVAPDVTtvOu/0OMjT3HVXqDYSYxLyRfrpw3SOeU=
X-Received: by 2002:adf:93e5:: with SMTP id
	92-v6mr1543466wrp.230.1527065671484; 
	Wed, 23 May 2018 01:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180523084140.7967-1-richard.leitner@skidata.com>
In-Reply-To: <20180523084140.7967-1-richard.leitner@skidata.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 23 May 2018 10:54:19 +0200
Message-ID: <CA+chaQd_tuEhVz5s073uNLHJTX2foWK0g-cNs-9VQ1BE-kE1DA@mail.gmail.com>
To: richard.leitner@skidata.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH v2] pam-plugin-ldapdb: add recipe
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
X-List-Received-Date: Wed, 23 May 2018 08:54:34 -0000
Content-Type: text/plain; charset="UTF-8"

Don't use github archives which are regenerated from time to time with
different checksums (read older discussions for more details).

On Wed, May 23, 2018 at 10:42 AM Richard Leitner <
richard.leitner@skidata.com> wrote:

> Add recipe for version 1.3 of pam-plugin-ldapdb, a PAM module for
> directly binding a user DN to an LDAP server.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> Changes v2:
>   + assign DEPENDS (instead of appending to it)
>   + add downloadfilename to SRC_URI
>   + append to FILES (instead of assigning it)
> ---
>  .../recipes-extended/pam/pam-plugin-ldapdb_1.3.bb  | 23
> ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
>
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> new file mode 100644
> index 000000000..c59a259fc
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
> +DEPENDS = "libpam openldap"
> +
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"
> +
> +SRC_URI = "
> https://github.com/rmbreak/pam_ldapdb/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz
> "
> +SRC_URI[md5sum] = "2dd4f1370fcfe995ee0ad09611109b87"
> +SRC_URI[sha256sum] =
> "8ed92b36523556bb5d9bf3eb33a1035e46041d4be767c8d62136930c0ca0e45b"
> +
> +S = "${WORKDIR}/pam_ldapdb-${PV}"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
> +}
> +
> +FILES_${PN} += "${base_libdir}/security/pam_ldapdb.so"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

