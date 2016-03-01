Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 421 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Mar 2016 09:33:47 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA1775E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 09:33:47 +0000 (UTC)
Received: from [216.82.251.37] by server-9.bemta-12.messagelabs.com id
	11/26-03835-65065D65; Tue, 01 Mar 2016 09:26:46 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-15.tower-153.messagelabs.com!1456824405!9672175!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10733 invoked from network); 1 Mar 2016 09:26:45 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-15.tower-153.messagelabs.com with SMTP;
	1 Mar 2016 09:26:45 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Tue, 1 Mar 2016 10:26:39 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Tue, 1 Mar 2016 10:26:38 +0100
Reply-To: <openembedded-devel@lists.openembedded.org>
References: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <56D56048.204@digi.com>
Date: Tue, 1 Mar 2016 10:26:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
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
X-List-Received-Date: Tue, 01 Mar 2016 09:33:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/16 16:59, Javier Viguera wrote:
> QMAKE_CACHE_EVAL is only used in qtwebengine and qtwebkit, but not in
> the rest of the QT5 packages, so use EXTRA_QMAKEVARS_PRE to pass the
> packageconfig options to the do_configure task.
>
> Also generalize bluetooth support so it can be used not only with bluez4
> but with bluez5 as well.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>

Hi all,

This patch has been in *jethro-next* for almost two months now.

Is there a date to have 'jethro-next' merged into jethro? Is it planned?

-
Thanks,

Javier Viguera

