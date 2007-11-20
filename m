Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IuZ9h-0006C0-5r
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 20:53:09 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2772029waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 11:50:57 -0800 (PST)
Received: by 10.114.66.2 with SMTP id o2mr313451waa.1195573022542;
	Tue, 20 Nov 2007 07:37:02 -0800 (PST)
Received: from lenovo ( [68.187.118.242])
	by mx.google.com with ESMTPS id 38sm88304nza.2007.11.20.07.36.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2007 07:36:56 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Tue, 20 Nov 2007 09:36:38 -0600
Date: Tue, 20 Nov 2007 09:36:38 -0600
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071120153638.GA6424@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Defining the user
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
X-List-Received-Date: Tue, 20 Nov 2007 19:53:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

How do we define BitBake and OpenEmbedded user and developers?

When working on the documentation I have been struggling to define
exactly what are: bitbake users, bitbake developers, openembedded
users, and open embedded developers.

The most consistant, and I belive correct, definitions depend on first
defining Distribution, BiteBake and OpenEmbedded.

Distribution - A distribution is a set of programs
which make up a computer operating system, tools, and applications.  These
programs are selected to provide specicic functionality and they are assembled
such that they can run on a target device.

bitbake - (with small letters) is a Domain Specific Language which is
used to describe how to build a Distribution.

BitBake - (Capital letters) is an interpeter for source files written
in bitbake.  The BitBake output is an image and installable package
which are ready to run. 

OpenEmbedded - is a set of source files, written in bitebake, which
describe how to build a generic embedded distribution.

This implies a number of things.  Working backwards.

1.  Openembedded users (consumers) are the developers who design and build
distributions for specific devices.  I am calling this group
'distribution developers.'  Currently, they are openmoko developers,
poky developer....  Distribution developers write source files in the
bitbake language which extend the generic functionality of
openembedded to meet their specic needs.  Distribution developers build from
their local trees.  They are responsible for the quality of their
distribution.

2.  OpenEmbedded developers are the developers who work on the set of files
stored at org.openembedded.dev.  These files are the bitbake and class
files which describe how to make a generic distribution.  OpenEmbedded
developers build from the o.e.d tree.  The open Embedded tree is
upstream from specific distribution trees.  Distribution developers
push the patches which they feel are generally useful upstream to
Openembedded developers.  Open Embedded developers act as gate keepers
for accepting patches which are of a high quality and generally
useful to the o.e.d tree.

3.  BitBake users are OpenEmbedded developers and distribution
developers.

4.  BitBake developers work on defining the bitbake language and
implementing the BitBake interpeter.

Thanks
David Farning



