Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIixA-00056y-VN
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 14:48:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MIimY-0005pd-3w
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:37:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 12:37:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 12:37:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 14:37:42 +0200
Message-ID: <h1ntum$rrv$1@ger.gmane.org>
References: <200906221206.37496.marcin@juszkiewicz.com.pl>
	<1245669099-30990-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245669099-30990-2-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 080/125] mobilemesh: fixed broken download URL
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
X-List-Received-Date: Mon, 22 Jun 2009 12:48:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 13:11, Marcin Juszkiewicz wrote:
> From: Martin Dietze<martin@the-little-red-haired-girl.org>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/mobilemesh/mobilemesh_1.2.bb |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/mobilemesh/mobilemesh_1.2.bb b/recipes/mobilemesh/mobilemesh_1.2.bb
> index df8f2f9..4fdf2ab 100644
> --- a/recipes/mobilemesh/mobilemesh_1.2.bb
> +++ b/recipes/mobilemesh/mobilemesh_1.2.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "MobileMesh mobile ad-hoc routing protocol"
>   HOMEPAGE = "http://www.mitre.org/work/tech_transfer/mobilemesh/"
>   LICENSE = "GPL"
>   DEPENDS = "openssl"
> -SRC_URI = "http://meshcube.org/download/mobilemesh_1.2.tgz"
> +SRC_URI = "http://download.berlin.freifunk.net/meshcube.org/nylon/stable/sources/mobilemesh_1.2.tgz"
>   PR = "r1"
>
>   S = "${WORKDIR}/mobilemesh"
> @@ -34,4 +34,7 @@ do_install() {
>   	install ${S}/mobilemesh.init ${D}${sysconfdir}/init.d/mobilemesh
>   }
>
> +FILES_${PN}-dbg += "${sysconfdir}/mobilemesh/mmtodot.debug ${sysconfdir}/mobilemesh/mmborder.debug \
> +	${sysconfdir}/mobilemesh/mmrp.debug ${sysconfdir}/mobilemesh/mmdiscover.debug"
>   CONFFILES_${PN}_nylon = "${sysconfdir}/mobilemesh/mmrp.conf ${sysconfdir}/mobilemesh/mmdiscover.conf"
> +




