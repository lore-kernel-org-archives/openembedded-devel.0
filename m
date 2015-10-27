Return-Path: <michael@losert.org>
Received: from s0.ouned.de (s0.ouned.de [185.44.107.108])
	by mail.openembedded.org (Postfix) with ESMTP id 28B567570D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by s0.ouned.de (Postfix) with ESMTP id 8112222B4C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:51:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at s0.ouned.de
Received: from s0.ouned.de ([127.0.0.1])
	by localhost (s0.ouned.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5T2vIcP5IMr0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:51:44 +0100 (CET)
Received: by s0.ouned.de (Postfix, from userid 33)
	id 179CE200C6; Tue, 27 Oct 2015 11:51:44 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
X-PHP-Originating-Script: 0:rcmail.php
MIME-Version: 1.0
Date: Tue, 27 Oct 2015 11:51:44 +0100
From: michael@losert.org
Message-ID: <d65ccb58baa5f0e85ea3719c4826c4a1@losert.org>
X-Sender: michael@losert.org
User-Agent: Roundcube Webmail/0.9.5
Subject: [meta-qt5] qtbluetooth not building against bluez
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
X-List-Received-Date: Tue, 27 Oct 2015 10:51:45 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit

I'm using qtbluetooth (qtconnectivity_git.bb) and noticed that it builds 
some kind of empty dummy library.
I then tried building in verbose mode: "bitbake -v qtconnectivity" and 
got the following message in the log:
"Unsupported Bluetooth platform, will not build a working QtBluetooth 
library.
Either no Qt D-Bus found or no BlueZ headers."

My solution was to add
   EXTRA_QMAKEVARS_PRE += "CONFIG+=config_bluez"
to
   recipes-qt/qt5/qtconnectivity_git.bb

after that it worked as expected.
I'm unsure if it's the right thing to do though.

I'm working with yocto 1.8 fido but also checked the master branch which 
doesn't seem to have anything changed related to qtconnectivity.

