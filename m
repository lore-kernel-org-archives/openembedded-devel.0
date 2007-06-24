Received: from [65.54.246.169] (helo=bay0-omc2-s33.bay0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pelle2004@hotmail.com>) id 1I2RvG-0007C5-5A
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2007 15:14:34 +0200
Received: from hotmail.com ([65.55.154.106]) by bay0-omc2-s33.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.2668); 
	Sun, 24 Jun 2007 06:10:26 -0700
Received: from mail pickup service by hotmail.com with Microsoft SMTPSVC;
	Sun, 24 Jun 2007 06:10:26 -0700
Message-ID: <BAY143-F26A49AD42DFE7DB1DE4350B9150@phx.gbl>
Received: from 65.55.154.123 by by143fd.bay143.hotmail.msn.com with HTTP;
	Sun, 24 Jun 2007 13:10:25 GMT
X-Originating-IP: [83.227.74.206]
X-Originating-Email: [pelle2004@hotmail.com]
X-Sender: pelle2004@hotmail.com
From: "Pelle Svensson" <pelle2004@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Bcc: 
Date: Sun, 24 Jun 2007 15:10:25 +0200
Mime-Version: 1.0
X-OriginalArrivalTime: 24 Jun 2007 13:10:26.0822 (UTC)
	FILETIME=[08273A60:01C7B661]
Subject: Need some help with conditional assignment
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
X-List-Received-Date: Sun, 24 Jun 2007 13:14:35 -0000
Content-Type: text/plain; charset=iso-8859-1; format=flowed


I need to assign a variable by condition and I can't get it right
Have tried these without any luck. I'm inside a bbclass...

# KERNEL_MAKE_OPTIONS += "${@base_conditional( 'KERNEL_BUILD_DIR', '', '', 
'-O '+bb.data.getVar('',d,1), d )}"
# KERNEL_MAKE_OPTIONS += "${@base_conditional( 'KERNEL_BUILD_DIR', '', '', 
'-O ${KERNEL_BUILD_DIR}', d )}"
KERNEL_MAKE_OPTIONS += "${@['-O ${KERNEL_BUILD_DIR}', 
''][bb.data.getVar('KERNEL_BUILD_DIR', d, 1) != '']}"

do_compile() {
	oe_runmake ${KERNEL_MAKE_OPTIONS} zImage
}

_________________________________________________________________
Kolla in coola trailern till Die Hard 4 
http://specials.se.msn.com/diehard4/default.aspx



