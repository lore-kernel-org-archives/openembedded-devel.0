Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MpK2I-00049f-TN for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 12:52:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MpK1l-00075R-12
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 12:52:21 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 12:52:21 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 12:52:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 20 Sep 2009 12:51:58 +0200
Message-ID: <h951gf$in8$1@ger.gmane.org>
References: <1253428380-27587-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1253428380-27587-1-git-send-email-denis@denix.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] package.bbclass: export subpackage individual version, if different from main
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
X-List-Received-Date: Sun, 20 Sep 2009 10:52:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-09-09 08:33, Denys Dmytriyenko wrote:
> Fixes the wrong versioned runtime dependency for shlib subpackages with
> own versions. Consider this:
>
> PACKAGES = "libfoo libbar"
> PV_libfoo = "1"
> PV_libbar = "2"
> PV = "3"
>
> That will generate libfoo_1 and libbar_2 packages, but version 3 will be
> exported in shlibs database, leading to the following versioned runtime
> dependencies:
>
> RDEPENDS: libfoo (>=3) libbar (>=3)
>
> This fixes the problem.

Normally I'd ask for a use case, but I know what you need it for :)

> Signed-off-by: Denys Dmytriyenko<denis@denix.org>

Acked-by: Koen Kooi <koen@openembedded.org>


>
> ---
>   classes/package.bbclass |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 5a9fa50..7a0ba80 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -652,6 +652,10 @@ python package_do_shlibs() {
>   		needs_ldconfig = False
>   		bb.debug(2, "calculating shlib provides for %s" % pkg)
>
> +		pkgver = bb.data.getVar('PV_' + pkg, d, 1)
> +		if not pkgver:
> +			pkgver = ver
> +
>   		needed[pkg] = []
>   		sonames = list()
>   		top = os.path.join(pkgdest, pkg)
> @@ -696,7 +700,7 @@ python package_do_shlibs() {
>   			fd.close()
>   			package_stagefile(shlibs_file, d)
>   			fd = open(shver_file, 'w')
> -			fd.write(ver + '\n')
> +			fd.write(pkgver + '\n')
>   			fd.close()
>   			package_stagefile(shver_file, d)
>   		if needs_ldconfig and use_ldconfig:




