Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M6OFx-0004Gz-RZ
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 14:17:18 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M6O8q-0005pb-Dm
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 12:09:56 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 19 May 2009 12:09:56 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 19 May 2009 12:09:56 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 19 May 2009 14:09:45 +0200
Message-ID: <guu7i9$pki$1@ger.gmane.org>
References: <200905191405.15699.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <200905191405.15699.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] task-proper-tools fixing
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
X-List-Received-Date: Tue, 19 May 2009 12:17:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-05-09 14:05, Marcin Juszkiewicz wrote:
>
> During work on 'task-proper-tools' I found a problem.
>
> This task tries to replace busybox applets with full versions of
> applications. I am adding new entries to this recipe to get better
> coverage and found some commands which are placed in different places.
>
> command   | busybox | command   | Debian    | package
> ----------|---------|-----------|-----------|-------------
> chattr    | /bin/   | /usr/bin/ | /usr/bin/ | coreutils
> df        | /bin/   | /usr/bin/ | /bin/     | coreutils
> getopt    | /bin/   | /usr/bin/ | /usr/bin/ | util-linux-ng
> mktemp    | /bin/   | /usr/bin/ | /bin/     | coreutils
> nice      | /bin/   | /usr/bin/ | /usr/bin/ | coreutils
> run-parts | /bin/   | /usr/bin/ | /bin/     | debianutils
> watch     | /bin/   | /usr/bin/ | /usr/bin/ | procps
>
> The question is: what do we do with those commands? Move all of them to
> /bin/ directory or move them to Debian locations?

I'd say we follow debian. On a related now, any suggestions on how to 
solve the /etc/defaults/mountall conflict?

regards,

Koen



