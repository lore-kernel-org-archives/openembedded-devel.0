Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NCacM-0000NY-Ib
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:14:21 +0100
Received: (qmail 32057 invoked by uid 1003); 23 Nov 2009 15:12:43 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Nov 2009 15:12:43 -0000
Message-ID: <4B0AA668.3030500@balister.org>
Date: Mon, 23 Nov 2009 10:12:40 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1258836735.21876.2.camel@runt>
In-Reply-To: <1258836735.21876.2.camel@runt>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE] [PATCH] base.bbclass: Replace os.system with subprocess call.
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
X-List-Received-Date: Mon, 23 Nov 2009 15:14:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 11/21/2009 03:52 PM, Cory Maccarrone wrote:
> (This patch is being submitted on behalf of Khem Raj.  I am not the original
> author, nor do I claim any part of this work.)
> --------------
>
> Often gzip is reporting broken pipe errors with do_unpack of
> tar.gz files.
>
> If you use the commands described above to extract a tar.gz file, gzip
> sometimes emits a Broken pipe error message. This can safely be ignored
> if tar extracted all files without any other error message.
>
> We do not let python install its SIGPIPE handler and use subprocess call
> to invoke the command.
>
> This is based on the following python bug report.
> http://bugs.python.org/issue1652
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   classes/base.bbclass |    9 +++++++--
>   1 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index e622aee..69d1979 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -716,9 +716,14 @@ base_do_buildall() {
>   	:
>   }
>
> +def subprocess_setup():
> +	import signal, subprocess
> +	# Python installs a SIGPIPE handler by default. This is usually not what
> +	# non-Python subprocesses expect.
> +	signal.signal(signal.SIGPIPE, signal.SIG_DFL)
>
>   def oe_unpack_file(file, data, url = None):
> -	import bb, os
> +	import bb, os, signal, subprocess
>   	if not url:
>   		url = "file://%s" % file
>   	dots = file.split(".")
> @@ -787,7 +792,7 @@ def oe_unpack_file(file, data, url = None):
>
>   	cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
>   	bb.note("Unpacking %s to %s/" % (base_path_out(file, data), base_path_out(os.getcwd(), data)))
> -	ret = os.system(cmd)
> +	ret = subprocess.call(cmd, preexec_fn=subprocess_setup, shell=True)
>
>   	os.chdir(save_cwd)
>


