Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE226A465
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 03:54:32 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ef5so13494390obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jul 2013 20:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ieC8P9fbUH5ADeldO3BHY44HBA0t17nAP/5JZN35AIk=;
	b=Rj8RKQ0j57A/KpQYUcbrSjcB35pp/3mmi+OvPI+gndIqZL69Y0t8zjjhEIcJ7HYInV
	ngxy20kM4zQmS+lLZGcS8qR3xTbwWP0U2ch1LjR98X+zdMci0v+2NDrgMWXCxkHUlpwG
	8066f/KvgN46ULKJe0E1geQop+PaJwIzdAePTYGGEdKtj/Wum80xPGWeb3nmWlwuD4Y7
	s3+BbQGCwU+hydyhsk3+0WElSONBU2fmxkfkq0/wRTtQFqxQTiI+vvQF3KbOotu7x+51
	7HJrjnqldrOEQGDBvJDfLveRxhtmdvqYOfbTijxdY0WGpqeYy+JA5efxXF8stQRrA6nj
	oFNw==
MIME-Version: 1.0
X-Received: by 10.182.105.99 with SMTP id gl3mr42448713obb.94.1373860472446;
	Sun, 14 Jul 2013 20:54:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Sun, 14 Jul 2013 20:54:32 -0700 (PDT)
In-Reply-To: <5eac17e51739330054a2dfb9d651bc0a2b931329.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
	<5eac17e51739330054a2dfb9d651bc0a2b931329.1373726565.git.paul.eggleton@linux.intel.com>
Date: Mon, 15 Jul 2013 00:54:32 -0300
X-Google-Sender-Auth: 6i1F8vESf_gUPSk20UTpnu-pUC4
Message-ID: <CAP9ODKqOJLBwUNHG7ungbU_+sY4HD4_66COMMvSSSa798dv-bA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] mosh: add new recipe for version 1.2.4
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
X-List-Received-Date: Mon, 15 Jul 2013 03:54:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 13, 2013 at 11:47 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb | 29 +++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>
> diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> new file mode 100644
> index 0000000..e9881bc
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Remote shell supporting roaming and high-latency connections"
> +DESCRIPTION = "Remote terminal application that allows roaming, supports \
> +intermittent connectivity, and provides intelligent local echo and line \
> +editing of user keystrokes. Mosh is a replacement for SSH. It's more \
> +robust and responsive, especially over Wi-Fi, cellular, and \
> +long-distance links."
> +HOMEPAGE = "http://mosh.mit.edu"
> +LICENSE = "GPLv3+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl"
> +
> +SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
> +SRC_URI[sha256sum] = "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
> +
> +inherit autotools
> +
> +PACKAGE_BEFORE_PN += "${PN}-server"
> +FILES_${PN}-server = "${bindir}/mosh-server"
> +
> +# mosh uses SSH to authenticate and the client uses OpenSSH-specific features
> +RDEPENDS_${PN} += "openssh-ssh"
> +# The server seemed not to work with dropbear either
> +RDEPENDS_${PN}-server += "openssh-sshd"
> +# Note: the server also requires a UTF-8 locale, but there's no way
> +# to add a dependency for this

I'd put this as a WARNING and on the top of the recipe or something so
it is easily visible.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

