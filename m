Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IqxV7-0003c1-JE
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Nov 2007 22:04:21 +0100
Received: by py-out-1112.google.com with SMTP id a25so424838pyi
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Nov 2007 13:03:09 -0800 (PST)
Received: by 10.65.203.3 with SMTP id f3mr10133056qbq.1194722387250;
	Sat, 10 Nov 2007 11:19:47 -0800 (PST)
Received: from lenovo ( [75.121.153.51])
	by mx.google.com with ESMTPS id v76sm1271390nzh.2007.11.10.11.19.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Nov 2007 11:19:45 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Sat, 10 Nov 2007 13:19:42 -0600
Date: Sat, 10 Nov 2007 13:19:42 -0600
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071110191942.GA6734@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Using widgets to add structure to OpenEmbedded
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
X-List-Received-Date: Sat, 10 Nov 2007 21:04:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Using Widgets to add structure to BitBake/OpenEmbedded.

The purpose of BitBake and OpenEmbedded is to create an image of a
distribution which will run on a target machine.

One of the most challenging aspects of describing OpenEmbedded is
defining where a specific type of information is
defined.  By not clearly specifying where information is defined, the
SPOT (single point of truth) principle is violated.

There is always a trade-off between flexibility and introducing
structure into a system.  In the case of BiteBake and
OpenEmbedded, which solve a very specific problem, more is gained than
lost by introducing structure.  

Graphical toolkits do a very good job of exchanging flexibility for
structure by using widgets.  Everything is gtk+ is
a widget.  Widgets have generic properties and methods which can
easily be overridden.  Widgets can contain other widgets.

Similarly, BitBake and OpenEmbedded can be broken down into a number
of widgets.  Each widget type represents a layer which
define domain specific parameters and methods. Below is a possible
widget hierarchy     

1. Host Machine.
  a. Set up build structure.
  b. Native compiler.

2. Target Machine.
  a. Target architecture.
  b. Cross compiler.
  c. Target specific device drivers.

3. Image
  a. Target file system type.
  b. Target root file system.

4. Distro
  a. Features to include in distribution.

5. Tasks
  a. Container which includes predefined sets of packages.

6. Packages
  a. Individual software packages.

For flexibility, a widget can contain any widget of a lower type. 

Interesting, because the conf parser is the same as the .bb parser,
setting up such a widget based hierarchy would not involve
any significant changes to bb or oe.

Bbclasses would define generic widgets.

Widgets are created by inheriting from the correct bbclass.
Widget override generic functionality by setting variables and
defining methods
Widgets can contain child widgets by including other bbfiles.

Does anyone see any obvious problem with such a system before I start
testing it?

This type of structure would make the documentation much easier.  It
would also significantly reduce the OpenEmbedded learning curve. 

Thanks
David Farning




