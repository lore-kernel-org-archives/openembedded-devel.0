Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfIJV-0003sW-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 21:38:01 +0100
Received: by iwn8 with SMTP id 8so57664iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 12:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=xk5GY6S3iJbvW+3Lc/IthTCPZFUZiydemA+sQO8KQ1g=;
	b=O3xoBR8hqO6/9avdKAjTYjDlOXLw7E6haXeHMokzpqERYBtt4/djXqcMxc8CC0fjrn
	GtdcVNd/1jzIVQLDvnLe0+mmHEd+RzmcYxn61Ev6U0wyhIEzjy5wYbwxQ2WXezcTnuoh
	b70ldkmUXWnLI47Xw7w7eWh7cNBLIzL/QBPWc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=JKCPH8EZz1827OQiqsDGO2fcx45aUmIvbntDHxj8n0McFjgyD0t+IcUfVbkA1nFH6F
	g9mKWpN19cpu/HoLUh6QaUSayhoZrOA+V7/etVS4WgOLRcN+KLjZToXJQGiRWBOPCymI
	YtkzAcH8O0tapJvktYPaq2ZQg/lrvAJr2k5ao=
Received: by 10.42.176.129 with SMTP id be1mr6926398icb.139.1295383044071;
	Tue, 18 Jan 2011 12:37:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 18 Jan 2011 12:37:04 -0800 (PST)
In-Reply-To: <1295363929-13246-4-git-send-email-kergoth@gmail.com>
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
	<1295363929-13246-4-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 12:37:04 -0800
Message-ID: <AANLkTi=g19b_c6e0LkR4Vv4mrvstqLw7tKvH5Xd6iwFP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/4] bin/install: implement -D internally
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
X-List-Received-Date: Tue, 18 Jan 2011 20:38:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 7:18 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0bin/install | =C2=A0 13 ++++++++++++-
> =C2=A01 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/bin/install b/bin/install
> index 4ad8172..1c938755 100755
> --- a/bin/install
> +++ b/bin/install
> @@ -1,9 +1,13 @@
> =C2=A0#!/bin/sh
> +#
> +# Portability notes:
> +# - We allow what SuSv3 defines
> +# - We implement -D internally
>
> =C2=A0source $(dirname $0)/wrapper.sh
>
> =C2=A0saved=3D""
> -while getopts dbCcMpSsvB:f:g:m:o: opt; do
> +while getopts dbCcMpSsvB:f:g:m:o:D opt; do
> =C2=A0 =C2=A0 case "$opt" in
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 s)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore strip argument
> @@ -12,6 +16,9 @@ while getopts dbCcMpSsvB:f:g:m:o: opt; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 save "-$opt"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 save "$OPTARG"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0D)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0createleading=3D"1"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 \?)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> @@ -25,4 +32,8 @@ for arg; do
> =C2=A0 =C2=A0 save "$arg"
> =C2=A0done
>
> +if [ $# =3D=3D 2 -a -n "$createleading" ]; then
> + =C2=A0 =C2=A0install -d $(dirname $2)
> +fi
> +
> =C2=A0exec_real
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


