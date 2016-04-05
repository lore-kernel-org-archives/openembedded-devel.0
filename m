Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.198])
	by mail.openembedded.org (Postfix) with ESMTP id 8806E770C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 11:48:44 +0000 (UTC)
Received: from [216.82.242.37] by server-6.bemta-8.messagelabs.com id
	55/A2-10926-C16A3075; Tue, 05 Apr 2016 11:48:44 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-14.tower-99.messagelabs.com!1459856924!16318294!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 8.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1601 invoked from network); 5 Apr 2016 11:48:44 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-14.tower-99.messagelabs.com with SMTP;
	5 Apr 2016 11:48:44 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Tue, 5 Apr 2016 13:48:37 +0200
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Tue, 5 Apr 2016 13:48:36 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1447452500-31031-1-git-send-email-armccurdy@gmail.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <5703A60E.4000009@digi.com>
Date: Tue, 5 Apr 2016 13:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1447452500-31031-1-git-send-email-armccurdy@gmail.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [meta-qt5][PATCH] ninja-native: remove from meta-qt5 (moved to meta-oe)
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
X-List-Received-Date: Tue, 05 Apr 2016 11:48:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ninja-native recipe is still duplicated in Jethro branch:

$ bitbake-layers show-overlayed
=== Overlayed recipes ===
ninja-native:
   meta-qt5             1.5.3+gitrAUTOINC+3309498174
   meta-oe              1.6.0

Could the removal patch in master be cherry-picked to jethro?

# git cherry-pick -x 2d1bf98775aeb6796c66d545230c422b36b58cbe

-
Regards,

Javier Viguera

