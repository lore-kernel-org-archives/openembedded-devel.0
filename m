Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LeupR-0006lP-An
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 18:24:21 +0100
Received: from [192.168.1.105] (e180183108.adsl.alicedsl.de [85.180.183.108])
	by drlauer-research.com (Postfix) with ESMTP id 32CA0584167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 18:44:51 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236182004-4523-66-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-66-git-send-email-openembedded@haerwu.biz>
Organization: Vanille-Media
Date: Wed, 04 Mar 2009 18:20:09 +0100
Message-Id: <1236187209.10602.126.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: [PATCH 65/70] rpm-native: add Python 2.6
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
X-List-Received-Date: Wed, 04 Mar 2009 17:24:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 04.03.2009, 16:53 +0100 schrieb Marcin Juszkiewicz:
> From: Marcin Juszkiewicz <hrw@openembedded.org>
> 
> ---
>  packages/rpm/rpm_4.4.2.3.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
> index 3083387..248a9f2 100644
> --- a/packages/rpm/rpm_4.4.2.3.bb
> +++ b/packages/rpm/rpm_4.4.2.3.bb
> @@ -97,6 +97,7 @@ do_configure () {
>  def rpm_python_version(d):
>  	import os, bb
>  	staging_incdir = bb.data.getVar( "STAGING_INCDIR", d, 1 )
> +	if os.path.exists( "%s/python2.6" % staging_incdir ): return "2.6"
>  	if os.path.exists( "%s/python2.5" % staging_incdir ): return "2.5"
>  	if os.path.exists( "%s/python2.4" % staging_incdir ): return "2.4"
>  	if os.path.exists( "%s/python2.3" % staging_incdir ): return "2.3"

Comment to 08/70 applies here.

-- 
:M:



