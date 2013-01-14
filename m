Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tutrp-0007gO-GQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jan 2013 00:55:06 +0100
Received: by mail-vc0-f179.google.com with SMTP id p1so4210228vcq.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 15:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Y5DvjNA8tRVtzb/ODR1rEjxS9c6ouPXzPXqFxUFUrrg=;
	b=t0uhha/NpoKJB9SlJ8f/cjFn5Bh6h2gQ0aLM5tFHpMzl3bHCuCkrzTvfG/4FuPYdr7
	QrgfHP3Onp9OZ0zG+U0EL9d/yqhLyZtb40aCW8bY6U36oKPUF8bMWSCgxtJQ+hT8Dsm+
	uoONQGbz19toCnia7YfAmJS+nEvytPK9jSULjIgXk1hZ0NCoEaoWRtig521zyWuKFOom
	641gh/LWFSLVCNvB/k9MDOgy5P49lCeJOrMAU63WwM1TmQ8I6kJpGE3w3Dcv87ZbqDQ/
	kaEEguBC9FpOslMQGw5cTp7+LtLhBlyCmXnu2ZLuE5rkHieDAZRmhqNyg54eIdTLZfPz
	CKXg==
MIME-Version: 1.0
Received: by 10.220.154.148 with SMTP id o20mr103711967vcw.54.1358206781648;
	Mon, 14 Jan 2013 15:39:41 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 14 Jan 2013 15:39:41 -0800 (PST)
In-Reply-To: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
References: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
Date: Tue, 15 Jan 2013 00:39:41 +0100
Message-ID: <CALbNGRS645Gs8Dbb=qHiwxC11LnN5hh404XQ1H9vQ_tQqjzVyA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-systemd][PATCH 1/4] bluez4: Package systemd service
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
X-List-Received-Date: Mon, 14 Jan 2013 23:55:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 14, 2013 at 7:42 PM, Andrei Gherzan
<andrei.gherzan@windriver.com> wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../bluez/bluez4_4.101.bbappend                    |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
>
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
> new file mode 100644
> index 0000000..8945a6d
> --- /dev/null
> +++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
> @@ -0,0 +1,9 @@
> +PRINC := "${@int(PRINC) + 1}"
> +
> +inherit systemd
> +
> +EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
> +
> +SYSTEMD_PACKAGES = "${PN}-systemd"
> +SYSTEMD_SERVICE = "bluetooth.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
This is quite interesting: For my first tests I also added the
'disable' but I could not get bluez start automatically so I decided
to start it at boot time. Maybe it is related to that I did not yet
find a way to setup my bluetooth device automatically. It still needs

hciattach ttyO1 csr

Which service starts blues if not enabled?

Andreas


