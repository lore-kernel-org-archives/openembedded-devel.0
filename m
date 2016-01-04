Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.203])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3D4731C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:39:53 +0000 (UTC)
Received: from [216.82.242.35] by server-11.bemta-8.messagelabs.com id
	A5/57-05489-A50AA865; Mon, 04 Jan 2016 16:39:54 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-16.tower-75.messagelabs.com!1451925592!7561723!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 46266 invoked from network); 4 Jan 2016 16:39:52 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-16.tower-75.messagelabs.com with SMTP;
	4 Jan 2016 16:39:52 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 4 Jan 2016 17:39:46 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 4 Jan 2016 17:39:45 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
	<20160104161718.GA2378@jama>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <568AA04B.8000101@digi.com>
Date: Mon, 4 Jan 2016 17:39:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160104161718.GA2378@jama>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: Re: [meta-qt5][master][jethro][PATCH] qtconnectivity, qtsystems: fix bluetooth support
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
X-List-Received-Date: Mon, 04 Jan 2016 16:39:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/16 17:17, Martin Jansa wrote:
>
> Is it deterministic?
>
> Will it always pick bluez4 when BLUEZ is set to bluez4, but there is
> bluez5 is already in the sysroot as well?

No, BLUEZ is set by *bluetooth* class depending on your distro features 
and is only used to add 'bluez4' or 'bluez5' to the recipe build-time 
dependences (DEPENDS). But apart from that it does nothing to the QT5 
compilation itself.

>
> config.tests/bluez/bluez.pro is only using pkgconfig to find bluez, so
> I'm not sure which one will win.

Neither do I, but I don't think having both versions of the bluez 
libraries in the sysroot is a common use-case. The package config file 
for bluez4 and bluez5 is almost the same. It adds the same cflags and 
libs to any package querying it:

Libs: -L${libdir} -lbluetooth
Cflags: -I${includedir}

So to recap: this change fix the bluetooth support which is currently 
broken because QMAKE_CACHE_EVAL is not used at all, and also allows to 
build QT5 bluetooth support using bluez5 instead of the hard-coded bluez4.

-- 
Regards,

Javier Viguera

