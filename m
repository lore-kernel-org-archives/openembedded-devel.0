Return-Path: <blloyd@familyhonor.net>
Received: from mho-01-ewr.mailhop.org (mho-03-ewr.mailhop.org [204.13.248.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2AE6FCEA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jun 2014 03:58:18 +0000 (UTC)
Received: from [98.142.68.106] (helo=lloydserv.home.familyhonor.net)
	by mho-01-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1Wt7lr-0005qm-4n for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2014 03:58:19 +0000
Received: from mail.familyhonor.net (lloydserv.home.familyhonor.net
	[127.0.0.1]) (authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s573wGcI017247
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jun 2014 22:58:16 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.106
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1/0JvYD53XUhLbtExoqqF0U6RBxw1pKhoU=
MIME-Version: 1.0
Date: Fri, 06 Jun 2014 22:58:16 -0500
From: blloyd <blloyd@familyhonor.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <1e3e1440af55f551685afb9d79e47d71@mail.familyhonor.net>
X-Sender: blloyd@familyhonor.net
User-Agent: Roundcube Webmail/0.9.5
Subject: multi-threaded core dump issues when threading symbols missing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jun 2014 03:58:20 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit

I originally tried to solve this problem a long time ago by changing the 
gdb package to depend on the selected libc debug packages.  That never 
did get to a state that was accepted for commit.

However, even if it did, I've come to realize that it wouldn't really 
fix the problem.

Basically, core dumps do not generate valid dumps for multiple threads 
when the threading debug symbols are not available.  This includes 
automatically generated core dumps when an application segfaults while 
running (kernel generated dumps).

Two possible solutions for the problem which will ensure core dumps work 
when enabled is to:
1.  not strip the libc packages.  Since this would mean more loaded into 
memory all the time, I can understand why this may not be desirable.
2.  Include the debug symbols for either all of libc or just the 
specific libc debug symbols needed for a valid core dump so that core 
dumps work.
      a.  Just have eglibc depend on eglibc-dbg and uclibc depend on 
uclibc-dbg.  Easy.  For eglibc, this adds @35mb to a system
      b.  Split the required *.so.debug out from the rest of the dbg, and 
have the -dbg package and base package depend on the new package.  I 
believe the minimal required is libpthread-*.so.debug, which for the 
eglibc case adds less than 1MB to the image.

Testing would be required to ensure the right subset is selected for 
2.b, but when I originally did this just adding that one debug file 
caused the generated images to work for all my debugging needs.

Are either of the above possible solutions likely to get approved?  I 
don't mind implementing either, but as they effectively affect every 
image made, I would like to discuss before implementing one of the 
solutions.

Without this change, a debug dump will have only one viewable thread.  
It is not usually the crashing thread.  With the required debug symbols 
in place, crash dump debugging (including on a development box with the 
device SDK installed) appears to function properly.


Any suggestions about what can be done that could be accepted for 
inclusion into the mainline after completion would be appreciated.

Is 1MB worth worrying about?  I know some images that are generated are 
very small, but I don't usually get things smaller than 200MB where 500K 
is just noise.


