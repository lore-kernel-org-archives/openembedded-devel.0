Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PfdvY-0006SO-Fz
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 20:42:44 +0100
Received: (qmail 23303 invoked by uid 1003); 19 Jan 2011 19:35:17 -0000
Received: from unknown (HELO ?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 Jan 2011 19:35:17 -0000
Message-ID: <4D373CFC.8010400@balister.org>
Date: Wed, 19 Jan 2011 11:35:24 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
In-Reply-To: <1295464913-2642-1-git-send-email-koen@openembedded.org>
Subject: Re: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Wed, 19 Jan 2011 19:42:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2011 11:21 AM, Koen Kooi wrote:
> * Having rpath to sysroot is just as bad as one to workdir

When you do a build with this, how many recipes have issues?

Philip


>
> Based on insane.bbclass from yocto
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   classes/insane.bbclass |   11 ++++++-----
>   1 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index 677db27..50752b5 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -160,20 +160,21 @@ def package_qa_check_rpath(file,name,d, elf):
>       import bb, os
>       sane = True
>       scanelf = os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'scanelf')
> -    bad_dir = bb.data.getVar('TMPDIR', d, True) + "/work"
> +    bad_dirs = [bb.data.getVar('TMPDIR', d, True) + "/work", bb.data.getVar('STAGING_DIR_TARGET', d, True)]
>       bad_dir_test = bb.data.getVar('TMPDIR', d, True)
>       if not os.path.exists(scanelf):
>           bb.fatal("Can not check RPATH, scanelf (part of pax-utils-native) not found")
>
> -    if not bad_dir in bb.data.getVar('WORKDIR', d, True):
> +    if not bad_dirs[0] in bb.data.getVar('WORKDIR', d, True):
>           bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
>
>       output = os.popen("%s -B -F%%r#F '%s'" % (scanelf,file))
>       txt    = output.readline().split()
>       for line in txt:
> -        if bad_dir in line:
> -            error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
> -            sane = package_qa_handle_error(1, error_msg, name, file, d)
> +        for dir in bad_dirs:
> +            if dir in line:
> +                error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
> +                sane = sane + package_qa_handle_error(1, error_msg, name, file, d)
>
>       return sane
>


