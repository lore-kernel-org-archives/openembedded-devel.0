Received: from [64.233.162.226] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HftEF-0005ZE-5C
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 09:44:55 +0200
Received: by nz-out-0506.google.com with SMTP id m22so1156455nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2007 00:44:54 -0700 (PDT)
Received: by 10.65.232.19 with SMTP id j19mr2700333qbr.1177312555043;
	Mon, 23 Apr 2007 00:15:55 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id c1sm8929559nzd.2007.04.23.00.15.52;
	Mon, 23 Apr 2007 00:15:53 -0700 (PDT)
Date: Mon, 23 Apr 2007 10:15:51 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1363913311.20070423101551@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <461C85D6.1010105@whitby.id.au>
References: <1597775703.20070405182752@gmail.com>
	<46156BCD.6060407@whitby.id.au> <02429232.20070410152736@gmail.com>
	<461C85D6.1010105@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [RFC] Adding sanity to OE startup process
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2007 07:44:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Wednesday, April 11, 2007, 9:53:10 AM, you wrote:

> Paul Sokolovsky wrote:
>>   I expected SlugOS project to be important stakeholder for such
>> changes, so I appreciate your response, Rob! I had a look at
>> slugos-init's syslog handling, and for sure it looks well done and
>> should be generalized to the whole OE.

> Thanks.  It was mostly done by John Bowler.  Any bugs introduced since
> then are my responsibility :-)

>>   I guess, at this point, I should just play with it to understand
>> how it works better (for example, a question I have in mind: each of
>> syslog.{buffer, file, network} appears to just run syslogd with new
>> commandline params, not restart it or send signal; is this reliable
>> (e.g. documented)? Well, as I tell, I should try it myself first I
>> guess.)

> Good question.  I thought that only *one* of them would get started,
> based on the contents of the destination field in /etc/sysconf.conf at
> boot.  Is that not what you're seeing?

        Sorry, for delay, due to approaching of 2.6.22 merge window, I
work mostly on HH.org kernel now, but yesterday finally found time to
play with this issue.

        So yes, I see that the idea after all is log to only one
destination, just start logging as soon as possible for that
destination. I just had in mind something what Koen mentioned: start
logging to buffer ASAP, then later switchover to file if needed, then
to network if needed. Well, that's of course more of advanced feature.

        Also, confirmed that file log rotation works at least with
busybox 1.2.1. Cleaned up syslogd.conf fixed to not contain confusing
statements this is not supported, committed. Koen, what do you think
about switching Angstrom's default setting to /var/log/messages after
this, to make it easier for non-busybox people? After all, main
trouble with file logging is now fixed - it cannot grow unlimited in
size.


> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



