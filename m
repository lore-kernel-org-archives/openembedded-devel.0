Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nmsez-0006gh-7N
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:47:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23HiAeh020736
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 17:44:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20394-08 for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 17:43:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23HhpIk020730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 17:43:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
References: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
Date: Wed, 03 Mar 2010 17:43:49 +0000
Message-ID: <1267638229.2259.147.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Initial Proposal for Packaged Staging Revamp (was [RFC] Make some big changes right after next stable)
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
X-List-Received-Date: Wed, 03 Mar 2010 17:47:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-03 at 10:09 -0700, Chris Larson wrote:
> Proposal for the Revamp of "Packaged Staging"
> 
> Goals:
> - Simple implementation
> - Managed staging area
> - "Build" from cached/prebuilt binaries
> - Reduce behavioral differences between the prebuilt and from scratch cases
> - Intrinsic to the system, no longer opt-in

I had to smile when I read this as you make it sound this isn't the
direction packaged-staging is already moving in :). The things you
describe are all things I've had in mind, just the practicalities of the
real world mean we're not there yet.

Basically when you describe is what I also want to see packaged staging
and OE in general doing. You're right to point out that what we're
trying to achieve is beyond the scope of plain "put staging under the
control of a package manager".

Where we might differ how exactly to do it technically. I really dislike
some of the way packaged-staging works but its all done that way for a
reason. The reasons most likely become apparent when you try and find an
alternative to what it does.

> I would like to propose an alternative to the current implementation, which
> I believe will aleviate some headaches (for example, those caused by the
> stagefile bits, which is more functionality that slips beyond the original
> intent of package managed staging), make it easier to add more traceability
> to the builds, reduce behavioral differences between the use of cached
> binaries and building from scratch, and should help to prepare for some
> possible moves in the future.
> 
> To summarize, I propose the creation of an archive/package which acts as the
> primary artifact to come out of the build of a recipe.

My view on this is a kind of hybrid. Firstly, we need to adopt some kind
checksum system which represent staging packages. If the checksum
doesn't match what we want, the staging package is invalid.

Secondly, I agree we need to capture all output of a task we do that
already, just badly. I like the idea of creating structures under
WORKDIR where these things are put, like the output of do_install, the
output of do_package (split up do_install and some package data) as well
as the output of the package generation step. 

Your usecase is too focused on your specific problems and on do_install
though. Why is do_install special? I'd go one step further and allow the
"staging package" output of a recipe to be multiple packages each one
representing a task.

We could go as far as mandating only output under WORKDIR should be made
(in specified directories per task). bitbake could then have a
postprocessing task defined which looks at an output directory and
generates a corresponding "staging" package and also applies it to a
core sysroot directory / wherever.

So, if you build an rpm based image, it sees all the package_write_rpm
prebuilds and just makes sure they're installed, nothing else. This
approach seems extensible and generic, things which serve us well.

The pitfalls of this are (random brainstorming):

1. Stamp file handling - needs a total rethink really. Not sure how to 
   do it but I have given it thought before.
2. staging package covering tmpdir - we did this to cover pkgdata, 
   cross, stamps, deploy as well as staging.

   I like pb_'s idea of merging cross into the native sysroot and that 
   would remove one reason for using tmpdir, not the sysroot. We'd also 
   need to ensure packages only write to one sysroot. Not possible with 
   the gcc recipe for example.

   Stamp handling may be handled with 1. above. 

   pkgdata/deploy? Above ideas may help...

3. Optional packages staging - should be made mandatory to simplify code
4. Logistics of doing it. We can't even get packaged staging merged 
   into OE :(

So yes, I'd support the idea but the devil is in the details as always.

Cheers,

Richard





