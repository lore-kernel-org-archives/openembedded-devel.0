Received: from [212.125.75.19] (helo=mail14.messagelabs.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <martyn.welch@radstone.co.uk>) id 1IdOTM-0006Pi-5N
	for openembedded-devel@openembedded.org; Thu, 04 Oct 2007 13:02:28 +0200
X-VirusChecked: Checked
X-Env-Sender: martyn.welch@radstone.co.uk
X-Msg-Ref: server-5.tower-14.messagelabs.com!1191495430!11318579!1
X-StarScan-Version: 5.5.12.14.2; banners=radstone.co.uk,-,-
X-Originating-IP: [193.130.116.242]
Received: (qmail 21924 invoked from network); 4 Oct 2007 10:57:10 -0000
Received: from mailhost.radstone.co.uk (HELO marshall01.Radstone.Local)
	(193.130.116.242) by server-5.tower-14.messagelabs.com with SMTP;
	4 Oct 2007 10:57:10 -0000
Received: from radmail.Radstone.Local (Not Verified[192.168.2.152]) by
	marshall01.Radstone.Local
	id <B4704c7060000>; Thu, 04 Oct 2007 11:57:10 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Thu, 4 Oct 2007 11:57:09 +0100
Message-ID: <F38DEABE0E171746B133C1ABBD142D97071112B2@radmail.Radstone.Local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: SVN fetcher behaviour
Thread-Index: AcgGdU+ZXqEHpm5vToaRDXCS1syWKA==
From: "Martyn Welch" <martyn.welch@radstone.co.uk>
To: <openembedded-devel@lists.openembedded.org>
Subject: SVN fetcher behaviour
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2007 11:02:28 -0000
Content-class: urn:content-classes:message

Hello,

I have just tried to build "task-base" for machine=x86, distro=generic.

It is failing to download gconf-dbus using "gconf-dbus_svn.bb". It seems
that the script does not specify a revision and it therefore trying to
download revision 1. This fails.

I have managed to get the script to continue buy hacking the script to
get it to download the current revision (608), by adding "rev=608" to
the SRC_URI.

I've looked at
http://www.openembedded.org/user-manual&dpage=src_uri_variable, which
(under "SVN") describes the behaviour of the svn fetcher. This doesn't
seem to specify what the default behaviour of the svn fetcher is when no
revision is specified, I'd assumed it would be the "head", though I am
now having some doubt.

Martyn

----
Martyn Welch
Principal Software Engineer
 
Radstone Digital Processing
Part of GE Fanuc Embedded Systems
Tove Valley Business Park
Towcester
Northants
England
NN12 6PF

Telephone: +44 (0) 1327 359444
Direct Dial: +44 (0) 1327 322748
Fax: +44 (0) 1327 322800
email: martyn.welch@radstone.co.uk
web: www.radstone.com

This email is private and confidential and for the addressee only. If
misdirected, please notify us by telephone and confirm that it has been
deleted from your system and any hard copies destroyed. You are strictly
prohibited from using, printing, distributing or disseminating it or any
information contained in it save to the intended recipient.
 


________________________________________________________________________
This e-mail has been scanned for all viruses by Star.The service is powered by MessageLabs. 
________________________________________________________________________


