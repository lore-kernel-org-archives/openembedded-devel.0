Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0994AC77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 05:40:45 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.10517.1684388437109369686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 22:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id 817AD4CD0F
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 07:40:35 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.44.3]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pzWNH-1WvioU0; Thu, 18 May 2023 07:40:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCH 2/2] pipewire: update 0.3.70 -> 0.3.71
Date: Thu, 18 May 2023 07:40:15 +0200
Message-Id: <20230518054015.81043-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518054015.81043-1-f_l_k@t-online.de>
References: <20230518054015.81043-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684388427-5A7F357F-864D9379/0/0 CLEAN NORMAL
X-TOI-MSGID: f95f6f1d-3ba3-41ac-96c9-e9a5b2e931bd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 05:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102653

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - A new zero-latency jackdbus bridge was added. This works similar to w=
hat
    PulseAudio has to offer and creates a sink/source when jackdbus is
    started. It is however much more efficient and runs the complete Pipe=
Wire
    graph as a synchronous JACK client with no added latency.
  - Many performance improvements. Activation of remote nodes is more
    efficient, fewer eventfds are required on the clients, less callback
    overhead in performence critical paths and an optimized poll function
    was added. This was mainly driven by the jackdbus module to get the l=
owest
    possible overhead when running the graph.
  - The JACK notify callback implementation was reworked to emulate bette=
r what
    JACK does, improving compatibility with ardour7 and the JACK stress t=
est.
  - More work on BAP devices. Device latency is now passed on to
    applications also for multi-device headsets, and channel allocation
    is handled better.
  - Many more improvements and bugfixes.

  - Remove the hardcoded limit on io_areas. This is used to link nodes to=
gether
    and exchange buffers, it was limited to 2048 but now dynamically scal=
es
    based on requirements.
  - Rate and quantum changes are now applied correctly in more cases. (#3=
159)
  - Updates to client-node to more efficiently process the driver.
  - The profiler information was improved to be more accurate. It should
    now work better for remote drivers.
  - Some potential memory map errors were fixed in the protocol because i=
n some
    case with large messages, some fds were closed too soon.
  - pw-filter now implements the pw_filter_set_active() method.
  - A potential out-of-buffers case was fixed in capture pw-streams where=
 buffers
    were not moved to the recycle queue when the node suspended.
  - Nodes are now always woken up with the eventfd. Previously there were
    some optimiztions in the server to directly call into the node proces=
s
    function but that optimization is not necessary. Without this optimiz=
ation
    it is now possible to run nodes in different threads.
  - pw-stream trigger is now implemented correctly in all cases.
  - Remote nodes now use one eventfd less because they get triggered with=
 the
    node eventfd directly.
  - Monitor ports are now ignored in latency updates.
  - A potential race when reporting an error to a client was fixed. (#319=
2)
  - Fix a bug where always_process nodes would sometimes IDLE. (#3189)
  - Optimize peer activation. Nodes are now activated more efficiently an=
d
    independent of the number of links. It also reduces the number of eve=
ntfds
    and memory in remote clients.
  - A bug in property serialization was fixed. Values with spaces would o=
nly
    serialize the first part of the value.

  - Correctly handle the echo-canceler plugin init method fallback. The
    samplerate was not correctly configured. This is only a regression fo=
r people
    that have external echo-canceler plugins.
  - RAOP sink now only sets the volume on the remote end when the stream =
is
    recording. (#3175)
  - RAOP discover now tries to deduplicate entries from the same host.
  - A new zero-latency jackdbus bridge was added. This works similar to w=
hat
    pulseaudio has to offer and creates a sink/source when jackdbus is
    started. It is however much more efficient and runs the complete Pipe=
Wire
    graph as a synchronous JACK client.
  - The access module uses a more secure way to check the application
    executable.
  - module-combine-stream now has configurable delay and latency for each
    stream. This can be used to align sinks/sources with different latenc=
ies.
  - A potential crash in module-pulse-tunnel was fixed when shutting down=
.
    (#3199)
  - Module-rt will now clamp the nice value to the min allowed value to a=
void
    errors from rtkit. (#3186)
  - Fix a bug with the session counters in module-rtp-sap. Also use the r=
ight
    format for L24. Improve the AES67 example config.
  - Improve some warning and info messages in module-rt. (#3194)
  - module-rtp-session should now do something when started without argum=
ents.
  - A potential crash in module-rtp-session was fixed. (#3217)
  - module-filter-chain has better error reporting when a convolver fails=
 to
    load. (#3223)

  - Move some things around to avoid compiler warnings. (#3171)
  - Increase mixer ports. Reorganize some things and bump mixer input por=
ts
    from 128 to 512.
  - Fix a potential crash when a node is scheduled before it completes
    the setup.
  - The JACK sink and source SPA plugins have seen some improvements.
  - Allow the peaks resampler still if we disabled resampling.
  - Perform more cleanup in audioadapter when in error.
  - An optimized non-cancellable loop implementation was added.
  - Callbacks were optimized with a _fast() varsion that doesn't check th=
e
    version and method. When this check is performed earlier, it can
    be skipped in performance critical places.
  - Some of the callbacks and system methods are now using the fast funct=
ion
    calls in critical paths.
  - A potential division by zero was fixed in the ALSA plugins.
  - Improve rate and quantum when starting audioconvert.
  - Make it possible to override node.driver in the SPA null-audio-driver=
.
    (#3220)

  - The audio info parameter parsing was refactored and improved.
  - Fix some races with clients exiting when playing samples.
  - An option was added to change or disable the dbus name registration.
    (#2987)

  - Implement battery reporting using AT+XEVENT.
  - Disable hardware volume for 3M WorkTunes.
  - Implement BAP audio locations (channel positions) by using the new
    bluez properties.

  - Fix some errors reported by JACK test.cpp. (#2638)
  - Add jack.show-midi option to show/hide midi ports.
  - Add jack.max-client-ports option. JACK also has a port limit and so
    PipeWire needs it as well to make the tests happy.
  - Call the shutdown callback only when the server stopped, not when the=
re
    is a random error. (#3070)
  - Avoid registering the same port name twice.
  - Call port registration callbacks in activate/deactivate.
  - Improve jack_port_connected().
  - Improve some error reporting.
  - The JACK headers were updated to a newer version.
  - JACK callbacks are now managed with an event queue to simulate
    more what JACK does. This avoids emiting callbacks when a method is b=
locking
    for a reply and causing deadlocks. (#3183)
  - Assign unique names to JACK clients. (#2833)
  - Fix a potential crash when the thread_utils was used after free.
  - Aliases are now not filled in by default to improve JACK compatibilit=
y.
    (#3154)

  - The ALSA plugin will now wait for negotiation to complete or an error
    before _prepare() completes. This makes more applications deal correc=
tly
    with the potential errors.

  - A new document about how scheduling is implemented was added.
  - Update the pw-cli man page. (#2988)
  - Document the SPA Pod serialization.
  - Document the PipeWire native protocol.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.70.bb =3D> pipewire_0.3.71.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.70.bb =3D=
> pipewire_0.3.71.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.70.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.70.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
index 56595e7686..7f117e10b2 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.70.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "9f7d60c1e84cc0481afc3f6ccf76e127567943a8"
+SRCREV =3D "bd225b14bbda1a6e2dc7a52780eaf728920e0ff2"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


