Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ3Vs-0006Jc-Az
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:46:04 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ3LC-0003Ft-FJ
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 10:35:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:35:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:35:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 12:26:55 +0200
Message-ID: <h1qalf$n3k$2@ger.gmane.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-4-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747417-11163-4-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 055/125] libsdl-gfx: GNU HASH QA fix.
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
X-List-Received-Date: Tue, 23 Jun 2009 10:46:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Stanislav Brabec<utx@penguin.cz>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/libsdl/libsdl-gfx_2.0.17.bb |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/libsdl/libsdl-gfx_2.0.17.bb b/recipes/libsdl/libsdl-gfx_2.0.17.bb
> index 79af40a..b07be45 100644
> --- a/recipes/libsdl/libsdl-gfx_2.0.17.bb
> +++ b/recipes/libsdl/libsdl-gfx_2.0.17.bb
> @@ -10,6 +10,7 @@ S = "${WORKDIR}/SDL_gfx-${PV}"
>   inherit autotools
>
>   EXTRA_OECONF = "--disable-mmx"
> +TARGET_CC_ARCH += "${LDFLAGS}"
>
>   do_stage() {
>   	autotools_stage_all




