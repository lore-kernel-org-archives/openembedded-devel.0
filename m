Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MbaVw-0000OE-O5
	for openembedded-devel@openembedded.org; Thu, 13 Aug 2009 15:38:44 +0200
Received: (qmail 22821 invoked by uid 107); 13 Aug 2009 13:22:11 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 13 Aug 2009 15:22:11 +0200
Message-ID: <4A841382.7070909@epfl.ch>
Date: Thu, 13 Aug 2009 15:22:10 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4A83D8D4.7060206@epfl.ch>
	<200908131134.50432.holger+oe@freyther.de>
In-Reply-To: <200908131134.50432.holger+oe@freyther.de>
Subject: Re: Cross-compiling qt based programs with cmake
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
X-List-Received-Date: Thu, 13 Aug 2009 13:38:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Thursday 13 August 2009 11:11:48 Valentin Longchamp wrote:
>> Hello,
>>
>> I am trying to build cmake based programs that use QT with Openembedded.
>> The actual support for cmake in OE worked until now because I only had
>> "simple" dependencies. Now with QT as as dependency, I use the cmake
>> FindQt4 Module that strongly relies on qmake to find the different QT
>> cmake variables (try to run ${STAGINGBINDIR}/qmake2 -query). The cmake
>> FindQt4 Module uses the values given by qmake to determine where all the
>> libraries and tools are installed (and if installed).

Thanks for your feedback zecke.

> 
> Let me throw in some (pseudo) facts:
> 	- We want to use one qmake2 for Qt/X11, Qt/Embedded Linux builds
> 	- qmake is reading a qt.conf from the directory of the binary. In Qt/X11
> 	 and Qt/E build we write a custom one.

What do you mean by the binary ? The qmake binary ? Is the custom file 
you mention the linux.conf file (like 
openembedded/recipes/qt4/files/linux.conf, with some parts defined in 
openembedded/classes/qt4e.bbclass) ?

> 	- the pkg-config files for Qt should be correct.
> 
> 
> So my proposals include:
> 	- Consider renaming qmake2 to qmake or qmake-qt4 (and move qt3 to qmake-qt3)

Well, I don't think we need to change this anymore. As I said, a simple 
patch would allow FindQt4 cmake module to find qmake2 too (or I did not 
get what you meant here).

> 	- for X11/Embedded create a separate bin dir for qmake, create a symlink and
> 	  place a qt.conf in it.

This seems to be a very interesting. But isn't it qmake.conf now ? 
http://doc.trolltech.com/4.5/qmake-variable-reference.html

> 	- maybe convince Alexander Neuendorf to use pkg-config to find Qt too..

I think he does use qmake, because a qt build needs other tools besides 
the libs and headers, and pkg-config does not find them, but qmake does. 
But pkg-config could be used to find the libs and headers, you're right.

> 
> 
> what do you think?
> 

If I got what you meant right, your idea of producing an accurate 
qmake.conf file that correctly fits the locations of the headers and 
libs seems very interesting. But I still need to figure out how

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


