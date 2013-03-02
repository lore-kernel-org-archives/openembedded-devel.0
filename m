Received: from mail.fh-wedel.de ([213.39.232.198])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <di@fh-wedel.de>) id 1UBqrK-0003XI-MY
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 19:08:43 +0100
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 341A45412E; Sat,  2 Mar 2013 18:46:24 +0100 (CET)
Date: Sat, 2 Mar 2013 18:46:24 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130302174624.GH21221@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Nylon liveth (but on in OE?)
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
X-List-Received-Date: Sat, 02 Mar 2013 18:08:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Nylon is the distribution with which the 4G Meshcube/AccessCube
was shipped. As a former 4G employee I took over maintainership
and started re-integrating Nylon into org.openembedded.dev in
2009. However Nylon was and still is based on an old toolchain
and a 2.4 kernel. This lead to increasing problems keeping the
code buildable, as more and more code would no longer work on
a basis that old. Thus Nylon is now obsoleted in OE (and I'd 
say rightly so).

Not having had the time to work on this in the last years I've
now decided to go the easy way and simply fork at some time in
2009 when the code was still more or less working and continue
from there. The main benefit from using my work rather than the
original 4G toolchain (which was itself a fork from a much older
OE snapshot) I see in having a larger set of recipes to add
components from if needed and also some updated components in
the base system

This work has now been done, and I wonder where the code should
live from now on. I would thus like to ask if keeping my branch
in the OE repo would be an acceptable option to the project
maintainers. Doing this we could probably just remove all the
remaining mtx-[12] artifacts from the .dev branch (I am not sure
if mtx-3 is maintained by anyone any longer, at least it is not
by me).

I know that there's possibly only very few people interested in
this, but I'd really like to avoid forking completely, also 
the idea of still being able to grab some recipes from the .dev
branch if needed would be nice, and it would simplify contributing
for others. If this idea is not an acceptable option for you, of
course, I can still push my fork to github.

What do you think about it?

M'bert

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Wie verhindert man, dass einem die Geige gestohlen wird?
Man legt sie in einen Bratschenkasten...


