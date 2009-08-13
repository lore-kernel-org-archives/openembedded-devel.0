Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MbVrr-00031P-7N
	for openembedded-devel@openembedded.org; Thu, 13 Aug 2009 10:41:03 +0200
Received: (qmail 22012 invoked by uid 107); 13 Aug 2009 08:24:21 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 13 Aug 2009 10:24:21 +0200
Message-ID: <4A83CDB4.2000008@epfl.ch>
Date: Thu, 13 Aug 2009 10:24:20 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>
	<200908121119.43689.holger+oe@freyther.de>
In-Reply-To: <200908121119.43689.holger+oe@freyther.de>
Subject: Re: [RFC] change qmake2 to qmake4
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
X-List-Received-Date: Thu, 13 Aug 2009 08:41:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Thursday 18 June 2009 19:03:33 Valentin Longchamp wrote:
>> As I have already explained in an email earlier today, some tools
>> (cmake for instance, with its FindQt4 Module) look for a qmake under
>> a certain name (that can be qmake or qmake4 ... but not qmake2).
>>
>> This patch proposes to change this name. With this, all the other qt
>> tools consistently have the 4 at the end of their name.
>>
>> Of course, all the recipes that inherit qmake2 should be changed, but
>> this is not done here since it's only a RFC to start a discussion
> 
> nack for now. qmake4 is worse than calling it qmake2. The current major qmake 
> version is "2". We can talk about calling it "qmake" or "qmake-qt4".
> 

Ok, fine for me. The other way could be to patch cmake to make it look 
for qmake2 instead of qmake.

With this, qmake would be found by the FindQt.cmake module. However, the 
problem would not be solved yet (there is another thing that comes in 
the way, please see my other email to the list, coming in a few minutes).

Val

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


