Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PIu6Y-000358-VV
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 03:20:10 +0100
Received: (qmail 11968 invoked by uid 1003); 18 Nov 2010 02:18:28 -0000
Received: from adsl-75-37-22-143.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Nov 2010 02:18:27 -0000
Message-ID: <4CE48CFF.7070406@balister.org>
Date: Wed, 17 Nov 2010 18:18:39 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290046421-22553-1-git-send-email-sgarman@zenlinux.com>
In-Reply-To: <1290046421-22553-1-git-send-email-sgarman@zenlinux.com>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tar: upgrade to version 1.25
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
X-List-Received-Date: Thu, 18 Nov 2010 02:20:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2010 06:13 PM, Scott Garman wrote:
> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
> ---
>   recipes/tar/tar_1.23.bb |    6 ------
>   recipes/tar/tar_1.25.bb |    6 ++++++
>   2 files changed, 6 insertions(+), 6 deletions(-)
>   delete mode 100644 recipes/tar/tar_1.23.bb
>   create mode 100644 recipes/tar/tar_1.25.bb
>
> diff --git a/recipes/tar/tar_1.23.bb b/recipes/tar/tar_1.23.bb
> deleted file mode 100644
> index dc37247..0000000
> --- a/recipes/tar/tar_1.23.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require tar.inc
> -
> -PR = "${INC_PR}"
> -
> -SRC_URI[md5sum] = "41e2ca4b924ec7860e51b43ad06cdb7e"
> -SRC_URI[sha256sum] = "c9328372db62fbb1d94c9e4e3cefc961111af46de47085b635359c00a0eebe36"
> diff --git a/recipes/tar/tar_1.25.bb b/recipes/tar/tar_1.25.bb
> new file mode 100644
> index 0000000..c611f77
> --- /dev/null
> +++ b/recipes/tar/tar_1.25.bb
> @@ -0,0 +1,6 @@
> +require tar.inc
> +
> +PR = "${INC_PR}"
> +
> +SRC_URI[md5sum] = "6e497f861c77bbba2f7da4e10270995b"
> +SRC_URI[sha256sum] = "f3f6ce41b8e0f327abd05c95990f113ddafbae131e10f79a99728ed46458494b"


Acked-by: Philip Balister <philip@balister.org>

Can you add tar-1.23 to the removal.txt file? Ask it be removed in a 
couple of months. This way we have a schedule to delete the older recipe.

Philip


