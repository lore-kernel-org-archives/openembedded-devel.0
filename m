Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M9oTK-0005Lu-NW
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 May 2009 00:53:14 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKD00K6LD2S7VT0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	28 May 2009 14:35:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 18F6714AF5F; Thu,
	28 May 2009 15:35:16 -0400 (EDT)
Date: Thu, 28 May 2009 15:35:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090528193516.GA2625@denix.org>
References: <1243535051-10168-1-git-send-email-msmith@cbnco.com>
MIME-version: 1.0
In-reply-to: <1243535051-10168-1-git-send-email-msmith@cbnco.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] syslog-ng: fix SRC_URIs
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
X-List-Received-Date: Thu, 28 May 2009 22:53:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 28, 2009 at 02:24:10PM -0400, Michael Smith wrote:
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  conf/checksums.ini                    |    6 +++---
>  recipes/syslog-ng/syslog-ng_1.6.11.bb |    2 +-
>  recipes/syslog-ng/syslog-ng_1.6.8.bb  |    2 +-
>  recipes/syslog-ng/syslog-ng_2.0.5.bb  |    2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 19192ba..04737b1 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -22470,15 +22470,15 @@ sha256=c087b112da0afd1c50ba8a8a2727c4cabfb1e5a57f43701c5abdc05865072649
>  md5=ee6b84cc7b598b4e1a00a4a8c6676d4e
>  sha256=d4d17102e014d3183a11719896061dc464c3d9a836caaf47b3b57da4ac23b52d
>  
> -[http://www.balabit.com/downloads/syslog-ng/1.6/src/syslog-ng-1.6.11.tar.gz]
> +[http://www.balabit.com/downloads/files/syslog-ng/sources/1.6/src/syslog-ng-1.6.11.tar.gz]
>  md5=8f9ca6140f428dc9adec9fa1c270a2dd
>  sha256=dd37f1e280bd6c2d66c9a15aa3ee9e209a1b649e3b79e70fee58aea1cb0ea093
>  
> -[http://www.balabit.com/downloads/syslog-ng/1.6/src/syslog-ng-1.6.8.tar.gz]
> +[http://www.balabit.com/downloads/files/syslog-ng/sources/1.6/src/syslog-ng-1.6.8.tar.gz]
>  md5=ffbad7e8e6dcbe385820b8ffba23b622
>  sha256=3c841fd89599ffb770cdf2844426980d75dc3dab12e0f707e4cbb51937f6125e
>  
> -[http://www.balabit.com/downloads/files/syslog-ng/sources/stable/src/syslog-ng-2.0.5.tar.gz]
> +[http://www.balabit.com/downloads/files/syslog-ng/sources/2.0/src/syslog-ng-2.0.5.tar.gz]
>  md5=c161eefc450fabc246c1a10997c6c6a5
>  sha256=34862f87d9d404ad4874d95ee871334f5bc2acad65420f672ad2ee286ab660a1
>  
> diff --git a/recipes/syslog-ng/syslog-ng_1.6.11.bb b/recipes/syslog-ng/syslog-ng_1.6.11.bb
> index 794ad53..0ae0090 100644
> --- a/recipes/syslog-ng/syslog-ng_1.6.11.bb
> +++ b/recipes/syslog-ng/syslog-ng_1.6.11.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Alternative system logger daemon"
>  DEPENDS = "libol flex"
>  PR = "r0"
>  
> -SRC_URI = "http://www.balabit.com/downloads/syslog-ng/1.6/src/${PN}-${PV}.tar.gz \
> +SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/1.6/src/${PN}-${PV}.tar.gz \
>            file://syslog-ng.conf \
>            file://initscript"
>  
> diff --git a/recipes/syslog-ng/syslog-ng_1.6.8.bb b/recipes/syslog-ng/syslog-ng_1.6.8.bb
> index d8e02d0..9535656 100644
> --- a/recipes/syslog-ng/syslog-ng_1.6.8.bb
> +++ b/recipes/syslog-ng/syslog-ng_1.6.8.bb
> @@ -2,7 +2,7 @@ PR = "r9"
>  DESCRIPTION = "Alternative system logger daemon"
>  DEPENDS = "libol flex"
>  
> -SRC_URI = "http://www.balabit.com/downloads/syslog-ng/1.6/src/${PN}-${PV}.tar.gz \
> +SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/1.6/src/${PN}-${PV}.tar.gz \
>            file://syslog-ng.conf \
>  	  file://initscript"
>  
> diff --git a/recipes/syslog-ng/syslog-ng_2.0.5.bb b/recipes/syslog-ng/syslog-ng_2.0.5.bb
> index 80f0fc5..5b3431c 100644
> --- a/recipes/syslog-ng/syslog-ng_2.0.5.bb
> +++ b/recipes/syslog-ng/syslog-ng_2.0.5.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Alternative system logger daemon"
>  DEPENDS = "libol flex eventlog glib-2.0"
>  PR = "r2"
>  
> -SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/stable/src/${P}.tar.gz \
> +SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/2.0/src/${P}.tar.gz \
>            file://syslog-ng.conf \
>            file://initscript"
>  
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


