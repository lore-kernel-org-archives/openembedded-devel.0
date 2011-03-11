Received: from p3plsmtpa07-03.prod.phx3.secureserver.net ([173.201.192.232])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Py92g-0002t6-0P
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 21:34:36 +0100
Received: (qmail 8986 invoked from network); 11 Mar 2011 20:32:54 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa07-03.prod.phx3.secureserver.net (173.201.192.232) with
	ESMTP; 11 Mar 2011 20:32:54 -0000
Message-ID: <4D7A86EB.2090504@mwester.net>
Date: Fri, 11 Mar 2011 14:32:43 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201103101553.27407.pgsellmann@portner-elektronik.at>
In-Reply-To: <201103101553.27407.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH] vsftpd-2.0.5: added dependency for correct build order
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
X-List-Received-Date: Fri, 11 Mar 2011 20:34:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 3/10/2011 8:53 AM, Peter Gsellmann wrote:
> vsftpd needs the cap_* functions; if the library libcap is not built before vsftpd, an error occurs.
> 
> Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
> ---
>  recipes/vsftpd/vsftpd_2.0.5.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/vsftpd/vsftpd_2.0.5.bb b/recipes/vsftpd/vsftpd_2.0.5.bb
> index 518628e..2486744 100644
> --- a/recipes/vsftpd/vsftpd_2.0.5.bb
> +++ b/recipes/vsftpd/vsftpd_2.0.5.bb
> @@ -3,6 +3,8 @@ SECTION = "console/network"
>  LICENSE = "GPL"
>  PR = "r2"

Technically, you'll want to bump the PR as well (although for this
particular change, it'll actually work without it)


> +DEPENDS = "libcap"
> +
>  SRC_URI = "ftp://vsftpd.beasts.org/users/cevans/vsftpd-${PV}.tar.gz \
>             file://makefile.patch \
>             file://nopam.patch \
> @@ -20,7 +22,7 @@ do_configure() {
>  }
>  
>  do_compile() {
> -        oe_runmake "LIBS=-lcrypt -L${STAGING_LIBDIR}"
> +        oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap"
>  }
>  
>  do_install() {



