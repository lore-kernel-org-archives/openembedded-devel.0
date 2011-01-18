Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PfEqn-000820-FJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 17:56:09 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PfEqA-00012s-HG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 08:55:30 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 18 Jan 2011 08:55:30 -0800
Received: from [172.30.80.246] ([172.30.80.246]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 18 Jan 2011 09:55:29 -0700
Message-ID: <4D35C5FE.9000705@mentor.com>
Date: Tue, 18 Jan 2011 09:55:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
	<1295363929-13246-4-git-send-email-kergoth@gmail.com>
In-Reply-To: <1295363929-13246-4-git-send-email-kergoth@gmail.com>
X-OriginalArrivalTime: 18 Jan 2011 16:55:29.0501 (UTC)
	FILETIME=[830A88D0:01CBB730]
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
X-List-Received-Date: Tue, 18 Jan 2011 16:56:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2011 08:18 AM, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson<chris_larson@mentor.com>

Fold this into #3?

> ---
>   bin/install |   13 ++++++++++++-
>   1 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/bin/install b/bin/install
> index 4ad8172..1c938755 100755
> --- a/bin/install
> +++ b/bin/install
> @@ -1,9 +1,13 @@
>   #!/bin/sh
> +#
> +# Portability notes:
> +# - We allow what SuSv3 defines
> +# - We implement -D internally
>
>   source $(dirname $0)/wrapper.sh
>
>   saved=""
> -while getopts dbCcMpSsvB:f:g:m:o: opt; do
> +while getopts dbCcMpSsvB:f:g:m:o:D opt; do
>       case "$opt" in
>           s)
>               # Ignore strip argument
> @@ -12,6 +16,9 @@ while getopts dbCcMpSsvB:f:g:m:o: opt; do
>               save "-$opt"
>               save "$OPTARG"
>               ;;
> +        D)
> +            createleading="1"
> +            ;;
>           \?)
>               exit 1
>               ;;
> @@ -25,4 +32,8 @@ for arg; do
>       save "$arg"
>   done
>
> +if [ $# == 2 -a -n "$createleading" ]; then
> +    install -d $(dirname $2)
> +fi
> +
>   exec_real


-- 
Tom Rini
Mentor Graphics Corporation


