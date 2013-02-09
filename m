Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U4Ci4-0000e5-Ms
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2013 16:51:26 +0100
Received: by mail-ob0-f181.google.com with SMTP id ni5so4829950obc.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2013 07:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=8VgdgV7hJFyduwDBcUdCVEC5/3ddvhogaL+j5jkBGfw=;
	b=i31iIqUISLcuhmomTojXrxYTBD7GrEL3coQrhjkUscVRYlomN7xIf7gLmQVLNhBPgd
	Hq6s4lTbUZQFDKIIizTNPzBoQwNR6nENu4drUMDfhm7a7gXa3m+Wsi9WnKg1s31MJczr
	qs2VxIOSkdLx87zKANUimfq7h/1wLJ58r9/3PS7vXdw1ZvLZhOLUF/go65AxKKqSkUmQ
	eKsbhmBRZGQOvqCCEzKJcIzNW3jmfRPZEd4/QzYb2+siJSQjIRowBW3N8v9TuxqaFvZV
	reKYu1LNTe1yNTn2wD5CqgMZKQzprZYx6I28K1HJRl8FQTL5mkgRbOh1YVjahzikyI7H
	hOhQ==
MIME-Version: 1.0
X-Received: by 10.60.169.135 with SMTP id ae7mr6630012oec.82.1360424128738;
	Sat, 09 Feb 2013 07:35:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 9 Feb 2013 07:35:28 -0800 (PST)
In-Reply-To: <1360373385-27667-1-git-send-email-ftonello@cercacor.com>
References: <1360373385-27667-1-git-send-email-ftonello@cercacor.com>
Date: Sat, 9 Feb 2013 13:35:28 -0200
X-Google-Sender-Auth: R_D9K5QYVHdmhoD_dN290dn50fQ
Message-ID: <CAP9ODKpfSFUdyGpmRcdhBo7SjZyCG11nNDrZUb_dTaE6RtwH3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Sat, 09 Feb 2013 15:51:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 11:29 PM,  <eu@felipetonello.com> wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>
> This recipe provides the Qt library and QML plugins for connman.
>
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  ...-to-disable-qml-plugin-and-test-program-t.patch |   35 ++++++++++
>  .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>  create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
>
> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> new file mode 100644
> index 0000000..74c27e4
> --- /dev/null
> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
> @@ -0,0 +1,35 @@
> +From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
> +From: "Felipe F. Tonello" <ftonello@cercacor.com>
> +Date: Mon, 7 Jan 2013 17:13:22 -0800
> +Subject: [PATCH] added flags to disable qml plugin and test program to
> + compile
> +
> +This is usefull when there is no need to compile test program and qml plugin.
> +
> +Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>

Please add the 'Upstream-Status' field in  the patch file; more
reference at http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


