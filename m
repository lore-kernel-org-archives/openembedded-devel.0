Received: from [64.233.162.193] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <nicolasfr@gmail.com>) id 1GXl4G-0008Ji-5y
	for openembedded-devel@openembedded.org; Wed, 11 Oct 2006 22:52:44 +0200
Received: by nz-out-0102.google.com with SMTP id v1so180637nzb
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Oct 2006 13:46:25 -0700 (PDT)
Received: by 10.65.20.3 with SMTP id x3mr1407631qbi;
	Wed, 11 Oct 2006 13:46:25 -0700 (PDT)
Received: by 10.65.197.7 with HTTP; Wed, 11 Oct 2006 13:46:25 -0700 (PDT)
Message-ID: <b9481e140610111346xc062befs848d9e1c3bd35075@mail.gmail.com>
Date: Wed, 11 Oct 2006 22:46:25 +0200
From: "Nicolas FR" <nicolasfr@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: Help with bitebaking latest python-dbus
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2006 20:52:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am trying to bitbake python-dbus_0.71 with a simple bb, but I am
stuck on a cryptic error (seems to lie in how distutils tries to
compile the package). Could someone help me building this new version?

Here is the bb recipe:
---------------
DESCRIPTION = "Python bindings for DBus, a socket-based message bus
system for interprocess communication"
SECTION = "devel/python"
HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
LICENSE = "GPL"
DEPENDS = "python"
RDEPENDS = "dbus"
PR = "r0"

SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python-${PV}.tar.gz"
S = "${WORKDIR}/dbus-python-${PV}"

inherit distutils
---------------

and the error:

running build
running build_py
running build_ext
NOTE: sysconfig.get_config_h_filename() altered for OpenEmbedded
building 'dbus/dbus_bindings' extension
Traceback (most recent call last):
  File "setup.py", line 151, in ?
    cmdclass={'build_ext': build_ext, 'clean': full_clean, 'check':
dbus_python_check}
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/core.py",
line 149, in setup
    dist.run_commands()
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/dist.py",
line 946, in run_commands
    self.run_command(cmd)
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/dist.py",
line 966, in run_command
    cmd_obj.run()
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/command/build.py",
line 112, in run
    self.run_command(cmd_name)
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/cmd.py",
line 333, in run_command
    self.distribution.run_command(command)
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/dist.py",
line 966, in run_command
    cmd_obj.run()
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/command/build_ext.py",
line 279, in run
    self.build_extensions()
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/command/build_ext.py",
line 405, in build_extensions
    self.build_extension(ext)
  File "/opt/OE/build/tmp.openzaurus/staging/lib/python2.4/distutils/command/build_ext.py",
line 442, in build_extension
    sources = self.swig_sources(sources, ext)
TypeError: swig_sources() takes exactly 2 arguments (3 given)


