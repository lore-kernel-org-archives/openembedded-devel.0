Received: from [65.55.251.16] (helo=outbound7-blu-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <Tim.Bird@am.sony.com>) id 1HWeSy-0007Ma-NJ
	for openembedded-devel@openembedded.org; Wed, 28 Mar 2007 22:09:56 +0200
Received: from outbound7-blu.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound7-blu-R.bigfish.com (Postfix) with ESMTP id E048711686A5;
	Wed, 28 Mar 2007 20:09:55 +0000 (UTC)
Received: from mail124-blu-R.bigfish.com (unknown [10.1.252.3])
	by outbound7-blu.bigfish.com (Postfix) with ESMTP id D0BDD16300B0;
	Wed, 28 Mar 2007 20:09:55 +0000 (UTC)
Received: from mail124-blu (localhost.localdomain [127.0.0.1])
	by mail124-blu-R.bigfish.com (Postfix) with ESMTP id 4F958D10206;
	Wed, 28 Mar 2007 20:09:55 +0000 (UTC)
X-BigFish: VP
Received: by mail124-blu (MessageSwitch) id 1175112594740104_17172;
	Wed, 28 Mar 2007 20:09:54 +0000 (UCT)
Received: from mail8.fw-bc.sony.com (mail8.fw-bc.sony.com [160.33.98.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail124-blu.bigfish.com (Postfix) with ESMTP id 360A0154808F;
	Wed, 28 Mar 2007 20:09:54 +0000 (UTC)
Received: from mail1.sgo.in.sel.sony.com (mail1.sgo.in.sel.sony.com
	[43.130.1.111])
	by mail8.fw-bc.sony.com (8.12.11/8.12.11) with ESMTP id l2SK9rgc009489; 
	Wed, 28 Mar 2007 20:09:53 GMT
Received: from USSDIXIM02.am.sony.com (ussdixim02.am.sony.com [43.130.140.34])
	by mail1.sgo.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	l2SK9lFp020474; Wed, 28 Mar 2007 20:09:47 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM02.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 28 Mar 2007 13:09:43 -0700
Received: from [43.134.85.135] ([43.134.85.135]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 28 Mar 2007 13:09:42 -0700
Message-ID: <460ACBB8.8070501@am.sony.com>
Date: Wed, 28 Mar 2007 13:10:32 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: Richard Purdie <rpurdie@rpsys.net>
References: <20070320033120.GA8678@thegnar.org>	
	<1174574086.5949.32.camel@localhost.localdomain>	
	<20070323043126.GA893@thegnar.org>	
	<1174641616.5813.9.camel@localhost.localdomain>	
	<460AABD1.4080409@am.sony.com>
	<1175109319.5829.30.camel@localhost.localdomain>
In-Reply-To: <1175109319.5829.30.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 28 Mar 2007 20:09:42.0696 (UTC)
	FILETIME=[05DEFA80:01C77175]
Cc: openembedded-devel@openembedded.org
Subject: Re: bitbake and OE opperation
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
X-List-Received-Date: Wed, 28 Mar 2007 20:09:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Not to belabor this, but I'm going to try to repeat
this stuff back, to make sure I understand.

Richard Purdie wrote:
>> There are the following lines - I don't know if they're related or not:
>>
>> addtask build after do_populate_staging
>> do_build = ""
>> do_build[func] = "1"
> 
> These are very much related, it defines that there is a build task (with
> an associated function which defaults to empty). It says this build task
> depends on a "populate_staging" task.

So this is similar to:

build: do_populate_staging

in a makefile.

>> Maybe I'm thinking procedurally, and this is all declarative, but where
>> the heck are the actual statements executed during a "build"?
> 
> Nothing is executed by "build" itself, the key is in the dependency on
> "populate_staging".
> 
In this case, since build has no actual
commands associated with it, it is like a PHONY target in
a makefile?

> They're not hardcoded, the sequence is made through the definition of
> tasks, each of which depend on each other. Very roughly:
> 
> build depends on populate_staging
> populate_staging depends on package_write
> package_write depends on package
> package depends on install
> install depends on compile
> compile depends on configure
> configure depends on patch
> patch depends on unpack
> unpack depends on fetch
>

From base.bbclass, if I grep addtask, I see:
addtask showdata
addtask listtasks
addtask clean
addtask rebuild
addtask mrproper
addtask fetch
addtask fetchall after do_fetch
addtask unpack after do_fetch
addtask configure after do_unpack do_patch
addtask compile after do_configure
addtask populate_staging after do_package_write
addtask install after do_compile
addtask build after do_populate_staging

So there appear to be "island" tasks (e.g.showdata, clean),
that are not part of the main sequence for a build.  I presume these
are accessible via the command line in bitbake?

I don't see an addtask for "patch" in there.  Is this added
to the dependency tree somewhere else?  Is this something
that is package-specific?

Also, there appear to be multiple parallel
dependencies (fetchall and unpack are both after fetch).
How are these ordered?  (What is "fetchall" anyway?)

Tasks package and package_write are also referenced but not "addtask"ed
to the graph.

> Incidentally, don't be put off by the "do_" prefix, this is just to
> highlight things as tasks when their usage might otherwise be
> ambiguous.

Is "do_" ignored in task declarations, references, or both?

> Does that make it clearer?
Yes, thanks.

I assume that .bb files can arbitrarily define some new
task and graft it into the dependency tree.

In your experience, are there many other custom (package-specific)
tasks like this?

Here is my idea of what each task does:
Can you please check this?

build - meta-task to cover the whole build process
populate_staging - (same as do_stage?) - put package contents in staging area?
package_write - ??
package - collect files files from install locations into some kind of collection (dependent on package format)
install - place files (e.g. built binaries) at install locations
compile - make
configure - run configure
patch - apply patches to source
unpack - unpack tarballs
fetch - grab sources from Internet - turn into tarballs

Are there any other major tasks?

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Electronics
=============================



