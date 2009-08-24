Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MfQpe-0004Ex-5Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 06:06:58 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 271F91B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 03:53:29 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2009 05:49:09 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200908240549.09079.holger+oe@freyther.de>
Subject: Re: [PATCH] base.bbclass: Replace os.system with subprocess call.
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
X-List-Received-Date: Mon, 24 Aug 2009 04:06:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 24 August 2009 04:31:41 Khem Raj wrote:
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
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Holger Freyther <zecke@selfish.org>


> ---
>  classes/base.bbclass |    9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 598a7bb..4e9b65c 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -728,9 +728,14 @@ base_do_buildall() {
>
>  }
>
> +def subprocess_setup():
> +	import signal, subprocess
> +	# Python installs a SIGPIPE handler by default. This is usually not what
> +	# non-Python subprocesses expect.
> +	signal.signal(signal.SIGPIPE, signal.SIG_DFL)

you don't need to import subprocess here...



>
>  def oe_unpack_file(file, data, url = None):
> -	import bb, os
> +	import bb, os, signal, subprocess

no need for import signal...


>  	if not url:
>  		url = "file://%s" % file
>  	dots = file.split(".")
> @@ -799,7 +804,7 @@ def oe_unpack_file(file, data, url = None):
>
>  	cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
>  	bb.note("Unpacking %s to %s/" % (base_path_out(file, data),
> base_path_out(os.getcwd(), data))) -	ret = os.system(cmd)
> +	ret = subprocess.call(cmd, preexec_fn=subprocess_setup, shell=True)
>
>  	os.chdir(save_cwd)


