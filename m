Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NdT0a-0004hK-3e
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 19:34:27 +0100
Received: by pxi9 with SMTP id 9so4264141pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2010 10:31:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.59.19 with SMTP id h19mr1951643wfa.243.1265394713537; Fri, 
	05 Feb 2010 10:31:53 -0800 (PST)
In-Reply-To: <18e217241002031259o46bb47f1md0f00da47d055b62@mail.gmail.com>
References: <18e217241002031259o46bb47f1md0f00da47d055b62@mail.gmail.com>
Date: Fri, 5 Feb 2010 10:31:53 -0800
Message-ID: <18e217241002051031l4aac7560vb78618cf63d027be@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] BB_STAMP_BLACKLIST
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
X-List-Received-Date: Fri, 05 Feb 2010 18:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

I sent this to the bitbake-dev list but thought that the discussion would be
useful to others in the wider OE world...

Also I'm realizing that maybe I should have called it a Request For Comment
:]

all comments are appreciated.

Mike

On Wed, Feb 3, 2010 at 12:59 PM, C Michael Sundius <msundius@sundius.com>wrote:

> A while ago I was asking about a way to make sure dependent packages were
> rebuilt if their dependencies were rebuilt.
>
> Because we're doing lots of development of proprietary software built
> around APIs of all sorts we're finding that dependent packages need to be
> rebuilt after its dependencies are rebuilt (and re-staged). based on some of
> your comments about how it could cause a giant cascade of rebuilding if
> such  an option was turned on universally, I came up w/ the following patch
> to allow a list of recipes identified to cause their dependents to be
> rebuilt if their time stamps were out of date.
>
> To my understanding currently such a check is not ever doen unless the
> BB_STAMP_POLICY is set to full or whitelist. For the whitelist case,
> BB_STAMP_WHITELIST contains a list of recipes that should not be checked
> (i.e. they are always considered up to date). My patch does the opposite by
> setting BB_STAMP_BLACKLIST a list of recipes are considered suspect and
> should be checked (in check_stamp_task()) and flagged to be run if they are
> out of date with respect to their dependencies.
>
> The usecase for this is when you are working on an api for a partiular
> module and want to make sure other modules that use that api are recompiled
> each time you change it.
>
> Well maybe this is a long winded description/justification, but here's the
> patch. Could you all take a look and tell me what you think?
>
> Mike
>
> diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
> index 3a43889..4f1f40f 100644
> --- a/lib/bb/runqueue.py
> +++ b/lib/bb/runqueue.py
> @@ -169,6 +169,7 @@ class RunQueue:
>          self.scheduler = bb.data.getVar("BB_SCHEDULER", cfgData, 1) or
> "speed"
>          self.stamppolicy = bb.data.getVar("BB_STAMP_POLICY", cfgData, 1)
> or "perfile"
>          self.stampwhitelist = bb.data.getVar("BB_STAMP_WHITELIST",
> cfgData, 1) or ""
> +        self.stampblacklist = bb.data.getVar("BB_STAMP_BLACKLIST",
> cfgData, 1) or ""
>
>      def reset_runqueue(self):
>          self.runq_fnid = []
> @@ -671,6 +672,17 @@ class RunQueue:
>              stampfnwhitelist.append(fn)
>          self.stampfnwhitelist = stampfnwhitelist
>
> +        # Create a blacklist usable by the stamp checks
> +        stampfnblacklist = []
> +        for entry in self.stampblacklist.split():
> +            entryid = self.taskData.getbuild_id(entry)
> +            if entryid not in self.taskData.build_targets:
> +                continue
> +            fnid = self.taskData.build_targets[entryid][0]
> +            fn = self.taskData.fn_index[fnid]
> +            stampfnblacklist.append(fn)
> +        self.stampfnblacklist = stampfnblacklist
> +
>          #self.dump_data(taskData)
>
>          self.state = runQueueRunInit
> @@ -779,6 +791,9 @@ class RunQueue:
>              if self.stamppolicy == "whitelist":
>                  stampwhitelist = self.stampfnwhitelist
>
> +        stampblacklist = []
> +        stampblacklist = self.stampfnblacklist
> +
>          fn = self.taskData.fn_index[self.runq_fnid[task]]
>          taskname = self.runq_task[task]
>          stampfile = "%s.%s" % (self.dataCache.stamp[fn], taskname)
> @@ -799,7 +814,7 @@ class RunQueue:
>                  fn2 = self.taskData.fn_index[self.runq_fnid[dep]]
>                  taskname2 = self.runq_task[dep]
>                  stampfile2 = "%s.%s" % (self.dataCache.stamp[fn2],
> taskname2)
> -                if fn == fn2 or (fulldeptree and fn2 not in
> stampwhitelist):
> +                if fn == fn2 or (fulldeptree and fn2 not in
> stampwhitelist) or fn2 in stampblacklist:
>                      try:
>                          t2 = os.stat(stampfile2)[stat.ST_MTIME]
>                          if t1 < t2:
>
>

