Received: from [66.249.82.228] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HZUD5-0000tz-S7
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2007 17:49:15 +0200
Received: by wx-out-0506.google.com with SMTP id t14so567783wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2007 08:49:14 -0700 (PDT)
Received: by 10.90.72.10 with SMTP id u10mr1745434aga.1175788154665;
	Thu, 05 Apr 2007 08:49:14 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id 40sm3091455nzf.2007.04.05.08.49.13;
	Thu, 05 Apr 2007 08:49:14 -0700 (PDT)
Date: Thu, 5 Apr 2007 18:49:19 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1653144547.20070405184919@gmail.com>
To: Sergey Lapin <slapinid@gmail.com>
In-Reply-To: <461516E2.1000505@gmail.com>
References: <1597775703.20070405182752@gmail.com> <461516E2.1000505@gmail.com>
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
X-List-Received-Date: Thu, 05 Apr 2007 15:49:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Sergey,

Thursday, April 5, 2007, 6:33:54 PM, you wrote:

> Paul Sokolovsky wrote:
>>   So, to start with, I'd like to propose to make it possible for boot
>> process to log to syslog. I have following in mind:
>> 
>> 1. Make a convention that boot/service scripts should use "$echo"
>> instead of "echo" to do output.
>> 2. Have default define of "echo=echo" for this.
> I think some function should suffice.
> aliasing is possible too.
> Function could be more flexible solution.

  Well, yes, function would actually even better. I just wasn't sure
if rules for overriding builtins are portable enough. Well, I checked
that it works for both bash and busybox.


>> 3. Turn /etc/init.d/syslogd into /etc/init.d/syslogd.sh so it was
>> sourced by /etc/init.d/rc and could export new value for the rest of
>> scripts.
> I don't see why.

>> 5. Using syslogd for boot messages capture is of course optional.
> I don't see why.
> We can log to multiple places.

> All the best,
> S.


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



