Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.100])
	by mail.openembedded.org (Postfix) with ESMTP id 222CE6F790
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 16:18:07 +0000 (UTC)
Received: from [216.82.254.211:35806] by server-4.bemta-7.messagelabs.com id
	AD/91-05395-F373F135; Tue, 11 Mar 2014 16:18:07 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-12.tower-201.messagelabs.com!1394554651!8855832!4
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.9.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24902 invoked from network); 11 Mar 2014 16:18:06 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-12.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	11 Mar 2014 16:18:06 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 11 Mar 2014 11:17:38 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Tue, 11 Mar 2014 11:17:49 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 11 Mar 2014 17:17:48 +0100
Message-ID: <531F372B.8010907@digi.com>
Date: Tue, 11 Mar 2014 17:17:47 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1386874857-8596-1-git-send-email-joe@deserted.net>
In-Reply-To: <1386874857-8596-1-git-send-email-joe@deserted.net>
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
X-List-Received-Date: Tue, 11 Mar 2014 16:18:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Was this patch finally merged?

At the moment building *vsftpd* in a sysvinit-based system is *broken*. 
The failure is:

ERROR: QA Issue: vsftpd: Files/directories were installed but not shipped
   /run
   /run/vsftpd
   /run/vsftpd/empty
ERROR: QA run found fatal errors. Please consider fixing them.

In such sysvinit systems, '/run' usually is a TMPFS and 
'/run/vsftpd/empty' is created at *runtime* via volatiles bootscript.

Creating the directory in the recipe at build time leads to the above 
mentioned error.

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

