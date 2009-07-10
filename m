Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MPMOF-00075C-FY
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 22:08:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5491F45D844
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 15:55:21 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18391-08 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 10 Jul 2009 15:55:21 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 3647A340D18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 15:55:21 -0400 (EDT)
Message-ID: <4A579CA5.2090708@cbnco.com>
Date: Fri, 10 Jul 2009 15:55:17 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <be7a9f3d0907101039i6a58c3aeof2fc3e1f40d24dd0@mail.gmail.com>
In-Reply-To: <be7a9f3d0907101039i6a58c3aeof2fc3e1f40d24dd0@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: Mistakenly pushed changes without review, specially 6633c4c95a
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
X-List-Received-Date: Fri, 10 Jul 2009 20:08:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,

Otavio Salvador wrote:
> I'm specially interested to know about 6633c4c95a. If people objects
> on it I can revert it but I think it is not necessary to revert it if
> people agrees with it.

It looked good to me, but bitbake bails with:

RuntimeError: dictionary changed size during iteration

(reverting 6633c4c9 fixes it for me)

Also -- I've seen some references to MACHINE_CLASS. I'm wondering if it 
was intended to solve a similar problem.

Here's the traceback for the bailout.

Traceback (most recent call last):
   File "/home/michael/startitup/bitbake/bin/bitbake", line 143, in ?
     main()
   File "/home/michael/startitup/bitbake/bin/bitbake", line 123, in main
     cooker.parseConfiguration()
   File "/home/michael/startitup/bitbake/lib/bb/cooker.py", line 68, in 
parseConfiguration
     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
   File "/home/michael/startitup/bitbake/lib/bb/cooker.py", line 390, in 
parseConfigurationFile
     self.configuration.data = bb.parse.handle( afile, 
self.configuration.data )
   File "/home/michael/startitup/bitbake/lib/bb/parse/__init__.py", line 
75, in handle
     return h['handle'](fn, data, include)
   File 
"/home/michael/startitup/bitbake/lib/bb/parse/parse_py/ConfHandler.py", 
line 167, in handle
     feeder(lineno, s, fn, data)
   File 
"/home/michael/startitup/bitbake/lib/bb/parse/parse_py/ConfHandler.py", 
line 221, in feeder
     include(fn, s, data, "include required")
   File 
"/home/michael/startitup/bitbake/lib/bb/parse/parse_py/ConfHandler.py", 
line 114, in include
     ret = handle(fn, data, True)
   File "/home/michael/startitup/bitbake/lib/bb/parse/__init__.py", line 
75, in handle
     return h['handle'](fn, data, include)
   File 
"/home/michael/startitup/bitbake/lib/bb/parse/parse_py/ConfHandler.py", 
line 167, in handle
     feeder(lineno, s, fn, data)
   File 
"/home/michael/startitup/bitbake/lib/bb/parse/parse_py/ConfHandler.py", 
line 192, in feeder
     bb.data.update_data(e)
   File "/home/michael/startitup/bitbake/lib/bb/data.py", line 509, in 
update_data
     for var in vars:
RuntimeError: dictionary changed size during iteration



