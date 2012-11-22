Received: from hub023-nj-1.exch023.serverdata.net ([206.225.165.108])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scm@majust.dk>) id 1TbYLr-0008Qn-Mi
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 16:06:03 +0100
Received: from MBX023-E1-NJ-2.exch023.domain.local ([10.240.8.52]) by
	HUB023-NJ-1.exch023.domain.local ([10.240.8.30]) with mapi id
	14.02.0318.001; Thu, 22 Nov 2012 06:41:49 -0800
From: =?iso-8859-1?Q?S=F8ren_Christian_Madsen?= <scm@majust.dk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Debugging environment variable assignments
Thread-Index: Ac3Ivbhd+xDShO0TTXu9clnSlBRhNA==
Date: Thu, 22 Nov 2012 14:41:48 +0000
Message-ID: <6D6121C7FCEF004E9D5B6ECBA86B84CB24A460A8@mbx023-e1-nj-2.exch023.domain.local>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [87.51.7.169]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Debugging environment variable assignments
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
X-List-Received-Date: Thu, 22 Nov 2012 15:06:04 -0000
Content-Language: da-DK
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to create an overlay, based on an existing configuration.
During my build, I get an error which I'm pretty sure is caused by FILESDIR=
 having the wrong value, causing the "do_unpack" step to fail.

As far as I can tell, the FILESDIR variable is assigned using the following=
 expression: FILESDIR=3D${@bb.which(d.getVar('FILESPATH', 1), '.')}, accord=
ing to comments listed by the "-e" option to bitbake.

I inspected the FILESPATH variable contents for the existing (working) conf=
iguration, and my own. The only differences detected were 2 paths (correctl=
y) changed to point elsewhere (I can post full details if that is required)=
. But anyway the end-result in FILESDIR becomes massively wrong.

I speculate the error might be that FILESPATH is set to the correct value a=
fter the FILESDIR is being set?
The logs only contain the same info as shown in the console, which is not h=
elpfull.


Is it possible to "watch" assignments to variables in bitbake? Basically I =
would like to figure out what lines in what files cause assignments to cert=
ains variables in what order.

I would be very grateful for any suggestions on how to debug issues such as=
 this, as I'm a complete newbie with openembedded/bitbake.

Regards
S=F8ren

