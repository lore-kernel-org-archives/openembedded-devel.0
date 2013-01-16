Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1TvYg5-0003VS-BZ; Wed, 16 Jan 2013 20:29:38 +0100
Received: by mail-la0-f46.google.com with SMTP id fq13so1815453lab.33
	for <multiple recipients>; Wed, 16 Jan 2013 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=+aw3FN+C4CK+gx3usUBlcuA9qWTM7mUkKV1pwgjXbMk=;
	b=DQgjP97aavUFAmHtHct+u1HEMmLiD7p91k6B7MUmr2A8WEqPT04LmsmoRCO66dMhFP
	uqsKvU5m2JX8OJCkejXbMulw15cKEHpMO9Own0cx5leMiT+bORJGLDdZyn+32Vcu7wwA
	rSc/fokCFvMcQvQ6PGOlgGhnODEMfVwEEml2TozhPDXzo7Hy2Ym/c70W1Jjyvm6NWfIM
	NAZ/nYkwAD89Ntj6u/7/tV7m6TiEDO05TGsKDwTCDp1h76xUQcHCSYJXhKc1B1aCxW8Q
	98avQChexlM5gsVdxtqq+uHLZCB2U/z2uPObltX+sGuHv4/lmq/Pfo0xtGvHI27VqfRO
	wndQ==
MIME-Version: 1.0
X-Received: by 10.152.114.66 with SMTP id je2mr2180657lab.40.1358363654278;
	Wed, 16 Jan 2013 11:14:14 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.112.79.13 with HTTP; Wed, 16 Jan 2013 11:14:14 -0800 (PST)
Date: Wed, 16 Jan 2013 11:14:14 -0800
X-Google-Sender-Auth: uQOh9zaxJkOtliKtN-0IFaNQ-ts
Message-ID: <CA+YB3raM_MHQ1xc-snZ5vxatgPt0da=NteA+mYjSFkHm+kLazg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES: OE TSC 20 November 2012
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
X-List-Received-Date: Wed, 16 Jan 2013 19:29:40 -0000
X-List-Received-Date: Wed, 16 Jan 2013 19:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
20 November 2012

Attendees: Mark, Paul, Richard
Apologies: Khem, Koen
Notes: Jefro
________________________________________________________________
Agenda & Results

1. pick a chair

___________________________________
2. new issues

 a. RFC for the secondary toolchain (fray)
    how to document as best practice?
        possibly sample secondary toolchain layer as template
        no changes to oe-core, possibly add an include file
-> in progress

 b. RPM and package feeds
        packages_rpm, rootfs_rpm doesn't use Zypper
        fray proposes replacing with SMART after 1.3 release
        smaller footprint, python based
        -> fray will write proposal after 1.3
-> in progress

 c. patchwork queue
    bluelightning did a massive clearout of patchwork, got rid of 3 pages
    a number of oe-classic patches left
    koen notes that git hooks catch only 80% of patches, and then only
for master
    known to fail with accented names
=> koen to go through what is left in patchwork for meta-oe
=> bluelightning to send note to ml re oe-classic patches
-> not discussed

 d. raise ntp with the Yocto Project [RP]
-> not discussed

 e. secondary toolchain document
http://www.openembedded.org/wiki/Adding_a_secondary_toolchain
-> not discussed

 f. wiki
-> bluelightning did much work based on meetings in Barcelona
RP helped by deleting some old information

 g. oe-classic recipe migration status
-> not discussed

 h. FILESDIR & FILESPATH
-> FILESDIR deprecated, time to remove
and prune out the remaining FILESDIR references
 i. SMART replacing zypper
-> in progress
___________________________________
3. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. pre/post install scripting (fray)
     holding for 1.4

 c. document whitespace changes to the shell
    RP edited OE style guide with new info, linked to YP
        => fray to update patch guidelines

 d. documentation
    need someone to work on OE wiki pages
        RP, bluelightning, fray to hopefully work on it together @ELCE

___________________________________
4. status

 a. oe-core release
good to go with the branch as it stands now
1.4 is open for development now

 b. infrastructure
    Tom & Martin working on setting up jenkins

 c. 1.4 planning
   PR issues
   pre/post install scripting
   SMART
   systemd into master


________________________________________________________________
Raw Transcript

(9:00:26 AM) fray: I just want to mentioned the 'secondary toolchain'
document
(9:00:33 AM) fray: but I don't think there is anything to discuss there
(9:00:49 AM) fray:
http://www.openembedded.org/wiki/Adding_a_secondary_toolchain
(9:00:52 AM) bluelightning: I wanted to mention the wiki, and
OE-Classic recipe migration status
(9:01:59 AM) ***bluelightning has pinged koen
(9:02:03 AM) fray: It's been added to the wiki -- with a link to an
example layer.  I've not received any comments from the mailing list
on this.. (I don't expect it to be a big topic, unless someone is
really trying to implement a secondary/alternative toolchain..)  note,
this secondary toolchain is not to 'replace' the default toolchain
(the one used to build most of the system) but to provide an
alternative toolchain to perform some special function (such as a
highly op
(9:04:20 AM) RP__: I'd very briefly like to touch on FILESDIR and FILESPATH
(9:06:17 AM) RP__: is khem around?
(9:06:24 AM) ***Jefro was just about to ask that
(9:06:47 AM) bluelightning: he's not said anything here yet
(9:07:00 AM) Jefro: Agenda is now at http://pastebin.com/Cz0faSCS
(9:07:26 AM) Jefro: I left in lingering things from previous meetings
& added those mentioned here plus one from the meeting in Barcelona
(9:07:42 AM) RP__: ok, I'm going to be pushed for time here. Let me
mention the FILES stuff while I have a chance...
(9:07:43 AM) bluelightning: I would move FILESDIR/FILESPATH up the
list since Richard has to leave early
(9:08:02 AM) Jefro: can discuss in any order
(9:08:11 AM) RP__: Basically, FILESDIR is deprecated API and was
replaced with FILESPATH years ago. There is nothing FILESDIR can do
which FILESPATH cannot.
(9:08:32 AM) RP__: I therefore want to prune out the remaining
FILESDIR references. We can leave the support in bitbake for now
(9:08:48 AM) RP__: We only have about 5 references in the core for
FILESDIR. I think this part is an easy decision
(9:09:09 AM) RP__: FILESPATH is tricker. Its a *huge* variable
searching many different locations.
(9:09:24 AM) RP__: Most of them are pointless. I've therefore posted
patches on the list to cut down the list a lot
(9:09:47 AM) RP__: I have one remaining patch which is to remove
several OVERRIDES from the list it searches to, basically leave
MACHINE and DISTRO
(9:10:13 AM) bluelightning: FWIW, some greps of mine over most of the
public layers introducing new recipes reports only a few references to
FILESDIR
(9:10:20 AM) RP__: Nobody puts files in BUILD_ARCH, forcevariable,
libc-xxx or other locations as far as I know
(9:10:47 AM) RP__: The bigger problem will be the FILESPATH change
since I drop PN from it, preferring BPN
(9:10:55 AM) RP__: This did break some -native recipes
(9:11:08 AM) RP__: I suspect we have the bulk of those in the core though
(9:11:46 AM) RP__: Basically, I was looking to the TSC to decide if
this was a good direction to proceed, on grounds of improving
usability and simplifying things
(9:12:08 AM) RP__: You can get the existing behaviour back if you
wanted it though configuration, it just wouldn't be the default any
more
(9:12:14 AM) bluelightning: seems reasonable to me, FWIW
(9:13:14 AM) RP__: fray: the secondary toolchain sounds reasonable
from what we discussed. I need to read it sometime but I doubt I'll
get around to it soon :(
(9:13:37 AM) bluelightning: adding/overriding files is something that
users struggle with; the trouble though is that it's hard to tell
immediately if a file has been picked up or not
(9:14:12 AM) RP__: I have to say bluelightning has done great work on
the OE wiki and it looks much improved. In Barcelona, I tried to help
improve some sections, mostly by deleting seriously dated information
(9:14:43 AM) RP__: bluelightning: there are ways we can improve that
including printing search paths but when the list is two pages long,
its not useful
(9:14:53 AM) bluelightning: right
(9:14:55 AM) fray: Ya, the change seems reasonable to me
(9:15:13 AM) fray: RP__ re secondary toolchain.. I figure when people
need it they'll read it and comment.. otherwise it's just an FYI.. :)
(9:15:27 AM) RP__: On the plus side, with the file checksumming we
know about missing files at parse time which is nice
(9:15:44 AM) RP__: This is the reason we never touched FILESDIR/FILESPATH
before
(9:15:53 AM) RP__: since validation was runtime, now its parse time
(9:16:27 AM) fray: parse time is much better
(9:16:53 AM) RP__: we should probably make it an error now, not a warning
(9:16:58 AM) RP__: maybe an AR for bluelightning? :)
(9:17:13 AM) RP__: In fact I need to head AFK now, sorry about this.
If koen/khem do show up, please let them see my comments above
(9:17:17 AM) fray: my only concern is that I've seen cases where
layers come in and you get those messages -- but it's all items not
being used..
(9:17:28 AM) bluelightning: indeed, I'm not sure we can make it an error
(9:17:30 AM) fray: BTW not against making it an error.. just stating
the one place I've seen it
(9:17:44 AM) RP__: bluelightning: when is it valid to have just a warning?
(9:18:14 AM) RP__: bluelightning: I can't think of any case I've see
where it shouldn't have been an error but perhaps I don't use the
layers you do...
(9:18:22 AM) fray: when the recipe isn't used and the layer creator
was 'lazy'.. AFAIK
(9:18:34 AM) bluelightning: RP__: it's not really valid but it will
create pain where files exist for some configurations (machines,
archs, etc) and not others
(9:18:42 AM) fray: (which is why I'm not against making it an error..)
(9:18:52 AM) RP__: COMPATIBLE_MACHINE/HOST
(9:18:58 AM) fray: ahh, forgot about that case...
(9:19:11 AM) RP__: sorry I do need to go :(
(9:19:14 AM) bluelightning: RP__: yes, just forces people to do that
(9:19:16 AM) bluelightning: cya
(9:19:20 AM) RP__ left the room (quit: Quit: Leaving.).
(9:19:22 AM) fray: later!
(9:19:24 AM) bluelightning: hmm
(9:19:50 AM) bluelightning: well we have two people here (plus Jefro),
this is not really a meeting...
(9:19:52 AM) fray: do we still have a quorum?
(9:20:05 AM) fray: yup.. we'll need to adjourn.. is there naything
informal that we should mention?
(9:20:18 AM) fray: we could do SMART status for the meeting minutes..
(9:20:28 AM) bluelightning: yeah we should do that
(9:20:30 AM) Jefro: technically, no quorum
(9:20:47 AM) fray: yup.. so officially meeting over.. unofficially
we'll do smart status and call it
(9:20:50 AM) Jefro: (what's SMART status? I thought SMART was a hard
drive monitoring tool)
(9:20:59 AM) fray: smartass..
(9:21:00 AM) bluelightning: Jefro: please make a note that people need
to turn up or tell people they're not turning up in advance :/
(9:21:07 AM) fray: SMART is replacing Zypper..
(9:21:13 AM) Jefro: bluelightning will do
(9:21:18 AM) Jefro: fray ah yes, I remember now
(9:21:20 AM) bluelightning: it's Smart not SMART ;)
(9:21:29 AM) bluelightning: (according to their website)
(9:21:36 AM) fray: We have the first version of rpm support for python
working (and in), and smart itself is in, and at least passing basic
unit tests..
(9:21:51 AM) fray: work in progress -- recommends support.. and
replacing the rootfs install items
(9:21:58 AM) fray: bluelightning did I miss anything?
(9:22:29 AM) bluelightning: it can be built for native and tested in a
devshell - instructions for the interested:
https://wiki.yoctoproject.org/wiki/Smart
(9:22:45 AM) bluelightning: other than that I think that covers it
(9:22:45 AM) fray: yup


--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

