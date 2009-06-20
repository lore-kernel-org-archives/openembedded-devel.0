Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MI65I-0004zF-K6
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 21:18:40 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MI5ur-0006FF-5a
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 19:07:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 19:07:53 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 19:07:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 20 Jun 2009 21:07:37 +0200
Message-ID: <h1jc1p$lum$1@ger.gmane.org>
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 19:18:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-06-09 19:59, Elvis Dowson wrote:
> Hi,
> I'm trying to create a recipe for libserial-0.6.0rc1.

0.60rc1 as PV violates OE's versioning policy

> There is a folder
> called sip in the package. How can I modify the recipe to remove the sip
> folder from the list of files to be configured and compiled?
>
> DESCRIPTION = "C++ library for serial port support."
> SECTION = "libs"
> LICENSE = "GPL"
> HOMEPAGE = "http://libserial.sourceforge.net/mediawiki/index.php/Main_Page"
>
> SRC_URI = "${SOURCEFORGE_MIRROR}/libserial/libserial-${PV}.tar.gz"
>
> S = "${WORKDIR}/libserial-${PV}"
>
> inherit autotools pkgconfig
>
> do_stage() {
> autotools_stage_all

use autotools_stage and AUTOTOOLS_STAGE_PKGCONFIG = 1

regards,

Koen



