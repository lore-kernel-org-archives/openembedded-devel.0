Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MfsIF-0004Ai-P4
	for openembedded-devel@openembedded.org; Tue, 25 Aug 2009 11:26:21 +0200
Received: (qmail 3135 invoked by uid 107); 25 Aug 2009 09:08:29 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Tue, 25 Aug 2009 11:08:29 +0200
Message-ID: <4A93AA0C.6090504@epfl.ch>
Date: Tue, 25 Aug 2009 11:08:28 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A936CC0.70409@4d-electronics.co.nz>
	<200908250709.57101.holger+oe@freyther.de>
In-Reply-To: <200908250709.57101.holger+oe@freyther.de>
Subject: Re: CMake and Qt4
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
X-List-Received-Date: Tue, 25 Aug 2009 09:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Tuesday 25 August 2009 06:46:56 Matthew Dombroski wrote:
>> Hi,
>>
>> The FindQt4.cmake distributed with cmake (for some time now) is unable
>> to find the libs installed by qt4e (I haven't tried qt4x11).
>> This is because the libs installed by openembedded use an unusual naming
>> convention that isnt known in FindQt4.cmake.
>>
>> The below patch fixes the problem.
> 
> This will not work when both qt4x11 and qt4e is built and staged. I have no 
> specific knowledge of the current FindQt4 cmake module but there should be a 
> way to tell it that we want the QtE, QtX11 or QtMac built...
> 
> Do you have any idea?
> 

No idea, but with only qt4e built and staged, I had come to the exact
same solution that works like a charm.

Val




