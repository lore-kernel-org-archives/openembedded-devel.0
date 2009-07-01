Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM69v-0006Ks-8t
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 22:11:59 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MM5yM-00077S-90
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 20:00:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 20:00:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 20:00:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:16:03 +0200
Message-ID: <h2gclj$bts$5@ger.gmane.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-4-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474461-16671-4-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 009/125] qemu: add version 0.10.3, initial
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
X-List-Received-Date: Wed, 01 Jul 2009 20:11:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:54, Marcin Juszkiewicz wrote:
> From: Roman I Khimov<khimov@altell.ru>
>
> Finally not requiring GCC3. Added with masked preference, need to carefully
> sort out and apply OE's patches.
>
> Acked-by: Tom Rini<trini@embeddedalley.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/qemu/qemu-native.inc         |    5 +----
>   recipes/qemu/qemu-native_0.10.3.bb   |    2 ++
>   recipes/qemu/qemu-native_0.9.1.bb    |    3 +++
>   recipes/qemu/qemu-native_20070613.bb |    3 ++-
>   recipes/qemu/qemu-native_cvs.bb      |    3 +++
>   recipes/qemu/qemu-native_svn.bb      |    3 +++
>   recipes/qemu/qemu_0.10.3.bb          |   22 ++++++++++++++++++++++
>   7 files changed, 36 insertions(+), 5 deletions(-)
>   create mode 100644 recipes/qemu/qemu-native_0.10.3.bb
>   create mode 100644 recipes/qemu/qemu_0.10.3.bb
>
> diff --git a/recipes/qemu/qemu-native.inc b/recipes/qemu/qemu-native.inc
> index 3e6433c..e4064a2 100644
> --- a/recipes/qemu/qemu-native.inc
> +++ b/recipes/qemu/qemu-native.inc
> @@ -1,6 +1,3 @@
>   inherit native
>
> -DEPENDS = "libsdl-native zlib-native gcc3-native"
> -
> -require qemu-gcc3-check.inc
> -
> +DEPENDS = "libsdl-native zlib-native"
> diff --git a/recipes/qemu/qemu-native_0.10.3.bb b/recipes/qemu/qemu-native_0.10.3.bb
> new file mode 100644
> index 0000000..16984a3
> --- /dev/null
> +++ b/recipes/qemu/qemu-native_0.10.3.bb
> @@ -0,0 +1,2 @@
> +require qemu_${PV}.bb
> +require qemu-native.inc
> diff --git a/recipes/qemu/qemu-native_0.9.1.bb b/recipes/qemu/qemu-native_0.9.1.bb
> index 16984a3..4c418f6 100644
> --- a/recipes/qemu/qemu-native_0.9.1.bb
> +++ b/recipes/qemu/qemu-native_0.9.1.bb
> @@ -1,2 +1,5 @@
>   require qemu_${PV}.bb
>   require qemu-native.inc
> +require qemu-gcc3-check.inc
> +
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu-native_20070613.bb b/recipes/qemu/qemu-native_20070613.bb
> index dc9852b..4c418f6 100644
> --- a/recipes/qemu/qemu-native_20070613.bb
> +++ b/recipes/qemu/qemu-native_20070613.bb
> @@ -1,4 +1,5 @@
>   require qemu_${PV}.bb
>   require qemu-native.inc
> +require qemu-gcc3-check.inc
>
> -
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu-native_cvs.bb b/recipes/qemu/qemu-native_cvs.bb
> index c9db5e3..51e6028 100644
> --- a/recipes/qemu/qemu-native_cvs.bb
> +++ b/recipes/qemu/qemu-native_cvs.bb
> @@ -1,2 +1,5 @@
>   require qemu_cvs.bb
>   require qemu-native.inc
> +require qemu-gcc3-check.inc
> +
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu-native_svn.bb b/recipes/qemu/qemu-native_svn.bb
> index 1e3a4db..b530bbd 100644
> --- a/recipes/qemu/qemu-native_svn.bb
> +++ b/recipes/qemu/qemu-native_svn.bb
> @@ -1,2 +1,5 @@
>   require qemu_svn.bb
>   require qemu-native.inc
> +require qemu-gcc3-check.inc
> +
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu_0.10.3.bb b/recipes/qemu/qemu_0.10.3.bb
> new file mode 100644
> index 0000000..d6ad1d7
> --- /dev/null
> +++ b/recipes/qemu/qemu_0.10.3.bb
> @@ -0,0 +1,22 @@
> +LICENSE = "GPL"
> +DEPENDS = "zlib"
> +
> +# Need to port OE patches there
> +DEFAULT_PREFERENCE = "-1"
> +
> +FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
> +FILESDIR = "${WORKDIR}"
> +
> +SRC_URI = "\
> +    http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
> +    "
> +
> +S = "${WORKDIR}/qemu-${PV}"
> +
> +EXTRA_OECONF += "--disable-gfx-check"
> +
> +inherit autotools
> +
> +do_configure() {
> +	${S}/configure --prefix=${prefix} ${EXTRA_OECONF}
> +}




