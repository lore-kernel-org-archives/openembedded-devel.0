Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tobias.pflug@gmx.net>) id 1IslLE-0006Bt-IL
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2007 21:29:36 +0100
Received: (qmail invoked by alias); 15 Nov 2007 20:27:54 -0000
Received: from p549A891F.dip0.t-ipconnect.de (EHLO [192.168.1.100])
	[84.154.137.31]
	by mail.gmx.net (mp056) with SMTP; 15 Nov 2007 21:27:54 +0100
X-Authenticated: #283898
X-Provags-ID: V01U2FsdGVkX1+zqIMWsfWzdDVHGl1RLPuTFsy0fuDS5XDGl6vWxr
	RAXjPMo8r4l+lW
From: Tobias Pflug <tobias.pflug@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Nov 2007 21:29:40 +0100
Message-Id: <1195158580.6376.328.camel@toontown>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-Y-GMX-Trusted: 0
Subject: altering cflags for autotools
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
X-List-Received-Date: Thu, 15 Nov 2007 20:29:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi..

today i've been trying to package mod_python but had some difficulties
because ${STAGING_INCDIR} was not included in the path thus
mod_include.h (staged from the apache2 package) could not be found ->
can't compile mod_python.

Changing CFLAGS or EXTRA_CFLAGS has no effect. Looking at the autotools
class that is no surprise because it doesn't seem to be read anywhere. 
How can I fix this? Do I have to patch the configure.in file ? 

Which leads me to my next, slightly related question. When in a devshell
session, shouldn't STAGING_INCDIR be set as environment variable ?

regards,
Tobi



