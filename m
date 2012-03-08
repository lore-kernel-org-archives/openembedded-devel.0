Received: from sputnik.urmx.de ([88.198.51.18])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Eibach@gdsys.de>) id 1S5eKT-00058k-HO
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 15:28:29 +0100
Received: from mailrelay.gdsys.de (unknown [217.6.197.20])
	by sputnik.urmx.de (Postfix) with ESMTP id 6D0AB60010CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2012 15:19:51 +0100 (CET)
Received: from mailsgw.gdsys.de (localhost [127.0.0.1])
	by mailsgw.gdsys.de (Postfix) with ESMTP id 58D4A1F8802
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2012 15:19:51 +0100 (CET)
X-Spam-Processed: srv201.gdsys.de, Thu, 08 Mar 2012 15:19:50 +0100
	(not processed: message from trusted or authenticated source)
X-Return-Path: Eibach@gdsys.de
X-Envelope-From: Eibach@gdsys.de
X-MDaemon-Deliver-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Importance: normal
Priority: normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Date: Thu, 8 Mar 2012 15:19:47 +0100
Message-ID: <48D3D52125C49B43AE880038E2E5314BB5BFAF@SRV101.gdsys.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [meta-java] Compiling log4j1.2-native fails
thread-index: Acz9AceD+HmHOvf4T5KK+7RrsbQEhwANHvfQ
References: <48D3D52125C49B43AE880038E2E5314BB5BFAB@SRV101.gdsys.de>
From: "Eibach, Dirk" <Eibach@gdsys.de>
To: <openembedded-devel@lists.openembedded.org>,
	<heinold@inf.fu-berlin.de>
X-SafeGuard_MailGateway: Version: 5.60.3.11066 SGMG Date: 20120308141951Z
X-AntiVirus: checked by AntiVir MailGate (version: 2.0.2-5; AVE: 7.9.10.14;
	VDF: 7.11.24.230; host: mailrelay)
Subject: Re: [meta-java] Compiling log4j1.2-native fails
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
X-List-Received-Date: Thu, 08 Mar 2012 14:28:29 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Class: urn:content-classes:message


> With latest git of meta-java compiling 
> log4j1.2-native-1.2.15-r0 fails while building openjdk-6, 
> main problem seems to be:
> 
> | 32. ERROR in 
> src/main/java/org/apache/log4j/net/SMTPAppender.java (at
> line 1)
> | 	/*
> | 	^
> | The type javax.mail.MessagingException cannot be resolved. It is
> indirectly referenced from required .class files
> 
> Any ideas?

Rebuilding with a freshly checked out system without parallelization did
not show this bug. So maybe one of this nasty parallelization issues...

Cheers
Dirk




