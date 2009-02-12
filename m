Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXfPC-0006Sj-9f
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 18:31:18 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXfNy-00037e-BM
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 17:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 18:29:13 +0100
Message-ID: <gn1m9a$5tl$5@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 5/6] sun-jre6: add 1.6.0.10
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
X-List-Received-Date: Thu, 12 Feb 2009 17:31:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 17:38, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---

NACK:

> +PACKAGES =+ "${PN}-plugin"
> +
> +FILES_${PN} = "/usr/"
> +FILES_${PN}-dbg += "/usr/*/.debug /usr/*/*/.debug /usr/*/*/*/.debug /usr/*/*/*/*/.debug /usr/*/*/*/*/*/.debug"
> +FILES_${PN}-plugin = "${libdir}/firefox-3.0.1/plugins/* ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so"

it would be better to install the plugin to /usr/lib/mozilla/plugins and 
have a postinst that symlinks it to ${libdir}/firefox-*, 
${libdir}/fennec-*, ${libdir}/iceweasle when those are present. That way 
other browser implement NPAPI (webkit...) can use the one in 
mozilla/plugins.

regards,

Koen



