Received: from [62.65.142.223] (helo=mail.smartpal.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <ccsmart@smartpal.de>) id 1Hne8d-0008PK-GO
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2007 19:15:12 +0200
Received: from [172.16.11.81] (unknown [172.16.11.81])
	by mail.smartpal.de (Postfix) with ESMTP id B1B7BF45
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2007 19:15:04 +0200 (CEST)
From: "[cc]smart" <ccsmart@smartpal.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2007 19:15:16 +0200
Message-Id: <1179162916.23344.6.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.3 
Subject: Re: Making /var/lib persistent
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
X-List-Received-Date: Mon, 14 May 2007 17:15:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi list.

i must admit i am a bit late on the discussion but nonetheless... i
noticed the change on the tree and i would like to comment volatiles use
and the patch:

http://www.openembedded.org/viewmtn/revision.psp?id=d8f8ffd537ebb6baa3cabe50d3f8267cdd28f3b7

The discussion on the list was accompanied by:

>        The only concern is all this override files patchery. I wish 
>we had for fstab the same machinery as for autoconf site files - 
>ability to merge standard template with per-machine overrides. But 
>well, lack of such shouldn't be cause of delay with this patch, hope 
>to see it soon in mainline! 
> 
>Best regards, 
> Paul                            mailto:pmiscml at gmail.com


I would like to take you back a few years into history of volatiles,
because originally, it was invented primarily to assist in modular
configuration.

I'd like to start with the explanation given in the main volatiles
config file:


# This configuration file lists filesystem objects that should get
verified 
# during startup and be created if missing. 
# 
# Every line must either be a comment starting with # 
# or a definition of format: 
# <type> <owner> <group> <mode> <path> <linksource> 
# where the items are separated by whitespace ! 
# 
# <type> : d|f|l : (d)irectory|(f)ile|(l)ink 
# 
# A linking example: 
# l root root 0777 /var/test /tmp/testfile 
# f root root 0644 /var/test none 
# 
# Understanding links: 
# When populate-volatile is to verify/create a directory or file, it
will first 
# check it's existence. If a link is found to exist in the place of the
target, 
# the path of the target is replaced with the target the link points
to. 
# Thus, if a link is in the place to be verified, the object will be
created 
# in the place the link points to instead. 
# This explains the order of "link before object" as in the example
above, where 
# a link will be created at /var/test pointing to /tmp/testfile and due
to this 
# link the file defined as /var/test will actually be created
as /tmp/testfile.


FWIW, i think it has never been observed to create links before the
actual object. Why was it done like that despite it seems
counterintuitive.

Because it is part of the modulartity.

This main file should contain only basic, and only "real object"
descriptions. That is what it was at the beginning. All the redirection
into tmpfs space is NOT meant to be done in this file.

Basically it should roughly be kept like this (mind you, specifying
"none" in the end was not needed originally):

d root root 0755 /var/cache none 
d root root 1777 /var/lock none 
d root root 0755 /var/log none 
d root root 0755 /var/run none 
d root root 1777 /var/tmp none 
d root root 0755 /var/lock/subsys none 
f root root 0664 /var/log/wtmp none 
f root root 0664 /var/run/utmp none

In fstab, there should neither be tmpf on /var nor on /var/volatile but
for example under /media/ram only.

Now let your mind go back to the rule "link before object".

The default is a physical world. Volatiles would set up your directories
as described in it's configuration "ohysically".

If you create a distro for a device on flash, you would deliver your
image with links in var pointing to /media/ram. For example there would
be a link "/var/run" pointing to "/media/ram/run".

Automagically, volatiles would use the line

d root root 0755 /var/run none

to create a directory in "/media/ram". No need for changing the
volatiles base configuration (i hope that no change in volatiles as
broken this, otherwise IMHO it should be fixed to behave like that
again).

Subsequently turnup would only have to remove links in "/var" to get
that distro going on HD.

The second idea in the original design of volatiles is to have a tool
that allows adding and removing directory requirements per package. So a
package can drop in a specification in volatiles config directory. these
are numbered like runlevels.

This allows to have separate specification files. One defines the real
objects, like the base files does, and it's seq. number should be n+1 .

Additionally you may have a redirection config (possibly per distro)
with seq. number n which may redirect to volatile space, like
"/media/ram" .

Basically in thinking you always start physical and then deviate to
volatile.

All in all i would recommend to:

- revert volatiles main config to physical objects only 
- remove all /var based tmpfs's from /etc/fstab and make it more or less
a static thing. 
- get distros pre provide main redirection links in "/var" where needed.

Greetings, 
[cc]smart




