Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 24BAA605C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 18:10:27 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id c41-v6so11359386plj.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ukQjfTnZAmOYv1001x54xS0Xz+G652ErSIs0s6qR0cY=;
	b=olLhtV8QPljmOB4db4egQUmvxYuKw+H8GYGDNl3SgS+d9u7Xj+FxIvN0Lj+yoCe0+6
	OKW206ivy7z8hn+Ep+PpfqcAcqsHmuOBPLGPvonQWiZuwk8u3ZaHV1a6UP6zXWnDtNto
	SvDvPLYx+TW3cgA2XiqxDlT4qbijQhUauH3cahtTz0rfOpyyFZSrq4FBos58Jzkqoe2q
	us4mJJfgVkgoTZEQT9SG5rt2OTLuHVoxAgsQVaDR87bHglv39TPYc2eRXmm2ZW4u3ww9
	ZEZ+VCEGLg0fGiUk4rarYkDtSMdG13ySbyHdOZEcX54zZSH5SmpHKHVi+nPAKax8Mkcw
	uHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ukQjfTnZAmOYv1001x54xS0Xz+G652ErSIs0s6qR0cY=;
	b=fqSudrI0a2n9VDj0PZSXmsP9LSEW8W9YonZDTsARL+se+1fB3ufaXDz/KSyPxdJD2A
	udXCx0OH/LNJ2o81b/cHEQJ2EDmYBEnkh+vj7VkW8bYGeoxovtIML4Yvwl4iZ7ok8k58
	2U1ug1erunHcF3qHbiQD66WyOQPulEW2pyCaBp9FTMswwMrJju3XLJzbvUH1f/lCaFi+
	ZcbxtiVIohXyGVlzW/6tMLBq8+rlyNxFrm4l0vCgUsrRZRDhz+wsaxibAK1v6hS20qQU
	FEYjtEHqLt11DiLJWXY3oUDLGXIVRSQlfGQLuOve/FYzrvjJg1fPTtiabzYVLHr1z9xc
	BUxw==
X-Gm-Message-State: ALKqPwchwZp6rAx1j+XTlODLC6kvRhYbOPjoeqdMvwsso6RRszgfB6jJ
	OGGN2NV/JghYkm2n9w44y0kwAw/uXBW/0uxwbpz3Zg==
X-Google-Smtp-Source: AB8JxZrsozsDGsrNM+oa/HjoJL1FvCfyem3GwHDdJQcowHbNvtwj8BkJxYUARNknuRcdG0hQLqJOPUayyjULhTO6/LI=
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr25686567plb.275.1527012628786; 
	Tue, 22 May 2018 11:10:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Tue, 22 May 2018 11:09:58
	-0700 (PDT)
In-Reply-To: <20180522111047.26685-1-richard.leitner@skidata.com>
References: <20180522111047.26685-1-richard.leitner@skidata.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 May 2018 14:09:58 -0400
Message-ID: <CAMKF1srVqRkd86gANga1KQCJEtRi0vcnzTkzZztj-iDYuZAEuw@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 May 2018 18:10:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 7:10 AM, Richard Leitner
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
> +
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"
> +
> +SRC_URI = "https://github.com/rmbreak/pam_ldapdb/archive/v${PV}.tar.gz"
> +SRC_URI[md5sum] = "2dd4f1370fcfe995ee0ad09611109b87"
> +SRC_URI[sha256sum] = "8ed92b36523556bb5d9bf3eb33a1035e46041d4be767c8d62136930c0ca0e45b"
> +
> +S = "${WORKDIR}/pam_ldapdb-${PV}"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
> +}

Perhaps using EXTRA_OEMAKE += " PAMDIR=${base_libdir}/security"
would mean do dont need to define custom do_install()

> +
> +FILES_${PN} = "${base_libdir}/security/pam_ldapdb.so"

