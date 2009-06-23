Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ2V0-0006xu-GU
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:41:06 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2KI-0000mI-Vn
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 09:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 09:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:16:06 +0200
Message-ID: <h1q6gm$a5v$17@ger.gmane.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-8-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747394-31806-8-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 059/125] package_rpm: fix move wrong generated rpm name - closes #5078
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
X-List-Received-Date: Tue, 23 Jun 2009 09:41:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Lynn Lin<lynn.lin@avocent.com>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/package_rpm.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
> index 71fa760..0cebdea 100644
> --- a/classes/package_rpm.bbclass
> +++ b/classes/package_rpm.bbclass
> @@ -136,7 +136,7 @@ python write_specfile() {
>   	bb.build.exec_func('BUILDSPEC', d)
>
>   	# move the rpm into the pkgoutdir
> -	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
> +	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${RPMPV}-${PR}${DISTRO_PR}.${TARGET_ARCH}.rpm', d)
>   	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PACKAGE_ARCH}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
>   	bb.movefile(rpm, outrpm)
>   }




