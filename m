Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 371 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Jan 2016 16:32:12 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.3])
	by mail.openembedded.org (Postfix) with ESMTP id AE11660132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 16:32:12 +0000 (UTC)
Received: from [216.82.249.147] by server-3.bemta-12.messagelabs.com id
	31/6E-21005-91925965; Tue, 12 Jan 2016 16:26:01 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-29.messagelabs.com!1452615961!12573071!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10760 invoked from network); 12 Jan 2016 16:26:01 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-11.tower-29.messagelabs.com with SMTP;
	12 Jan 2016 16:26:01 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 12 Jan 2016 17:25:53 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 12 Jan 2016 17:25:53 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
	<20160104161718.GA2378@jama> <568AA04B.8000101@digi.com>
	<20160104203745.GB2378@jama>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <5695290B.90706@digi.com>
Date: Tue, 12 Jan 2016 17:25:47 +0100
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
X-List-Received-Date: Tue, 12 Jan 2016 16:32:14 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi Martin

On 04/01/16 21:37, Martin Jansa wrote:
> Some distros are still using bluez4, you can try it as well with:
> DISTRO_FEATURES_remove = "bluez5"
> DISTRO_FEATURES_append = " bluez4"
> 
> But nothing prevents bluez5 from being populated in the sysroot, because
> unlike bluez4 in meta-oe, bluez5 in oe-core doesn't set the PNBLACKLIST
> the make these 2 recipes really mutually exclusive in sysroot.

Seems that this problem was finally solved in:

http://git.openembedded.org/openembedded-core/commit/?id=0a556af62b509f9defd8ac5b3a6648bdfe1dff67

So here my humble ping for this commit (master and jethro).

-- 
Regards,

Javier Viguera

