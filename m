Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <hvontres@gmail.com>) id 1HMRce-0001LK-NH
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Feb 2007 17:25:44 +0100
Received: by ug-out-1314.google.com with SMTP id e2so166143ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2007 08:25:44 -0800 (PST)
Received: by 10.78.179.12 with SMTP id b12mr56634huf.1172679943562;
	Wed, 28 Feb 2007 08:25:43 -0800 (PST)
Received: by 10.78.20.19 with HTTP; Wed, 28 Feb 2007 08:25:38 -0800 (PST)
Message-ID: <a7f8874a0702280825j22bdf3bbw94e58cfd4a0fab93@mail.gmail.com>
Date: Wed, 28 Feb 2007 08:25:38 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Potential Problems in glibc-package.bbclass
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
X-List-Received-Date: Wed, 28 Feb 2007 16:25:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I think I may have stumbled across some potential bugs in glibc-package.bbclass:

it seems like the standard value for datadir is /usr/share which will
cause the following problems in output_locale_binary:

1) i18npath will be set to /usr/share/i18n instead of
treedir/usr/share/i18n becouse path.join is too braindead to remove
leading / on path entries.
2) the --inputfile option in localdef opts uses datadir instead of
treedir, so it looks like it would use the locale files installed on
the host instead of the ones we are buildig for.

Am I missing something here or should I file this as a bug?



-------------source starts here------------------------------------
def output_locale_binary(name, locale, encoding):
		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
		qemu = "qemu-%s -r 2.6.16" % target_arch
		pkgname = 'locale-base-' + legitimize_package_name(name)
		m = re.match("(.*)\.(.*)", name)
		if m:
			glibc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
		else:
			glibc_name = name
		bb.data.setVar('RDEPENDS_%s' % pkgname,
legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
		rprovides = 'virtual-locale-%s' % legitimize_package_name(name)
		m = re.match("(.*)_(.*)", name)
		if m:
			rprovides += ' virtual-locale-%s' % m.group(1)
		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
		bb.data.setVar('PACKAGES', '%s %s' % (pkgname,
bb.data.getVar('PACKAGES', d, 1)), d)

		treedir = os.path.join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
		path = bb.data.getVar("PATH", d, 1)
		i18npath = os.path.join(treedir, datadir, "i18n")

		localedef_opts = "--force --old-style --no-archive --prefix=%s
--inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir,
locale, encoding, name)
		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s %s/bin/localedef %s" %
(path, i18npath, qemu, treedir, treedir, localedef_opts)
		bb.note("generating locale %s (%s)" % (locale, encoding))
		if os.system(cmd):
			raise bb.build.FuncFailed("localedef returned an error (command was
%s)." % cmd)

