Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PvTl1-0003q8-BX
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 13:05:39 +0100
Received: (qmail 10462 invoked by uid 1003); 4 Mar 2011 12:03:46 -0000
Received: from unknown (HELO ?192.168.0.130?) (philip@opensdr.com@66.207.65.47)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Mar 2011 12:03:46 -0000
Message-ID: <4D70D51C.5000608@balister.org>
Date: Fri, 04 Mar 2011 07:03:40 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: cmake build failure
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
X-List-Received-Date: Fri, 04 Mar 2011 12:05:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I tried building cmake (not cmake-native) last night and it failed 
because it couldn't find LibArchive. This used to work. The build 
failure was confirmed in #oe.

In the future, please do not add a recipe and delete the old one in the 
same commit. It makes it much harder for people to diagnose problems 
since I need to mess around to get the old and new recipes in my tree at 
the same time. I'd really prefer not to see people delete recipes as 
soon as they add new ones, especially for cases like this when most 
people use the native version, and not the one for the target.

Sorry I can't paste the log right now, getting ready to board a plane 
for vacation :)

Philip


