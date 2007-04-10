Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HbFRY-00066r-8i
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 14:27:28 +0200
Received: by py-out-1112.google.com with SMTP id n39so1290934pyh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 05:27:27 -0700 (PDT)
Received: by 10.64.10.2 with SMTP id 2mr14120599qbj.1176208047190;
	Tue, 10 Apr 2007 05:27:27 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id 36sm11473886nzk.2007.04.10.05.27.25;
	Tue, 10 Apr 2007 05:27:26 -0700 (PDT)
Date: Tue, 10 Apr 2007 15:27:36 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <02429232.20070410152736@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <46156BCD.6060407@whitby.id.au>
References: <1597775703.20070405182752@gmail.com>
	<46156BCD.6060407@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding sanity to OE startup process
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 12:27:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Friday, April 6, 2007, 12:36:13 AM, you wrote:

> Paul Sokolovsky wrote:
>>   So, to start with, I'd like to propose to make it possible for boot
>> process to log to syslog. I have following in mind:
>> 
>> 4. Make /etc/init.d/syslogd.sh start earlier so it could capture as
>> mush output as possible.

> This is something that the syslog.file, syslog.buffer and syslog.network
> scripts in packages/slugos-init/files/initscripts try to do.  Syslog to
> buffer is started *as* *early* as possible.  Syslog to file is started
> as soon as filesystems are mounted, and Syslog to network is started as
> soon as the network is up.

> [I'm not suggesting you copy those files directly, or use the
> slugos-init package - this all needs to be generalised and subsumed into
> the standard init package as part of the slugos reincorporation into
> general OE.]

  I expected SlugOS project to be important stakeholder for such
changes, so I appreciate your response, Rob! I had a look at
slugos-init's syslog handling, and for sure it looks well done and
should be generalized to the whole OE.

  I guess, at this point, I should just play with it to understand
how it works better (for example, a question I have in mind: each of
syslog.{buffer, file, network} appears to just run syslogd with new
commandline params, not restart it or send signal; is this reliable
(e.g. documented)? Well, as I tell, I should try it myself first I
guess.)

[]

> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



