Received: from smtpr2.tom.com ([202.108.255.197] helo=tom.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <xydarcher@tom.com>) id 1Nn648-00029V-1O
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 09:06:00 +0100
Received: from china-53198c1e9 (unknown [172.24.140.52])
	by bjapp41 (Coremail) with SMTP id H8B3QeE+j0sXAIw0.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Mar 2010 13:02:28 +0800 (CST)
X-Originating-IP: [172.24.140.52]
Received: from china-53198c1e9([125.71.228.74])
	by bjapp12.tom.com(KBAS Gateway 2.1 2.127s39f(2009-08-22)) with ESMTP
	id local7728.1267678945 for
	<openembedded-devel@lists.openembedded.org>; 
	Thu, 04 Mar 2010 13:02:26 +0800 (CST)
X-Original-AuthLogin: xydarcher@tom.com
Date: Thu, 4 Mar 2010 13:02:22 +0800
From: "Readon Shaw" <xydarcher@tom.com>
To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
Message-ID: <201003041302203902334@tom.com>
X-mailer: Foxmail 6, 15, 201, 22 [cn]
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 202.108.255.197
X-SA-Exim-Mail-From: xydarcher@tom.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DNS_FROM_RFC_DSN,
	SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Xserver problem...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Mar 2010 08:06:06 -0000
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit

>Hi,
>I am using Angstrom OS for my pxa270 based board, which is build by
>Stable/2009 branch. In this, Xserver is running perperly on  240x320 and
>640x480 resolution, but while running 480x272 resolution lcd 4.3" it
>making problem. How can I  resolve this.
>
>Version      :     xserver-kdrive-1_1.4.0.90-r5
>Branch       :     Stable/2009
>
>Error log are,
>/*****************************************/
>root@regulus:~# Xfbdev -br -pn  -mouse tslib -hide-cursor :0 -noreset
>Warning: mode not found, using default
>error: Invalid argument
>
>Fatal server error:
>no screens found
>root@regulus:~#
>/*****************************************/
>
>With Regards
>J.Balakrishnan.
>
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I meet the same problem nearly.
it seems a problem of your kernel.
the error message is printed when ioctl call with FBIO_CHANGE_CMAP_VBL.
display entry in mach info struct was modified to some strange value.
i am still tracing that.
i don't if it was in the same case, hope useful.

------------------				 
Readon Shaw
2010-03-04




