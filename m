Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1P3cTo-0006oI-Bi
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 00:29:00 +0200
Received: (qmail 2362 invoked by uid 1003); 6 Oct 2010 22:28:34 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	6 Oct 2010 22:28:34 -0000
Message-ID: <4CACF810.6030402@balister.org>
Date: Wed, 06 Oct 2010 18:28:32 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc13 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Wed, 06 Oct 2010 22:29:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Next time, can you add the package name to the commit message?


Philip

On 10/06/2010 05:08 PM, Frans Meulenbroeks wrote:
> Signed-off-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> ---
>   classes/cpan-base.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
> index 379defa..a04f61c 100644
> --- a/classes/cpan-base.bbclass
> +++ b/classes/cpan-base.bbclass
> @@ -5,7 +5,7 @@
>   FILES_${PN} += "${libdir}/perl5 ${datadir}/perl5"
>
>   DEPENDS  += "${@["perl", "perl-native"][(bb.data.inherits_class('native', d))]}"
> -RDEPENDS  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
> +RDEPENDS_${PN}  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
>
>   # Determine the staged version of perl from the perl configuration file
>   def get_perl_version(d):


