Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0BF7264F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Jan 2015 09:54:42 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so6368600wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jan 2015 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ULW5lAqijD+WEc2HuDFcoLhI34Li0lazhWX5tbRUWlQ=;
	b=iDGh3f0ZNAjeogAWvYL4ciFfwVQQZFjSW2+7TW0/4oQfQS0qlXRgf4QP8J1YEsca2s
	P4JfWWqA6A922nmw3+lpOz+jlw+qy0oVwQTw05r/Hsdu9k6CnhTkxzGRWJqFp8pSpbNQ
	TgQjKM2xJ6k00aHjrZmbZ1Yx5TS6hZFi9Nc8Qp8twFoWGjRncQNiY48/ejI3V0qcOwgI
	23aQ56JmSknirWhxhacpvl7Aupjj0sIX00NLs3exAQ/MVJg8w0zKUMzVo4XHvIi5ykYb
	YFP8/UBh35fwav/4u72GwXiknG1QM1SqFEY/wfV61O+OLDLT3XMJXlPEP/ILesuxqKYi
	+B4A==
MIME-Version: 1.0
X-Received: by 10.180.109.46 with SMTP id hp14mr14607433wib.54.1420365282236; 
	Sun, 04 Jan 2015 01:54:42 -0800 (PST)
Received: by 10.194.40.234 with HTTP; Sun, 4 Jan 2015 01:54:42 -0800 (PST)
In-Reply-To: <1420329190-40280-2-git-send-email-liezhi.yang@windriver.com>
References: <1420329190-40280-1-git-send-email-liezhi.yang@windriver.com>
	<1420329190-40280-2-git-send-email-liezhi.yang@windriver.com>
Date: Sun, 4 Jan 2015 10:54:42 +0100
Message-ID: <CA+chaQeNaVQkQNkb7ho=yULyESd+u0TOHbk5whH_DArPJc41Lw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] [PATCH 2/5] rarpd: use BPN in SRC_URI
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
X-List-Received-Date: Sun, 04 Jan 2015 09:54:49 -0000
Content-Type: text/plain; charset=UTF-8

${BPN}-${PV}
<http://pkgs.fedoraproject.org/repo/pkgs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/$%7BBPN%7D-$%7BPV%7D.tar.gz>
->
${BP} (twice)

please

On Sun, Jan 4, 2015 at 12:53 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> index d69499d..a9233af 100644
> --- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> +++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> @@ -9,7 +9,7 @@ You should install rarpd if you want to set up a RARP
> server on your \
>  network."
>  SECTION = "System Environment/Daemons"
>
> -SRC_URI = "
> http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-${PV}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${PN}-${PV}.tar.gz
> "
> +SRC_URI = "
> http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-${PV}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${BPN}-${PV}.tar.gz
> "
>  SRC_URI[md5sum] = "be2a88f8ccddf2a40ac484cb3294fedc"
>  SRC_URI[sha256sum] =
> "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba267958f168fbe776e6"
>
> @@ -25,7 +25,7 @@ SRC_URI += "file://0001-rarpd.8-add-man-file.patch \
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://rarpd.c;md5=199b20b172ea93121bc613a9c77b6931"
>
> -S = "${WORKDIR}/${PN}"
> +S = "${WORKDIR}/${BPN}"
>
>  do_install() {
>      install -d ${D}${sysconfdir}/init.d
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

