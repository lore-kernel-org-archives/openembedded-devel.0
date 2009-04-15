Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LuCOD-0001YW-Vd
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 23:11:30 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LuCKV-0003hC-FU
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 21:07:35 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 21:07:35 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 21:07:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Apr 2009 23:07:20 +0200
Message-ID: <gs5ia9$c4i$1@ger.gmane.org>
References: <20090415205336.GB17954@rainbow>
	<1239829008-11236-1-git-send-email-mad_soft@inbox.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090413 Shredder/3.0b3pre
In-Reply-To: <1239829008-11236-1-git-send-email-mad_soft@inbox.ru>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] glista: new recipe
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
X-List-Received-Date: Wed, 15 Apr 2009 21:11:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-09 22:56, Dmitry Artamonow wrote:
> Add new recipe for glista (v0.4) - a simple personal to-do list manager,
> written using GTK+ widget set. It can be used as an alternative to gpe-todo.
>
> Closes OE bug #4525

Looks good to me


>
> Signed-off-by: Dmitry Artamonow<mad_soft@inbox.ru>
> ---
>   conf/checksums.ini           |    4 ++++
>   recipes/glista/glista_0.4.bb |   10 ++++++++++
>   2 files changed, 14 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/glista/glista_0.4.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 6518eb5..3032b0f 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -7718,6 +7718,10 @@ sha256=7ff592b6687caefa367b33d8cb8f66f3c0273fa86d4b688c0758d0d9fee7a2cb
>   md5=78fe56143bab9a7df232fa15e35a54a6
>   sha256=972da0f1c35df459b99b24f5bbed5ddec150b714540e2254b6b37035117167ed
>
> +[http://glista.googlecode.com/files/glista-0.4.tar.gz]
> +md5=db4afe3ba157232a6debe58885c693e6
> +sha256=39289c0fc3efd3b003730212201ce7d8a56b06fcf080188ecc76d4ad9375c807
> +
>   [http://camaya.net/download/gloox-0.8.1.tar.bz2]
>   md5=9054d072f5972d5e567c428531734ad5
>   sha256=7f836c8189b55ef4ec8f3387673687d0a5c1a713abc9617144638b28e6857bd2
> diff --git a/recipes/glista/glista_0.4.bb b/recipes/glista/glista_0.4.bb
> new file mode 100644
> index 0000000..d657b46
> --- /dev/null
> +++ b/recipes/glista/glista_0.4.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Glista is very simple personal to-do list manager"
> +AUTHOR = "Shahar Evron<shahar@prematureoptimization.org>"
> +HOMEPAGE = "http://prematureoptimization.org/glista/"
> +SECTION = "x11/applications"
> +PRIORITY = "optional"
> +LICENSE = "GPLv3"
> +DEPENDS = "gtk+ (>=2.12.0) libxml2"
> +SRC_URI = "http://glista.googlecode.com/files/glista-${PV}.tar.gz"
> +
> +inherit autotools




