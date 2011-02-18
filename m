Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqRKt-0004yu-2w
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 15:29:31 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqRJg-0001XR-89 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 06:28:16 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 06:28:15 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 07:28:14 -0700
Message-ID: <4D5E81F9.5060605@mentor.com>
Date: Fri, 18 Feb 2011 07:28:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298028729-10564-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1298028729-10564-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 18 Feb 2011 14:28:15.0033 (UTC)
	FILETIME=[1417F290:01CBCF78]
Subject: Re: [PATCH] acl: fix build problems with rpath on older libtool
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
X-List-Received-Date: Fri, 18 Feb 2011 14:29:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/18/2011 04:32 AM, Eric Bénard wrote:
> * bump INC_PR
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
>   recipes/udev/acl_2.2.49.bb |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
> index 5a37c57..20f94db 100644
> --- a/recipes/udev/acl_2.2.49.bb
> +++ b/recipes/udev/acl_2.2.49.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Commands for Manipulating POSIX Access Control Lists"
>   LICENSE = "GPLv2"
>
> -PR = "r3"
> +PR = "r4"
>
>   DEPENDS = "attr"
>
> @@ -20,6 +20,9 @@ EXTRA_OECONF = " --enable-gettext=yes \
>   do_configure_append() {
>       # gettext hack
>       echo "#define _(str) str">>  ${S}/include/config.h
> +    # use same fix as libiconv
> +    sed -i -e  s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ \
> +           -e s/^runpath_var/#runpath_var/ ${S}/*-libtool
>   }
>
>   do_configure_prepend() {

I've actually got something similar, but based on how poky fixed this 
queued up, and while I was in there I cleaned up the paths a bit too. 
But you got it posted first, so do you have a preference?

-- 
Tom Rini
Mentor Graphics Corporation


