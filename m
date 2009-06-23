Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2LI-0006VK-Kr
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:31:04 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2Ac-0000Me-Nq
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:15:15 +0200
Message-ID: <h1q6f3$a5v$14@ger.gmane.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-5-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747394-31806-5-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 042/125] Allow use of Itanium as build machine
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
X-List-Received-Date: Tue, 23 Jun 2009 09:31:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Peter Chubb<peter.chubb@nicta.com.au>
>
> Hi,
> 	I have access to a cluster of Itaniums that I want to use as
> build machines for openembedded.  This patch enables Itanium as a
> build environment.
>
> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Your evil twin is signing off as well? :p

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/siteinfo.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
> index 55ab371..b51868b 100644
> --- a/classes/siteinfo.bbclass
> +++ b/classes/siteinfo.bbclass
> @@ -48,6 +48,7 @@ def get_siteinfo_list(d):
>                  "i486-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
>                  "i586-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
>                  "i686-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
> +	       "ia64-linux":		  "endian-little bit-64 common-linux common-glibc",\
>                  "mipsel-linux":            "endian-little bit-32 common-linux common-glibc",\
>                  "mipsel-linux-uclibc":     "endian-little bit-32 common-linux common-uclibc",\
>                  "mips-linux":              "endian-big bit-32 common-linux common-glibc",\




