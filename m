Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1HETiu-00007l-Ht
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Feb 2007 18:03:16 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1615558ugf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Feb 2007 09:03:15 -0800 (PST)
Received: by 10.78.179.12 with SMTP id b12mr404513huf.1170781385180;
	Tue, 06 Feb 2007 09:03:05 -0800 (PST)
Received: by 10.78.166.11 with HTTP; Tue, 6 Feb 2007 09:03:05 -0800 (PST)
Message-ID: <d46153c40702060903l5dab58b4ha7a237730d51da66@mail.gmail.com>
Date: Tue, 6 Feb 2007 11:03:05 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: GNU Classpath, gconf-dbus inconsistency
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
X-List-Received-Date: Tue, 06 Feb 2007 17:03:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm trying to bump classpath-gtk to >= 0.92, but these are failing due
to a dbus check:

| checking for gconf-2.0 >= 2.11.2... Requested 'gconf-2.0 >= 2.11.2'
but version of gconf is 2.6.4.14
|
| configure: error: Library requirements (gconf-2.0 >= 2.11.2) not
met; consider adjusting the PKG_CONFIG_PATH environment variable if
your libraries are in a nonstandard prefix so pkg-config can find
them.
| FATAL: oe_runconf failed


Which is somewhat interesting since
$ bitbake gconf -crebuild
...
NOTE: package gconf-dbus-2.10.0+svn20060719: started
...
NOTE: package gconf-dbus-2.10.0+svn20060719: completed

Which actually builds version 2.6.4.14, not 2.10 as the recipe
suggests.  I don't know if there is a reason for this or how to fix
this if it is a bug, so I submitted bug 1851.


