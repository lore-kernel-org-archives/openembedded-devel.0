Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LoXsy-0001vd-2n
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 08:55:48 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LoXqr-0002Nj-6X
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 06:53:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 06:53:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 06:53:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 31 Mar 2009 08:53:24 +0200
Message-ID: <gqsel4$g9v$1@ger.gmane.org>
References: <1238452829.7128.4.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <1238452829.7128.4.camel@alap>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] add hotplug2 package
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
X-List-Received-Date: Tue, 31 Mar 2009 06:55:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-03-09 00:40, Angus Ainslie wrote:

Your commit message is invalid



> +PR = "r0"

r0 is the default so you can remove that


> +DEFAULT_PREFERENCE = "-1"

There's only one version of hotplug2, so why add a default_pref?


> +INITSCRIPT_PARAMS = "start 03 S ."

You forgot to inherit update-rc.d

> +LDFLAGS += "-lglibc"

I don't think that actually works, and if it did, uclibc would break


> +DESTDIR=${D}

missing quotes

> +do_configure () {
> +}

missing colon between the braces. But more importantly: why inherit 
autotools when you're not going to run configure?

regards,

Koen



