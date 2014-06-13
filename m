Return-Path: <felix01.fischer@iav.de>
Received: from mailout04.rmx.de (mailout04.rmx.de [94.199.90.94])
	by mail.openembedded.org (Postfix) with ESMTP id A08166FD8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 15:00:54 +0000 (UTC)
Received: from cryptout01.retarus.com ([172.19.21.78])
	by mailout04.rmx.de (8.14.4/8.14.5/retarus.custom) with ESMTP id
	s5DF0pQW020066 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:00:51 +0200
Received: from cryptout01 (localhost [127.0.0.1])
	by cryptout01.retarus.com (Postfix) with ESMTP id E38753704DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:00:50 +0200 (CEST)
Received: from mailcc05.retarus.de (mailcc05.retarus.de [172.19.21.5])
	by cryptout01.retarus.com (Postfix) with SMTP id 971003704DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:00:50 +0200 (CEST)
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 0F30F0E2:7197CB6E-C1257CF6:005207D4;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
From: Felix01 Fischer <felix01.fischer@iav.de>
Message-ID: <OF0F30F0E2.7197CB6E-ONC1257CF6.005207D4-C1257CF6.00526B8E@retarus.de>
Date: Fri, 13 Jun 2014 17:00:19 +0200
X-RouteServers: CN=SRVB02M/O=IAV;CN=SRVHUB1/O=IAV
X-MIMETrack: Serialize by Router on jaja/RetarusMail(Release 8.5.3FP3|November
	15, 2012) at 06/13/2014 17:00:37,
	Serialize complete at 06/13/2014 17:00:37
X-RMX-ID: 20140613-170037-s5DF0HkV019336-0@kdin02
X-RMX-TRACE: 2014-06-13 17:00:38 KdIn2013@kdin02/mailcc08 [0.1s]
	20140613-170037-s5DF0HkV019336-0@kdin02 0:00:00
X-RMX-TRACE: 2014-06-13 17:00:38 RmxMSO@kdin02/mailcc11 [0.1s]
	20140613-170037-s5DF0HkV019336-0@kdin02 0:00:01
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] How do I add qmake and stuff to an image?
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
X-List-Received-Date: Fri, 13 Jun 2014 15:00:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

To whom it may concern,

How do I add qmake and stuff to an image?
I tried by adding "packagegroup-qt5-toolchain-target.bb" to my=20
IMAGE_INSTALL Variable, but
find / | grep -i "qmake" only finds various  qmake.conf, no qmake binary.
qtbase-devel and similar packages are also not providing a qmake binary

I'm using yocto, meta-qt5, meta-raspberry and meta-ruby all with the=20
latest master-branch



Regards,

Felix Fischer


Student Employee (VC-I42)
Vehicle Cockpit - HMI Software and Code generation

IAV GmbH
Carnotstr. 1
10587 BERLIN
GERMANY

Phone: +49 30 3997-89540
Fax:       +49 30 3997-89411
E-Mail:  <mailto:felix01.fischer@iav.de>
Internet: http://www.iav.com

Sitz/Registered Office: Berlin,=20
Registergericht/Registration Court: Amtsgericht Charlottenburg,=20
Registernummer/Company Registration Number: HRB 21 280,=20
Gesch&#65533;ftsf&#65533;hrer/Managing Directors: Kurt Blumenr&#65533;der,=
 Michael Schubert,=20
Dr. R&#65533;diger Goyk
Vorsitzender des Aufsichtsrates/Chairman of the Supervisory Board: Dr.=20
Harald Ludanek
From denis@denix.org  Fri Jun 13 17:03:00 2014
Return-Path: <denis@denix.org>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.o=
rg;
	Fri, 13 Jun 2014 17:02:57 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 7234E6FE57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:02:57 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7400DGW789F7W0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 Jun 2014 11:02:49 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CB41820086; Fri,
	13 Jun 2014 12:02:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jun 2014 12:02:09 -0400
Message-id: <1402675329-25425-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Cc: "Balasubramanian, Aparna" <aparnab@ti.com>,
	Denys Dmytriyenko <denys@ti.com>
Subject: [oe] [PATCH] rng-tools: Update rng-tools version to 4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembed=
ded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject
