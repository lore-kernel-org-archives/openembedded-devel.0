Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pcwi8-00023p-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 10:09:44 +0100
Received: by pxi17 with SMTP id 17so46531pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 01:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Tv9fEiVNL2tHT1ZXWWtAJZ0Mgh16nfgtG1olLJDJ5Ho=;
	b=L1mJai0BRp/9EsY3I9mp8sJG8qPnPb7/cgeshJ5jK3/gRkoE2i495lvpq3B41rxzyk
	YIipgQ0NNYlkoVfBc31S8GrVl2Rszsch0YDnTyiA6betRo42mmmY6tBmUXVNyp86wen+
	OaR1ts8L6y87KFtI14uZAVmaJMAZFXVPl3et0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=gGnZoCqi4ksaFemrcHmzbY54lDW/mXAt5szfGRLwsrkm1w7e2E2jVE7v0h3omG2ddh
	EQDjvO2zltr4LU3SZgk6p9XpBtei8Ykqx2z+cOfsUAwYrfaAXn3j2AMxuTOH2gF5FKHu
	WUPG40aZXnC3uHUeDqM8SrBFh9T6O190f1Gok=
Received: by 10.142.193.8 with SMTP id q8mr687633wff.308.1294823351830;
	Wed, 12 Jan 2011 01:09:11 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm554265wff.16.2011.01.12.01.09.10
	(version=SSLv3 cipher=RC4-MD5); Wed, 12 Jan 2011 01:09:10 -0800 (PST)
Message-ID: <4D2D6FB2.2060706@gmail.com>
Date: Wed, 12 Jan 2011 01:09:06 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1294822095-10559-1-git-send-email-raj.khem@gmail.com>
	<BA7CD77F-CB74-4639-B887-413AA7B873D8@dominion.thruhere.net>
In-Reply-To: <BA7CD77F-CB74-4639-B887-413AA7B873D8@dominion.thruhere.net>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Configure based on DISTRO_FEATURES_EGLIBC
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
X-List-Received-Date: Wed, 12 Jan 2011 09:09:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/2011 1:03 AM, Koen Kooi wrote:
>
> Op 12 jan 2011, om 09:48 heeft Khem Raj het volgende geschreven:
>
>> * Let distros decide what features to enable if not
>>   selected it will turn off all possible knobs
>>
>> * Enable all knobs for angstrom and distros based on
>>   sane-toolchain
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> CC: k.kooi@student.utwente.nl
>
> That email address will stop to exist soon :)

ok

>
>> CC: koansoftware@gmail.com
>> ---
>> conf/distro/include/angstrom-eglibc.inc       |    8 ++-
>> conf/distro/include/sane-toolchain-eglibc.inc |    8 ++
>> recipes/eglibc/eglibc-options.inc             |   89 +++++++++++++------------
>> recipes/eglibc/eglibc.inc                     |    4 +-
>> 4 files changed, 62 insertions(+), 47 deletions(-)
>>
>> diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
>> index f0ef802..1e3b971 100644
>> --- a/conf/distro/include/angstrom-eglibc.inc
>> +++ b/conf/distro/include/angstrom-eglibc.inc
>> @@ -26,4 +26,10 @@ BUILD_OPTIMIZATION_sparc = "-O2"
>> TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
>>
>> CXXFLAGS += "-fvisibility-inlines-hidden"
>> -
>> +DISTRO_FEATURES_EGLIBC ?= "ipv6 backtrace big-macros bsd cxx-tests catgets \
>> +                           charsets crypt crypt-ufc db-aliases envz fcvt fmtmsg \
>> +                           fstab ftraverse getlogin idn inet inet-anl libm \
>> +                           libm-big locales locale-code memusage nis nsswitch \
>> +                           rcmd rtld-debug spawn streams sunrpc utmp utmpx \
>> +                           wordexp posix-clang-wchar posix-regexp \
>> +                           posix-regexp-glibc posix-wchar-io"
>
> Can we double-soft assign (??=) it in eglibc.inc as well?

hmmm could be done. infact then we dont need to modify 
angstrom-eglibc.inc and sane-toolchain-eglibc.inc just having it in 
eglibc.inc will feed all the beasts.
>
> regards,
>
> Koen



