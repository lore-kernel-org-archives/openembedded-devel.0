Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCA5781DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 18:17:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x189so1374742wmg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fYDcspigVARsxu+8SIK5w1VcrfBEQsz/Qf88Eey3V4A=;
	b=e6Wi5ENANqDZCstU1DaGxv5WD0Q4daSQKwTCnF9XllaPr0Y0/vhMg3k0h4+h9Q9LJp
	Ok1NIlW7YFFUrOrvX7OmHuHsqLEn94llMv6fnRcL4d6DvH3Cw3ZzDIwz0L0bzsJOlDv4
	wd17AD0oHLZmHT8DVKdyIW8p+yyprmVDKeV74I5BEoXTbmDEzNKFovseyrXZToErYkqh
	Cvwf36LIQdOkvGooiCU4E6PZrkZZQc53o7ifNtCiluIY4UDRiCd0wAnTN3mAkpsEgaNC
	sE7h09CElREmkLrS4E+NFY4UYXZcaN2WbPHdNgX/BGBVuddjcQtsptsmZYtwIqExY3lF
	IDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fYDcspigVARsxu+8SIK5w1VcrfBEQsz/Qf88Eey3V4A=;
	b=I8WO2q3+sixsnodeAXsJuScBUCZk9gAUTfyJzek7Lfyi5xLV2AAxUR2M/OQHk4/631
	Eu42tIGx1XmQ/fQ+hJ46v1pQtLrs+kgkBEnrleKFHCIUtq1dqufq+UErWS1rOnzqA4V/
	uq8pEvbC4SQPVkq0Prb8Fuoy+sKrPSbuP5tNw6z5AkdKEr5yIwPxcVQq0g0AUcitjdoa
	PFjyBzCJrTDU8fImhs+lwSpvvjB+FODzb/iZIOImZgv2TzSGYBws/vaZZtKdO8tFdacS
	XTG8G6me/twKCaXrWvonN7KnShEGEhxHgaPg1OunlNIYDjJt3KWgi42O3RsdWogWA3Ss
	KOug==
X-Gm-Message-State: AHYfb5j+mythp0qZ9hI3UhblZ/TnVrnfmYhnXBD799plLBk9dG9iyr31
	MlBg7C4Akso0BTsefn8OA9fPIz4Oiw==
X-Received: by 10.28.182.7 with SMTP id g7mr789210wmf.66.1503944253751; Mon,
	28 Aug 2017 11:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.184.147 with HTTP; Mon, 28 Aug 2017 11:17:33 -0700 (PDT)
In-Reply-To: <20170828135913.7508-2-kai.kang@windriver.com>
References: <20170828135913.7508-1-kai.kang@windriver.com>
	<20170828135913.7508-2-kai.kang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 28 Aug 2017 11:17:33 -0700
Message-ID: <CAJ86T=Xg+-=EJXT-_3+wQnu3NM58rpdeVHh1Fw=CLvRkhGs1Ug@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] mariadb: disable thumb on armv5
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
X-List-Received-Date: Mon, 28 Aug 2017 18:17:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 28, 2017 at 6:59 AM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Disable thumb on armv5 for mariadb which causes link error:
>
> | libsql.a(mysqld.cc.o): In function `test_if_case_insensitive(char const*) [clone .constprop.28]':
> | /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8276:(.text.unlikely+0xbe):
> | relocation truncated to fit: R_ARM_THM_CALL against symbol `fn_format' defined
> | in .glue_7 section in linker stubs
> | /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8278:(.text.unlikely+0xd0):
> | relocation truncated to fit: R_ARM_THM_CALL against symbol `fn_format' defined
> | in .glue_7 section in linker stubs
> | /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8285:(.text.unlikely+0x150):
> | relocation truncated to fit: R_ARM_THM_CALL against symbol
> | `sql_print_warning(char const*, ...)' defined in .glue_7 section in linker stubs
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/mysql/mariadb.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
> index 32e3eaa6d..03cded637 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -82,6 +82,8 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
>                   -DCAT_EXECUTABLE=`which cat` \
>                   -DCMAKE_AR:FILEPATH=${AR}"
>
> +ARM_INSTRUCTION_SET_armv5 = "arm"

For Thumb1 build issues, normal approach is to over-ride
ARM_INSTRUCTION_SET for both armv4 and armv5. Even though you may not
be able to test armv4 it's almost certain to hit the same issue.

>  do_configure_append() {
>      # handle distros with different values of ${libexecdir}
>      libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

