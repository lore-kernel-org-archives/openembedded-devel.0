Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NH1E8-0004z7-Fk
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Dec 2009 21:27:39 +0100
Received: (qmail 9381 invoked by uid 1003); 5 Dec 2009 20:25:56 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 5 Dec 2009 20:25:56 -0000
Message-ID: <4B1AC1D3.6000601@balister.org>
Date: Sat, 05 Dec 2009 15:25:55 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1260039602-21665-1-git-send-email-darkstar6262@gmail.com>
In-Reply-To: <1260039602-21665-1-git-send-email-darkstar6262@gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE] [PATCH] icu: Add patch for dangling #elif expression
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
X-List-Received-Date: Sat, 05 Dec 2009 20:27:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2009 02:00 PM, Cory Maccarrone wrote:
> This change adds a patch that fixes a compile error in
> source/layoutex/ParagraphLayout.cpp caused by an

I'm testing this and also see a problem with icu-native preventing icu 
from building. Did you fix this in stable also?

Philip

>
> Signed-off-by: Cory Maccarrone<darkstar6262@gmail.com>
> ---
>   recipes/icu/files/fix-elif-expression.patch |   11 +++++++++++
>   recipes/icu/icu-3.6.inc                     |    3 ++-
>   2 files changed, 13 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/icu/files/fix-elif-expression.patch
>
> diff --git a/recipes/icu/files/fix-elif-expression.patch b/recipes/icu/files/fix-elif-expression.patch
> new file mode 100644
> index 0000000..6021bee
> --- /dev/null
> +++ b/recipes/icu/files/fix-elif-expression.patch
> @@ -0,0 +1,11 @@
> +--- source/layoutex/ParagraphLayout.cpp	2006-08-22 17:12:42.000000000 -0700
> ++++ source/layoutex/ParagraphLayout.cpp-new	2009-12-05 10:35:04.728241416 -0800
> +@@ -798,7 +798,7 @@
> +
> +     return nullLanguageCode;
> + }
> +-#elif
> ++#else
> +
> + // TODO - dummy implementation for right now...
> + le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
> diff --git a/recipes/icu/icu-3.6.inc b/recipes/icu/icu-3.6.inc
> index 04fc842..aaacd83 100644
> --- a/recipes/icu/icu-3.6.inc
> +++ b/recipes/icu/icu-3.6.inc
> @@ -1,7 +1,8 @@
>
>   LICENSE = "ICU"
>
> -SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-3_6-src.tgz"
> +SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-3_6-src.tgz \
> +           file://fix-elif-expression.patch;patch=1"
>
>   S = "${WORKDIR}/icu/source"
>


