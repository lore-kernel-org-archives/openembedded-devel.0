Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7AB77DB6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 15:19:22 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f27so15831451pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jun 2017 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=exLgJxHbCvjRlVXhlLKDWVSWNY4N/B1/GSIUu8RQTto=;
	b=LvnL36GxjZ6UkX45NJGc4hCMnJKiKT18q/EyJSCv6bVqNAMR8TYyO59pghQADVnhbS
	qu9fQxcjQhxPwmMAZJNCDIccXo3A6xDy3ZH6vut66bx1Ow6lxvxBVObpDyurzgS6aQHE
	J08cg/x6SNmmSNYB6osdvKrIBuLxPXbFERdTNbqA3QFF32n2R33g9YD7CQUYsY/38i8v
	uyU8mpLa/pTa85HAfYAZK8s+Hgtomc+aG/jOkG9oTCuGTDd2LNyASCGCnUVF6O3R+HS7
	w54prv7SSRNGlcy4WOB1ydF6HLSRLUG0qIbOO9hsyph+KOPdM3938lFWulE7gQQISUmB
	ZVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=exLgJxHbCvjRlVXhlLKDWVSWNY4N/B1/GSIUu8RQTto=;
	b=r6ItprN7s4xS+1f3JurLQI52VyKqaOEIgalwzCumj3X2/ebfdEXg6iK+nmU4Idvp6K
	WTL1woBJgW6wMdAbxiM2f/gh1HSN9InKg3ggXEGNwaGRxKWxphjbjaO+ydpk2ZJgAh8G
	ML0kPNcIrk0ZSkr5JqxlXNK31YXE5dr1PV/+cNFA5PXiI66WEHHgPyLghzkhfUvAaWit
	QycVn4q/WH/3hu0LpM7YqgB4UOpwt5sJsuRv/esRrIDfe2W2+QgKLT8ZW2cvd8sS2uuG
	VDLVtpDqcE72cKzkbgXIleszOeCM2di94WPXuPZcq5uW1PfetngqWSog16Whkt/wl123
	6Unw==
X-Gm-Message-State: AODbwcAOElcjp07ghs2noj98ED4Ui5Qft/pJe93HyHOxK4O5EtS3uPJK
	q4FInzWOhC8lrRrq/tk=
X-Received: by 10.84.209.199 with SMTP id y65mr5548346plh.205.1496503164111;
	Sat, 03 Jun 2017 08:19:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:b844:8676:377:81ac?
	([2601:202:4001:9ea0:b844:8676:377:81ac])
	by smtp.gmail.com with ESMTPSA id
	r73sm44593209pfk.114.2017.06.03.08.19.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Jun 2017 08:19:23 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20170603045833.8120-1-raj.khem@gmail.com>
	<20170603045833.8120-4-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <972b705e-d0b2-349c-f30d-443392fcccea@gmail.com>
Date: Sat, 3 Jun 2017 08:19:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170603045833.8120-4-raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH 4/4] samba: Fix build with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Jun 2017 15:19:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/02/2017 09:58 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../recipes-connectivity/samba/samba/glibc_only.patch | 15 +++++++++++++++
>   .../samba/samba/netdb_defines.patch                   | 19 +++++++++++++++++++
>   .../recipes-connectivity/samba/samba_4.6.2.bb         |  2 ++
>   3 files changed, 36 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
>   create mode 100644 meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch b/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
> new file mode 100644
> index 000000000..894bc8bb2
Isn't this missing Upstream-Status and Signed-off-by ?

- armin
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
> @@ -0,0 +1,15 @@
> +Index: samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
> +===================================================================
> +--- samba-4.6.2.orig/ctdb/tests/src/test_mutex_raw.c
> ++++ samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
> +@@ -166,8 +166,10 @@ int main(int argc, const char **argv)
> + 			if (ret == 0) {
> + 				pthread_mutex_unlock(mutex);
> + 			}
> ++#ifdef __GLIBC__
> + 		} else if (ret == EBUSY) {
> + 			printf("pid=%u\n", mutex->__data.__owner);
> ++#endif
> + 		} else if (ret == 0) {
> + 			pthread_mutex_unlock(mutex);
> + 		}
> diff --git a/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch b/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
> new file mode 100644
> index 000000000..eb06866f4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
> @@ -0,0 +1,19 @@
> +Index: samba-4.6.2/nsswitch/wins.c
> +===================================================================
> +--- samba-4.6.2.orig/nsswitch/wins.c
> ++++ samba-4.6.2/nsswitch/wins.c
> +@@ -39,6 +39,14 @@ static pthread_mutex_t wins_nss_mutex =
> + #define INADDRSZ 4
> + #endif
> +
> ++#ifndef NETDB_INTERNAL
> ++#define NETDB_INTERNAL (-1)
> ++#endif
> ++
> ++#ifndef NETDB_SUCCESS
> ++#define NETDB_SUCCESS  0
> ++#endif
> ++
> + NSS_STATUS _nss_wins_gethostbyname_r(const char *hostname,
> + 				     struct hostent *he,
> + 				     char *buffer,
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
> index 38876c2c3..7574aefb4 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
> @@ -18,6 +18,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>              file://21-add-config-option-without-valgrind.patch \
>              file://0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch \
>              file://0006-avoid-using-colon-in-the-checking-msg.patch \
> +           file://netdb_defines.patch \
> +           file://glibc_only.patch \
>              file://volatiles.03_samba \
>             "
>   SRC_URI_append_libc-musl = " \


