Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OjbDX-0005RY-0n
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 19:05:23 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OjbDJ-00069k-Le from Tom_Rini@mentor.com ;
	Thu, 12 Aug 2010 10:05:09 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 12 Aug 2010 10:05:09 -0700
Received: from [172.30.80.91] ([172.30.80.91]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 12 Aug 2010 11:05:08 -0600
Message-ID: <4C6429BD.1070606@mentor.com>
Date: Thu, 12 Aug 2010 10:05:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1281627336-686-1-git-send-email-kernel-hacker@bennee.com>
	<1281627336-686-3-git-send-email-kernel-hacker@bennee.com>
In-Reply-To: <1281627336-686-3-git-send-email-kernel-hacker@bennee.com>
X-OriginalArrivalTime: 12 Aug 2010 17:05:08.0536 (UTC)
	FILETIME=[847E0380:01CB3A40]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Alex Bennee <ajb@cbnl.com>
Subject: Re: [PATCH 2/2] recode: Fix configure step.
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
X-List-Received-Date: Thu, 12 Aug 2010 17:05:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

kernel-hacker@bennee.com wrote:
> From: Alex Bennee <ajb@cbnl.com>
> 
> Add space to appended CC/CXX otherwise configure fails
> 
> Signed-off-by: Alex Bennee <ajb@cbnl.com>
> ---
>  recipes/recode/recode_3.6.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/recode/recode_3.6.bb b/recipes/recode/recode_3.6.bb
> index 3e7c6cd..0cdd43d 100644
> --- a/recipes/recode/recode_3.6.bb
> +++ b/recipes/recode/recode_3.6.bb
> @@ -8,7 +8,7 @@ SRC_URI = "${GNU_MIRROR}/recode/recode-${PV}.tar.gz \
>  
>  inherit autotools
>  
> -TARGET_CC_ARCH_append = "${LDFLAGS}"
> +TARGET_CC_ARCH_append = " ${LDFLAGS}"
>  
>  do_configure() {
>  	gnu-configize

iirc this should become TARGET_CC_ARCH += "${LDFLAGS}" as then the space 
will be added and it looks cleaner.

-- 
Tom Rini
Mentor Graphics Corporation


