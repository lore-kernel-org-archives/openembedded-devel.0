Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LY0eu-0000xw-Ii
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 17:12:56 +0100
Received: by fxm10 with SMTP id 10so2459107fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 08:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wD2Bpp+pu9EytHeQmtwdgKizPGh46Av/ZQs6rzRlP2s=;
	b=lEMCP+9qmdLtg6BwW9XIy7+jaaPl/fCvoZk7S3Ut6aA9ssTsnKTbpeH/YaKcAwCW2v
	RkgYU+mujKnZhvaLCnaxVutQ6BInKLeD5Tch0ztto8czNDWjSn+ERdZ+3lbifhIGdilf
	HWsNX72zYh0job9OjoNPERItsaIGmEu79amJA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SYDAcxR+8qFCMqEplR0bMXMnSNk0OcmNL3B4V3gE6vSqm7CTGvrRInPvE689Cnz2rQ
	iAp8Ypow+s/Rx9urTcuY6ZAIbc9VH2vQTK5tPa1zBhdpNKCBsLTsMTiosrXn/Ya0hJmD
	1zhBOouNdGmPLA8YFZAaBaTLCp73B06U6y0ec=
MIME-Version: 1.0
Received: by 10.181.148.13 with SMTP id a13mr773794bko.20.1234541432983; Fri, 
	13 Feb 2009 08:10:32 -0800 (PST)
In-Reply-To: <1234538851.24574.4.camel@EPBYMINW0568>
References: <1234538851.24574.4.camel@EPBYMINW0568>
Date: Fri, 13 Feb 2009 18:10:32 +0200
Message-ID: <fce2a370902130810r61652aajcc71822d645fe532@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add new ruby-dbus package
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
X-List-Received-Date: Fri, 13 Feb 2009 16:12:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Please don't commit it. I forgot to add DEPENDS += "ruby" for it.

On Fri, Feb 13, 2009 at 5:27 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> This is a package with D-Bus bindings for Ruby language.
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  conf/checksums.ini               |    4 ++++
>  packages/ruby/ruby-dbus_0.2.1.bb |   17 +++++++++++++++++
>  2 files changed, 21 insertions(+), 0 deletions(-)
>  create mode 100644 packages/ruby/ruby-dbus_0.2.1.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 4e8e0f1..8d508eb 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -19074,6 +19074,10 @@ sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
>  md5=797ea136fe43e4286c9362ee4516674e
>  sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
>
> +[http://trac.luon.net/data/ruby-dbus/releases/ruby-dbus-0.2.1.tar.gz]
> +md5=1f6398d8bbafa272c0b43878fec43276
> +sha256=cfcadc4ae860f2de3d6aa1a1230a410b1dedf783148a27a20205bb3b54e3c3ac
> +
>  [http://rxtx.qbang.org/pub/rxtx/rxtx-2.1-7r2.zip]
>  md5=9290b4832d46199f8d798a531209640b
>  sha256=31db3852a86105766758975519b27d262407c96cacad4f34ad0de5aae26addd9
> diff --git a/packages/ruby/ruby-dbus_0.2.1.bb b/packages/ruby/ruby-dbus_0.2.1.bb
> new file mode 100644
> index 0000000..a1ce40c
> --- /dev/null
> +++ b/packages/ruby/ruby-dbus_0.2.1.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "${PN} bindings"
> +SECTION = "devel/ruby"
> +LICENSE = "LGPL"
> +
> +SRC_URI = "http://trac.luon.net/data/ruby-dbus/releases/ruby-dbus-0.2.1.tar.gz"
> +
> +RUBY_DIR = "/usr/lib/ruby/1.8"
> +
> +S = "${WORKDIR}/ruby-dbus-${PV}"
> +
> +FILES_${PN} += "${RUBY_DIR}"
> +
> +do_install() {
> +       install -d ${D}${RUBY_DIR}
> +       cp -r lib/* ${D}${RUBY_DIR}
> +}
> +
> --
> 1.5.6.3
>
>
>


