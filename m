Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9B82B6D76F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:49:21 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VlJwx-00064s-2e for openembedded-devel@lists.openembedded.org;
	Tue, 26 Nov 2013 15:49:15 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 15:49:15 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 15:49:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 26 Nov 2013 15:52:55 +0100
Message-ID: <l72ccn$qmo$1@ger.gmane.org>
References: <1384917768-28022-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<l6sc8p$ogf$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <l6sc8p$ogf$1@ger.gmane.org>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] gateone: Updated to version 1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2013 14:49:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef op 24-11-13 09:12:
> Dan McDougall schreef op 20-11-13 04:22:
>> This new version of Gate One uses a new configuration file format which
>>  means the old server.conf is gone.  It now stores configuration files
>> in /etc/gateone/conf.d.  The /opt/gateone directory is also gone and
>> instead the package installs like a regular Python module in
>> site-packages.  SSL certificates/keys are stored in /etc/gateone/ssl/.
> 
>> The new version requires python-tornado 3.1.1 (which was submitted 
>> earlier today) and the python-futures package (which was also submitted
>>  today).
> 
>> An 80oe.conf file has been added specific to OpenEmbedded that replaces
>>  the old pre-configured server.conf functionality.
> 
>> The old patch that removes the init script checks has been deprecated
>> by the use of the --skip_init_scripts option which is now being passed
>> to setup.py.
> 
>> Lastly, Gate One 1.2 is about twice as fast (benchmarked) as Gate One
>> 1.1 on the Beaglebone platform.
> 
>> Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
> 
> I massaged the patches to apply to 'dylan' and I ran into the following 
> problems:
> 
> 1) the systemd service has:
> 
> ConditionPathExists=|/var/lib/gateone
> 
> But that doesn't exist, so gateone will never get started.
> 
> 2) Missing python stuff:
> 
> root@beaglebone:~# !jour journalctl -a -b -f -u gateone -- Logs begin at
> Sat 2013-11-23 19:11:00 UTC. -- Nov 23 22:43:23 beaglebone systemd[1]:
> Started GateOne daemon. Nov 23 22:43:37 beaglebone systemd[1]: Started
> GateOne daemon. Nov 23 22:45:14 beaglebone systemd[1]: Starting GateOne
> daemon... Nov 23 22:45:15 beaglebone systemd[1]: Started GateOne daemon. 
> Nov 23 22:45:15 beaglebone python[800]: Traceback (most recent call
> last): Nov 23 22:45:15 beaglebone python[800]: File "/usr/bin/gateone",
> line 5, in <module> Nov 23 22:45:15 beaglebone python[800]: from
> pkg_resources import load_entry_point Nov 23 22:45:15 beaglebone
> python[800]: ImportError: No module named pkg_resources Nov 23 22:45:15
> beaglebone systemd[1]: gateone.service: main process exited, code=exited,
> status=1/FAILURE Nov 23 22:45:15 beaglebone systemd[1]: Unit
> gateone.service entered failed state.
> 
> Google suggests python-setuptools is missing
> 
> 3) Even after installing setuptools:
> 
> Nov 24 08:08:59 beaglebone python[1068]: Traceback (most recent call
> last): Nov 24 08:08:59 beaglebone python[1068]: File "/usr/bin/gateone",
> line 9, in <module> Nov 24 08:08:59 beaglebone python[1068]:
> load_entry_point('gateone==1.2.0', 'console_scripts', 'gateone')() Nov 24
> 08:08:59 beaglebone python[1068]: File 
> "/usr/lib/python2.7/site-packages/gateone/core/server.py", line 3745, in
> main Nov 24 08:08:59 beaglebone python[1068]:
> define_options(installed=installed) Nov 24 08:08:59 beaglebone
> python[1068]: File 
> "/usr/lib/python2.7/site-packages/gateone/core/configuration.py", line
> 165, in define_options Nov 24 08:08:59 beaglebone python[1068]:
> additional_origins = socket.gethostbyname_ex(socket.gethostname()) Nov 24
> 08:08:59 beaglebone python[1068]: socket.error: [Errno 110] Connection
> timed out Nov 24 08:08:59 beaglebone systemd[1]: gateone.service: main
> process exited, code=exited, status=1/FAILURE Nov 24 08:08:59 beaglebone
> systemd[1]: Unit gateone.service entered failed state.

After changing
"/usr/lib/python2.7/site-packages/gateone/core/configuration.py", line 165
to read:

        additional_origins = [] # additional_origins =
socket.gethostbyname_ex(socket.gethostname())

Gateone now works.

> regards,
> 
> Koen
> 
>> ...move-init-check-it-looks-outside-the-sysr.patch | 38 
>> ----------------------
>> .../recipes-connectivity/gateone/gateone/80oe.conf | 23 +++++++++++++
>> .../gateone/gateone/server.conf                    | 5 ---
>> .../recipes-connectivity/gateone/gateone_git.bb    | 32 
>> ++++++++++-------- .../gateone/gateone/gateone.service
>> | 2 +- 5 files changed, 43 insertions(+), 57 deletions(-) delete mode 
>> 100644 
>> meta-oe/recipes-connectivity/gateone/gateone/0001-setup.py-remove-init-check-it-looks-outside-the-sysr.patch
>
>> 
> 
> create mode 100644
> meta-oe/recipes-connectivity/gateone/gateone/80oe.conf
>> delete mode 100644 
>> meta-oe/recipes-connectivity/gateone/gateone/server.conf
> 
>> diff --git 
>> a/meta-oe/recipes-connectivity/gateone/gateone/0001-setup.py-remove-init-check-it-looks-outside-the-sysr.patch
>>
>> 
b/meta-oe/recipes-connectivity/gateone/gateone/0001-setup.py-remove-init-check-it-looks-outside-the-sysr.patch
> 
> 
> deleted file mode 100644
>> index ef3a95b..0000000 --- 
>> a/meta-oe/recipes-connectivity/gateone/gateone/0001-setup.py-remove-init-check-it-looks-outside-the-sysr.patch
>
>> 
> 
> +++ /dev/null
>> @@ -1,38 +0,0 @@ -From a65ad6683688bb427efefe5e52137928c2736137 Mon
>> Sep 17 00:00:00 2001 -From: Koen Kooi <koen@dominion.thruhere.net>
>> -Date: Thu, 4 Apr 2013 13:04:03 +0200 -Subject: [PATCH] setup.py:
>> remove init check, it looks outside the sysroot - -Signed-off-by: Koen
>> Kooi <koen@dominion.thruhere.net> ---- - setup.py | 14 -------------- -
>> 1 file changed, 14 deletions(-) - -diff --git a/setup.py b/setup.py
>> -index 00c8ba1..4568679 100755 ---- a/setup.py -+++ b/setup.py -@@
>> -112,20 +112,6 @@ redhat_script = os.path.join(setup_dir, 
>> 'scripts/init/gateone-redhat.sh') - gentoo_script = 
>> os.path.join(setup_dir, 'scripts/init/gateone-gentoo.sh') - 
>> temp_script_path = os.path.join(setup_dir, 'build/gateone') - 
>> temp_confd_path = os.path.join(setup_dir, 'build/gateone') --if 
>> os.path.exists('/etc/debian_version'): --
>> shutil.copy(debian_script, temp_script_path) --elif
>> os.path.exists('/etc/redhat-release'): -- shutil.copy(redhat_script,
>> temp_script_path) --elif os.path.exists('/etc/gentoo-release'): --
>> shutil.copy(gentoo_script, temp_script_path) --    conf_file =
>> [('/etc/conf.d', [ -- os.path.join(setup_dir, 'scripts/conf/gateone')
>> --    ])] -- --if os.path.exists(temp_script_path): --    init_script =
>> [('/etc/init.d', [ --        temp_script_path --    ])] - - # Put it
>> all together - data_files = ( --- -1.8.1.4 - diff --git 
>> a/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf 
>> b/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf new file mode 
>> 100644 index 0000000..cde98bc --- /dev/null +++ 
>> b/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf @@ -0,0 +1,23 
>> @@ +// Some custom Gate One settings for OpenEmbedded +{ +    "*": { + 
>> "gateone": { // These settings apply to all of Gate One + 
>> "log_file_max_size": 5242880, // 5 megabyte logs for OE by default 
>> (default would normally be 100Mb) +            "log_file_num_backups":
>> 2, // Default is normally 10 +            "origins": ["*"], // Every
>> device has a unique origin +            "logging": "info", + 
>> "pid_file": "/var/run/gateone.pid", +            "session_dir": 
>> "/tmp/gateone", +            "user_dir": "/var/lib/gateone/users" + },
>> +        "terminal": { +            // Disabling session logging for 
>> embedded devices is a good idea (limited/slow storage) + 
>> "session_logging": false, +            "syslog_session_logging": false
>>  +//             "commands": { +//                 // For some reason
>> this doesn't work (never asks for the password) +//
>> "login": "setsid /bin/login" // Normally this would emulate logging
>> into the host console +//             } +        } +    } +} diff
>> --git a/meta-oe/recipes-connectivity/gateone/gateone/server.conf 
>> b/meta-oe/recipes-connectivity/gateone/gateone/server.conf deleted
>> file mode 100644 index 988b0d0..0000000 --- 
>> a/meta-oe/recipes-connectivity/gateone/gateone/server.conf +++
>> /dev/null @@ -1,5 +0,0 @@ -session_logging = False -origins = "*"
>> -command = "/var/lib/gateone/plugins/ssh/scripts/ssh_connect.py -S 
>> '/tmp/gateone/%SESSION%/%SHORT_SOCKET%' --sshfp -a 
>> '-oUserKnownHostsFile=%USERDIR%/%USER%/ssh/known_hosts'"
>> -log_file_prefix = "/var/log/gateone.log" - diff --git 
>> a/meta-oe/recipes-connectivity/gateone/gateone_git.bb 
>> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb index 
>> c5586b5..9c41a3b 100644 --- 
>> a/meta-oe/recipes-connectivity/gateone/gateone_git.bb +++ 
>> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb @@ -1,40 +1,46 @@
>>  DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and
>> SSH client" LICENSE = "AGPLv3" -LIC_FILES_CHKSUM = 
>> "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c" 
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE.txt;md5=834cbc6995db88433db17cdf8953a428" +HOMEPAGE = 
>> "http://liftoffsoftware.com/Products/GateOne"
> 
>> -PR = "r8" +PR = "r1"
> 
>> -PV = "1.1" -SRCREV = "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9" +PV = 
>> "1.2" +SRCREV = "1528d324088fc1c180b7fdf50f5b5c1af057eef6" SRC_URI = 
>> "git://github.com/liftoff/GateOne.git \ file://gateone-avahi.service \
>> - file://server.conf \ +           file://80oe.conf \ "
> 
>> S = "${WORKDIR}/git"
> 
>> -inherit distutils allarch +inherit distutils +export prefix = 
>> "${localstatedir}"
> 
>> -export prefix = "${localstatedir}/lib" +DISTUTILS_INSTALL_ARGS = 
>> "--root=${D} \ +    --prefix=${prefix} \ + 
>> --install-lib=${PYTHON_SITEPACKAGES_DIR} \ + 
>> --install-data=${PYTHON_SITEPACKAGES_DIR} \ + 
>> --install-scripts=${bindir} \ +    --skip_init_scripts"
> 
>> do_install_append() { -	install -d ${D}${localstatedir}/log/${BPN} - 
>> install -m 0755 -d ${D}${sysconfdir}/avahi/services/ install -m 0644 
>> ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
> 
>> -	install -m 0644 ${WORKDIR}/server.conf 
>> ${D}/var/lib/gateone/server.conf +	install -m 0755 -d 
>> ${D}${sysconfdir}/gateone/conf.d/ +	install -m 0644
>> ${WORKDIR}/80oe.conf ${D}${sysconfdir}/gateone/conf.d/80oe.conf }
> 
>> -FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log
>> ${base_libdir} ${sysconfdir} ${libdir}/python*" -RDEPENDS_${PN} = "file
>> \ - mime-support \ +FILES_${PN} = "${localstatedir}/lib ${bindir} 
>> ${base_libdir} ${sysconfdir} ${libdir}/python*" +RDEPENDS_${PN} = 
>> "mime-support \ openssh-ssh \ python-compression \ python-crypt \ 
>> python-datetime \ python-email \ python-fcntl \ + python-futures \
>> python-html \ python-imaging \ python-io \ diff --git 
>> a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
>>
>> 
b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
> 
> 
> index 7ff6002..7b14d3e 100644
>> --- 
>> a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
>
>> 
> 
> +++
> b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
>>
> 
@@ -4,7 +4,7 @@ ConditionPathExists=|/var/lib/gateone
> 
>> [Service] WorkingDirectory=/var/lib/gateone -ExecStart=/usr/bin/python 
>> gateone.py +ExecStart=/usr/bin/python /usr/bin/gateone
> 
>> [Install] WantedBy=multi-user.target
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSlLXHMkyGM64RGpERAp2wAJ0T3Nv+/4srLX78F2oQR5VtZrn8HwCgig8V
FSJAUqY8Bso6IBjjJXz8A7k=
=CtqD
-----END PGP SIGNATURE-----


