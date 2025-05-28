Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1091BC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 16:38:30 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.308.1748450308494817632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 May 2025 09:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id 6B60C178;
	Wed, 28 May 2025 18:38:24 +0200 (CEST)
Received: from [192.168.178.20] ([79.219.238.136]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uKJnH-1ZEzIG0; Wed, 28 May 2025 18:38:19 +0200
Date: Wed, 28 May 2025 18:38:12 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: RE: [oe] [meta-networking][PATCH] networkmanager: update 1.50.0 ->
 1-52-0
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <OVCZWS.F3FXOTHI0NV71@t-online.de>
In-Reply-To: <AS1PR10MB5697A6F60CA36CB6B273568DFD67A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250528061506.466361-1-f_l_k@t-online.de>
	<AS1PR10MB5697A6F60CA36CB6B273568DFD67A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-J6/RWWs6BrVLNcYAWW9x"
X-TOI-EXPURGATEID: 150726::1748450299-2DFF89DC-1E9403F8/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d444e97-23c0-4377-93b7-7109939ed0b6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 16:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117649

--=-J6/RWWs6BrVLNcYAWW9x
Content-Type: text/plain; charset=us-ascii; format=flowed

I had updated to tip of master to check if there was already a fix for 
the gobject issue that could be backported, and then forgot to set 
SRCREV back to 1.52.0

On Wed, May 28 2025 at 06:23:22 +00:00:00, "Marko, Peter" 
<Peter.Marko@siemens.com> wrote:
> 
> 
>>  -----Original Message-----
>>  From: openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org> <openembedded-
>>  devel@lists.openembedded.org <mailto:devel@lists.openembedded.org>> 
>> On Behalf Of Markus Volk via
>>  lists.openembedded.org
>>  Sent: Wednesday, May 28, 2025 8:15
>>  To: openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org>
>>  Subject: [oe] [meta-networking][PATCH] networkmanager: update 
>> 1.50.0 -> 1-52-0
>> 
>>  - there is no tarball hosted at gnome anymore -> switch from
>>    gnomebase class to meson + git
>>  - add missing dependencies for uuid and nvme, add pkgconfig class
>>  - dhcpcanon option was removed upstream
>>  - gtkdoc is broken. Disable to unbreak builds if api-documentation
>>    is enabled
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...rkmanager_1.50.0.bb => networkmanager_1.52.0.bb} | 13 
>> +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>   rename meta-networking/recipes-
>>  connectivity/networkmanager/{networkmanager_1.50.0.bb =>
>>  networkmanager_1.52.0.bb} (96%)
>> 
>>  diff --git a/meta-networking/recipes-
>>  connectivity/networkmanager/networkmanager_1.50.0.bb b/meta-
>>  
>> networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
>>  similarity index 96%
>>  rename from meta-networking/recipes-
>>  connectivity/networkmanager/networkmanager_1.50.0.bb
>>  rename to meta-networking/recipes-
>>  connectivity/networkmanager/networkmanager_1.52.0.bb
>>  index 702b80ac68..cc37bd05d7 100644
>>  --- a/meta-networking/recipes-
>>  connectivity/networkmanager/networkmanager_1.50.0.bb
>>  +++ b/meta-networking/recipes-
>>  connectivity/networkmanager/networkmanager_1.52.0.bb
>>  @@ -25,32 +25,34 @@ DEPENDS = " \
>>       intltool-native \
>>       libxslt-native \
>>       libnl \
>>  +    libnvme \
>>       udev \
>>       util-linux \
>>  +    util-linux-libuuid \
>>       libndp \
>>       curl \
>>       dbus \
>>   "
>>   DEPENDS:append:class-target = " bash-completion"
>> 
>>  -inherit gnomebase gettext update-rc.d systemd 
>> gobject-introspection gtk-doc
>>  update-alternatives upstream-version-is-even
>>  +inherit meson gettext update-rc.d systemd gobject-introspection 
>> update-
>>  alternatives upstream-version-is-even pkgconfig
>> 
>>   SRC_URI = " \
>>  -
>>  
>> ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager
>>  -${PV}.tar.xz \
>>  +
>>  
>> git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=main
>>  \
>>       file://${BPN}.initd <file://${bpn}.initd/> \
>>       file://enable-dhcpcd.conf <file://enable-dhcpcd.conf/> \
>>       file://enable-iwd.conf <file://enable-iwd.conf/> \
>>   "
>>   SRC_URI:append:libc-musl = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'ld-is-
>>  lld', ' 
>> file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', 
>> <file://0001-linker-scripts-do-not-export-_io_stdin_used.patch',/> 
>> '', d)}"
>> 
>>  -SRC_URI[sha256sum] =
>>  "fc03e7388a656cebc454c5d89481626122b1975d7c26babc64dc7e488faa66e3"
>>  +SRCREV = "7ee8d84a1ea030f5a4dd867702ed2992f192c5c8"
> 
> This is tip of current main branch (1.53.4-dev-23-g7ee8d84a1e), not 
> 1.52.0
> Ideally this should be hash of 1.52.0 (or even better 1.53.4) and 
> SRC_URI should contain ";tag=${PV}"
> 
> Peter
> 
>> 
>>  -S = "${WORKDIR}/NetworkManager-${PV}"
>>  +S = "${WORKDIR}/git"
>> 
>>   # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
>>   NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
>> 
>>  -# ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
>>  +# ['dhclient', 'dhcpcd', 'internal', 'nettools']
>>   NETWORKMANAGER_DHCP_DEFAULT ??= "internal"
>> 
>>   # The default gets detected based on whether /usr/sbin/nft or 
>> /usr/sbin/iptables is
>>  installed, with nftables preferred.
>>  @@ -65,7 +67,6 @@ EXTRA_OEMESON = "\
>>       -Dqt=false \
>>       -
>>  Dconfig_dns_rc_manager_default=${NETWORKMANAGER_DNS_RC_MANAGER_
>>  DEFAULT} \
>>       -Dconfig_dhcp_default=${NETWORKMANAGER_DHCP_DEFAULT} \
>>  -    -Ddhcpcanon=false \
>>       -Diptables=${sbindir}/iptables \
>>       -Dnft=${sbindir}/nft \
>>   "
>>  --
>>  2.49.0
> 


--=-J6/RWWs6BrVLNcYAWW9x
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I had updated to tip of master to check if there was already a fix for the gobject issue that could be backported, and then forgot to set SRCREV back to 1.52.0</div></div><div id="geary-quote" dir="auto"><br>On Wed, May 28 2025 at 06:23:22 +00:00:00, "Marko, Peter" &lt;Peter.Marko@siemens.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">

<blockquote> -----Original Message-----
 From: <a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a> &lt;openembedded-
 <a href="mailto:devel@lists.openembedded.org">devel@lists.openembedded.org</a>&gt; On Behalf Of Markus Volk via
 lists.openembedded.org
 Sent: Wednesday, May 28, 2025 8:15
 To: <a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
 Subject: [oe] [meta-networking][PATCH] networkmanager: update 1.50.0 -&gt; 1-52-0
 
 - there is no tarball hosted at gnome anymore -&gt; switch from
   gnomebase class to meson + git
 - add missing dependencies for uuid and nvme, add pkgconfig class
 - dhcpcanon option was removed upstream
 - gtkdoc is broken. Disable to unbreak builds if api-documentation
   is enabled
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  ...rkmanager_1.50.0.bb =&gt; networkmanager_1.52.0.bb} | 13 +++++++------
  1 file changed, 7 insertions(+), 6 deletions(-)
  rename meta-networking/recipes-
 connectivity/networkmanager/{networkmanager_1.50.0.bb =&gt;
 networkmanager_1.52.0.bb} (96%)
 
 diff --git a/meta-networking/recipes-
 connectivity/networkmanager/networkmanager_1.50.0.bb b/meta-
 networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
 similarity index 96%
 rename from meta-networking/recipes-
 connectivity/networkmanager/networkmanager_1.50.0.bb
 rename to meta-networking/recipes-
 connectivity/networkmanager/networkmanager_1.52.0.bb
 index 702b80ac68..cc37bd05d7 100644
 --- a/meta-networking/recipes-
 connectivity/networkmanager/networkmanager_1.50.0.bb
 +++ b/meta-networking/recipes-
 connectivity/networkmanager/networkmanager_1.52.0.bb
 @@ -25,32 +25,34 @@ DEPENDS = " \
      intltool-native \
      libxslt-native \
      libnl \
 +    libnvme \
      udev \
      util-linux \
 +    util-linux-libuuid \
      libndp \
      curl \
      dbus \
  "
  DEPENDS:append:class-target = " bash-completion"
 
 -inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-doc
 update-alternatives upstream-version-is-even
 +inherit meson gettext update-rc.d systemd gobject-introspection update-
 alternatives upstream-version-is-even pkgconfig
 
  SRC_URI = " \
 -
 ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager
 -${PV}.tar.xz \
 +
 git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=main
 \
      <a href="file://${BPN}.initd">file://${BPN}.initd</a> \
      <a href="file://enable-dhcpcd.conf">file://enable-dhcpcd.conf</a> \
      <a href="file://enable-iwd.conf">file://enable-iwd.conf</a> \
  "
  SRC_URI:append:libc-musl = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'ld-is-
 lld', ' <a href="file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch',">file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch',</a> '', d)}"
 
 -SRC_URI[sha256sum] =
 "fc03e7388a656cebc454c5d89481626122b1975d7c26babc64dc7e488faa66e3"
 +SRCREV = "7ee8d84a1ea030f5a4dd867702ed2992f192c5c8"
</blockquote>
This is tip of current main branch (1.53.4-dev-23-g7ee8d84a1e), not 1.52.0
Ideally this should be hash of 1.52.0 (or even better 1.53.4) and SRC_URI should contain ";tag=${PV}"

Peter

<blockquote> 
 -S = "${WORKDIR}/NetworkManager-${PV}"
 +S = "${WORKDIR}/git"
 
  # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
  NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
 
 -# ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
 +# ['dhclient', 'dhcpcd', 'internal', 'nettools']
  NETWORKMANAGER_DHCP_DEFAULT ??= "internal"
 
  # The default gets detected based on whether /usr/sbin/nft or /usr/sbin/iptables is
 installed, with nftables preferred.
 @@ -65,7 +67,6 @@ EXTRA_OEMESON = "\
      -Dqt=false \
      -
 Dconfig_dns_rc_manager_default=${NETWORKMANAGER_DNS_RC_MANAGER_
 DEFAULT} \
      -Dconfig_dhcp_default=${NETWORKMANAGER_DHCP_DEFAULT} \
 -    -Ddhcpcanon=false \
      -Diptables=${sbindir}/iptables \
      -Dnft=${sbindir}/nft \
  "
 --
 2.49.0
</blockquote>
</div></blockquote></div>
--=-J6/RWWs6BrVLNcYAWW9x--


