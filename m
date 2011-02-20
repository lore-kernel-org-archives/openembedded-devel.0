Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pr6jC-0001tF-6o
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 11:41:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id B8777A5BA7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 10:40:04 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id hPMV0i9N89FL
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 10:40:03 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id C1FC2A5B96
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 10:40:03 +0000 (GMT)
Message-ID: <4D60EF84.3070705@xora.org.uk>
Date: Sun, 20 Feb 2011 10:40:04 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1Pr64K-0003ub-00.nyrl-mail-ru@f253.mail.ru>
In-Reply-To: <E1Pr64K-0003ub-00.nyrl-mail-ru@f253.mail.ru>
X-Enigmail-Version: 1.1.1
Subject: Re: MACHINE_KERNEL_PR overrides PR for modules
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
X-List-Received-Date: Sun, 20 Feb 2011 10:41:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I think this patch is actually an indication that we need to rethink how
PR is generated and how it is abused
to contain SRCREV.

Graeme

On 20/02/2011 09:59, Denis Dydychkin wrote:
>
> When recipe inherits module.bbclass, it will get its PR overwritten if
> MACHINE_KERNEL_PR is defined. The outcome is that bumping PR within recipe has
> no effect, as well as SRCREV does not work anymore, which is especially
> important when working with latest version from repos.
>
> The following patch fixes this problem by appending MACHINE_KERNEL_PR to PR
> instead of replacing it. "+k" is added to get resulting PR looks like "r1+kr22"
> or "r1+svnr222+kr33" since MACHINE_KERNEL_PR is usually defined as "rXX".
>
>
> --- classes/module-base.bbclass 2011-02-17 16:14:45.792425264 +0300
> +++ classes/module-base.bbclass 2011-02-17 16:36:00.088425246 +0300
> @@ -11,7 +11,8 @@
>      machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>
>      if machine_kernel_pr:
> -       bb.data.setVar('PR', machine_kernel_pr, d)
> +       pr = bb.data.getVar('PR', d, True) + "+k" + machine_kernel_pr
> +       bb.data.setVar('PR', pr, d)
>  }
>
>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



