Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttR8-000122-RT
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:01:46 +0100
Received: (qmail 9065 invoked by uid 1003); 23 Mar 2010 01:58:32 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 01:58:32 -0000
Message-ID: <4BA82047.1050404@balister.org>
Date: Mon, 22 Mar 2010 21:58:31 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269255925-13112-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269255925-13112-2-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269255925-13112-2-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] procps: adjust FILES so that libproc-*.so lands in ${PN}
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
X-List-Received-Date: Tue, 23 Mar 2010 02:01:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>


On 03/22/2010 07:05 AM, Marcin Juszkiewicz wrote:
> From: Phil Blundell<philb@gnu.org>
>
> ---
>   recipes/procps/procps.inc |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/procps/procps.inc b/recipes/procps/procps.inc
> index ddc8030..2de32d2 100644
> --- a/recipes/procps/procps.inc
> +++ b/recipes/procps/procps.inc
> @@ -8,6 +8,8 @@ PRIORITY = "optional"
>   LICENSE = "GPL"
>   DEPENDS = "ncurses"
>
> +FILES_${PN} += "${base_libdir}/libproc-*.so"
> +
>   SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz \
>              file://install.patch;patch=1"
>


