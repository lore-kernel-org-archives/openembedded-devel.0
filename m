Received: from 2.27.mail-out.ovh.net ([46.105.37.238] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PpI7I-0004O7-4A
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 11:26:44 +0100
Received: (qmail 22406 invoked by uid 503); 15 Feb 2011 10:51:34 -0000
Received: from b9.ovh.net (HELO mail623.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 15 Feb 2011 10:51:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Feb 2011 12:00:16 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 15 Feb 2011 12:00:15 +0200
Message-ID: <4D5A4E56.7040209@eukrea.com>
Date: Tue, 15 Feb 2011 10:58:46 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinN1b=egyKPv6N3rHq1HODKDyK15B22=1qBZcMZ@mail.gmail.com>
In-Reply-To: <AANLkTinN1b=egyKPv6N3rHq1HODKDyK15B22=1qBZcMZ@mail.gmail.com>
X-Ovh-Tracer-Id: 5669750457349025097
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [RFH] qt4-tools-sdk not providing right values
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
X-List-Received-Date: Tue, 15 Feb 2011 10:26:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,

On 15/02/2011 01:15, Otavio Salvador wrote:
> CMake (that is being used more and more for qt applications) depends
> on qmake -query values to "detect" qt and headers. Do someone know how
> we can address it so a fully working Qt SDK that works with qmake can
> be done?
>
ok, the path actually reported are wrong ex with angstrom :
QT_INSTALL_PREFIX:/usr/local/angstrom/arm/

Can you try this :
create a qt.conf in /usr/local/angstrom/arm/bin
with the following content :
[Paths]
Prefix = /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr

cd /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr
ln -s share/qtopia/mkspecs/

then qmake -query reports correct paths :
QT_INSTALL_PREFIX:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr
QT_INSTALL_HEADERS:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include
QT_INSTALL_LIBS:/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib

Can you try if that also works with CMake ?

Eric


