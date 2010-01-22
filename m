Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NYLhf-0000iq-9x
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 16:45:46 +0100
Received: (qmail 31621 invoked by uid 1003); 22 Jan 2010 15:43:24 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 22 Jan 2010 15:43:24 -0000
Message-ID: <4B59C79B.707@balister.org>
Date: Fri, 22 Jan 2010 10:43:23 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1264174860-2130-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1264174860-2130-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] sanity.bbclass: handle lack of permission to	read /proc/sys/vm/mmap_min_addr
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
X-List-Received-Date: Fri, 22 Jan 2010 15:45:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2010 10:41 AM, Marcin Juszkiewicz wrote:
> From: Martin Jansa<martin.jansa@gmail.com>
>
> * With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
>    "cat /proc/sys/vm/mmap_min_addr" returns now
>    "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
>    Its probably becuse of
>    http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
>    But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
>    is intentional or just bug which should be fixed in kernel.
>
> This patch makes bitbake ignore reading error. Possible QEmu failure is not
> handled yet.
>
> Acked-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Philip Balister <philip@balister.org>

> ---
>   classes/sanity.bbclass |   13 ++++++++-----
>   1 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index f65df61..f57d8e4 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -96,11 +96,14 @@ def check_sanity(e):
>   			if not check_app_exists("qemu-arm", e.data):
>   				messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
>
> -		if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> -			f = file("/proc/sys/vm/mmap_min_addr", "r")
> -			if (f.read().strip() != "0"):
> -				messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
> -			f.close()
> +		try:
> +			if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> +				f = file("/proc/sys/vm/mmap_min_addr", "r")
> +				if (f.read().strip() != "0"):
> +					messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
> +				f.close()
> +		except:
> +			pass
>
>   	for util in required_utilities.split():
>   		if not check_app_exists( util, e.data ):


