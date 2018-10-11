Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 18A1579AC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 20:34:18 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id e10-v6so11479928qtq.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xCwTB+mhMGjd8izlIBCU+10q2o4WcByiRy/RKar2q9Y=;
	b=ge0wRzoN4+XSN1zO9b61jrW8C62GW3kq+OZ9+zOKxDxrpE3aZJPUBMWhtb8/mUHILB
	Te3HlURdsSYAGw8+Qn10hwMtG/1ciFAWWNuMWGmhSY+306mbLsairmuo8pdZgKIHO110
	R1A1IWtFo3j9CJM0v5t8yRya+RijIxWf3CR0LXbXyKD/55rRmF74So7spl8YxeIGRxnW
	hoVor2D2DTf873L0Wgr03KjVq4rw26N9991wL3W2OTF5yAcF8mKuoOaAC/BNaJC1DKp4
	LtPe6qiNvCkjGNkt1/pbqLy/tcC0rqi0gcCvUAq/9pxGzcD3e3sTfRsdhkfA58F1up9C
	VQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xCwTB+mhMGjd8izlIBCU+10q2o4WcByiRy/RKar2q9Y=;
	b=aAJsC6OjRzsYDCoMzfN3KL8PTq7VNST8aIKeryQC5sAvQv09pKUHLuU6rHBoAxchLR
	3PXwoQH0hYmKER85K2iLMEUlCSQU+GklPs3Hax9SJILxGFbf/yDNRmFLyXQMqkRANOok
	mHXwPZNjFUyGb6JAK16xMDaLBt3ERFX7PfI++CLcZfD/Z9EaolduUoNi2rKsNAafLo7K
	6SJHQTN67j/Z6zhYv7ej5no0WU4eanuyM5wNPUE/WHPmZB0h1wEZ224z40DwjBpLdXdC
	8Rb1/U21SIJHi1crBebqwOD7voqKu0KAKsTwOBSgnCaNjd58U6Yj3fuk4HPxmhPAwVrI
	ZL/A==
X-Gm-Message-State: ABuFfoijDvR8mTDxKU5kyXiKtDgSKpvQ+uULBWsDxSwTUN1CHOfymhGn
	u2AlYs8nDKia+fnp0MRczyTR95/YVJNvhav6HD0yk6yG
X-Google-Smtp-Source: ACcGV618QAUUczhyMhwp66nD2Hg2EzVB2wQaw2ecNqH0vIshB783yJoP3ubS8ZeVn8PVajaK6KrDqueyXg1CkodxwwQ=
X-Received: by 2002:aed:3031:: with SMTP id 46-v6mr3135210qte.29.1539290058788;
	Thu, 11 Oct 2018 13:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181011171418.35757-1-james.feist@linux.intel.com>
In-Reply-To: <20181011171418.35757-1-james.feist@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Oct 2018 13:33:52 -0700
Message-ID: <CAMKF1spEhWhnGzvePs5QDZspaT6u=rMg3T_n=QtuuZ87EJWB6A@mail.gmail.com>
To: James Feist <james.feist@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nlohmann-json: Add symlink to json.hpp and update to 3.3.0
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
X-List-Received-Date: Thu, 11 Oct 2018 20:34:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi James

It seems this srcrev does not exist on master branch but on develop
branch probably
we need to add branch=develop to SRC_URI as well.

see

http://errors.yoctoproject.org/Errors/Build/69670/
On Thu, Oct 11, 2018 at 10:15 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> nlohmann-json has examples in their repo that refer to
> the header as json.hpp directly, as such many packages
> that require nlohmann-json expect json.hpp and not
> nlohmann/json.hpp as the cmake file installs. Create symlink
> so that access is available by either option. Also update
> to release 3.3.0.
>
> Signed-off-by: James Feist <james.feist@linux.intel.com>
> ---
>  .../nlohmann-json/nlohmann-json_git.bb                 | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
> index a89b659ae..c1e108b38 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_git.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=9a8ae1c2d606c432a2aa2e2de15be22a"
>
>  SRC_URI = "git://github.com/nlohmann/json.git"
>
> -PV = "3.2.0+git${SRCPV}"
> +PV = "3.3.0+git${SRCPV}"
>
> -SRCREV = "8c20571136f2d5351b379a06ad6591bd980880fe"
> +SRCREV = "f1768a540a7b7c5cc30cdcd6be9e9ef91083719b"
>
>  S = "${WORKDIR}/git"
>
> @@ -21,3 +21,9 @@ EXTRA_OECMAKE += "-DJSON_BuildTests=OFF"
>  RDEPENDS_${PN}-dev = ""
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +# other packages commonly reference the file directly as "json.hpp"
> +# create symlink to allow this usage
> +do_install_append() {
> +    ln -s nlohmann/json.hpp ${D}${includedir}/json.hpp
> +}
> --
> 2.17.1
>

