Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OnEeF-0003OY-UU
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 19:48:01 +0200
Received: (qmail 27237 invoked by uid 1003); 22 Aug 2010 17:47:34 -0000
Received: from pool-96-240-180-89.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.89)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	22 Aug 2010 17:47:34 -0000
Message-ID: <4C7162B0.6090206@balister.org>
Date: Sun, 22 Aug 2010 13:47:28 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282498345-8697-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1282498345-8697-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ncurses_5.7.bb: Make DEFAULT_PREFERENCE
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
X-List-Received-Date: Sun, 22 Aug 2010 17:48:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2010 01:32 PM, Khem Raj wrote:
> * Select 5.7 if none pinned.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   recipes/ncurses/ncurses_5.7.bb |    3 ---
>   1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7.bb
> index ab029ae..57374ec 100644
> --- a/recipes/ncurses/ncurses_5.7.bb
> +++ b/recipes/ncurses/ncurses_5.7.bb
> @@ -6,9 +6,6 @@ PATCHDATE = "20100501"
>   PKGV = "${PV}+${PATCHDATE}"
>   PR = "r11"
>
> -# recipe is experimental for now...
> -DEFAULT_PREFERENCE = "-99"
> -
>   DEPENDS = "ncurses-native unifdef-native"
>   DEPENDS_virtclass-native = "unifdef-native"
>

We need to combine this with a PR bump for all recipes that DEPEND on 
ncurses ....

Philip


