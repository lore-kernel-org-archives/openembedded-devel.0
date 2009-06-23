Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2ek-0007Md-1J
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:51:10 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2Tz-0001At-6s
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:40:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:40:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:40:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:13:30 +0200
Message-ID: <h1q6bq$a5v$7@ger.gmane.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747417-11163-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 052/125] evtest: Fixed GNU_HASH QA error.
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
X-List-Received-Date: Tue, 23 Jun 2009 09:51:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Theodore A. Roth<taroth@gmail.com>
>
> Signed-off-by: Theodore A. Roth<taroth@gmail.com>
> Acked-by: Denys Dmytriyenko<denis@denix.org>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Even though it lacks a PR bump:
Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/evtest/evtest_1.23.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/evtest/evtest_1.23.bb b/recipes/evtest/evtest_1.23.bb
> index 4c5d195..6cf87be 100644
> --- a/recipes/evtest/evtest_1.23.bb
> +++ b/recipes/evtest/evtest_1.23.bb
> @@ -11,6 +11,8 @@ PR = "r0"
>   SRC_URI = "http://beagleboard.googlecode.com/files/evtest.c"
>   S = "${WORKDIR}"
>
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>   do_compile() {
>       ${CC} evtest.c -o evtest -I${STAGING_INCDIR} -L${STAGING_LIBDIR}
>   }




