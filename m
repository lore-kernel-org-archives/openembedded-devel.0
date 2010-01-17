Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <s_buschmann@gmx.de>) id 1NWRIf-0002H8-KV
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 10:20:04 +0100
Received: (qmail invoked by alias); 17 Jan 2010 09:11:08 -0000
Received: from brln-4dbaafcd.pool.mediaWays.net (EHLO [192.168.178.176])
	[77.186.175.205]
	by mail.gmx.net (mp037) with SMTP; 17 Jan 2010 10:11:08 +0100
X-Authenticated: #1404922
X-Provags-ID: V01U2FsdGVkX1/gPRFP+3rgVfrA15BBHA+jmyUOm45afTd4NzOQIr
	JJf4YlPZRw03p9
Message-ID: <4B52D42D.9020103@gmx.de>
Date: Sun, 17 Jan 2010 10:11:09 +0100
From: Stefan Buschmann <s_buschmann@gmx.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.5) Gecko/20091204 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.70999999999999996
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: s_buschmann@gmx.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: changing system configuration in a customized image
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
X-List-Received-Date: Sun, 17 Jan 2010 09:20:04 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi all!

I'm using a customized image of SHR that includes some additional 
packages I like to have installed automatically as well as a package 
that should include the changes to the system configuration that I need. 
It would just be nice to have this done automatically rather than having 
to tweak the system by hand every time I build and install a new image 
on the device.

So e.g. I would like to change configuration files and execute some 
commands:
- Add a system user
- Install customized version of '/etc/samba/smb.conf'
- Set samba password via 'smbpasswd'

I think I can't simply run those commands via install or staging task, 
because I wouldn't be able to run something like 'smbpasswd' there. So I 
figure the way to go would be to add a configuration script which runs 
only on the first system start, that can modify the configuration files 
and run the necessary commands.

So is this the right approach? How can I add such a script? I tried to 
find out by looking into e.g. the recipe for 'alsa' but didn't find a 
clue there. Also I'm making my way through the OpenEmbedded User Manual 
but couldn't find it there either.

Thanks,

Stefan



