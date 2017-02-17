Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0F18A71DBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 21:45:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1487367938; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=SQzA5VVZhNtj9d+yKXQWR09RQIHt0GOvGIy4Q9imrkQ=;
	b=jh9qOITzk0vFeKr1kSt+cJdQN2S/cKn7nJNn6gDYCwtnQm7lzpjGvoxqIEuDxr6MangAWc6g
	/1W481afm7OVT9vsVlZGLVvo+NYTJti4GxZPlphuV+huy5YWQkJ2JE4c9W55s/JHOewbtH0L
	fun6LrvwdeHnTz8gAUNZl1ZJbYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=lu8QmB9fS2pYDB1CFuc45rn0fFYHEMRHQmnQ0R497wETm2sQK+yURwEiipIyuUCzz/Xekd
	WQxeLfaHnqw3E/Yn+SsLtvzZ8pni0sl94cErDj/jbYBC8dLt5EdG9m4GA8y+Uem/DbDX51Mj
	Jtwdj9LnVnabIEccaGDV2rIbG6JWk=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mxa.mailgun.org with ESMTP id 58a76f01.7f7124d9d370-smtp-out-n03;
	Fri, 17 Feb 2017 21:45:37 -0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l66so2196487ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 13:45:37 -0800 (PST)
X-Gm-Message-State: AMke39m7nVJDWlLlWg9COzZOrWKMJOb28jpRzMvN+sZ2g/CTgVhHA1EQVmzMZQUGHgIedaGfk8HAp0s2A8+LmA==
X-Received: by 10.107.151.146 with SMTP id z140mr10473908iod.161.1487367937100;
	Fri, 17 Feb 2017 13:45:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Fri, 17 Feb 2017 13:45:36 -0800 (PST)
Received: by 10.107.156.85 with HTTP; Fri, 17 Feb 2017 13:45:36 -0800 (PST)
In-Reply-To: <20170217213607.6278-1-pkj@axis.com>
References: <20170217213607.6278-1-pkj@axis.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 17 Feb 2017 16:45:36 -0500
X-Gmail-Original-Message-ID: <CADNbA1pOSncA6o9GauAEUq+MjuZuT98RayFs8hszFbBZ8ZDLCA@mail.gmail.com>
Message-ID: <CADNbA1pOSncA6o9GauAEUq+MjuZuT98RayFs8hszFbBZ8ZDLCA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCH] apache2: Correct the SRC_URI
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
X-List-Received-Date: Fri, 17 Feb 2017 21:45:48 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for this one.  I must have neglected to do a clean all first.

-Derek

On Feb 17, 2017 4:37 PM, "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
wrote:

> The change to use ${APACHE_MIRROR} in the SRC_URI in dfbe6cf214 did
> not take into account that ${APACHE_MIRROR} already contains "/dist".
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb | 2 +-
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> index fc84872..99717d2 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
> @@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
>
>  inherit autotools pkgconfig native
>
> -SRC_URI = "${APACHE_MIRROR}/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
>             file://0001-configure-use-pkg-config-for-PCRE-detection.patch
> \
>            "
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> index b3a2dfd..60f6fb9 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
> @@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat
> pcre apr apr-util"
>  SECTION = "net"
>  LICENSE = "Apache-2.0"
>
> -SRC_URI = "${APACHE_MIRROR}/dist/httpd/httpd-${PV}.tar.bz2 \
> +SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
>             file://server-makefile.patch \
>             file://httpd-2.4.1-corelimit.patch \
>             file://httpd-2.4.4-export.patch \
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

