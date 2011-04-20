Received: from bsmtp4.bon.at ([195.3.86.186] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1QCYlT-00016g-52 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 16:52:23 +0200
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 95F2613004A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 16:49:59 +0200 (CEST)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 16:49:57 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <20110419093343.GB2989@rhein.zuhause.netz>
	<1303307478.3979.60.camel@mattotaupa>
	<1303308248.3979.63.camel@mattotaupa>
In-Reply-To: <1303308248.3979.63.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201104201649.58067.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH 2/2] orc: add version 0.4.11
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
X-List-Received-Date: Wed, 20 Apr 2011 14:52:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Hi Paul

Am Mittwoch 20 April 2011, 16:04:08 schrieb Paul Menzel:
> Date: Wed, 20 Apr 2011 11:50:37 +0200
> 
> This version is build tested using `angstrom-2010.x` and `minimal{,-uclibc}` for `MACHINE = "beagleboard"`. `schroedinger_1.0.9.bb` also seems to build fine with this version.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/orc/orc_0.4.11.bb |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/orc/orc_0.4.11.bb
> 
> diff --git a/recipes/orc/orc_0.4.11.bb b/recipes/orc/orc_0.4.11.bb
> new file mode 100644
> index 0000000..e101068
> --- /dev/null
> +++ b/recipes/orc/orc_0.4.11.bb
> @@ -0,0 +1,4 @@
> +require orc.inc
> +
> +SRC_URI[orc.md5sum] = "b8b0b148d319422c3ad250c29483b3c4"
> +SRC_URI[orc.sha256sum] = "6ec60521a11339eda36f1e2210d08ae95010d769575e471aaf365b89bca8d031"
> 

This version of orc is compatible to schroedinger_1.0.9
compiles fine but only with BBMASK = "orc_0.4.13"
see http://88.116.171.82/angstrom/files/log.do_compile.9392

What to do with the (defect?) versions 0.4.12 and 0.4.13 ?

Delete recipes?

PREFERRED_VERSION = orc_0.4.11  somewhere?

Is there a notation for a recipe like DEPENDS = "orc<=0.4.11" as 'Requires' in rpm-specfiles does?



Peter


