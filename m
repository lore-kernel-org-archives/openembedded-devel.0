Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.12])
	by mail.openembedded.org (Postfix) with ESMTP id 515B96CEF4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 15:57:45 +0000 (UTC)
Received: from [216.82.249.131:64747] by server-12.bemta-12.messagelabs.com id
	AD/2C-10790-87EC6525; Thu, 10 Oct 2013 15:57:44 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-28.messagelabs.com!1381420653!24548651!10
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32573 invoked from network); 10 Oct 2013 15:57:44 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-6.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	10 Oct 2013 15:57:44 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 10 Oct 2013 10:55:49 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.158.1;
	Thu, 10 Oct 2013 10:56:02 -0500
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 10 Oct 2013 17:56:00 +0200
Message-ID: <5256CE06.60502@digi.com>
Date: Thu, 10 Oct 2013 17:55:50 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Dylan backports
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
X-List-Received-Date: Thu, 10 Oct 2013 15:57:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Bear with me if this has been already replied, but what is the procedure 
to get patches applied in maintenance branches (e.g. dylan)?

I sent a couple of patches some time ago:

<http://patchwork.openembedded.org/patch/57455/>
<http://patchwork.openembedded.org/patch/57475/>

that fixes broken builds in Dylan, but I'm not sure if this is the 
correct way because at the moment they have not made their way into the 
repo.

With the current status of dylan, cherokee cannot be downloaded (wrong 
SRC_URI) and net-snmp fails to build when not using 'systemd':

snmpd.c:459: undefined reference to `netsnmp_sd_listen_fds'

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

