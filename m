Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXfKQ-0006LQ-28
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 18:26:22 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXfJ8-0002t1-PD
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 17:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 18:24:35 +0100
Message-ID: <gn1m0k$5tl$2@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 2/6] cups: add 1.3.8.
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
X-List-Received-Date: Thu, 12 Feb 2009 17:26:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 17:38, Otavio Salvador wrote:
> ---
>   .../cups/cups-1.3.8/use_echo_only_in_init.patch    |   11 +++++++++++
>   packages/cups/cups_1.3.8.bb                        |    8 ++++++++
>   2 files changed, 19 insertions(+), 0 deletions(-)
>   create mode 100644 packages/cups/cups-1.3.8/use_echo_only_in_init.patch
>   create mode 100644 packages/cups/cups_1.3.8.bb
>
> diff --git a/packages/cups/cups-1.3.8/use_echo_only_in_init.patch b/packages/cups/cups-1.3.8/use_echo_only_in_init.patch
> new file mode 100644
> index 0000000..21ff0e5
> --- /dev/null
> +++ b/packages/cups/cups-1.3.8/use_echo_only_in_init.patch
> @@ -0,0 +1,11 @@
> +--- a/init/cups.sh.in.orig	2008-10-04 16:50:46.000000000 -0300
> ++++ b/init/cups.sh.in	2008-10-04 16:51:39.000000000 -0300
> +@@ -68,7 +68,7 @@
> + 		ECHO_ERROR=:
> + 		;;
> +
> +-	Linux*)
> ++	DISABLELinux*)
> + 		IS_ON=/bin/true
> + 		if test -f /etc/init.d/functions; then
> + 			. /etc/init.d/functions
> diff --git a/packages/cups/cups_1.3.8.bb b/packages/cups/cups_1.3.8.bb
> new file mode 100644
> index 0000000..e9fd985
> --- /dev/null
> +++ b/packages/cups/cups_1.3.8.bb
> @@ -0,0 +1,8 @@
> +require cups.inc
> +
> +SRC_URI += "file://use_echo_only_in_init.patch;patch=1"
> +PR = "r1"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +EXTRA_OECONF += " --disable-gssapi "

ACK



