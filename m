Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M5iIX-0003EW-DY
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 17:29:09 +0200
Received: (qmail invoked by alias); 17 May 2009 15:21:56 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp065) with SMTP; 17 May 2009 17:21:56 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1+3cxlqg6e3K5skHQwnCPbYyGpQQM3Mr+N5868rrT
	VVOIxaMQrrNWrH
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 May 2009 17:21:47 +0200
User-Agent: KMail/1.11.3 (Linux/2.6.28-11-generic; KDE/4.2.3; i686; ; )
MIME-Version: 1.0
Message-Id: <200905171721.48073.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.78,0.78
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: libxcb fails compiling
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
X-List-Received-Date: Sun, 17 May 2009 15:29:10 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


The error:

ln -s -f /usr/share/xcb/xproto.xml xproto.xml                                                                                               
/usr/bin/xsltproc --stringparam mode source \                                                                                                                 
--stringparam base-path /usr/share/xcb/ \                                                                                                   
--stringparam extension-path /usr/share/xcb/ \                                                                                              
-o xproto.c ./c-client.xsl xproto.xml                                                                                     
warning: failed to load external entity "xproto.xml"                                                                                       
 unable to parse xproto.xml 

Is trying to make a link to a file that doesn't exist.
I have installed xcb-proto in my machine, and it works now, but I guess that 
is not the right way to fix the problem.


-- 
  - Eismann -

