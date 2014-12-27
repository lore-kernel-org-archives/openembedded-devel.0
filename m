Return-Path: <Alex.Gonzalez@digi.com>
X-Greylist: delayed 412 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 27 Dec 2014 20:09:25 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.113])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0167228F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 20:09:25 +0000 (UTC)
Received: from [216.82.254.211] by server-17.bemta-7.messagelabs.com id
	E1/B5-02679-9501F945; Sat, 27 Dec 2014 20:02:33 +0000
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-13.tower-201.messagelabs.com!1419710553!17110081!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6450 invoked from network); 27 Dec 2014 20:02:33 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-13.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	27 Dec 2014 20:02:33 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Sat, 27 Dec 2014 14:02:30 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Sat, 27 Dec 2014 14:02:31 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0210.002;
	Sat, 27 Dec 2014 21:02:28 +0100
From: "Gonzalez, Alex" <Alex.Gonzalez@digi.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] Exception running x11 application
Thread-Index: AdAiEApG04AXX9OOQuGqDQn/rXPS9Q==
Date: Sat, 27 Dec 2014 20:02:28 +0000
Message-ID: <02BDCB585301A044B5DBBDB58DDFDA0113EDF7@dor-sms-xch01.digi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [95.22.141.150]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Subject: [meta-java] Exception running x11 application
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
X-List-Received-Date: Sat, 27 Dec 2014 20:09:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
When running an example graphical application on X11 I get the following ex=
ception:=0A=
=0A=
Exception in thread "main" java.awt.AWTError: Toolkit not found: sun.awt.X1=
1.XToolkit=0A=
        at java.awt.Toolkit$2.run(Toolkit.java:875)=0A=
        at java.security.AccessController.doPrivileged(Native Method)=0A=
        at java.awt.Toolkit.getDefaultToolkit(Toolkit.java:860)=0A=
        at java.awt.Toolkit.getEventQueue(Toolkit.java:1730)=0A=
        at java.awt.EventQueue.invokeLater(EventQueue.java:1217)=0A=
        at javax.swing.SwingUtilities.invokeLater(SwingUtilities.java:1287)=
=0A=
        at HelloWorldSwing.main(HelloWorldSwing.java:17)=0A=
=0A=
This is similar to an issue reported for the dora branch on https://github.=
com/woglinde/meta-java/issues/60, however the suggested revert leaves a non=
 buildable system.=0A=
=0A=
Has anyone succeeded in running a graphical java application over X11?=0A=
=0A=
Thanks,=0A=
Alex=0A=
=0A=
=0A=
=0A=

