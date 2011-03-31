Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>)
	id 1Q5OOO-0002OL-9t; Thu, 31 Mar 2011 22:22:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2VKKq99016223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Mar 2011 13:20:52 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 31 Mar 2011 13:20:51 -0700
Message-ID: <4D94E222.8090708@windriver.com>
Date: Thu, 31 Mar 2011 15:20:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D94C075.3020001@windriver.com>
In-Reply-To: <4D94C075.3020001@windriver.com>
X-Originating-IP: [172.25.36.234]
Cc: tsc@lists.openembedded.org
Subject: Re: Commit and Patch message guidelines - third draft.
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
X-List-Received-Date: Thu, 31 Mar 2011 20:22:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

BTW a brief comment from the TSC after they briefly reviewed this draft at the
meeting today.

Between draft 2 and draft 3, the concept of an "Integrated-by" tag line was
added for unmodified patches and commits.  It's been decided that this isn't a
good idea, and we'll use Signed-off-by for all instances.

It's also suggested to reference something similar to:

http://www.pokylinux.org/doc/poky-handbook.html

(Scroll to the bottom, Chapter 6)

the "Developer's Certificate of Origin" which is given by using the
"Signed-off-by" line.

Again, the whole point of the Signed-off-by: line and external references is to
document the provenance of the changes, be it an individual recipe's patch set
or the overall OpenEmbedded repository commits.

--Mark

On 3/31/11 12:57 PM, Mark Hatle wrote:
> This is the third draft of the guidelines... All previous feedback has been
> incorporated...
> 
> It is the first of the drafts being sent to the OpenEmbedded-devel mailing list
> for comments.  The intention of the TSC is to use the following guidelines to
> help increase the quality of the commit and patches within Open Embedded.
> Please review the following guidelines and let me know if you have any
> questions, comments or concerns with them.
> 
> ----
> 
> This set of guidelines is intended to help both the developer and reviewers of
> changes determine reasonable patch and change commit messages. Often when
> working with the code, you forget that not everyone is as familiar with the
> problem and/or fix as you are. Often the next person in the code doesn't
> understand what or why something is done so they quickly look at patch and
> commit messages. Unless these messages are clear it will be difficult to
> understand the relevance of a given change and how future changes may impact
> previous decisions.
> 
> Both patches and commit messages require the same attention and basic details,
> however the purposes of the messages are slightly different. A patch needs to
> describe a specific change that fixes an individual problem in a component,
> while a commit message describes one or more changes to the overall project or
> system.
> 
> By following these guidelines we will have a better record of the problems and
> solutions made over the course of development. It will also help establish a
> clear provenance of all of the code and changes within the development.
> 
> General Information
> -------------------
> 
> While specific to the Linux kernel development, the following could also be
> considered a general guide for any Open Source development:
> 
> http://ldn.linuxfoundation.org/book/how-participate-linux-community
> 
> Many of the guidelines in this document are related to the items in that
> information.
> 
> Pay particular attention to section 5.3 that talks about patch preparation.
> They key thing to remember is to break up your changes into logical sections.
> Otherwise you run the risk of not being able to even explain the purpose of a
> change in the patch headers!
> 
> Patch and Commit Headers
> ------------------------
> There seems to always be a question or two surrounding what a person
> should put in a patch header, or commit message.
> 
> The general rules always apply, those being that there is a single line
> short log or summary of the change (think of this as the subject when the patch
> is e-mailed), and then the more detailed long log, and closure with tag lines
> like the "Signed-off-by:" or "Integrated-by:"
> 
> See the examples below for examples and details.
> 
> New development
> ---------------
> 
> A minimal patch or commit message would be of the format:
> 
>    Short log / Statement of what needed to be changed.
> 
>    (Optional pointers to external resources, such as defect tracking)
> 
>    The intent of your change.
> 
>    (Optional, if it's not clear from above) how your change resolves the
>    issues in the first part.
> 
>    Tag line(s) at the end.
> 
> For example:
> 
>    foobar: Adjusted the foo setting in bar
> 
>    When using foobar on systems with less than a gigabyte of RAM common
>    usage patterns often result in an Out-of-memory condition causing
>    slowdowns and unexpected application termination.
> 
>    Low-memory systems should continue to function without running into
>    memory-starvation conditions with minimal cost to systems with more
>    available memory.  High-memory systems will be less able to use the
>    full extent of the system, a dynamically tunable option may be best,
>    long-term.
> 
>    The foo setting in bar was decreased from X to X-50% in order to
>    ensure we don't exhaust all system memory with foobar threads.
> 
>    Signed-off-by: Joe Developer <joe.developer@example.com>
> 
> The minimal commit is good for new code development and simple changes.
> 
> The single short log message indicates what needed to be changed. It should
> begin with an indicator as to the primary item changed by this patch,
> followed by a short summary of the change. In the above case we're indicating
> that we've changed the "foobar" item, by "adjusting the foo setting in bar".
> 
> Optionally, you may include pointers to defects this change corrects. Unless
> the defect format is specified by the component you are modifying, it is
> suggested that you use a full URL to specify the reference to the defect
> information.
> 
> You must then have a full description of the change. Specifying the intent of
> your change and if necessary how the change resolves the issue.
> 
> As mentioned above this is intended to answer the "what were you thinking"
> questions down the road and to know what other impacts are likely to
> result of the change needs to be reverted. It also allows for better
> solutions if someone comes along later and agrees with paragraph 1
> (the problem statement) and either disagrees with paragraph 2
> (the design) or paragraph 3 (the implementation).
> 
> Finally one or more tag lines should exist. Each developer responsible
> for working on the patch is responsible for adding a Signed-off-by: tag line.
> 
> It is not acceptable to have an empty or non-existent header, or just a single
> line message. The summary and description is required for all changes.
> 
> Importing from elsewhere
> -----------------------------
> If you are importing work from somewhere else, the minimum commit message is not
> enough. It does not clearly establish the provenance of the code. The following
> specified the guidelines required for importing code from elsewhere.
> 
> By default you should keep the original authors summary and commit message,
> along with any Signed-off-by: information. If the original change that was
> imported does not have a summary and/or commit message from the original author,
> it is still your responsibility to add them to the patch. Just as if you wrote
> the code, you should be able to clearly explain what the change does. It is also
> necessary to document the original author of the change. You should indicate the
> original author by simply stating "written by" or "posted to the ... mailing
> list by". Only the original author can commit using a Signed-off-by: tag line.
> 
> It is also required that the origin of the work be fully documented. The origin
> should be specified as part of the commit message in a way that an average
> developer would be able to track down the original code. URLs should reference
> original authoritative sources and not mirrors.
> 
> If changes were required to the patch, they should be documented as well.
> 
> Finally a tag line should be added to indicate that you worked with the patch.
> The "Integrated-by:" tag line should be used to indicate that you did not need
> to modify the patch, it was integrated unchanged. The "Signed-off-by:" tag line
> should only be used when changes to the original patch were necessary.
> 
> For example, if you were to pull in the patch from the above example unmodified:
> 
>    foobar: Adjusted the foo setting in bar
> 
>    When using foobar on systems with less than a gigabyte of RAM common
>    usage patterns often result in an Out-of-memory condition causing
>    slowdowns and unexpected application termination.
> 
>    Low-memory systems should continue to function without running into
>    memory-starvation conditions with minimal cost to systems with more
>    available memory.  High-memory systems will be less able to use the
>    full extent of the system, a dynamically tunable option may be best,
>    long-term.
> 
>    The foo setting in bar was decreased from X to X-50% in order to
>    ensure we don't exhaust all system memory with foobar threads.
> 
>    Signed-off-by: Joe Developer <joe.developer@example.com>
> 
>    The foobar recipe was imported from the OpenEmbedded git server
>    (git://git.openembedded.org/openembedded) as of commit id
>    b65a0e0c84cf489bfa00d6aa6c48abc5a237100f.
> 
>    Integrated-by: Your Name <your.name@openembedded.org>
> 
> The above example shows a clear way for a developer to find the original source
> of the change. It indicates that the open embedded developer simply integrated
> the change into the system without making any further modifications.
> 
> However in the same example, if the author did have to make some changes to the
> original patch it would look like this:
> 
>    foobar: Adjusted the foo setting in bar
> 
>    When using foobar on systems with less than a gigabyte of RAM common
>    usage patterns often result in an Out-of-memory condition causing
>    slowdowns and unexpected application termination.
> 
>    Low-memory systems should continue to function without running into
>    memory-starvation conditions with minimal cost to systems with more
>    available memory.  High-memory systems will be less able to use the
>    full extent of the system, a dynamically tunable option may be best,
>    long-term.
> 
>    The foo setting in bar was decreased from X to X-50% in order to
>    ensure we don't exhaust all system memory with foobar threads.
> 
>    Signed-off-by: Joe Developer <joe.developer@example.com>
> 
>    The foobar recipe was imported from the OpenEmbedded git server
>    (git://git.openembedded.org/openembedded) as of commit id
>    b65a0e0c84cf489bfa00d6aa6c48abc5a237100f.
> 
>    It was necessary to change the memory threshold from 50% to 42%
>    due to the constraints of the implementation of bar in OpenEmbedded.
> 
>    Signed-off-by: Your Name <your.name@openembedded.org>
> 
> 
> Common Errors in Patch and Commit messages
> ------------------------------------------
> 
> - Don't have one huge patch, split your change into logical subparts. It's
> easier to track down problems afterwards with a binary search and also people
> can then cherrypick changes into things like stable branches.
> 
> - Don't simply translate your change into English for a commit log. The log
> "Change compare from zero to one" is bad because it describes only the code
> change in the patch; we can see that from reading the patch itself. Let the code
> tell the story of the mechanics of the change (as much as possible), and let
> your comment tell the other details -- i.e. what the problem was, how it
> manifested itself (symptoms), and if necessary, the justification for why the
> fix was done in manner that it was.
> 
> - Don't start your commit log with "This patch..." -- we already know it is a patch.
> 
> - Don't repeat your short log in the long log. If you really really don't have
> anything new and informational to add in as a long log, then don't put a long
> log at all. This should be uncommon -- i.e. the only acceptable cases for no
> long log would be something like "Fix spelling mistakes in Documentation/README"
> or similar.
> 
> - Don't put absolute paths to source files that are specific to your site, i.e.
> if you get a compile error on "fs/exec.c" then tidy up the parts of the compile
> output to just show that portion. We don't need to see that it was
> /home/wally/src/git/oe-core/meta/classes/insane.bbclass or similar - that full
> path has no value to others.
> 
> - Always use the most significant ramification of the change in the words of
> your subject/shortlog. For example, don't say "fix compile warning in foo" when
> the compiler warning was really telling us that we were dereferencing complete
> garbage off in the weeds that could in theory cause an OOPS under some
> circumstances. When people are choosing commits for backports to stable or
> distro kernels, the shortlog will be what they use for an initial sorting
> selection. If they see "Fix possible OOPS in...." then these people will look
> closer, whereas they most likely will skip over simple warning fixes.
> 
> - Don't put in the full 20 or more lines of a backtrace when really it is just
> the last 5 or so function calls that are relevant to the crash/fix. If the entry
> point, or start of the trace is relevant (i.e. a syscall or similar), you can
> leave that, and then replace a chunk of the intermediate calls in the middle
> with a single [...]
> 
> - Don't include timestamps or other unnecessary information, unless they are
> relevant to the situation (i.e. indicating an unacceptable delay in a driver
> initialization etc.)
> 
> - Don't use links to temporary resources like pastebin and friends. The commit
> message may be read long after this resource timed out.
> 
> - Don't reference mirrors, but instead always reference original authoritative
> sources.
> 
> - Avoid punctuation in the short log.
> 
> _______________________________________________
> tsc mailing list
> tsc@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/tsc



