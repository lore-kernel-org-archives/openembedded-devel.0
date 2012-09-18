Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDym9-0001n9-Lr
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:45 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=IQ3tsKtocqDrEPahta7PboA3tHW/+SzgovYZiewWX4s=;
	b=lFavYi924ZStCsirh5xBVwyNzuq8tJDANcszcsBPrdF+GfNj/1rE/3Zu34MMKY/RxO
	13S4Gg9XK4d4QqArqFwGgLNIIdIwTsE7PDdW4GsrXjU6b8VIgoqTafqvrguqjsobTIqn
	Jvz9jHb1N6TyBfQX4yiMGA2pyGiGEJ/xNUe5JkqCRXvHloN2xdshjtfqCA2L+0tffDyh
	8VzBCenW6vndf2F8Sfn1TLf0OLgPtkwY2LZoE77VMRo82t82I//QiiVMUGQphbgr7BB0
	A+wGwZNjMAr5WyUvxn1TY+6gDYeaF1InkzPoRz+ZwWEyMH7wzJmD7pTbhaW/FMhnRzYK
	CR5Q==
Received: by 10.204.129.14 with SMTP id m14mr28057bks.7.1347977707376;
	Tue, 18 Sep 2012 07:15:07 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:17 +0200
Message-Id: <1347977601-28665-37-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 36/40] mpd: Initial add 0.17.1
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/mpd/mpd.conf.in     |  420 ++++++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.17.1.bb       |   44 ++
 .../recipes-multimedia/musicpd/mpd_0.17.1.bbappend |   14 +
 3 files changed, 478 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/mpd.conf.in
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
 create mode 100644 meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/mpd.conf.in b/meta-multimedia/recipes-multimedia/musicpd/mpd/mpd.conf.in
new file mode 100644
index 0000000..f9f92c9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/mpd.conf.in
@@ -0,0 +1,420 @@
+# An example configuration file for MPD
+# See the mpd.conf man page for a more detailed description of each parameter.
+
+
+# Files and directories #######################################################
+#
+# This setting controls the top directory which MPD will search to discover the
+# available audio files and add them to the daemon's online database. This
+# setting defaults to the XDG directory, otherwise the music directory will be
+# be disabled and audio files will only be accepted over ipc socket (using
+# file:// protocol) or streaming files over an accepted protocol.
+#
+music_directory		"%music_directory%"
+#
+# This setting sets the MPD internal playlist directory. The purpose of this
+# directory is storage for playlists created by MPD. The server will use
+# playlist files not created by the server but only if they are in the MPD
+# format. This setting defaults to playlist saving being disabled.
+#
+playlist_directory		"%playlist_directory%"
+#
+# This setting sets the location of the MPD database. This file is used to
+# load the database at server start up and store the database while the
+# server is not up. This setting defaults to disabled which will allow
+# MPD to accept files over ipc socket (using file:// protocol) or streaming
+# files over an accepted protocol.
+#
+db_file			"%db_file%"
+#
+# These settings are the locations for the daemon log files for the daemon.
+# These logs are great for troubleshooting, depending on your log_level
+# settings.
+#
+# The special value "syslog" makes MPD use the local syslog daemon. This
+# setting defaults to logging to syslog, otherwise logging is disabled.
+#
+log_file			"%log_file%"
+#
+# This setting sets the location of the file which stores the process ID
+# for use of mpd --kill and some init scripts. This setting is disabled by
+# default and the pid file will not be stored.
+#
+#pid_file			"/var/run/mpd/mpd.pid"
+#
+# This setting sets the location of the file which contains information about
+# most variables to get MPD back into the same general shape it was in before
+# it was brought down. This setting is disabled by default and the server
+# state will be reset on server start up.
+#
+state_file		"%state_file%"
+#
+# The location of the sticker database.  This is a database which
+# manages dynamic information attached to songs.
+#
+#sticker_file			"~/.mpd/sticker.sql"
+#
+###############################################################################
+
+
+# General music daemon options ################################################
+#
+# This setting specifies the user that MPD will run as. MPD should never run as
+# root and you may use this setting to make MPD change its user ID after
+# initialization. This setting is disabled by default and MPD is run as the
+# current user.
+#
+user "mpd"
+#
+# This setting specifies the group that MPD will run as. If not specified
+# primary group of user specified with "user" setting will be used (if set).
+# This is useful if MPD needs to be a member of group such as "audio" to
+# have permission to use sound card.
+#
+group				"audio"
+#
+# This setting sets the address for the daemon to listen on. Careful attention
+# should be paid if this is assigned to anything other then the default, any.
+# This setting can deny access to control of the daemon.
+#
+# For network
+bind_to_address		"any"
+#
+# And for Unix Socket
+#bind_to_address		"~/.mpd/socket"
+#
+# This setting is the TCP port that is desired for the daemon to get assigned
+# to.
+#
+#port				"6600"
+#
+# This setting controls the type of information which is logged. Available
+# setting arguments are "default", "secure" or "verbose". The "verbose" setting
+# argument is recommended for troubleshooting, though can quickly stretch
+# available resources on limited hardware storage.
+#
+#log_level			"default"
+#
+# If you have a problem with your MP3s ending abruptly it is recommended that
+# you set this argument to "no" to attempt to fix the problem. If this solves
+# the problem, it is highly recommended to fix the MP3 files with vbrfix
+# (available from <http://www.willwap.co.uk/Programs/vbrfix.php>), at which
+# point gapless MP3 playback can be enabled.
+#
+#gapless_mp3_playback			"yes"
+#
+# This setting enables MPD to create playlists in a format usable by other
+# music players.
+#
+#save_absolute_paths_in_playlists	"no"
+#
+# This setting defines a list of tag types that will be extracted during the
+# audio file discovery process. Optionally, 'comment' can be added to this
+# list.
+#
+#metadata_to_use	"artist,album,title,track,name,genre,date,composer,performer,disc"
+#
+# This setting enables automatic update of MPD's database when files in
+# music_directory are changed.
+#
+#auto_update	"yes"
+#
+# Limit the depth of the directories being watched, 0 means only watch
+# the music directory itself.  There is no limit by default.
+#
+#auto_update_depth "3"
+#
+###############################################################################
+
+
+# Symbolic link behavior ######################################################
+#
+# If this setting is set to "yes", MPD will discover audio files by following
+# symbolic links outside of the configured music_directory.
+#
+#follow_outside_symlinks	"yes"
+#
+# If this setting is set to "yes", MPD will discover audio files by following
+# symbolic links inside of the configured music_directory.
+#
+#follow_inside_symlinks		"yes"
+#
+###############################################################################
+
+
+# Zeroconf / Avahi Service Discovery ##########################################
+#
+# If this setting is set to "yes", service information will be published with
+# Zeroconf / Avahi.
+#
+#zeroconf_enabled		"yes"
+#
+# The argument to this setting will be the Zeroconf / Avahi unique name for
+# this MPD server on the network.
+#
+#zeroconf_name			"Music Player"
+#
+###############################################################################
+
+
+# Permissions #################################################################
+#
+# If this setting is set, MPD will require password authorization. The password
+# can setting can be specified multiple times for different password profiles.
+#
+#password                        "password@read,add,control,admin"
+#
+# This setting specifies the permissions a user has who has not yet logged in.
+#
+#default_permissions             "read,add,control,admin"
+#
+###############################################################################
+
+
+# Input #######################################################################
+#
+
+input {
+        plugin "curl"
+#       proxy "proxy.isp.com:8080"
+#       proxy_user "user"
+#       proxy_password "password"
+}
+
+#
+###############################################################################
+
+# Audio Output ################################################################
+#
+# MPD supports various audio output types, as well as playing through multiple
+# audio outputs at the same time, through multiple audio_output settings
+# blocks. Setting this block is optional, though the server will only attempt
+# autodetection for one sound card.
+#
+# See <http://mpd.wikia.com/wiki/Configuration#Audio_Outputs> for examples of
+# other audio outputs.
+#
+# board specific examples #####################################################
+# (feel free to add futher)
+#
+# gumstix overo (tested with TOBI expansion board)
+#audio_output {
+#	type		"alsa"
+#	name		"overo"
+#	mixer_control	"Headset"
+#	mixer_index	"0"
+#}
+#
+# general examples ############################################################
+#
+# An example of an ALSA output:
+#
+#audio_output {
+#	type		"alsa"
+#	name		"My ALSA Device"
+##	device		"hw:0,0"	# optional
+##	format		"44100:16:2"	# optional
+##	mixer_type      "hardware"	# optional
+##	mixer_device	"default"	# optional
+##	mixer_control	"PCM"		# optional
+##	mixer_index	"0"		# optional
+#}
+#
+# An example of an OSS output:
+#
+#audio_output {
+#	type		"oss"
+#	name		"My OSS Device"
+##	device		"/dev/dsp"	# optional
+##	format		"44100:16:2"	# optional
+##	mixer_type      "hardware"	# optional
+##	mixer_device	"/dev/mixer"	# optional
+##	mixer_control	"PCM"		# optional
+#}
+#
+# An example of a shout output (for streaming to Icecast):
+#
+#audio_output {
+#	type		"shout"
+#	encoding	"ogg"			# optional
+#	name		"My Shout Stream"
+#	host		"localhost"
+#	port		"8000"
+#	mount		"/mpd.ogg"
+#	password	"hackme"
+#	quality		"5.0"
+#	bitrate		"128"
+#	format		"44100:16:1"
+##	protocol	"icecast2"		# optional
+##	user		"source"		# optional
+##	description	"My Stream Description"	# optional
+##	genre		"jazz"			# optional
+##	public		"no"			# optional
+##	timeout		"2"			# optional
+##	mixer_type      "software"		# optional
+#}
+#
+# An example of a recorder output:
+#
+#audio_output {
+#	type		"recorder"
+#	name		"My recorder"
+#	encoder		"vorbis"		# optional, vorbis or lame
+#	path		"/var/lib/mpd/recorder/mpd.ogg"
+##	quality		"5.0"			# do not define if bitrate is defined
+#	bitrate		"128"			# do not define if quality is defined
+#	format		"44100:16:1"
+#}
+#
+# An example of a httpd output (built-in HTTP streaming server):
+#
+#audio_output {
+#	type		"httpd"
+#	name		"My HTTP Stream"
+#	encoder		"vorbis"		# optional, vorbis or lame
+#	port		"8000"
+#	bind_to_address	"0.0.0.0"		# optional, IPv4 or IPv6
+##	quality		"5.0"			# do not define if bitrate is defined
+#	bitrate		"128"			# do not define if quality is defined
+#	format		"44100:16:1"
+#	max_clients	"0"			# optional 0=no limit
+#}
+#
+# An example of a pulseaudio output (streaming to a remote pulseaudio server)
+#
+#audio_output {
+#	type		"pulse"
+#	name		"My Pulse Output"
+##	server		"remote_server"		# optional
+##	sink		"remote_server_sink"	# optional
+#}
+#
+## Example "pipe" output:
+#
+#audio_output {
+#	type		"pipe"
+#	name		"my pipe"
+#	command		"aplay -f cd 2>/dev/null"
+## Or if you're want to use AudioCompress
+#	command		"AudioCompress -m | aplay -f cd 2>/dev/null"
+## Or to send raw PCM stream through PCM:
+#	command		"nc example.org 8765"
+#	format		"44100:16:2"
+#}
+#
+## An example of a null output (for no audio output):
+#
+#audio_output {
+#	type		"null"
+#	name		"My Null Output"
+#	mixer_type      "none"			# optional
+#}
+#
+# This setting will change all decoded audio to be converted to the specified
+# format before being passed to the audio outputs. By default, this setting is
+# disabled.
+#
+#audio_output_format		"44100:16:2"
+#
+# If MPD has been compiled with libsamplerate support, this setting specifies
+# the sample rate converter to use.  Possible values can be found in the
+# mpd.conf man page or the libsamplerate documentation. By default, this is
+# setting is disabled.
+#
+#samplerate_converter		"Fastest Sinc Interpolator"
+#
+###############################################################################
+
+
+# Normalization automatic volume adjustments ##################################
+#
+# This setting specifies the type of ReplayGain to use. This setting can have
+# the argument "off", "album" or "track". See <http://www.replaygain.org>
+# for more details. This setting is off by default.
+#
+#replaygain			"album"
+#
+# This setting sets the pre-amp used for files that have ReplayGain tags. By
+# default this setting is disabled.
+#
+#replaygain_preamp		"0"
+#
+# This setting enables on-the-fly normalization volume adjustment. This will
+# result in the volume of all playing audio to be adjusted so the output has
+# equal "loudness". This setting is disabled by default.
+#
+#volume_normalization		"no"
+#
+###############################################################################
+
+
+# MPD Internal Buffering ######################################################
+#
+# This setting adjusts the size of internal decoded audio buffering. Changing
+# this may have undesired effects. Don't change this if you don't know what you
+# are doing.
+#
+#audio_buffer_size		"2048"
+#
+# This setting controls the percentage of the buffer which is filled before
+# beginning to play. Increasing this reduces the chance of audio file skipping,
+# at the cost of increased time prior to audio playback.
+#
+#buffer_before_play		"10%"
+#
+###############################################################################
+
+
+# Resource Limitations ########################################################
+#
+# These settings are various limitations to prevent MPD from using too many
+# resources. Generally, these settings should be minimized to prevent security
+# risks, depending on the operating resources.
+#
+#connection_timeout		"60"
+#max_connections		"10"
+#max_playlist_length		"16384"
+#max_command_list_size		"2048"
+#max_output_buffer_size		"8192"
+#
+###############################################################################
+
+
+# Character Encoding ##########################################################
+#
+# If file or directory names do not display correctly for your locale then you
+# may need to modify this setting.
+#
+#filesystem_charset		"UTF-8"
+#
+# This setting controls the encoding that ID3v1 tags should be converted from.
+#
+#id3v1_encoding			"ISO-8859-1"
+#
+###############################################################################
+
+
+# SIDPlay decoder #############################################################
+#
+# songlength_database:
+#  Location of your songlengths file, as distributed with the HVSC.
+#  The sidplay plugin checks this for matching MD5 fingerprints.
+#  See http://www.c64.org/HVSC/DOCUMENTS/Songlengths.faq
+#
+# default_songlength:
+#  This is the default playing time in seconds for songs not in the
+#  songlength database, or in case you're not using a database.
+#  A value of 0 means play indefinitely.
+#
+# filter:
+#  Turns the SID filter emulation on or off.
+#
+#decoder {
+#	plugin			"sidplay"
+#	songlength_database	"/media/C64Music/DOCUMENTS/Songlengths.txt"
+#	default_songlength	"120"
+#	filter "true"
+#}
+#
+###############################################################################
+
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
new file mode 100644
index 0000000..b3b82c4
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Music Player Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+HOMEPAGE ="http://sourceforge.net/projects/musicpd"
+
+DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio \
+           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad lame libid3tag', d)}"
+
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
+    file://mpd.conf.in \
+"
+
+SRC_URI[md5sum] = "da3f3d6617a877192db4c6f53504cd38"
+SRC_URI[sha256sum] = "b18cdb1b779ca2ab323e212a0af4a567b7da4881a4e96868a8979bdfdbe7c2e8"
+
+inherit autotools useradd
+
+EXTRA_OECONF = "enable_bzip2=yes"
+
+do_install_append() {
+    install -d ${D}/${localstatedir}/lib/mpd/music
+    chmod 775 ${D}/${localstatedir}/lib/mpd/music
+    install -d ${D}/${localstatedir}/lib/mpd/playlists
+    chown -R mpd ${D}/${localstatedir}/lib/mpd
+    chown mpd:mpd ${D}/${localstatedir}/lib/mpd/music
+
+    install -d ${D}/${sysconfdir}
+    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
+    sed -i \
+        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
+        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
+        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
+        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
+        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
+        ${D}/${sysconfdir}/mpd.conf
+}
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = " \
+    --system --no-create-home \
+    --home ${localstatedir}/lib/mpd \
+    --groups audio \
+    --user-group mpd"
diff --git a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
new file mode 100644
index 0000000..eee4cdd
--- /dev/null
+++ b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
@@ -0,0 +1,14 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+EXTRA_OECONF += "--with-systemdsystemunitdir=${systemd_unitdir}/system"
+
+do_install_append() {
+    sed -i \
+        's|^ExecStart=.*|ExecStart=${bindir}/mpd --no-daemon|' \
+        ${D}/${systemd_unitdir}/system/mpd.service
+}
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "mpd.service"
-- 
1.7.6.5



