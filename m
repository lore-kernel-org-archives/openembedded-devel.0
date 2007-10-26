Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IlW70-0003tA-C0
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 22:48:58 +0200
Received: by an-out-0708.google.com with SMTP id c31so162124ana
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2007 13:41:28 -0700 (PDT)
Received: by 10.100.211.8 with SMTP id j8mr2020630ang.1193430850215;
	Fri, 26 Oct 2007 13:34:10 -0700 (PDT)
Received: from lenovo ( [75.121.171.134])
	by mx.google.com with ESMTPS id 39sm5043039nzk.2007.10.26.13.34.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2007 13:34:09 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Fri, 26 Oct 2007 15:34:03 -0500
Date: Fri, 26 Oct 2007 15:34:03 -0500
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071026203403.GA6387@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: [doc] High level overview.
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
X-List-Received-Date: Fri, 26 Oct 2007 20:48:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am adding three high-level overview sections to getting started.
Each of these list items will be expanded into a paragraph introducing
the concept and how BB/OE solves the problem.

The first section describes what a development system must be able to do.
The second section describes what a OE developer must be able to define.
The third section describes the Outputs of bb/oe.

The section listed concepts are intentionally redundant because they
will look at the concepts from the three point of view:  What does the
system do, how do we tell the system what to do, what the system
outputs.

Please take a look and let me know if I am missing any big concepts.

thanks
David Farning

1
*************************
      <para>Before we get into the details of installing
<application>BitBake</application> let's step back and look at
      our goals.  As embedded developers we want to create a
specialized Linux <glossterm>distribution</glossterm>
      that will run on our <glossterm>device</glossterm>.
      This requires a number of things from our build system.

      <itemizedlist>
        <listitem>
          <para>Download Source Files - Grab source files, on the fly,
from upstream projects rather than
          from a central repository</para>
        </listitem>
        <listitem>
          <para>Apply Patches - Apply patches to source files which
will enable the compiled binaries
          to run on non-standard devices.</para>
        </listitem>
        <listitem>
          <para>Configure Applications</para>
        </listitem>
        <listitem>
           <para>Cross Compile - Compile executables that will run on
the target device.</para>
        </listitem>
        <listitem>
          <para>Create Packages</para>
        </listitem>
        <listitem>
          <para>Create File System - Create a root filesystem that
contains the installed packages.</para>
        </listitem>
        <listitem>
          <para>Build Image - Build an image that contains the file
system.</para>
        </listitem>
      </itemizedlist>
      </para>
****************

2
***************************
    <para>It is time to step back and look at our goals again.  In
order to create a linux distribution for an embedd device, we
    need to define.

      <itemizedlist>
        <listitem>
           <para>Define Applications</para>
        </listitem>
        <listitem>
          <para>Define Libaries.</para>
        </listitem>
        <listitem>
          <para>Define Kernel</para>
        </listitem>
        <listitem>
          <para>Define Archicture</para>
        </listitem>
        <listitem>
          <para>Define Package System</para>
        </listitem>
        <listitem>
          <para>Define File System</para>
        </listitem>
      </itemizedlist>
      </para>
************************

3
************************
    <para>It is time to step back and look at our goals again.  We
want to create an image which we can deploy.
    This impiles

      <itemizedlist>
        <listitem>
          <para>Create Cross Compiler.</para>
        </listitem>
        <listitem>
          <para>Create installable Packages.</para>
        </listitem>
        <listitem>
           <para>Create a deployable image.</para>
        </listitem>
      </itemizedlist>
      </para>
*************************


