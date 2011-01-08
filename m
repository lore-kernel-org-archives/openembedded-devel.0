Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pbhzh-0002Sf-0w
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 00:14:45 +0100
Received: by pwi8 with SMTP id 8so2605438pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 15:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=7plFLBd2AR+of5dBFT1hpIwxJq6oiOsdWUsjBEi4nlc=;
	b=QDIO7k82t7Eq5BULzm7bdcrc4ZKXefKUuxb6adD63Vvo1W5NHLk+elc5ttRi6fdOSU
	+o7XE9eMxqrMqsj+chHo5FNM1aDWLUwde4aD5kcJ47KyfTw7DS0ZJXJ7mu9SbuyBISoQ
	9q/rh1LIz9BgsyBBZWLwMQ8sgEEM89EMDBnRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=nGgb2fUhuiEDTGtZjFJoN9t8naqc6j65ATnwHTv43kjBlq2YSM3hjAMK++8uBP/KUk
	gnyJgNquRkZnE2QoQyD+Yc8/Yi2uzpbXVrC9ljlmWNGdEtnc8lqs/rdPrF2dQBgFNRP3
	IfCGVo9/duDszZgB8uIUuCzljHCGQ4MnVK1G4=
Received: by 10.143.39.20 with SMTP id r20mr2944888wfj.413.1294528455819;
	Sat, 08 Jan 2011 15:14:15 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm4995363wff.16.2011.01.08.15.14.14
	(version=SSLv3 cipher=RC4-MD5); Sat, 08 Jan 2011 15:14:15 -0800 (PST)
Message-ID: <4D28EFBA.50704@gmail.com>
Date: Sat, 08 Jan 2011 15:14:02 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH 1/2] azy: add mysql5 to depends it's used in azy/src/tests/T_SQL.azy_server_stubs.h if mysql-config is found
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
X-List-Received-Date: Sat, 08 Jan 2011 23:14:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/2011 7:33 AM, Martin Jansa wrote:
> ---
>   recipes/efl1/azy_svn.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/efl1/azy_svn.bb b/recipes/efl1/azy_svn.bb
> index 5d6cb00..7e96c60 100644
> --- a/recipes/efl1/azy_svn.bb
> +++ b/recipes/efl1/azy_svn.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Azy is a library meant for implementing rpc clients and servers in a simple manner."
> -DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native azy-native"
> -DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native"
> +DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native mysql5 azy-native"
> +DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native"
>   LICENSE = "LGPLv2.1+"
>   PV = "1.0.0+svnr${SRCPV}"
>   SRCREV = "${EFL_SRCREV}"

Looks ok.

Acked-by: Khem Raj <raj.khem@gmail.com>

please add your sign-off before installing it.


