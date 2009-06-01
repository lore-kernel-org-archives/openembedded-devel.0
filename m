Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBF3q-0001ZX-30
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 23:28:51 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MBEvK-0008Eb-Fl
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 21:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 21:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 21:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Jun 2009 23:18:01 +0200
Message-ID: <h01gia$ckf$1@ger.gmane.org>
References: <200905191405.15699.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
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
X-List-Received-Date: Mon, 01 Jun 2009 21:28:52 -0000
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

Any updates on this? Do_rootfs currently breaks because of this:

Collected errors:
update-alternatives: Error: cannot register alternative df to 
/usr/bin/df since it is already registered to /bin/df
update-alternatives: Error: cannot register alternative nice to 
/usr/bin/nice since it is already registered to /bin/nice
update-alternatives: Error: cannot register alternative stat to 
/usr/bin/stat since it is already registered to /bin/stat
update-alternatives: Error: cannot register alternative run-parts to 
/usr/bin/run-parts since it is already registered to /bin/run-parts

log_check: There were error messages in the logfile

regards,

Koen



