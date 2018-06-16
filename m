Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6805B75172
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 13:24:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5GDOY43019981
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 06:24:34 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Sat, 16 Jun 2018 06:24:33 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 16 Jun 2018 06:24:33 -0700
Message-ID: <20180616132433.75139-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] spice: Uprev to fix compile errors from gcc 8.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jun 2018 13:24:34 -0000
Content-Type: text/plain

The upstream spice already fixed the following problems:

../../git/server/red-channel.c: In function 'red_channel_receive':
../../git/server/red-channel.c:307:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
     g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_receive, NULL);
                                            ^
../../git/server/red-channel.c: In function 'red_channel_destroy':
../../git/server/red-channel.c:406:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
     g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_destroy, NULL);
                                            ^
../../git/server/red-channel.c: In function 'red_channel_send':
../../git/server/red-channel.c:412:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
     g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_send, NULL);
                                            ^
../../git/server/red-channel.c: In function 'red_channel_push':
../../git/server/red-channel.c:421:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
     g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_push, NULL);
                                            ^
../../git/server/red-channel.c: In function 'red_channel_disconnect':
../../git/server/red-channel.c:481:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
     g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_disconnect, NULL);
                                            ^
../../git/server/char-device.c: In function 'red_char_device_reset':
../../git/server/char-device.c:838:49: error: cast between incompatible function types from 'void (*)(RedPipeItem *)' {aka 'void (*)(struct RedPipeItem *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
         g_queue_foreach(dev_client->send_queue, (GFunc)red_pipe_item_unref, NULL);

--

The new commit also changed opus to compile in by default.  This is
now added as a PKGCONFIG option.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 35482ca86..e12e7d691 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 PV = "0.14.0+git${SRCPV}"
 
-SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
-SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
+SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
+SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
 
 SRCREV_FORMAT = "spice_spice-common"
 
@@ -47,6 +47,7 @@ PACKAGECONFIG[smartcard] = "--enable-smartcard,--disable-smartcard,libcacard,"
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,"
 PACKAGECONFIG[client] = "--enable-client,--disable-client,,"
 PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
+PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus,"
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
-- 
2.17.1


