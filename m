Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIHPA-0007Jo-Tr for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 11:33:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIHMa-0002Tc-C8 for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 11:30:20 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 11:30:20 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 11:30:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 May 2011 11:30:08 +0200
Message-ID: <iq0f30$tm6$1@dough.gmane.org>
References: <1304324573-31754-1-git-send-email-koen@openembedded.org>	<1304337015.3949.62.camel@mattotaupa>	<1304340997.3949.64.camel@mattotaupa>
	<1304673598.4041.17.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304673598.4041.17.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] systemd: update to v26
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
X-List-Received-Date: Fri, 06 May 2011 09:33:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-11 11:19, Paul Menzel wrote:
> Dear Koen,
> 
> 
> Am Montag, den 02.05.2011, 14:56 +0200 schrieb Paul Menzel:
>> Am Montag, den 02.05.2011, 13:50 +0200 schrieb Paul Menzel:
>>> Am Montag, den 02.05.2011, 10:22 +0200 schrieb Koen Kooi:
>>>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>>>> ---
>>>>  recipes/systemd/files/disable_xml_generation.patch |   36 --------
>>>>  recipes/systemd/files/execute.patch                |   17 ----
>>>>  recipes/systemd/files/getty-serial@.service        |   19 ----
>>>>  recipes/systemd/files/replace_accpet4.patch        |   26 ------
>>>>  recipes/systemd/files/systemadm.patch              |   13 ---
>>>>  ...-disable-xml-file-stuff-and-introspection.patch |   93 ++++++++++++++++++++
>>>>  recipes/systemd/systemd-v26/execute.patch          |   17 ++++
>>>>  recipes/systemd/systemd-v26/getty-serial@.service  |   19 ++++
>>>>  recipes/systemd/systemd-v26/replace_accpet4.patch  |   26 ++++++
>>>>  recipes/systemd/systemd-v26/systemadm.patch        |   13 +++
>>>>  recipes/systemd/systemd_git.bb                     |   26 ++++--
>>>>  11 files changed, 185 insertions(+), 120 deletions(-)
>>>>  delete mode 100644 recipes/systemd/files/disable_xml_generation.patch
>>>>  delete mode 100644 recipes/systemd/files/execute.patch
>>>>  delete mode 100644 recipes/systemd/files/getty-serial@.service
>>>>  delete mode 100644 recipes/systemd/files/replace_accpet4.patch
>>>>  delete mode 100644 recipes/systemd/files/systemadm.patch
>>>>  create mode 100644 recipes/systemd/systemd-v26/0001-systemd-disable-xml-file-stuff-and-introspection.patch
>>>>  create mode 100644 recipes/systemd/systemd-v26/execute.patch
>>>>  create mode 100644 recipes/systemd/systemd-v26/getty-serial@.service
>>>>  create mode 100644 recipes/systemd/systemd-v26/replace_accpet4.patch
>>>>  create mode 100644 recipes/systemd/systemd-v26/systemadm.patch
>>>
>>> `git log --stat -M -C -C` makes the diff lock much more daunting.
>>>
>>> […]
>>>
>>>> --- /dev/null
>>>> +++ b/recipes/systemd/systemd-v26/systemadm.patch
>>>> @@ -0,0 +1,13 @@
>>>> +Index: git/src/systemadm.vala
>>>> +===================================================================
>>>> +--- git.orig/src/systemadm.vala	2010-06-15 11:02:35.863509632 +0200
>>>> ++++ git/src/systemadm.vala	2010-06-15 11:06:16.305986249 +0200
>>>> +@@ -297,7 +297,7 @@
>>>> + 
>>>> +                 bbox.pack_start(cancel_button, false, true, 0);
>>>> + 
>>>> +-                bus = Bus.get(session ? BusType.SESSION : BusType.SYSTEM);
>>>> ++                bus = DBus.Bus.get(session ? DBus.BusType.SESSION : DBus.BusType.SYSTEM);
>>>> + 
>>>> +                 manager = bus.get_object(
>>>> +                                 "org.freedesktop.systemd1",
>>>> diff --git a/recipes/systemd/systemd_git.bb b/recipes/systemd/systemd_git.bb
>>>> index 5f98e54..7634b22 100644
>>>> --- a/recipes/systemd/systemd_git.bb
>>>> +++ b/recipes/systemd/systemd_git.bb
>>
>> Thinking about it, should not this be named `system_26.bb` to avoid
>> confusion?
>>
>>>> @@ -1,48 +1,56 @@
>>>>  DESCRIPTION = "Systemd a init replacement"
>>>>  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
>>>> -LICENSE = "GPL"
>>>> +LICENSE = "GPLv2+
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>>>> +
>>>>  DEPENDS = "readline udev dbus libcap2 libcgroup gtk+"
>>
>> `gtk+` should be removed. Actually I would prefer a separate patch
>> including disabling it.
>>
>>>>  PRIORITY = "optional"
>>>>  SECTION = "base/shell"
>>>>  
>>>> -PV = "0.0"
>>>> -PR_append = "+${SRCPV}"
>>>> +PV = "v26"
>>>> +#PR_append = "+${SRCPV}"
>>>
>>> Remove the commented line.
>>>  
>>>>  inherit autotools vala
>>>>  
>>>> -TAG = "1ebdf2d8793181f31b766b8342391aa1978f9917"
>>>> +TAG = "${PV}"
>>>>  
>>>>  SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git;tag=${TAG} \
>>>>             file://execute.patch \
>>>> -           file://systemadm.patch \
>>>> -           file://disable_xml_generation.patch \
>>>> +#           file://systemadm.patch \
>>>
>>> Maybe a comment in the recipe or the commit message would be nice, why
>>> this is commented. Could it be needed in the future?
>>>
>>>> +           file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \
>>>>             file://replace_accpet4.patch \
>>>>             file://getty-serial@.service \
>>>>            "
>>>>  
>>>>  S = "${WORKDIR}/git"
>>>>  
>>>> +# The gtk+ tools should get built as a seperate recipe e.g. systemd-tools
>>>
>>> s/seperate/separate/
>>>
>>> … to not force people to build all gtk+ packages/recipes.
>>>
>>>>  EXTRA_OECONF = " --with-distro=debian \
>>>>                   --with-rootdir=${base_prefix} \
>>>> +                 --disable-gtk \
>>>>                 "
>>>>  
>>>> -PACKAGES = "${PN} ${PN}-gui ${PN}-dbg ${PN}-doc"
>>>> +PACKAGES =+ "${PN}-gui"
>>>>  
>>>>  FILES_${PN}-gui = "${bindir}/systemadm"
>>>>  
>>>>  FILES_${PN} = " ${base_bindir}/* \
>>>>                  ${datadir}/dbus-1/services \
>>>>                  ${datadir}/dbus-1/system-services \
>>>> +                ${datadir}/polkit-1 \
>>>>                  ${datadir}/${PN} \
>>>>                  ${sysconfdir} \
>>>>                  ${base_libdir}/systemd/* \
>>>>                  ${base_libdir}/systemd/system/* \
>>>>                  ${base_libdir}/udev/rules.d \
>>>> +                ${base_libdir}/security/*.so \
>>>>                  /cgroup \
>>>> -                ${bindir}/systemd-install \
>>>> +                ${bindir}/systemd* \
>>>> +                ${libdir}/tmpfiles.d/*.conf \
>>>> +                ${libdir}/systemd \
>>>>                 "
>>>>  
>>>> -FILES_${PN}-dbg += " /lib/systemd/.debug "
>>>> +FILES_${PN}-dbg += "${base_libdir}/systemd/.debug ${base_libdir}/systemd/*/.debug"
>>>>  
>>>>  def get_baudrate(bb, d):
>>>>      return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]
>>>
>>> A split in two commits to fix/improve the recipe and to update to v26
>>> would have been nice.
>>>
>>> Anyway, using `angstrom-2010.x` for `MACHINE = "beagleboard"` fails with
>>> the following error message.
>>>
>>>         […]
>>>           CCLD   systemd-getty-generator
>>>           GEN    man/systemd.1
>>>         I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
>>>         warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
>>>         cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
>>>         make[1]: *** [man/systemd.1] Error 4
>>>         make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/systemd-v26-r0/git'
>>>         make: *** [all] Error 2
>>>         + die 'oe_runmake failed'
>>>         + oefatal 'oe_runmake failed'
>>>         + echo FATAL: 'oe_runmake failed'
>>>         FATAL: oe_runmake failed
>>>         + exit 1
>>>
>>> Please find `log.do_compile` attached.
> 
> why did you ignore my comments and pushed anyway in 1f14659d [1]?

You might have noticed that the patch I pushed is quite different from
the one I sent to this list.

Anyway, Henning OK'd the patch:

10:00 < koen> woglinde_: OK to commit the patch so you can fix up epoll
later?
10:01 < woglinde_> koen its booting
10:01 < woglinde_> so commit it

And since he's the maintainer I pushed it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNw7+gMkyGM64RGpERAnAwAJ9Hkk3agonPzHzp06YrZzPD2sbBPQCghkEU
g0+AycJHMgLgbbj+mR0oIEI=
=9eoo
-----END PGP SIGNATURE-----



