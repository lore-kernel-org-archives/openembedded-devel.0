Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.4])
	by mail.openembedded.org (Postfix) with ESMTP id C2A696F895
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:40:34 +0000 (UTC)
Received: from [216.82.249.147:53999] by server-4.bemta-12.messagelabs.com id
	4C/7F-18200-19A4F135; Tue, 11 Mar 2014 17:40:33 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-15.tower-29.messagelabs.com!1394559632!22776023!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.11.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18224 invoked from network); 11 Mar 2014 17:40:32 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-15.tower-29.messagelabs.com with RC4-SHA encrypted SMTP;
	11 Mar 2014 17:40:32 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 11 Mar 2014 12:40:44 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 11 Mar 2014 12:40:31 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 11 Mar 2014 18:40:29 +0100
Message-ID: <531F4A8C.2060205@digi.com>
Date: Tue, 11 Mar 2014 18:40:28 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1386874857-8596-1-git-send-email-joe@deserted.net>	<531F372B.8010907@digi.com>
	<20140311170540.GA13065@deserted.net>
In-Reply-To: <20140311170540.GA13065@deserted.net>
Subject: Re: [meta-networking][PATCH] vsftpd: install volatiles file based on init system
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
X-List-Received-Date: Tue, 11 Mar 2014 17:40:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Joe,

On 11/03/14 18:05, Joe MacDonald wrote:
> Sorry, no, not yet.  At the end of the thread I think I had a workable
> solution but I've not merged the result.  If you have an updated patch
> that addresses all of the systemd/sysvinit/systemd+sysvinit
> combinations, I'll be happy to merge it instead of my work.

Unfortunately I have never played with *systemd*, so i don't have a 
patch handy.

At the moment in my custom BSP layer i have workarounded it creating a 
bbappend with just:

INSANE_SKIP_${PN} = "installed-vs-shipped"

I know this is not the proper fix but at least it allows me to complete 
the build. Otherwise it fails.

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

