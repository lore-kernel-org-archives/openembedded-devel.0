Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwNNJ-00074n-Ag
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 23:19:29 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwNJ0-0002lW-Un
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 21:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 21:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:36:55 +0200
Message-ID: <gslap7$mfs$6@ger.gmane.org>
References: <1239967824-19483-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1239967824-19483-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] tunctl: new recipe, version 1.5
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
X-List-Received-Date: Tue, 21 Apr 2009 21:19:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-04-09 13:30, Roman I Khimov wrote:

Acked-by: Koen Kooi <koen@openembedded.org>


> Tool for controlling the TUN/TAP driver in Linux.
> ---
>   conf/checksums.ini           |    4 ++++
>   recipes/tunctl/tunctl.inc    |   14 ++++++++++++++
>   recipes/tunctl/tunctl_1.5.bb |    1 +
>   3 files changed, 19 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/tunctl/tunctl.inc
>   create mode 100644 recipes/tunctl/tunctl_1.5.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 948a4bf..fc17727 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -22682,6 +22682,10 @@ sha256=d91b4addcbb241b04b6cf795447163ed890a436b10205d2cd9cc1885ea3d9433
>   md5=ee74158c6c55ae16327595c70369ef83
>   sha256=ef5e9bf276b65bb831f9c2554cd8784bd5b4ee65353808f82b7e2aef851587ec
>
> +[http://downloads.sourceforge.net/tunctl/tunctl-1.5.tar.gz]
> +md5=fdbedc263b3e85bb0e087cd567414607
> +sha256=aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff
> +
>   [http://alioth.debian.org/frs/download.php/2241/tuxmath_w_fonts-1.6.0.tar.gz]
>   md5=3aa0e0e488719611f0bc4441b63a6f56
>   sha256=f3aae7e2f67cf12f3da98325388c7b2f6718729aa69c5c804d1866d6a49f8592
> diff --git a/recipes/tunctl/tunctl.inc b/recipes/tunctl/tunctl.inc
> new file mode 100644
> index 0000000..c9c7e95
> --- /dev/null
> +++ b/recipes/tunctl/tunctl.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "The tunctl tool for controlling the TUN/TAP driver in Linux."
> +SECTION = "net"
> +LICENSE = "GPL"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz"
> +
> +do_compile() {
> +	oe_runmake tunctl
> +}
> +
> +do_install() {
> +	install -d ${D}/${sbindir}
> +	install -m 755 tunctl ${D}/${sbindir}
> +}
> diff --git a/recipes/tunctl/tunctl_1.5.bb b/recipes/tunctl/tunctl_1.5.bb
> new file mode 100644
> index 0000000..8a988a8
> --- /dev/null
> +++ b/recipes/tunctl/tunctl_1.5.bb
> @@ -0,0 +1 @@
> +require tunctl.inc




