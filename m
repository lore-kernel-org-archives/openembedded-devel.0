Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXfYu-0006iW-MA
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 18:41:20 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXfXf-0003XS-4U
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 17:40:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:40:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:40:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 18:25:10 +0100
Message-ID: <gn1m1n$5tl$3@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add dynamic depends on locale packages (ipk specific)
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
X-List-Received-Date: Thu, 12 Feb 2009 17:41:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 17:38, Otavio Salvador wrote:
> ---
>   classes/package.bbclass     |   10 ----------
>   classes/package_ipk.bbclass |    4 ++++
>   2 files changed, 4 insertions(+), 10 deletions(-)

I'd like a bigger explanation what does wants to do and what the impact 
of it is.

regards,

Koen




>
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index a7cdb5f..5559592 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -293,16 +293,6 @@ python package_do_split_locales() {
>   		bb.data.setVar('DESCRIPTION_' + pkg, '%s translation for %s' % (l, pn), d)
>
>   	bb.data.setVar('PACKAGES', ' '.join(packages), d)
> -
> -	# Disabled by RP 18/06/07
> -	# Wildcards aren't supported in debian
> -	# They break with ipkg since glibc-locale* will mean that
> -	# glibc-localedata-translit* won't install as a dependency
> -	# for some other package which breaks meta-toolchain
> -	# Probably breaks since virtual-locale- isn't provided anywhere
> -	#rdep = (bb.data.getVar('RDEPENDS_%s' % mainpkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "").split()
> -	#rdep.append('%s-locale*' % pn)
> -	#bb.data.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep), d)
>   }
>
>   python populate_packages () {
> diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
> index 3a97729..2d28cf8 100644
> --- a/classes/package_ipk.bbclass
> +++ b/classes/package_ipk.bbclass
> @@ -244,6 +244,10 @@ python do_package_ipk () {
>   		rprovides = (bb.data.getVar("RPROVIDES", localdata, 1) or "").split()
>   		rreplaces = (bb.data.getVar("RREPLACES", localdata, 1) or "").split()
>   		rconflicts = (bb.data.getVar("RCONFLICTS", localdata, 1) or "").split()
> +
> +		if pkgname.find('-locale-') == -1:
> +			rdepends.append('%s-locale*' % pkgname)
> +
>   		if rdepends:
>   			ctrlfile.write("Depends: %s\n" % ", ".join(rdepends))
>   		if rsuggests:




