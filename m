Received: from [206.16.192.249] (helo=outbound1-ash-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <tim.bird@am.sony.com>) id 1GNCep-00015E-2n
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 20:06:51 +0200
Received: from outbound1-ash.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound1-ash-R.bigfish.com (Postfix) with ESMTP id CD48D13BF0E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 18:03:13 +0000 (UTC)
Received: from mail43-ash-R.bigfish.com (unknown [172.18.2.3])
	by outbound1-ash.bigfish.com (Postfix) with ESMTP id C4B3813B3558
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 18:03:13 +0000 (UTC)
Received: from mail43-ash.bigfish.com (localhost.localdomain [127.0.0.1])
	by mail43-ash-R.bigfish.com (Postfix) with ESMTP id BA382C0F997
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 18:03:13 +0000 (UTC)
X-BigFish: V
Received: by mail43-ash (MessageSwitch) id 1158084136649735_17921;
	Tue, 12 Sep 2006 18:02:16 +0000 (UCT)
Received: from mail8.fw-sd.sony.com (mail8.fw-sd.sony.com [160.33.66.75])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by mail43-ash.bigfish.com (Postfix) with ESMTP id 79C7DC0FCE9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 18:02:16 +0000 (UTC)
Received: from mail3.sjc.in.sel.sony.com (mail3.sjc.in.sel.sony.com
	[43.134.1.211])
	by mail8.fw-sd.sony.com (8.12.11/8.12.11) with ESMTP id k8CI2F9T013915
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 18:02:15 GMT
Received: from [43.134.85.135] ([43.134.85.135])
	by mail3.sjc.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	k8CI2F11028373 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 18:02:15 GMT
Message-ID: <4506F6A1.2030201@am.sony.com>
Date: Tue, 12 Sep 2006 11:04:17 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <200609121228.26077.openembedded@hrw.one.pl>
In-Reply-To: <200609121228.26077.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.0.0
Subject: Re: Paid support offer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2006 18:06:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> I started own business. Main area will be OpenEmbedded consulting
> as I'm one of core developers of this buildsystem.
> 
> Things which I want to cover are:
> 
> * device support
> * bug fixing
> * adding/altering packages
> * maintenance of external branches
> 
> Those kinds of things are nothing new to me - I maintain own branch
> used to build OpenZaurus, added few hundreds of packages (and changed
> countless of them).
> 
> Currently I prefer remote work due to fact that I still have full time job.
> Payments can be solved in two ways:
> 
> - payment per needed hours (this can be hard to count because some of it
>   takes waiting for build)
> - one price for whole work
> 
> I can provide invoice.

I am interested.  The CE Linux Forum is using OE for our Test Lab, but
we have some difficulties with it.  Maybe you can help us solve some
of these difficulties.

Here are some specifics:
 * we wish to create our own distribution with fairly minimal footprint
 but including a number of test packages.  Specifically, we have added an
 LTP package to our system, but have not (to my knowledge) pushed this
 upstream to OE.  We would like assistance with adding, modifying and maintaining
 packages:
  * would like an X11-less python package - to support test scripts on target
  written in python (but where the target does not have any graphical support).
  * would like a drop-bear that supports root access with no password
  (There's a patch for this, but we have not integrated it into our system yet)
  * would like to add several test packages (here are some candidates, in no particular order):
aiostress  fio         kernbench  reaim     sleeptest  tbench
bonnie     fsx         lmbench    scrashme  unixbench
dbench     interbench  selftest  stress

 * we would also like to set up and maintain a source snapshot mirror.
I have a sources fetch running nightly now on a dedicated machine in
our test lab (grabbing the sources for a 'bootstrap-image' distro.  But I
have not yet set up the rsync to move the snapshot files to a large server
where I can publish them on the web.  I don't think much remains to finish
this effort, but I don't have time to do it myself.

The problem we are trying to solve is that users of our test lab system may not
have access outside their corporate firewall to anything but http.  So they cannot
use subversion, monotone, or other configuration management systems to retrieve sources.
Bitbake just breaks if it ends up needing to use any of these CMSes directly.  OE will
only work for us if our users have a public repository of source that is accessible
via only http.

 * an RPM package with minimal elements that can be used to begin working
 with our OE-based distribution.  I have found that OE has a very large list of
 pre-requisites, and is very difficult to set up on my local machine.  An installer
 program which resolves these difficulties would be very useful.  Users of my testlab
 will download and build OE software on their local machines, and this needs to be
 turn-key if possible.

 * documentation for the above.

Please let me know your interest level and a rough estimate (ballpark figure) of the
amount of money each of the projects listed above would cost.  (Or let me know your
hourly rate and a rough estimate of the hours you think those would take.

Please contact me if you have additional questions.

Thanks and regards,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Electronics
=============================



