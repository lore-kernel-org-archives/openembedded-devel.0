Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PZ62X-0002iv-48 for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 19:18:53 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p01IGS2a016415; Sat, 1 Jan 2011 18:16:29 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1-Ta3FSjWwDq; Sat,  1 Jan 2011 18:16:28 +0000 (GMT)
Received: from [192.168.1.42] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p01IGOdh016411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 1 Jan 2011 18:16:26 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Sat, 01 Jan 2011 18:14:37 +0000
Message-ID: <1293905677.17519.16909.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Bitbake task logging
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
X-List-Received-Date: Sat, 01 Jan 2011 18:18:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been looking at the changes in bitbake master and those in Poky.
Both are trying to improve the logging situation but I think we need to
discuss/agree what we're trying to achieve.

I'm trying to think about this from the user point of view. What does a
user need and expect from bitbake to be as easy to use as possible and
figure out whats going on. New users often ask "what is it doing? what
functions does it run?" and its hard to work out for someone new to it.

Some of the list below works today, some is close, some doesn't but I'm
looking to work out what the experience should be, then we can figure
out how to get there technically.

The things I think we need are:

a) A logfile per task.

b) All output from the task should end up in the logfile, copied or
otherwise, be it bitbake LogRecords, output to stdout, stderr or
anything else.

c) The logfile should be able to include different output from that
shown in the UI console. For example, I think "note" output in the
logfiles might be useful all the time, I'm wondering if it ever is
useful on the UI console. Turning off "note" for the console but keeping
it and maybe using it more in tasks could be useful. For example,
exec_func() could note which functions are being executed and I can
imagine a user finding that very useful in the log file for debugging
(which is when a user would look there). Debug output is probably too
verbose even for the log files in general but I'm open to persuasion one
way or another on that.

d) Handling of the default stdout is a tricky one. I think it makes most
sense to redirect this to the logfile always, for both python and shell 
tasks. For bitbake itself, nothing in bitbake should be putting output
there though IMO. This makes sense since we can control stdout from
within bitbake itself but from within generic tasks we cannot make
guarantees. Python tasks may make os.system calls, or run binaries and
it would make sense for stdout to just work for these rather than need
special handling or wrapper functions especially for log handling (they
could be a good idea for other reasons).

e) I'm not 100% on this yet but I'm wondering if we should scrap
stdout/stderr output to the UI console in debug mode, just make it clear
where the output went on the console? If you ever have two tasks running
the output is unreadable anyway.

Thoughts/Comments/Suggestions?

Cheers,

Richard



