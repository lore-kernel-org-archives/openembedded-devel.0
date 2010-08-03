Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgAm9-0001Ag-Ly
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 08:15:01 +0200
Received: by bwz10 with SMTP id 10so2164902bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 23:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZeKuUoWbd3+w/od//ejsPwDvvA2fSKrc6260DjQttCY=;
	b=LgW+W73OF5XwnY4caayponS1uz8O5jOyCnUoWzX3fYYaKzaMtKgmdHlSXIgZ0nLq9P
	ay/QXKD6VI3piBHlzb9o7DcACNcYBamhL8L2kbopTinQGLaqVP0OmVRCH1c92kvvqq8c
	Vx6gV6kK6NAxRqEyfYRuJ1DvB9BdiFPJo+07o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WjOLDfhV5kRzELUAydwEXDAQ02D0g8FhRU2hyxDhBhmeMZtXgunYEdb7/yhJIT1LA/
	BuyaMDhQnq/HcWf/R2Ur4mp6FQ78eZxrbIYpzQqHGJCjfeR4J87WuQ3MAU1h6FtLHNDn
	6NOrg2M6ueDJIpBr4jK/ydCZ5QKv3+iyAuMtY=
MIME-Version: 1.0
Received: by 10.204.133.129 with SMTP id f1mr4865907bkt.91.1280816085866; Mon, 
	02 Aug 2010 23:14:45 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Mon, 2 Aug 2010 23:14:45 -0700 (PDT)
In-Reply-To: <1280808074-13861-1-git-send-email-sgarman@zenlinux.com>
References: <1280808074-13861-1-git-send-email-sgarman@zenlinux.com>
Date: Tue, 3 Aug 2010 08:14:45 +0200
Message-ID: <AANLkTimKyWgQyN0T6VExcAjE0=M2kuCLvbq-hEYJ70Fc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] tar: Upgrade to v1.23
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Aug 2010 06:15:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/3 Scott Garman <sgarman@zenlinux.com>

> From: Scott Garman <scott.a.garman@intel.com>
>
> * Addresses CVE-2010-0624
>

Please have a look at http://wiki.openembedded.net/index.php/Commit_Policy

And especially this section:

 * Have a clear commit message (example
<http://wiki.openembedded.net/index.php/Commit_log_example>):
    - The first line of commit is a summary of the changes.
    - The first line should start with the name of the recipe the
change affects.
    - The rest of the message should give more details on the change
as appropriate.
    - Mention the affected bug numbers if appropriate.
    - Give credit where credit is due. If you commit someone else's
work more or
      less verbatim, you should use *git commit --author
$mail-of-author*. If pulling
      changes from somewhere like Poky or OpenMoko there is no problem with that
      but mention where the changes came from.
    - Include a Signed-off-by: line indicating the change has valid certificate
      of origin as per the Linux kernel <http://lwn.net/Articles/139916/>



>
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>
> ---
>  recipes/tar/tar_1.22.bb |    4 ----
>  recipes/tar/tar_1.23.bb |    4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  delete mode 100644 recipes/tar/tar_1.22.bb
>  create mode 100644 recipes/tar/tar_1.23.bb
>
> diff --git a/recipes/tar/tar_1.22.bb b/recipes/tar/tar_1.22.bb
> deleted file mode 100644
> index 4863e84..0000000
> --- a/recipes/tar/tar_1.22.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require tar.inc
> -
> -SRC_URI[md5sum] = "07fa517027f426bb80f5f5ff91b63585"
> -SRC_URI[sha256sum] =
> "3cefb67f197a3f8f5235999fe749ced0889466a71ddcbc96fddca84e5d53aa4d"
> diff --git a/recipes/tar/tar_1.23.bb b/recipes/tar/tar_1.23.bb
> new file mode 100644
> index 0000000..89a0243
> --- /dev/null
> +++ b/recipes/tar/tar_1.23.bb
> @@ -0,0 +1,4 @@
> +require tar.inc
> +
> +SRC_URI[md5sum] = "41e2ca4b924ec7860e51b43ad06cdb7e"
> +SRC_URI[sha256sum] =
> "c9328372db62fbb1d94c9e4e3cefc961111af46de47085b635359c00a0eebe36"
>

The rest looks good to me.

Frans

> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

