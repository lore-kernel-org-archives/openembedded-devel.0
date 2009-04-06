Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lqpe4-0005JI-Lz
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 16:18:32 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LqpbK-0000MQ-9J
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 14:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 14:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 14:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Apr 2009 16:02:05 +0200
Message-ID: <grd20t$rdt$3@ger.gmane.org>
References: <1239020332-6949-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1239020332-6949-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] dhclient: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 14:18:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06-04-09 14:18, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>

>
>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   recipes/dhclient/dhclient_2.0pl5.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/dhclient/dhclient_2.0pl5.bb b/recipes/dhclient/dhclient_2.0pl5.bb
> index 20b0dfc..0b1f614 100644
> --- a/recipes/dhclient/dhclient_2.0pl5.bb
> +++ b/recipes/dhclient/dhclient_2.0pl5.bb
> @@ -1,12 +1,14 @@
>   SECTION = "console/network"
>   DESCRIPTION = "ISC DHCP Distribution (client and server)."
>   LICENSE = "BSD"
> +PR = "r1"
>
>   SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-2.0-history/dhcp-${PV}.tar.gz \
>   	   file://make.patch;patch=1"
>   S = "${WORKDIR}/dhcp-${PV}"
>
>   export BINDIR = "${sbindir}"
> +export LFLAGS = "${LDFLAGS}"
>
>   do_configure () {
>   	./configure ${TARGET_SYS}




