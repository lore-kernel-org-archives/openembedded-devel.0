Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NwNE2-0007AD-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 00:14:27 +0200
Received: (qmail 30473 invoked by uid 1003); 29 Mar 2010 22:11:10 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 29 Mar 2010 22:11:10 -0000
Message-ID: <4BB1257C.9050606@balister.org>
Date: Mon, 29 Mar 2010 18:11:08 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269899607-30980-1-git-send-email-mok@mnet-online.de>
In-Reply-To: <1269899607-30980-1-git-send-email-mok@mnet-online.de>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pkgconfig.inc: add missing ${D} when creating	${libdir}/pkgconfig in do_install_append
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
X-List-Received-Date: Mon, 29 Mar 2010 22:14:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2010 05:53 PM, mok@mnet-online.de wrote:
> From: Klaus Kurzmann<mok@fluxnetz.de>
>
> Signed-off-by: Klaus Kurzmann<mok@fluxnetz.de>

Thanks. I just hit the same problem. I'll push as soon as my build finished.

Philip

> ---
>   recipes/pkgconfig/pkgconfig.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/pkgconfig/pkgconfig.inc b/recipes/pkgconfig/pkgconfig.inc
> index 5707735..4f618f8 100644
> --- a/recipes/pkgconfig/pkgconfig.inc
> +++ b/recipes/pkgconfig/pkgconfig.inc
> @@ -22,5 +22,5 @@ do_configure_prepend () {
>   }
>
>   do_install_append() {
> -	install -d -m 0755 ${libdir}/pkgconfig
> +	install -d -m 0755 ${D}${libdir}/pkgconfig
>   }


