Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MCKk1-0005t5-ID
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 23:44:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MCKbD-0004kK-Fc
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 21:35:47 +0000
Received: from cuo02-acns-ce1.cisco.com ([64.101.22.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 21:35:47 +0000
Received: from msundius by cuo02-acns-ce1.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 21:35:47 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Sundius <msundius@sundius.com>
Date: Thu, 4 Jun 2009 21:35:36 +0000 (UTC)
Message-ID: <loom.20090604T211010-224@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 64.101.22.72 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.15) Gecko/20080702 Fedora/2.0.0.15-1.fc8 Firefox/2.0.0.15)
Sender: news <news@ger.gmane.org>
Subject: development process
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
X-List-Received-Date: Thu, 04 Jun 2009 21:44:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I have two issues with open embedded that I'm wondering if there is already a
solution for, or rather, am I totally missing the boat on how things work:

1) regarding toolchains:
my understanding is that if you don't want to go through the exercise of
building gcc and glibc everytime you create a distribution, then you should use
the meta-toolchain.bb recipe to create a installable (tools) distribution and
then others can install the resultant on their own machine and use the
external-toolchain.bb recipe to integrate it w/ OE, populating the staging area
and creating the appropriate packages and what not. (part a: is this correct?)

what if the boss says you gotta use the xyz toolchain from blowco inc (that
while complete, was not built w/ OE in mind and does not work w/ the
external-toolchain.bb recipe). I'm sure someone asked this question before, but
is the only recourse to package up the libraries (ala write a recipe) yourself
and put them in to oe? is there an example recipe in the openembedded tree that
does this already? does someone have an example that they could share?, is there
a doc explaining what needs to go where? (or of course am I just off base on my
question). could someone please educate me on best way to proceed (ie. the path
or least resistance).

2) in a more general sense. 
as with most embedded systems, a developer working on a single component rarely
cares (or knows) about how to build/configure the rest of the systems. it should
just work. further when I have a task to fix a bug in said version of my small
little corner of the world I don't want to wait hours for the rest of the
software to be built before I can test my fix. is there a way to indicate my
PREFERRED_PROVIDER for a package/recipe (or even better all by default) is a
package feed? again maybe this is done on a regular basis or maybe its a special
thing, but I really didn't see any documentation/examples for it. It seems the
only reference to a package feed is to allow for easy installation of a system
that is already up and running... 

Thanks for reading my rambling questions and for your help all... 
Mike



