Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.201])
	by mail.openembedded.org (Postfix) with ESMTP id 818AB6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 10:28:39 +0000 (UTC)
Received: from [216.82.242.37] by server-9.bemta-8.messagelabs.com id
	EF/90-17451-7DA9B865; Tue, 05 Jan 2016 10:28:39 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-99.messagelabs.com!1451989717!7480944!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27059 invoked from network); 5 Jan 2016 10:28:38 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-11.tower-99.messagelabs.com with SMTP;
	5 Jan 2016 10:28:38 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 5 Jan 2016 11:28:30 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 5 Jan 2016 11:28:30 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
	<20160104161718.GA2378@jama> <568AA04B.8000101@digi.com>
	<20160104203745.GB2378@jama>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <568B9AC8.5020302@digi.com>
Date: Tue, 5 Jan 2016 11:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160104203745.GB2378@jama>
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
X-List-Received-Date: Tue, 05 Jan 2016 10:28:40 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 04/01/16 21:37, Martin Jansa wrote:
> So you can build both with:
> bitbake -c build bluez5 bluez4
> (or with "bitbake world")
> 
> and you end with 2 providers for bluez.pc (and bluetooth.so) in the sysroot
> and qtconnectivity will get runtime dependency on whatever bluez version
> was built first, e.g. bluez5 even when BLUEZ variable says bluez4. See
> shlibs provider code in package.bbclass.
> 
> That's cause for undeterministic builds and this QA warning:
> WARNING: QA Issue: qtconnectivity rdepends on bluez5, but it isn't a build dependency? [build-deps]

Ok, I understand now the problem. Thanks for explaining it.

But to be honest, I don't know how this can be solved in these QT5 recipes. To me this seems more a problem in the bluez5 recipe, so it cannot be built when bluez4 is already built. This is probably beyond my Yocto skills :-)

I used this commit as an example to add the bluez5 support:

http://git.openembedded.org/meta-openembedded/commit/?id=c2069a1420fb3d199c99f8b6e778478240fa56be

Shouldn't the problem you outline happen just the same with the gpsd recipe after above commit?

-- 
Regards,

Javier Viguera

