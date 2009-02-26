Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcbWb-0002ya-Aw
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 09:23:21 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LcbTO-0002Pr-OU
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 08:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 08:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 08:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 26 Feb 2009 09:13:38 +0100
Message-ID: <go5ivi$nvl$4@ger.gmane.org>
References: <alpine.DEB.1.00.0902251712490.25447@localhost.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <alpine.DEB.1.00.0902251712490.25447@localhost.localdomain>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] getting_oe.xml: Update "Building Software" section.
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
X-List-Received-Date: Thu, 26 Feb 2009 08:23:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>

On 26-02-09 02:15, Theodore A. Roth wrote:
> ---
>   docs/usermanual/chapters/getting_oe.xml |  317 ++++++++++++++++++++++++++++++-
>   1 files changed, 310 insertions(+), 7 deletions(-)
>
> diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
> index 3c68504..d71ea71 100644
> --- a/docs/usermanual/chapters/getting_oe.xml
> +++ b/docs/usermanual/chapters/getting_oe.xml
> @@ -242,13 +242,316 @@ MACHINE = "om-gta01"</screen>
>     <section id="gettingoe_building_software">
>       <title>Building Software</title>
>
> -<para>Once BitBake and OpenEmbedded are set up and configured, one can build
> -    software and images like this:
> -<screen>
> -bitbake&lt;recipe_name&gt;
> -</screen>
> -</para>
> +<para>The primary interface to the build system is
> +      the<command>bitbake</command>  command (see
> +      the<ulink url="http://subversion.tigris.org/faq.html#proxy">BitBake
> +      users manual</ulink>). BitBake will download and patch files from the
> +      internet, so it helps if you are on a well connected machine.
> +</para>
> +
> +<para>Note that you should issue all BitBake commands from inside of the
> +<filename>build/</filename>  directory, or you should
> +      override<varname>TMPDIR</varname>  in
> +      your<filename>$OEBASE/build/conf/local.conf</filename>  to point
> +      elsewhere (by default it goes to<filename>tmp/</filename>  relative to
> +      the directory you run<command>bitbake</command>  commands in).
> +</para>
> +
> +<note>
> +<para>BitBake might complain that there is a problem with the setting in
> +<filename>/proc/sys/vm/mmap_min_addr</filename>, which needs to be set
> +        to zero. You can set it by doing the following as root:
> +
> +<screen># echo 0>  /proc/sys/vm/mmap_min_addr</screen>
> +
> +        Note that you can not use a text editor to do this since files
> +        in<filename>/proc</filename>  are not real files. Also note that this
> +        above change will be lost when you reboot your system. To have the
> +        change made automatically when the system boots, some systems provide
> +        a<filename>/etc/sysctl.conf</filename>  file. Add the following line
> +        to that file:
> +
> +<screen>vm.mmap_min_addr=0</screen>
> +
> +        If your system does not provide
> +        the<filename>/etc/sysctl.conf</filename>  mechanism, you can try adding
> +        the above<command>echo</command>  command line to
> +        your<filename>/etc/rc.local</filename>.
> +</para>
> +</note>
> +
> +<para>Once BitBake and OpenEmbedded are set up and configured, you can build
> +      software and images like this:
>
> -<para>This section is a stub, help us by expanding it</para>
> +<screen>$ bitbake&lt;recipe_name&gt;</screen>
> +
> +      A recipe name corresponds to a BitBake<filename>.bb</filename>  file.  A
> +      BitBake file is a logical unit of tasks to be executed. Normally this is
> +      a package to be built. Inter-recipe dependencies are obeyed. The recipes
> +      are located by BitBake via the<varname>BBFILES</varname>  variable (set
> +      in your<filename>$OEBASE/build/conf/local/conf</filename>), which is a
> +      space separated list of<filename>.bb</filename>  files, and does handle
> +      wildcards.
> +</para>
> +
> +<para>To build a single package, bypassing the long parse step (and
> +      therefore its dependencies -- use with care):
> +
> +<screen>$ bitbake -b $OEBASE/openembedded/packages/blah/blah.bb</screen>
> +</para>
> +
> +<para>There are a few groups of special recipes located in subdirectories
> +      of the<filename>$OEBASE/openembedded/packages/</filename>
> +      directory. These groups are:
> +
> +<variablelist>
> +<varlistentry>
> +<term><filename>tasks/</filename></term>
> +<listitem><para>A collection of meta-packages that depend on real
> +              packages to make managing package sets easier.</para></listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><filename>meta/</filename></term>
> +<listitem><para>A collection of usefull meta tasks and recipes that
> +              don't fit in a general category.</para></listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><filename>images/</filename></term>
> +<listitem><para>A collection of image targets that depend on
> +              packages that will be installed into an image which can be put
> +              on the target system.</para></listitem>
> +</varlistentry>
> +</variablelist>
> +</para>
> +
> +<section><title>Useful Target Recipes</title>
> +<para>Although BitBake can build individual packages, it is often more
> +        useful to build a set of packages and combine them into an image. The
> +        following recipe names are commonly used to that effect.
> +</para>
> +
> +<section><title>Images</title>
> +<para>
> +<variablelist>
> +<varlistentry>
> +<term><literal>helloworld-image</literal></term>
> +<listitem>
> +<para>Builds an image, that if used as a root filesystem, will
> +                  start a static executable that prints hello world then
> +                  loops infinitely. Can be used to test the Linux boot
> +                  procedure into user space (init).
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>bootstrap-image</literal></term>
> +<listitem>
> +<para>Build image contains task-base packages.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>console-image</literal></term>
> +<listitem>
> +<para>Build an image without the X11, gtk+, or qt windowing
> +                  libraries.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>x11-image</literal></term>
> +<listitem>
> +<para>Builds an image with X11.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>beagleboard-demo-image</literal></term>
> +<listitem>
> +<para>Builds the&Aring;ngstr&ouml;m distribution like Koen
> +                proposed.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>opie-image</literal></term>
> +<listitem>
> +<para>Build image based on the
> +<ulink url="http://opie.handhelds.org/">Open Palmtop
> +                  Integrated Environment</ulink>  (OPIE). OPIE is a completely
> +                  Open Source based graphical user environment and suite of
> +                  applications for small form-factor devices, such as PDAs,
> +                  running Linux.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>opie-kdepim-image</literal></term>
> +<listitem>
> +<para>Build image based on the OPIE and full featured
> +                  KDE-based PIM (pi-sync, ko/pi, ka/pi, etc).
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>pivotboot-image</literal></term>
> +<listitem>
> +<para>Build image that is necessary to flash a Sharp SL C3000,
> +                  Zaurus. It pivots after booting from the NAND and finalizes
> +                  the install to the HD during the first boot.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>twin-image</literal></term>
> +<listitem>
> +<para>A image with task-base plus a couple of editors, nano and
> +                  vim (why two?), and a mail reader, mutt.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>uml-image</literal></term>
> +<listitem>
> +<para>A root image for user-mode-linux. Includes task-base,
> +                  and parts of opie.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>gpe-image</literal></term>
> +<listitem>
> +<para>Build a<ulink url="http://opie.handhelds.org/">GPE
> +                  Palmtop Environment</ulink>  based kernel and rootfs. The GPE
> +                  provides a user interface environment for palmtop/handheld
> +                  computers running the GNU/Linux or any other UNIX-like
> +                  operating system.
> +</para>
> +</listitem>
> +</varlistentry>
> +</variablelist>
> +</para>
> +</section>
> +
> +<section><title>Tasks</title>
> +<para>
> +<variablelist>
> +<varlistentry>
> +<term><literal>task-base</literal></term>
> +<listitem>
> +<para>Build a kernel and core packages for a basic
> +                  installation. You won't be able to do much more than ssh to
> +                  the machine if this is all that is installed.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>task-dvb</literal></term>
> +<listitem>
> +<para>Meta-package for DVB application (DVB = Digital Video
> +                Broadcasting).
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>task-python-everything</literal></term>
> +<listitem>
> +<para>All of python.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>task-native-sdk</literal></term>
> +<listitem>
> +<para>Mata-package for native (on-device) SDK.
> +</para>
> +</listitem>
> +</varlistentry>
> +</variablelist>
> +</para>
> +</section>
> +
> +<section><title>Meta</title>
> +<para>
> +<variablelist>
> +<varlistentry>
> +<term><literal>meta-opie</literal></term>
> +<listitem>
> +<para>Build all OPIE related packages and some more for OPIE
> +                  based usage.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>meta-gpe</literal></term>
> +<listitem>
> +<para>Basic packages to go with gpe-image.
> +</para>
> +</listitem>
> +</varlistentry>
> +</variablelist>
> +</para>
> +</section>
> +
> +<section><title>Other</title>
> +<para>
> +<variablelist>
> +<varlistentry>
> +<term><literal>helloworld</literal></term>
> +<listitem>
> +<para>Builds a static executable that prints hello
> +                  world then loops infinitely.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>world</literal></term>
> +<listitem>
> +<para>Build everything. This takes a long time, a lot
> +                  of network bandwidth, and a lot of disc space. Can also
> +                  break your toolchain.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>package-index</literal></term>
> +<listitem>
> +<para>Target to update the "feed" files to reflect the current
> +                  set of .ipk's that exist in the deploy directory. Commonly
> +                  used after building some packages individually to update the
> +                  feed and allow them to be installed via a package manager or
> +                  the ipkg command line tools.
> +</para>
> +</listitem>
> +</varlistentry>
> +
> +<varlistentry>
> +<term><literal>virtual/kernel</literal></term>
> +<listitem>
> +<para>Builds the appropriate kernel for your device.</para>
> +</listitem>
> +</varlistentry>
> +</variablelist>
> +</para>
> +</section>
> +</section>
>     </section>
>   </chapter>




