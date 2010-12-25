Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWY5v-0006y7-60
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 18:39:51 +0100
Received: by pwi8 with SMTP id 8so771674pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 09:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=yFuVbjHJ1oPWfh7fFBx3G6qvdx+G668RRjR3ibBd+Z0=;
	b=csf76maFw7jur13Mq7KlZfIDhxXfPyYzofs/+W7rmW+6sYX406LYKHJYjEhFLTTcKV
	XF91stvdL+u1rrZ89CnrsjvAhNKjLABfGT+AW2tS91o3fAecLR0kgIMdnWGr/nY86SGK
	qMJg2MkMOSl4V2lsTVLoPVqET5Vh2kBffPhsg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=YYYpO1dfxbT20isUpcbljZSUgIN/tI6zy4DnTe0h9ooWVX+gH6jlsbt/ln/ztI16od
	qIEhuwMhsMdDITLSsRciVVQ3Y9QGwMyFkkiPwgmqkYFRsBWgFahlrRAOlJuU2BGXjxjU
	X9En8BeRMjgH/xLK3iW/zvSwUnA93RvHY7qtY=
Received: by 10.142.203.15 with SMTP id a15mr8493352wfg.90.1293298767319;
	Sat, 25 Dec 2010 09:39:27 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm14407778wfh.12.2010.12.25.09.39.25
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 09:39:25 -0800 (PST)
Message-ID: <4D162C47.9080605@gmail.com>
Date: Sat, 25 Dec 2010 09:39:19 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>	<1293274109-15695-2-git-send-email-khimov@altell.ru>	<1293274109-15695-3-git-send-email-khimov@altell.ru>
	<1293274109-15695-4-git-send-email-khimov@altell.ru>
In-Reply-To: <1293274109-15695-4-git-send-email-khimov@altell.ru>
Subject: Re: [PATCH 4/5] perl-5.10.1: fix config var. 'need_va_copy'
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
X-List-Received-Date: Sat, 25 Dec 2010 17:39:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> From: Vladimir Sorokin<sorokin@altell.ru>
>
> On x86_64, powerpc&  s390 architectures need to copy va_list variable,
> if it got from overlying function, before it passed to underlying function.
>
> Signed-off-by: Vladimir Sorokin<sorokin@altell.ru>
> Signed-off-by: Roman I Khimov<khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   recipes/perl/perl_5.10.1.bb |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
> index 0e6a1f9..a58b8ec 100644
> --- a/recipes/perl/perl_5.10.1.bb
> +++ b/recipes/perl/perl_5.10.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
>   PRIORITY = "optional"
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db perl-native grep-native"
> -PR = "r16"
> +PR = "r17"
>
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"
> @@ -149,6 +149,13 @@ do_configure() {
>   	       -e 's,/usr/,${exec_prefix}/,g' \
>               config.sh-${TARGET_ARCH}-${TARGET_OS}
>
> +	case "${TARGET_ARCH}" in
> +		x86_64 | powerpc | s390)
> +			sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
> +				config.sh-${TARGET_ARCH}-${TARGET_OS}
> +			;;
> +	esac
> +
>           if test "${MACHINE}" != "native"; then
>               # These are strewn all over the source tree
>               for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do



