Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7946-0003Ly-9e
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 16:16:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M78wh-0002G8-O2
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 14:08:31 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 14:08:31 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 14:08:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 21 May 2009 16:07:56 +0200
Message-ID: <gv3n7s$1gg$1@ger.gmane.org>
References: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
In-Reply-To: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] gst-plugins: fixed pattern for meta package dependencies.
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
X-List-Received-Date: Thu, 21 May 2009 14:16:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-05-09 15:21, Ihar Hrachyshka wrote:
> This fixes package name matching so that gst-plugins-*-meta
> packages include all the plugin ones. The current matching
> implementation doesn't make meta packages depend on gst-plugins
> with 'locale' and 'dev' in their names (f.e. gstfbdevsink).

This patch looks OK, but you need to bump PR for the affected recipes as 
well. (Someone will probably mention INC_PR soon ;))

regards,

Koen

> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>   recipes/gstreamer/gst-plugins.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gstreamer/gst-plugins.inc b/recipes/gstreamer/gst-plugins.inc
> index bcb3e39..0156cff 100644
> --- a/recipes/gstreamer/gst-plugins.inc
> +++ b/recipes/gstreamer/gst-plugins.inc
> @@ -33,7 +33,7 @@ python populate_packages_prepend () {
>   	metapkg_rdepends = []
>   	packages = bb.data.getVar('PACKAGES', d, 1).split()
>   	for pkg in packages[1:]:
> -		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count('dev') and not pkg.count( 'locale' ):
> +		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-locale'):
>   			metapkg_rdepends.append(pkg)
>   	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
>   	bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta package', d)




