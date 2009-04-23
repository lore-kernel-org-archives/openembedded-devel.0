Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwsWF-0002RG-H0
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 08:34:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LwsRk-0000gK-OP
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 06:30:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 06:30:08 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 06:30:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Apr 2009 08:29:53 +0200
Message-ID: <gsp1t1$9fq$1@ger.gmane.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>	<1240449461-26116-2-git-send-email-otavio@debian.org>	<1240449461-26116-3-git-send-email-otavio@debian.org>
	<1240449461-26116-4-git-send-email-otavio@debian.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240449461-26116-4-git-send-email-otavio@debian.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 3/6] machine/geode[gl]x: use more optimization while compiling
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
X-List-Received-Date: Thu, 23 Apr 2009 06:34:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-04-09 03:17, Otavio Salvador wrote:

> -GLIBC_EXTRA_OECONF = "--with-tls"
> +GLIBC_EXTRA_OECONF = "--with-tls --with-cpu=geode"
> +SELECTED_OPTIMIZATION_glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"

shouldn't that be _pn-glibc?

And shouldn't you make glibc geode specific after that?

regards,

Koen



