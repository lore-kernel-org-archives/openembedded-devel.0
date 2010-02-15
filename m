Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ngy0a-0004Kk-4R for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 11:16:55 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ngxy3-0001wD-8w for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 11:14:15 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 11:14:15 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 11:14:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Feb 2010 11:13:51 +0100
Message-ID: <hlb6ov$s5c$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] set PYTHONPATH inside distutils-base.bbclass instead of distutils.bbclass
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
X-List-Received-Date: Mon, 15 Feb 2010 10:16:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I had a problem with building python-pygobject-native last week which
was due to this bit in m4/python.m4

if test -x "$PYTHON-config"; then
PYTHON_INCLUDES=`$PYTHON-config --includes 2>/dev/null`
else
PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
if test "$py_prefix" != "$py_exec_prefix"; then
  PYTHON_INCLUDES="$PYTHON_INCLUDES
- -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
>fi
fi

$PYTHON-config exists in staging and needs HOST_SYS, BUILDSYS,
STAGING_LIBDIR and STAGING_INCDIR exported to work.

But after instrumenting python.m4 a bit I get this when running
python-config:

Traceback (most recent call last):
  File "/OE/angstrom-dev/staging/x86_64-linux/usr/bin/python-config",
line 26, in <module>
    pyver = sysconfig.get_config_var('VERSION')
  File "/usr/lib/python2.5/distutils/sysconfig.py", line 541, in
get_config_var
    return get_config_vars().get(name)
  File "/usr/lib/python2.5/distutils/sysconfig.py", line 499, in
get_config_vars
    func()
  File "/usr/lib/python2.5/distutils/sysconfig.py", line 351, in _init_posix
    filename = get_makefile_filename()
  File "/usr/lib/python2.5/distutils/sysconfig.py", line 210, in
get_makefile_filename
    return os.path.join(lib_dir, "config" + (sys.pydebug and "_d" or
""), "Makefile")AttributeError: 'module' object has no attribute 'pydebug'

Which means it's using the distutils on my buildhost instead of the
proper one in staging.

OE is doing this:

export
PYTHONPATH=/OE/bitbake:/OE/bitbake/lib:/OE/bitbake-git/bin:/usr/lib/python2.5:/usr/lib/python2.5/plat-linux2:/usr/lib/python2.5/lib-tk:/usr/lib/python2.5/lib-dynload:/usr/local/lib/python2.5/site-packages:/usr/lib/python2.5/site-packages:/usr/lib/python2.5/site-packages/Numeric:/usr/lib/python2.5/site-packages/PIL:/usr/lib/pymodules/python2.5:/usr/lib/pymodules/python2.5/gtk-2.0

So I added this to the recipe:

do_configure_prepend() {
       unset PYTHONPATH
}

And everything started working again.

So my question is:

Can we set PYTHONPATH inside distutils-base.bbclass instead of
distutils.bbclass or just plain unset it?

regards,

Koen



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLeR5fMkyGM64RGpERApuWAJ4zzAKv7lVLPc9JIVJaBvul/ZGN2ACgmBH7
zA6ShA0i6mutv5+rCEncno8=
=48js
-----END PGP SIGNATURE-----



