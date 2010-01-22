Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NYJTa-0001GF-5q
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 14:23:05 +0100
Received: (qmail 12609 invoked by uid 1003); 22 Jan 2010 13:20:43 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 22 Jan 2010 13:20:43 -0000
Message-ID: <4B59A628.2070602@balister.org>
Date: Fri, 22 Jan 2010 08:20:40 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <n> <1264154671-29704-1-git-send-email-michael.lippautz@gmail.com>
In-Reply-To: <1264154671-29704-1-git-send-email-michael.lippautz@gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] libxml2: Add catalog and docbook support
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
X-List-Received-Date: Fri, 22 Jan 2010 13:23:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2010 05:04 AM, Michael Lippautz wrote:
> * Adds catalog and docbook support, which is needed for
>    libxml-libxml-perl recipe.
> ---
>   recipes/libxml/libxml2.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libxml/libxml2.inc b/recipes/libxml/libxml2.inc
> index bc31123..44e6f82 100644
> --- a/recipes/libxml/libxml2.inc
> +++ b/recipes/libxml/libxml2.inc
> @@ -9,7 +9,7 @@ PR = "r1"
>
>   inherit autotools pkgconfig binconfig
>
> -EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n"
> +EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --with-docbook --with-c14n"

Does this change any of the recipes DEPENDS?

Philip


