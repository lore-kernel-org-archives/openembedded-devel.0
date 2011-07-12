Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QgZIh-0002A6-AV
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 11:30:43 +0200
Received: from NVC1420.nedap.local ([10.91.8.1] RDNS failed) by smtp.nedap.com
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Tue, 12 Jul 2011 10:58:04 +0200
Message-ID: <0564089300001e7d@nedap.com>
Received: from nvc1511.nedap.local ([10.2.40.10]) by nedap.com ([10.91.8.1])
	with ESMTP (TREND IMSS SMTP Service 7.0) id 0564089300001e7d
	for <jaap.dejong@nedap.com>; Tue, 12 Jul 2011 10:58:07 +0100
Message-ID: <4E1C0C99.3040508@nedap.com>
Date: Tue, 12 Jul 2011 10:58:01 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 12 Jul 2011 08:58:04.0505 (UTC)
	FILETIME=[CF954490:01CC4071]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bbappend
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
X-List-Received-Date: Tue, 12 Jul 2011 09:30:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all!

I need some help concerning bbappend.
I've created a bbappend file:

    FILESEXTRAPATHS := "${THISDIR}/files"
    SRC_URI += "file://xyzzy.patch"

If I run a bitbake it complains about missing ..../xyzzy.patch
When I change the bbappend file to this:

    SRC_URI += "file:///absolute-path-to-the-file/files/xyzzy.patch"

then everything works fine...
(As a workaround this will do)

Any help is appreciated!!
Jaap


